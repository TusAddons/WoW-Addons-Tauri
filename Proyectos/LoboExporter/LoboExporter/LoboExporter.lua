-- LoboExporter: AddOn de Exportación Universal para WoW Legion 7.3.5
-- Creado por Artiom & AI Pair Programming

local ADDON_NAME = "LoboExporter"

-- Configuración por defecto
LoboExporterDB = LoboExporterDB or {
    exportCompletedAchievs = true,
    exportIncompleteAchievs = false,
    exportEquipment = true,
    exportCurrencies = true,
    exportReputations = true,
    exportFollowers = true,
    formatJSON = true, -- true = JSON, false = Texto Legible
    showMapPins = true, -- true = Mostrar iconos de logros en el mapa
    showMapCompleted = true, -- true = Mostrar también check verde en los completados
}

-- Opciones de ranuras de equipo
local SLOT_NAMES = {
    [1] = "Cabeza", [2] = "Cuello", [3] = "Hombros", [4] = "Camisa", [5] = "Pecho",
    [6] = "Cintura", [7] = "Piernas", [8] = "Pies", [9] = "Muñecas", [10] = "Manos",
    [11] = "Anillo 1", [12] = "Anillo 2", [13] = "Abalorio 1", [14] = "Abalorio 2",
    [15] = "Espalda", [16] = "Arma Principal", [17] = "Arma Secundaria", [19] = "Tabardo"
}

-- Función auxiliar para escapar strings para JSON
local function EscapeJSON(str)
    if not str then return "" end
    str = string.gsub(str, "\\", "\\\\")
    str = string.gsub(str, '"', '\\"')
    str = string.gsub(str, "\n", " ")
    str = string.gsub(str, "\r", "")
    return str
end

-- Función de comprobación robusta de logros
local function IsAchievementDone(achID)
    if not achID then return false end
    local id, name, points, completed, month, day, year, description, flags, icon, rewardText, isGuild, wasEarnedByMe = GetAchievementInfo(achID)
    if completed or wasEarnedByMe then
        return true
    end
    -- Verificación de respaldo por criterios si el servidor de Tauri devuelve false al desactivar .accwide:
    local num = GetAchievementNumCriteria(achID)
    if num and num > 0 then
        local allDone = true
        for i = 1, num do
            local _, _, critDone = GetAchievementCriteriaInfo(achID, i)
            if not critDone then
                allDone = false
                break
            end
        end
        if allDone then
            return true
        end
    end
    return false
end

-- Generadores de Datos
local function GetEquipmentData(isJSON)
    local lines = {}
    local avgIlvl, avgIlvlEquipped = GetAverageItemLevel()
    
    if isJSON then
        lines[#lines+1] = string.format('  "equipment": {\n    "avgItemLevel": %.1f,\n    "equippedItemLevel": %.1f,\n    "items": [', avgIlvl or 0, avgIlvlEquipped or 0)
        local items = {}
        for slot = 1, 19 do
            if SLOT_NAMES[slot] then
                local link = GetInventoryItemLink("player", slot)
                if link then
                    local name, _, quality, ilvl = GetItemInfo(link)
                    if not name then name = link:match("%[(.-)%]") or "Objeto Desconocido" end
                    items[#items+1] = string.format('      {"slot": "%s", "name": "%s", "ilvl": %d}', SLOT_NAMES[slot], EscapeJSON(name), ilvl or 0)
                end
            end
        end
        lines[#lines+1] = table.concat(items, ",\n")
        lines[#lines+1] = '    ]\n  }'
    else
        lines[#lines+1] = string.format("=== EQUIPAMIENTO (ilvl Medio: %.1f / Equipado: %.1f) ===", avgIlvl or 0, avgIlvlEquipped or 0)
        for slot = 1, 19 do
            if SLOT_NAMES[slot] then
                local link = GetInventoryItemLink("player", slot)
                if link then
                    local name, _, _, ilvl = GetItemInfo(link)
                    if not name then name = link:match("%[(.-)%]") or "Objeto" end
                    lines[#lines+1] = string.format("[%s]: %s (ilvl %d)", SLOT_NAMES[slot], name, ilvl or 0)
                end
            end
        end
    end
    return table.concat(lines, "\n")
end

local function GetCurrenciesData(isJSON)
    local lines = {}
    local money = GetMoney() or 0
    local gold = math.floor(money / 10000)
    local silver = math.floor((money % 10000) / 100)
    local copper = money % 100
    
    if isJSON then
        lines[#lines+1] = string.format('  "wealth": {\n    "gold": %d, "silver": %d, "copper": %d,\n    "currencies": [', gold, silver, copper)
        local currs = {}
        for i = 1, GetCurrencyListSize() do
            local name, isHeader, _, _, _, count = GetCurrencyListInfo(i)
            if not isHeader and name and count and count > 0 then
                currs[#currs+1] = string.format('      {"name": "%s", "count": %d}', EscapeJSON(name), count)
            end
        end
        lines[#lines+1] = table.concat(currs, ",\n")
        lines[#lines+1] = '    ]\n  }'
    else
        lines[#lines+1] = string.format("=== RIQUEZA Y MONEDAS ===\nOro: %dg %ds %dc", gold, silver, copper)
        for i = 1, GetCurrencyListSize() do
            local name, isHeader, _, _, _, count = GetCurrencyListInfo(i)
            if not isHeader and name and count and count > 0 then
                lines[#lines+1] = string.format("- %s: %d", name, count)
            end
        end
    end
    return table.concat(lines, "\n")
end

local function GetReputationsData(isJSON)
    local lines = {}
    if isJSON then
        lines[#lines+1] = '  "reputations": ['
        local reps = {}
        for i = 1, GetNumFactions() do
            local name, _, standingId, barMin, barMax, barValue, _, _, isHeader = GetFactionInfo(i)
            if not isHeader and name then
                local current = barValue - barMin
                local max = barMax - barMin
                local standingNames = {"Odiado", "Hostil", "Adverso", "Neutral", "Amistoso", "Honorable", "Venerado", "Exaltado"}
                local standingText = standingNames[standingId] or "Desconocido"
                reps[#reps+1] = string.format('    {"faction": "%s", "standing": "%s", "current": %d, "max": %d}', EscapeJSON(name), standingText, current, max)
            end
        end
        lines[#lines+1] = table.concat(reps, ",\n")
        lines[#lines+1] = '  ]'
    else
        lines[#lines+1] = "=== REPUTACIONES ==="
        for i = 1, GetNumFactions() do
            local name, _, standingId, barMin, barMax, barValue, _, _, isHeader = GetFactionInfo(i)
            if not isHeader and name then
                local standingNames = {"Odiado", "Hostil", "Adverso", "Neutral", "Amistoso", "Honorable", "Venerado", "Exaltado"}
                lines[#lines+1] = string.format("- %s: %s (%d/%d)", name, standingNames[standingId] or "", barValue - barMin, barMax - barMin)
            end
        end
    end
    return table.concat(lines, "\n")
end

local function GetAchievementsData(completedOnly, incompleteOnly, isJSON)
    local lines = {}
    local cats = GetCategoryList()
    local achs = {}
    
    for _, catID in ipairs(cats) do
        local num = GetCategoryNumAchievements(catID)
        for i = 1, num do
            local id, name, points = GetAchievementInfo(catID, i)
            if id and name then
                local completed = IsAchievementDone(id)
                if (completedOnly and completed) or (incompleteOnly and not completed) then
                    if isJSON then
                        achs[#achs+1] = string.format('    {"id": %d, "name": "%s", "points": %d, "completed": %s}', id, EscapeJSON(name), points or 0, completed and "true" or "false")
                    else
                        lines[#lines+1] = string.format("[%s] %s (ID: %d - %d pts)", completed and "X" or " ", name, id, points or 0)
                    end
                end
            end
        end
    end
    
    if isJSON then
        local label = completedOnly and "completedAchievements" or (incompleteOnly and "incompleteAchievements" or "allAchievements")
        return string.format('  "%s": [\n%s\n  ]', label, table.concat(achs, ",\n"))
    else
        local title = completedOnly and "LOGROS COMPLETADOS" or (incompleteOnly and "LOGROS PENDIENTES / SIN COMPLETAR" or "SELECCIÓN DE LOGROS")
        return string.format("=== %s (%d encontrados) ===\n%s", title, #lines, table.concat(lines, "\n"))
    end
end

local BIKINI_PLATES_IDS = {
    ["glorious_Ornato glorioso - Cabeza"] = {14969},
    ["glorious_Hombreras gloriosas - Hombros"] = {14972},
    ["glorious_Coraza gloriosa - Pecho"] = {14966},
    ["glorious_Ataduras gloriosas - Muñecas"] = {14965},
    ["glorious_Guanteletes gloriosos - Manos"] = {14967},
    ["glorious_Cinturón glorioso - Cinturón"] = {14968},
    ["glorious_Musleras gloriosas - Piernas"] = {14970},
    ["glorious_Escarpes gloriosos - Pies"] = {14971},

    ["bloodscale_Yelmo de Escama de sangre - Cabeza"] = {24949},
    ["bloodscale_Hombreras de Escama de sangre - Hombros"] = {24951, 27898},
    ["bloodscale_Coraza de Escama de sangre - Pecho"] = {24943, 27897}, -- 27897 es Peto carmesí dorado
    ["bloodscale_Brazales de Escama de sangre - Muñecas"] = {24944},
    ["bloodscale_Guanteletes de Escama de sangre - Manos"] = {24945},
    ["bloodscale_Cinturón de Escama de sangre - Cinturón"] = {24946},
    ["bloodscale_Musleras de Escama de sangre - Piernas"] = {24947, 27896},
    ["bloodscale_Escarpes de Escama de sangre - Pies"] = {24948},

    ["vanguard_Ornato de vanguardia - Cabeza"] = {14867},
    ["vanguard_Hombreras de vanguardia - Hombros"] = {14869},
    ["vanguard_Coraza de vanguardia - Pecho"] = {14864},
    ["vanguard_Avambrazos de vanguardia - Muñecas"] = {14862},
    ["vanguard_Guanteletes de vanguardia - Manos"] = {14863},
    ["vanguard_Faja de vanguardia - Cinturón"] = {14865},
    ["vanguard_Musleras de vanguardia - Piernas"] = {14866},
    ["vanguard_Escarpes de vanguardia - Pies"] = {14868},

    ["saltstone_Yelmo Piedra de sal - Cabeza"] = {14860},
    ["saltstone_Hombreras Piedra de sal - Hombros"] = {14861},
    ["saltstone_Sobrevesta Piedra de sal - Pecho"] = {14854},
    ["saltstone_Férulas Piedra de sal - Muñecas"] = {14855},
    ["saltstone_Guanteletes Piedra de sal - Manos"] = {14856},
    ["saltstone_Faja Piedra de sal - Cinturón"] = {14858},
    ["saltstone_Musleras Piedra de sal - Piernas"] = {14859},
    ["saltstone_Escarpes Piedra de sal - Pies"] = {14857},

    ["tyrant_Yelmo de tirano - Cabeza"] = {14843},
    ["tyrant_Hombreras de tirano - Hombros"] = {14845},
    ["tyrant_Pectoral de tirano - Pecho"] = {14839},
    ["tyrant_Avambrazos de tirano - Muñecas"] = {14838},
    ["tyrant_Guanteletes de tirano - Manos"] = {14840},
    ["tyrant_Cinturón de tirano - Cinturón"] = {14841},
    ["tyrant_Musleras de tirano - Piernas"] = {14842},
    ["tyrant_Grebas de tirano - Pies"] = {14844},
}

local function GetBikiniDataJSON()
    local results = {}
    for key, ids in pairs(BIKINI_PLATES_IDS) do
        local collected = false
        if C_TransmogCollection and C_TransmogCollection.PlayerHasTransmog then
            for _, itemID in ipairs(ids) do
                if C_TransmogCollection.PlayerHasTransmog(itemID) then
                    collected = true
                    break
                end
            end
        end
        results[#results+1] = string.format('    "%s": %s', key, collected and "true" or "false")
    end
    return "{\n  \"bikiniTracker\": {\n" .. table.concat(results, ",\n") .. "\n  }\n}"
end

local function GetFollowersData(isJSON)
    if not C_Garrison or not C_Garrison.GetFollowers then return isJSON and '  "followers": []' or "--- SEGUIDORES: API NO DISPONIBLE ---" end
    local ok, followers = pcall(C_Garrison.GetFollowers, 1)
    if not ok or not followers then
        return isJSON and ('  "followers_error": "' .. EscapeJSON(tostring(followers)) .. '"') or ("--- ERROR OBTENIENDO SEGUIDORES: " .. tostring(followers) .. " ---")
    end
    
    if isJSON then
        local parts = {}
        for i, f in ipairs(followers) do
            local status = "Disponible"
            if f.isCollected == false or f.status == GARRISON_FOLLOWER_INACTIVE or f.status == 6 then
                status = "Inactivo"
            elseif f.status == GARRISON_FOLLOWER_ON_MISSION then
                status = "Trabajando"
            end
            
            local traitsArr = {}
            local abilitiesArr = {}
            if f.isCollected and f.followerID and type(f.followerID) == "string" and C_Garrison.GetFollowerLink then
                local lok, link = pcall(C_Garrison.GetFollowerLink, f.followerID)
                if lok and link then
                    local _, _, _, _, ab1, ab2, ab3, ab4, tr1, tr2, tr3, tr4 = link:match("garrfollower:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)")
                    local ids = { {ab1, abilitiesArr}, {ab2, abilitiesArr}, {ab3, abilitiesArr}, {ab4, abilitiesArr}, {tr1, traitsArr}, {tr2, traitsArr}, {tr3, traitsArr}, {tr4, traitsArr} }
                    for _, item in ipairs(ids) do
                        local idNum = tonumber(item[1])
                        if idNum and idNum > 0 then
                            local name = C_Garrison.GetFollowerAbilityName and C_Garrison.GetFollowerAbilityName(idNum)
                            if not name and C_Garrison.GetFollowerAbilityInfo then
                                local info = C_Garrison.GetFollowerAbilityInfo(idNum)
                                name = info and info.name
                            end
                            if name then
                                table.insert(item[2], '"' .. EscapeJSON(name) .. '"')
                            end
                        end
                    end
                end
            end
            parts[#parts+1] = string.format('    {"name": "%s", "ilvl": %d, "quality": %d, "status": "%s", "abilities": [%s], "traits": [%s]}', EscapeJSON(f.name or "Desconocido"), tonumber(f.iLevel or f.itemLevel) or 0, tonumber(f.quality) or 0, status, table.concat(abilitiesArr, ", "), table.concat(traitsArr, ", "))
        end
        return '  "followers": [\n' .. table.concat(parts, ",\n") .. '\n  ]'
    else
        local str = "--- SEGUIDORES DE CIUDADELA ---\n"
        for _, f in ipairs(followers) do
            local status = "Disponible"
            if f.isCollected == false or f.status == GARRISON_FOLLOWER_INACTIVE or f.status == 6 then status = "Inactivo" elseif f.status == GARRISON_FOLLOWER_ON_MISSION then status = "Trabajando" end
            local traitsArr = {}
            local abilitiesArr = {}
            if f.isCollected and f.followerID and type(f.followerID) == "string" and C_Garrison.GetFollowerLink then
                local lok, link = pcall(C_Garrison.GetFollowerLink, f.followerID)
                if lok and link then
                    local _, _, _, _, ab1, ab2, ab3, ab4, tr1, tr2, tr3, tr4 = link:match("garrfollower:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)")
                    local ids = { {ab1, abilitiesArr}, {ab2, abilitiesArr}, {ab3, abilitiesArr}, {ab4, abilitiesArr}, {tr1, traitsArr}, {tr2, traitsArr}, {tr3, traitsArr}, {tr4, traitsArr} }
                    for _, item in ipairs(ids) do
                        local idNum = tonumber(item[1])
                        if idNum and idNum > 0 then
                            local name = C_Garrison.GetFollowerAbilityName and C_Garrison.GetFollowerAbilityName(idNum)
                            if not name and C_Garrison.GetFollowerAbilityInfo then
                                local info = C_Garrison.GetFollowerAbilityInfo(idNum)
                                name = info and info.name
                            end
                            if name then table.insert(item[2], name) end
                        end
                    end
                end
            end
            str = str .. string.format("- %s (ilvl %d) [%s] | Facultades: [%s] | Rasgos: [%s]\n", f.name or "Desconocido", tonumber(f.iLevel or f.itemLevel) or 0, status, table.concat(abilitiesArr, ", "), table.concat(traitsArr, ", "))
        end
        return str
    end
end

local function GenerateExport()
    local isJSON = LoboExporterDB.formatJSON
    local parts = {}
    
    local playerName, playerRealm = UnitName("player"), GetRealmName()
    local playerClass = UnitClass("player")
    local playerLevel = UnitLevel("player")
    
    if isJSON then
        parts[#parts+1] = "{"
        parts[#parts+1] = string.format('  "character": {"name": "%s", "realm": "%s", "class": "%s", "level": %d}', EscapeJSON(playerName), EscapeJSON(playerRealm), EscapeJSON(playerClass), playerLevel)
    else
        parts[#parts+1] = string.format("=== EXPORTACIÓN DE PERSONAJE: %s-%s (%s Nvl %d) ===", playerName, playerRealm, playerClass, playerLevel)
    end
    
    if LoboExporterDB.exportEquipment then
        parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. GetEquipmentData(isJSON)
    end
    
    if LoboExporterDB.exportCurrencies then
        parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. GetCurrenciesData(isJSON)
    end
    
    if LoboExporterDB.exportReputations then
        parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. GetReputationsData(isJSON)
    end
    
    if LoboExporterDB.exportFollowers then
        local ok, data = pcall(GetFollowersData, isJSON)
        if ok then
            parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. data
        else
            parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. (isJSON and ('  "followers_error": "' .. EscapeJSON(tostring(data)) .. '"') or ("ERROR: " .. tostring(data)))
        end
    end
    
    if LoboExporterDB.exportCompletedAchievs then
        parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. GetAchievementsData(true, false, isJSON)
    end
    
    if LoboExporterDB.exportIncompleteAchievs then
        parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. GetAchievementsData(false, true, isJSON)
    end
    
    if isJSON then
        parts[#parts+1] = "\n}"
    end
    
    return table.concat(parts, isJSON and "" or "\n")
end

-- ==========================================================
-- MÓDULO DE MAPA: MARCAS EN EL MAPA DE MUNDO (LoboTracker)
-- ==========================================================
-- Helper para obtener el ID de logro correcto según la facción del jugador
local function GetZoneAchID(info)
    if not info then return nil end
    if info.idHorde and UnitFactionGroup("player") == "Horde" then
        return info.idHorde
    end
    return info.id
end

local MAP_ZONES_INFO = {
    -- Continente 1: Kalimdor (18 zonas: incluyendo Uldum y Monte Hyjal de Cataclysm)
    [1] = {
        { id = 4925, idHorde = 4976, name = "Vallefresno", x = 0.46, y = 0.40 },
        { id = 4928, name = "Costa Oscura", x = 0.41, y = 0.34, faction = "Alliance" },
        { id = 4926, name = "Isla Bruma de Sangre", x = 0.29, y = 0.18, faction = "Alliance" },
        { id = 4929, idHorde = 4978, name = "Marjal Revolcafango", x = 0.58, y = 0.65 },
        { id = 4932, idHorde = 4979, name = "Feralas", x = 0.41, y = 0.72 },
        { id = 4937, idHorde = 4981, name = "Los Baldíos del Sur", x = 0.52, y = 0.60 },
        { id = 4933, name = "Los Baldíos del Norte", x = 0.52, y = 0.50, faction = "Horde" },
        { id = 4927, name = "Azshara", x = 0.58, y = 0.38, faction = "Horde" },
        { id = 4935, name = "Tanaris", x = 0.60, y = 0.86 },
        { id = 4939, name = "Cráter de Un'Goro", x = 0.50, y = 0.83 },
        { id = 4930, name = "Desolace", x = 0.41, y = 0.56 },
        { id = 4931, name = "Frondavil", x = 0.48, y = 0.30 },
        { id = 4934, name = "Silithus", x = 0.40, y = 0.88 },
        { id = 4936, idHorde = 4980, name = "Sierra Espolón", x = 0.44, y = 0.45 },
        { id = 4938, name = "Las Mil Agujas", x = 0.52, y = 0.74 },
        { id = 4940, name = "Cuna del Invierno", x = 0.58, y = 0.24 },
        { id = 4872, name = "Uldum", x = 0.50, y = 0.92 },
        { id = 4870, name = "Monte Hyjal", x = 0.52, y = 0.32 },
    },
    -- Continente 2: Reinos del Este (21 zonas: recalibradas vertical y horizontalmente según feedback visual)
    [2] = {
        { id = 4905, name = "Cabo de Tuercespina", x = 0.44, y = 0.91 },
        { id = 4906, name = "Norte de la Vega de Tuercespina", x = 0.46, y = 0.85 },
        { id = 4901, name = "Estepas Ardientes", x = 0.48, y = 0.71 },
        { id = 4910, name = "Garganta de Fuego", x = 0.47, y = 0.66 },
        { id = 4900, name = "Tierras Inhóspitas", x = 0.56, y = 0.65 },
        { id = 12456, name = "Loch Modan", x = 0.53, y = 0.60, faction = "Alliance" },
        { id = 12456, name = "Los Humedales", x = 0.52, y = 0.54, faction = "Alliance" },
        { id = 4896, name = "Tierras Altas de Arathi", x = 0.53, y = 0.47 },
        { id = 4897, name = "Tierras del Interior", x = 0.56, y = 0.39 },
        { id = 4892, name = "Tierras de la Peste del Este", x = 0.55, y = 0.28 },
        { id = 4893, name = "Tierras de la Peste del Oeste", x = 0.48, y = 0.29 },
        { id = 4902, name = "Montañas Crestagrana", x = 0.54, y = 0.75, faction = "Alliance" },
        { id = 12455, name = "Páramos de Poniente", x = 0.40, y = 0.81, faction = "Alliance" },
        { id = 12455, name = "Bosque del Ocaso", x = 0.47, y = 0.79, faction = "Alliance" },
        { id = 4894, name = "Bosque de Argénteos", x = 0.42, y = 0.36, faction = "Horde" },
        { id = 4895, name = "Laderas de Trabalomas", x = 0.48, y = 0.40, faction = "Horde" },
        { id = 4908, name = "Tierra Fantasma", x = 0.56, y = 0.16, faction = "Horde" },
        { id = 4869, idHorde = 4982, name = "Vashj'ir", x = 0.30, y = 0.65 },
        { id = 4873, idHorde = 5501, name = "Tierras Altas Crepusculares", x = 0.60, y = 0.56 },
        { id = 4904, name = "Pantano de las Penas", x = 0.54, y = 0.78 },
        { id = 4909, name = "Las Tierras Devastadas", x = 0.54, y = 0.84 },
    },
    -- Continente 3: Terrallende (7 zonas)
    [3] = {
        { id = 861, name = "Península del Fuego Infernal", x = 0.60, y = 0.52 },
        { id = 862, name = "Marisma de Zangar", x = 0.33, y = 0.47 },
        { id = 863, name = "Bosque de Terokkar", x = 0.45, y = 0.68 },
        { id = 864, name = "Nagrand", x = 0.27, y = 0.68 },
        { id = 865, name = "Montañas Filospada", x = 0.43, y = 0.28 },
        { id = 866, name = "Tormenta Abisal", x = 0.63, y = 0.23 },
        { id = 867, name = "Valle Sombraluna", x = 0.65, y = 0.75 },
    },
    -- Continente 4: Rasganorte (8 zonas: coordenadas ajustadas según feedback)
    [4] = {
        { id = 33, name = "Tundra Boreal", x = 0.22, y = 0.63 },
        { id = 34, name = "Fiordo Aquilonal", x = 0.78, y = 0.68 },
        { id = 35, name = "Cementerio de Dragones", x = 0.50, y = 0.62 },
        { id = 36, name = "Colinas Pardas", x = 0.76, y = 0.56 },
        { id = 37, name = "Zul'Drak", x = 0.68, y = 0.40 },
        { id = 38, name = "Cuenca de Sholazar", x = 0.27, y = 0.43 },
        { id = 39, name = "Las Cumbres Tormentosas", x = 0.58, y = 0.25 },
        { id = 40, name = "Corona de Hielo", x = 0.45, y = 0.28 },
    },
    -- Continente 5: La Vorágine / Cataclysm (1 zona: Infralar)
    [5] = {
        { id = 4871, name = "Infralar", x = 0.55, y = 0.40 },
    },
    -- Continente 6: Pandaria (6 zonas: coordenadas ajustadas)
    [6] = {
        { id = 6300, name = "El Bosque de Jade", x = 0.68, y = 0.52 },
        { id = 6301, name = "Valle de los Cuatro Vientos", x = 0.50, y = 0.68 },
        { id = 6534, name = "Espesura de Krasarang", x = 0.48, y = 0.82 },
        { id = 6535, name = "Cima Kun-Lai", x = 0.45, y = 0.32 },
        { id = 6537, name = "Estepas de Tong Long", x = 0.28, y = 0.45 },
        { id = 6538, name = "Desierto del Pavor", x = 0.33, y = 0.68 },
    },
    -- Continente 7: Draenor (6 zonas: separando Alianza y Horda)
    [7] = {
        { id = 8922, name = "Valle Sombraluna", x = 0.65, y = 0.70, faction = "Alliance" },
        { id = 8921, name = "Cresta Fuego Glacial", x = 0.32, y = 0.30, faction = "Horde" },
        { id = 8923, name = "Gorgrond", x = 0.55, y = 0.28 },
        { id = 8924, name = "Talador", x = 0.52, y = 0.55 },
        { id = 8925, name = "Cumbres de Arak", x = 0.48, y = 0.78 },
        { id = 8926, name = "Nagrand (Draenor)", x = 0.28, y = 0.58 },
    },
    -- Continente 8: Islas Abruptas / Legion (6 zonas: ajustadas con precisión según feedback)
    [8] = {
        { id = 10763, name = "Azsuna", x = 0.29, y = 0.62 },
        { id = 10698, name = "Val'sharah", x = 0.26, y = 0.35 },
        { id = 10059, name = "Monte Alto", x = 0.42, y = 0.26 },
        { id = 10790, name = "Tormenheim", x = 0.58, y = 0.36 },
        { id = 11124, name = "Suramar", x = 0.44, y = 0.48 },
        { id = 11546, name = "Costa Abrupta", x = 0.54, y = 0.65 },
    },
    -- Continente 9: Argus (1 zona: requiere logro Asalto a la Tumba / Breaching the Tomb 11546)
    [9] = {
        { id = 12066, name = "Argus", x = 0.75, y = 0.28, reqAch = 11546 },
    }
}

local MapPins = {}

local function HideAllMapPins()
    for _, pin in ipairs(MapPins) do
        pin:Hide()
    end
end

local function GetOrCreatePin(index)
    local mapFrame = WorldMapDetailFrame or WorldMapButton
    if not mapFrame then return nil end
    
    if not MapPins[index] then
        local pin = CreateFrame("Button", "LoboMapPin"..index, mapFrame)
        pin:SetSize(24, 24)
        pin:SetFrameStrata("FULLSCREEN_DIALOG")
        pin:SetFrameLevel(9999)
        
        -- Icono principal
        pin.icon = pin:CreateTexture(nil, "ARTWORK")
        pin.icon:SetSize(20, 20)
        pin.icon:SetPoint("CENTER")
        
        pin:SetScript("OnEnter", function(self)
            GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
            GameTooltip:AddLine("|cffFF7D0ALoboExporter|r: Logro de Zona", 1, 1, 1)
            GameTooltip:AddLine((self.zoneName or "") .. " (ID: " .. (self.achID or 0) .. ")", 1, 0.82, 0)
            if self.isCompleted then
                GameTooltip:AddLine("Estado: |cff00FF00[COMPLETADO]|r", 0.2, 1, 0.2)
            else
                GameTooltip:AddLine("Estado: |cffFF3333[PENDIENTE / FALTA]|r", 1, 0.2, 0.2)
            end
            if self.achID then
                local num = GetAchievementNumCriteria(self.achID)
                if num and num > 0 then
                    local done = 0
                    for c = 1, num do
                        local _, _, critDone = GetAchievementCriteriaInfo(self.achID, c)
                        if critDone then done = done + 1 end
                    end
                    GameTooltip:AddLine("Criterios de trama: " .. done .. " / " .. num, 0.8, 0.8, 0.8)
                end
            end
            GameTooltip:Show()
        end)
        pin:SetScript("OnLeave", function() GameTooltip:Hide() end)
        
        pin:EnableMouse(true)
        pin:RegisterForClicks("AnyUp")
        pin:SetScript("OnClick", function(self)
            local now = GetTime()
            if self.lastClick and (now - self.lastClick) < 0.3 then return end
            self.lastClick = now
            
            PlaySound(SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON or 856)
            print("|cffFF7D0A========================================|r")
            print("|cffFF7D0A[LoboTracker Inspector]|r ¡Has hecho CLICK en un icono de NUESTRO AddOn!")
            print(" -> |cffFFFFFFZona:|r " .. (self.zoneName or "Desconocida"))
            print(" -> |cffFFFFFFID de Logro:|r " .. (self.achID or 0))
            if self.isCompleted then
                print(" -> |cffFFFFFFEstado en LoboExporter:|r |cff00FF00[COMPLETADO]|r")
            else
                print(" -> |cffFFFFFFEstado en LoboExporter:|r |cffFF3333[PENDIENTE / FALTA]|r")
            end
            if self.achID then
                local num = GetAchievementNumCriteria(self.achID)
                if num and num > 0 then
                    local done = 0
                    for c = 1, num do
                        local _, _, critDone = GetAchievementCriteriaInfo(self.achID, c)
                        if critDone then done = done + 1 end
                    end
                    print(" -> |cffFFFFFFCriterios de Trama:|r " .. done .. " / " .. num .. " completados.")
                end
            end
            print("|cffFF7D0A========================================|r")
        end)
        
        MapPins[index] = pin
    end
    return MapPins[index]
end

local function UpdateLoboMapPins()
    HideAllMapPins()
    if not LoboExporterDB.showMapPins then return end
    
    local mapFrame = WorldMapDetailFrame or WorldMapButton
    if not mapFrame or not mapFrame:IsShown() then return end
    
    local mapName = GetMapInfo()
    local MAP_NAME_TO_CONT = {
        ["Kalimdor"] = 1, ["Azeroth"] = 2, ["Expansion01"] = 3,
        ["Northrend"] = 4, ["TheMaelstrom"] = 5, ["Maelstrom"] = 5,
        ["Pandaria"] = 6, ["Draenor"] = 7, ["BrokenIsles"] = 8, ["Argus"] = 9
    }
    local continent = MAP_NAME_TO_CONT[mapName] or GetCurrentMapContinent()
    local zone = GetCurrentMapZone()
    
    -- Solo mostramos cuando se ve el mapa general de un continente
    if (zone == 0 or zone == nil or MAP_NAME_TO_CONT[mapName]) and MAP_ZONES_INFO[continent] then
        local pinIdx = 1
        local w, h = mapFrame:GetWidth(), mapFrame:GetHeight()
        if w and h and w > 0 and h > 0 then
            local playerFaction = UnitFactionGroup("player")
            for _, info in ipairs(MAP_ZONES_INFO[continent]) do
                if (not info.faction or info.faction == playerFaction) and (not info.reqAch or IsAchievementDone(info.reqAch)) then
                    local achID = GetZoneAchID(info)
                    local completed = IsAchievementDone(achID)
                    if (not completed) or LoboExporterDB.showMapCompleted then
                        local pin = GetOrCreatePin(pinIdx)
                        if pin then
                            pin.zoneName = info.name
                            pin.achID = achID
                            pin.isCompleted = completed
                            
                            if completed then
                                pin.icon:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-Ready")
                                pin:SetAlpha(1.0)
                            else
                                pin.icon:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-NotReady")
                                pin:SetAlpha(1.0)
                            end
                            
                            pin:ClearAllPoints()
                            pin:SetPoint("CENTER", mapFrame, "TOPLEFT", info.x * w, -info.y * h)
                            pin:Show()
                            pinIdx = pinIdx + 1
                        end
                    end
                end
            end
        end
    end
end

local MapEventFrame = CreateFrame("Frame")
MapEventFrame:RegisterEvent("WORLD_MAP_UPDATE")
MapEventFrame:RegisterEvent("PLAYER_ENTERING_WORLD")
MapEventFrame:RegisterEvent("ACHIEVEMENT_EARNED")
MapEventFrame:SetScript("OnEvent", function()
    C_Timer.After(0.05, UpdateLoboMapPins)
end)

if WorldMapFrame then
    WorldMapFrame:HookScript("OnShow", function()
        C_Timer.After(0.05, UpdateLoboMapPins)
    end)
end
if hooksecurefunc then
    hooksecurefunc("WorldMapFrame_Update", function()
        UpdateLoboMapPins()
    end)
end

-- ==========================================================
-- INTERFAZ GRÁFICA (UI)
-- ==========================================================
local UIFrame = CreateFrame("Frame", "LoboExporterFrame", UIParent)
UIFrame:SetSize(640, 600)
UIFrame:SetPoint("CENTER")
UIFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 11 }
})
UIFrame:SetMovable(true)
UIFrame:EnableMouse(true)
UIFrame:RegisterForDrag("LeftButton")
UIFrame:SetScript("OnDragStart", UIFrame.StartMoving)
UIFrame:SetScript("OnDragStop", UIFrame.StopMovingOrSizing)
UIFrame:Hide()

-- Título
local TitleTexture = UIFrame:CreateTexture(nil, "ARTWORK")
TitleTexture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
TitleTexture:SetWidth(380)
TitleTexture:SetHeight(64)
TitleTexture:SetPoint("TOP", UIFrame, "TOP", 0, 12)

local TitleText = UIFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
TitleText:SetPoint("TOP", TitleTexture, "TOP", 0, -14)
TitleText:SetText("|cffFF7D0ALobo|r Exporter & Tracker")

-- Botón Cerrar
local CloseBtn = CreateFrame("Button", nil, UIFrame, "UIPanelCloseButton")
CloseBtn:SetPoint("TOPRIGHT", UIFrame, "TOPRIGHT", -8, -8)

-- Panel Superior de Opciones (Checkboxes)
local function CreateCheckbox(parent, label, key, x, y)
    local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    cb:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    cb.text = cb:CreateFontString(nil, "OVERLAY", "GameFontNormalSmall")
    cb.text:SetPoint("LEFT", cb, "RIGHT", 4, 1)
    cb.text:SetText(label)
    cb:SetChecked(LoboExporterDB[key])
    cb:SetScript("OnClick", function(self)
        LoboExporterDB[key] = self:GetChecked()
        UpdateLoboMapPins()
    end)
    return cb
end

local cbEquip = CreateCheckbox(UIFrame, "Equipamiento", "exportEquipment", 25, -45)
local cbCurr = CreateCheckbox(UIFrame, "Oro y Monedas", "exportCurrencies", 165, -45)
local cbRep = CreateCheckbox(UIFrame, "Reputaciones", "exportReputations", 305, -45)

local cbAchDone = CreateCheckbox(UIFrame, "Logros Completados", "exportCompletedAchievs", 25, -75)
local cbAchInc = CreateCheckbox(UIFrame, "Logros Sin Completar", "exportIncompleteAchievs", 165, -75)
local cbFollowers = CreateCheckbox(UIFrame, "Seguidores (WoD)", "exportFollowers", 305, -75)

-- Checkboxes para Mapa de Logros
local cbMapPins = CreateCheckbox(UIFrame, "❌ Ver Faltantes en Mapa", "showMapPins", 430, -45)
local cbMapDone = CreateCheckbox(UIFrame, "✅ Ver Completados en Mapa", "showMapCompleted", 430, -75)

-- Botón Formato
local FormatBtn = CreateFrame("Button", nil, UIFrame, "UIPanelButtonTemplate")
FormatBtn:SetSize(160, 24)
FormatBtn:SetPoint("TOPRIGHT", UIFrame, "TOPRIGHT", -25, -105)
local function UpdateFormatBtnText()
    FormatBtn:SetText(LoboExporterDB.formatJSON and "Formato: JSON { }" or "Formato: Texto Legible")
end
FormatBtn:SetScript("OnClick", function()
    LoboExporterDB.formatJSON = not LoboExporterDB.formatJSON
    UpdateFormatBtnText()
end)

-- Botones de Acción
local GenerateBtn = CreateFrame("Button", nil, UIFrame, "UIPanelButtonTemplate")
GenerateBtn:SetSize(210, 30)
GenerateBtn:SetPoint("TOPLEFT", UIFrame, "TOPLEFT", 25, -105)
GenerateBtn:SetText("⚡ Generar Datos para Copiar")

local CopyAllBtn = CreateFrame("Button", nil, UIFrame, "UIPanelButtonTemplate")
CopyAllBtn:SetSize(200, 30)
CopyAllBtn:SetPoint("LEFT", GenerateBtn, "RIGHT", 10, 0)
CopyAllBtn:SetText("📋 Seleccionar Todo (CTRL+C)")

-- Caja de Texto Scrollable
local ScrollFrame = CreateFrame("ScrollFrame", "LoboExporterScrollFrame", UIFrame, "UIPanelScrollFrameTemplate")
ScrollFrame:SetPoint("TOPLEFT", UIFrame, "TOPLEFT", 25, -185)
ScrollFrame:SetPoint("BOTTOMRIGHT", UIFrame, "BOTTOMRIGHT", -45, 25)

local ScrollBG = CreateFrame("Frame", nil, UIFrame)
ScrollBG:SetPoint("TOPLEFT", ScrollFrame, "TOPLEFT", -6, 6)
ScrollBG:SetPoint("BOTTOMRIGHT", ScrollFrame, "BOTTOMRIGHT", 26, -6)
ScrollBG:SetBackdrop({
    bgFile = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 }
})
ScrollBG:SetBackdropColor(0.05, 0.05, 0.08, 0.95)

local EditBox = CreateFrame("EditBox", nil, ScrollFrame)
EditBox:SetSize(540, 360)
EditBox:SetMultiLine(true)
EditBox:SetFontObject("ChatFontNormal")
EditBox:SetAutoFocus(false)
EditBox:EnableKeyboard(true)
EditBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
ScrollFrame:SetScrollChild(EditBox)

-- Create Search Label
local SearchLabel = UIFrame:CreateFontString(nil, "ARTWORK", "GameFontNormal")
SearchLabel:SetPoint("TOPLEFT", UIFrame, "TOPLEFT", 25, -148)
SearchLabel:SetText("Buscar Logro:")

-- Create Search EditBox
local SearchEditBox = CreateFrame("EditBox", "LoboExporterSearchEditBox", UIFrame, "InputBoxTemplate")
SearchEditBox:SetSize(280, 24)
SearchEditBox:SetPoint("LEFT", SearchLabel, "RIGHT", 10, 0)
SearchEditBox:SetAutoFocus(false)

-- Perform Search Function
local function PerformSearch(query)
    if not query or query == "" then
        EditBox:SetText("Escribe algo para buscar...")
        return
    end
    EditBox:SetText("Buscando logros con: '" .. query .. "'...")
    
    C_Timer.After(0.05, function()
        local cats = GetCategoryList()
        local results = {}
        local found = 0
        local isJSON = LoboExporterDB.formatJSON
        
        if isJSON then
            results[#results+1] = "{\n  \"searchQuery\": \"" .. EscapeJSON(query) .. "\",\n  \"results\": ["
        else
            results[#results+1] = "=== RESULTADOS DE BÚSQUEDA: '" .. query .. "' ==="
        end
        
        local matchItems = {}
        for _, catID in ipairs(cats) do
            local num = GetCategoryNumAchievements(catID)
            for i = 1, num do
                local id, name, points, completed = GetAchievementInfo(catID, i)
                -- FIX: Use plain search (4th arg = true) to prevent Lua regex pattern errors
                if name and string.find(string.lower(name), string.lower(query), 1, true) then
                    completed = IsAchievementDone(id)
                    found = found + 1
                    if isJSON then
                        matchItems[#matchItems+1] = string.format('    {"id": %d, "name": "%s", "points": %d, "completed": %s}', id, EscapeJSON(name), points or 0, completed and "true" or "false")
                    else
                        results[#results+1] = string.format("[%s] %s (ID: %d - %d pts)", completed and "X" or " ", name, id, points or 0)
                    end
                end
            end
        end
        
        if isJSON then
            results[#results+1] = table.concat(matchItems, ",\n")
            results[#results+1] = "  ]\n}"
        else
            results[#results+1] = string.format("\nTotal encontrados: %d logros.", found)
        end
        
        EditBox:SetText(table.concat(results, "\n"))
        EditBox:SetFocus()
        EditBox:HighlightText()
    end)
end

-- Create Search Button
local SearchBtn = CreateFrame("Button", nil, UIFrame, "UIPanelButtonTemplate")
SearchBtn:SetSize(80, 24)
SearchBtn:SetPoint("LEFT", SearchEditBox, "RIGHT", 10, 0)
SearchBtn:SetText("Buscar")
SearchBtn:SetScript("OnClick", function() PerformSearch(SearchEditBox:GetText()) end)
SearchEditBox:SetScript("OnEnterPressed", function(self)
    PerformSearch(self:GetText())
    self:ClearFocus()
end)

-- Create Clear Button
local ClearBtn = CreateFrame("Button", nil, UIFrame, "UIPanelButtonTemplate")
ClearBtn:SetSize(80, 24)
ClearBtn:SetPoint("LEFT", SearchBtn, "RIGHT", 10, 0)
ClearBtn:SetText("Limpiar")
ClearBtn:SetScript("OnClick", function()
    SearchEditBox:SetText("")
    EditBox:SetText("")
    EditBox:ClearFocus()
end)

-- Funciones de Botones
GenerateBtn:SetScript("OnClick", function()
    EditBox:SetText("Generando datos, por favor espera...")
    C_Timer.After(0.05, function()
        local result = GenerateExport()
        EditBox:SetText(result)
        EditBox:SetFocus()
        EditBox:HighlightText()
        print("|cffFF7D0A[LoboExporter]|r Datos generados (" .. string.len(result) .. " caracteres). Pulsa |cff00FF00CTRL + C|r para copiar.")
    end)
end)

CopyAllBtn:SetScript("OnClick", function()
    EditBox:SetFocus()
    EditBox:HighlightText()
    print("|cffFF7D0A[LoboExporter]|r Texto seleccionado. Pulsa |cff00FF00CTRL + C|r para copiar en tu portapapeles.")
end)

-- Carga inicial del estado
UIFrame:SetScript("OnShow", function()
    UpdateFormatBtnText()
    cbEquip:SetChecked(LoboExporterDB.exportEquipment)
    cbCurr:SetChecked(LoboExporterDB.exportCurrencies)
    cbRep:SetChecked(LoboExporterDB.exportReputations)
    cbAchDone:SetChecked(LoboExporterDB.exportCompletedAchievs)
    cbAchInc:SetChecked(LoboExporterDB.exportIncompleteAchievs)
    cbMapPins:SetChecked(LoboExporterDB.showMapPins)
    cbMapDone:SetChecked(LoboExporterDB.showMapCompleted)
end)

-- Slash Commands
SLASH_LOBOEXPORTER1 = "/loboexport"
SLASH_LOBOEXPORTER2 = "/lex"
SLASH_LOBOEXPORTER3 = "/exportar"
SlashCmdList["LOBOEXPORTER"] = function(msg)
    if msg and string.lower(msg) == "debug" then
        local mapName = GetMapInfo()
        local MAP_NAME_TO_CONT = {
            ["Kalimdor"] = 1, ["Azeroth"] = 2, ["Expansion01"] = 3,
            ["Northrend"] = 4, ["TheMaelstrom"] = 5, ["Maelstrom"] = 5,
            ["Pandaria"] = 6, ["Draenor"] = 7,
            ["BrokenIsles"] = 8, ["Argus"] = 9
        }
        local cont = MAP_NAME_TO_CONT[mapName] or GetCurrentMapContinent()
        if not MAP_ZONES_INFO[cont] then cont = 1 end -- Si no hay datos, mostramos Kalimdor por defecto
        print("|cffFF7D0A[LoboExporter Debug]|r Zonas del Continente " .. cont .. " (" .. (mapName or "Kalimdor") .. "):")
        if MAP_ZONES_INFO[cont] then
            local playerFaction = UnitFactionGroup("player")
            for _, info in ipairs(MAP_ZONES_INFO[cont]) do
                if not info.faction or info.faction == playerFaction then
                    if info.reqAch and not IsAchievementDone(info.reqAch) then
                        print(" - " .. info.name .. " |cffFF8800[BLOQUEADO - Requiere Logro " .. info.reqAch .. "]|r")
                    else
                        local achID = GetZoneAchID(info)
                        local done = IsAchievementDone(achID)
                        print(" - " .. info.name .. " (" .. achID .. "): " .. (done and "|cff00FF00[COMPLETADO]|r" or "|cffFF3333[PENDIENTE]|r"))
                    end
                end
            end
        end
        return
    end
    if msg and (string.lower(msg) == "progreso" or string.lower(msg) == "stats") then
        local numMounts = 0
        if C_MountJournal and C_MountJournal.GetNumMounts then
            numMounts = C_MountJournal.GetNumMounts()
        end
        local numPets = 0
        if C_PetJournal and C_PetJournal.GetNumPets then
            _, numPets = C_PetJournal.GetNumPets()
        end
        local totalPoints = GetTotalAchievementPoints()
        print("|cffFF7D0A=== [LoboExporter: Resumen de Progreso] ===|r")
        print("🏆 |cff00FF00Puntos de Logro:|r " .. (totalPoints or 0))
        print("🐎 |cff00FF00Monturas en diario:|r " .. (numMounts or 0))
        print("🐾 |cff00FF00Mascotas en diario:|r " .. (numPets or 0))
        print("💰 |cff00FF00Oro actual:|r " .. GetCoinTextureString(GetMoney()))
        return
    end
    if msg and string.lower(msg) == "bikini" then
        if not UIFrame:IsShown() then UIFrame:Show() end
        EditBox:SetText("Consultando la base de datos de Blizzard... (Forzando caché de objetos, espera 1.5s)")
        
        -- Forzar al cliente a pedir los datos de todos los objetos al servidor
        for _, ids in pairs(BIKINI_PLATES_IDS) do
            for _, itemID in ipairs(ids) do
                GetItemInfo(itemID)
            end
        end
        
        -- Esperar 1.5 segundos para que el servidor responda y llene la caché
        C_Timer.After(1.5, function()
            EditBox:SetText(GetBikiniDataJSON())
            EditBox:SetFocus()
            EditBox:HighlightText()
            print("|cffFF7D0A[LoboExporter]|r Datos de transfiguración (Bikini Plate) listos para copiar.")
        end)
        return
    end
    if msg and string.sub(string.lower(msg), 1, 6) == "search" then
        local query = string.trim(string.sub(msg, 7))
        if query == "" then query = "Frondavil" end
        if not UIFrame:IsShown() then UIFrame:Show() end
        SearchEditBox:SetText(query)
        PerformSearch(query)
        return
    end
    if UIFrame:IsShown() then
        UIFrame:Hide()
    else
        UIFrame:Show()
    end
end

local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("ADDON_LOADED")
EventFrame:SetScript("OnEvent", function(self, event, arg1)
    if arg1 == ADDON_NAME then
        print("|cffFF7D0A[LoboExporter]|r AddOn cargado (con LoboTracker de Mapa). Escribe |cff00FF00/lex|r para opciones.")
    end
end)
