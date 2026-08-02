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

local function RunCoroutine(co)
    local ticker
    ticker = C_Timer.NewTicker(0.01, function()
        if coroutine.status(co) ~= "dead" then
            local success, err = coroutine.resume(co)
            if not success then
                print("|cffFF0000[LoboExporter] Error en exportación:|r", err)
                ticker:Cancel()
            end
        else
            ticker:Cancel()
        end
    end)
end


local function ExportRaidLootAsync(progressCallback, callback)
    local results = {}
    
    local co = coroutine.create(function()
        EJ_SelectTier(7)
        local totalBosses = 0
        local idx = 1
        while true do
            local iID = EJ_GetInstanceByIndex(idx, true)
            if not iID then break end
            EJ_SelectInstance(iID)
            local b = 1
            while EJ_GetEncounterInfoByIndex(b) do
                totalBosses = totalBosses + 1
                b = b + 1
            end
            idx = idx + 1
        end
        
        local bossesProcessed = 0
        
        local origClass, origSpec = EJ_GetLootFilter()
        local raidIndex = 1
        while true do
            local instanceID, raidName = EJ_GetInstanceByIndex(raidIndex, true)
            if not instanceID then break end
            
            EJ_SelectInstance(instanceID)
            local i = 1
            while true do
                local bossName, description, bossID = EJ_GetEncounterInfoByIndex(i)
                if not bossName then break end
                
                EJ_SelectEncounter(bossID)
                
                local diffs = { {14, "Normal"}, {15, "Heroico"}, {16, "Mítico"} }
                
                for _, diff in ipairs(diffs) do
                    EJ_SetDifficulty(diff[1])
                    local seenItems = {}
                    
                    if origClass and origClass > 0 then
                        EJ_SetLootFilter(origClass, 0) -- Todas las especializaciones de la clase actual
                    end
                    
                    local numLoot = EJ_GetNumLoot()
                        for j = 1, numLoot do
                            local vals = { EJ_GetLootInfoByIndex(j) }
                            local itemID = 0
                            local itemLink = nil
                            local infoName = nil
                            local infoSlot = nil
                            
                            for _, v in ipairs(vals) do
                                if type(v) == "string" then
                                    if string.find(v, "Hitem:") then
                                        itemLink = v
                                    elseif string.find(v, "Interface") then
                                        -- ignorar icono
                                    elseif v == "Tela" or v == "Placas" or v == "Malla" or v == "Cuero" or v == "Reliquia" or v == "Cloth" or v == "Plate" or v == "Mail" or v == "Leather" or v == "Relic" then
                                        -- ignorar armorType
                                    elseif string.len(v) > 2 and string.match(v, "[%a%s]+") then
                                        if not infoName then infoName = v else infoSlot = v end
                                    end
                                elseif type(v) == "number" and v > 1000 then
                                    itemID = v
                                end
                            end
                            
                            if itemLink then
                                local foundID = string.match(itemLink, "item:(%d+)")
                                if foundID then itemID = tonumber(foundID) end
                            end
                            
                            local query = itemLink or itemID
                            if query and query ~= 0 and not seenItems[itemID] then
                                local itemName, _, _, _, _, _, itemSubType, _, itemEquipLoc = GetItemInfo(query)
                                if not itemName or itemName == "" then itemName = infoName end
                                
                                local finalSlot = itemEquipLoc
                                if not finalSlot or finalSlot == "" then
                                    finalSlot = infoSlot
                                end
                                if not finalSlot or finalSlot == "" then
                                    finalSlot = itemSubType
                                end
                                
                                if itemName and itemName ~= "" then
                                    seenItems[itemID] = true
                                    results[#results+1] = string.format(
                                        '    {"raid": "%s", "boss": "%s", "difficulty": "%s", "itemName": "%s", "itemID": %d, "slot": "%s"}',
                                        EscapeJSON(raidName), EscapeJSON(bossName), diff[2], EscapeJSON(itemName), itemID, EscapeJSON(finalSlot or "")
                                    )
                                end
                            end
                        end
                end
                
                bossesProcessed = bossesProcessed + 1
                if progressCallback then progressCallback(bossesProcessed, totalBosses) end
                i = i + 1
                coroutine.yield()
            end
            raidIndex = raidIndex + 1
        end
        if origClass then EJ_SetLootFilter(origClass, origSpec or 0) end
        callback("{\n  \"raidLoot\": [\n" .. table.concat(results, ",\n") .. "\n  ]\n}", #results)
    end)
    RunCoroutine(co)
end

local function ExportDungeonLootAsync(progressCallback, callback)
    local results = {}
    
    local co = coroutine.create(function()
        EJ_SelectTier(7)
        local totalBosses = 0
        local idx = 1
        while true do
            local iID = EJ_GetInstanceByIndex(idx, false)
            if not iID then break end
            EJ_SelectInstance(iID)
            local b = 1
            while EJ_GetEncounterInfoByIndex(b) do
                totalBosses = totalBosses + 1
                b = b + 1
            end
            idx = idx + 1
        end
        
        local bossesProcessed = 0
        
        local origClass, origSpec = EJ_GetLootFilter()
        local dungeonIndex = 1
        while true do
            local instanceID, instanceName = EJ_GetInstanceByIndex(dungeonIndex, false)
            if not instanceID then break end
            
            EJ_SelectInstance(instanceID)
            local i = 1
            while true do
                local bossName, description, bossID = EJ_GetEncounterInfoByIndex(i)
                if not bossName then break end
                
                EJ_SelectEncounter(bossID)
                
                local diffs = { {1, "Normal"}, {2, "Heroico"}, {23, "Mítico"} }
                
                for _, diff in ipairs(diffs) do
                    EJ_SetDifficulty(diff[1])
                    local seenItems = {}
                    
                    if origClass and origClass > 0 then
                        EJ_SetLootFilter(origClass, 0) -- Todas las especializaciones de la clase actual
                    end
                        local numLoot = EJ_GetNumLoot()
                        for j = 1, numLoot do
                            local vals = { EJ_GetLootInfoByIndex(j) }
                            local itemID = 0
                            local itemLink = nil
                            local infoName = nil
                            local infoSlot = nil
                            
                            for _, v in ipairs(vals) do
                                if type(v) == "string" then
                                    if string.find(v, "Hitem:") then
                                        itemLink = v
                                    elseif string.find(v, "Interface") then
                                        -- ignorar icono
                                    elseif v == "Tela" or v == "Placas" or v == "Malla" or v == "Cuero" or v == "Reliquia" or v == "Cloth" or v == "Plate" or v == "Mail" or v == "Leather" or v == "Relic" then
                                        -- ignorar armorType
                                    elseif string.len(v) > 2 and string.match(v, "[%a%s]+") then
                                        if not infoName then infoName = v else infoSlot = v end
                                    end
                                elseif type(v) == "number" and v > 1000 then
                                    itemID = v
                                end
                            end
                            
                            if itemLink then
                                local foundID = string.match(itemLink, "item:(%d+)")
                                if foundID then itemID = tonumber(foundID) end
                            end
                            
                            local query = itemLink or itemID
                            if query and query ~= 0 and not seenItems[itemID] then
                                local itemName, _, _, _, _, _, itemSubType, _, itemEquipLoc = GetItemInfo(query)
                                if not itemName or itemName == "" then itemName = infoName end
                                
                                local finalSlot = itemEquipLoc
                                if not finalSlot or finalSlot == "" then
                                    finalSlot = infoSlot
                                end
                                if not finalSlot or finalSlot == "" then
                                    finalSlot = itemSubType
                                end
                                
                                if itemName and itemName ~= "" then
                                    seenItems[itemID] = true
                                    results[#results+1] = string.format(
                                        '    {"dungeon": "%s", "boss": "%s", "difficulty": "%s", "itemName": "%s", "itemID": %d, "slot": "%s"}',
                                        EscapeJSON(dungeonName), EscapeJSON(bossName), diff[2], EscapeJSON(itemName), itemID, EscapeJSON(finalSlot or "")
                                    )
                                end
                            end
                        end
                end
                
                bossesProcessed = bossesProcessed + 1
                if progressCallback then progressCallback(bossesProcessed, totalBosses) end
                i = i + 1
                coroutine.yield()
            end
            dungeonIndex = dungeonIndex + 1
        end
        if origClass then EJ_SetLootFilter(origClass, origSpec or 0) end
        callback("{\n  \"dungeonLoot\": [\n" .. table.concat(results, ",\n") .. "\n  ]\n}", #results)
    end)
    RunCoroutine(co)
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
    
    if LoboExporterDB.exportEquipment then parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. GetEquipmentData(isJSON) end
    if LoboExporterDB.exportCurrencies then parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. GetCurrenciesData(isJSON) end
    if LoboExporterDB.exportReputations then parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. GetReputationsData(isJSON) end
    if LoboExporterDB.exportFollowers then
        local ok, data = pcall(GetFollowersData, isJSON)
        if ok then
            parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. data
        else
            parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. (isJSON and ('  "followers_error": "' .. EscapeJSON(tostring(data)) .. '"') or ("ERROR: " .. tostring(data)))
        end
    end
    if LoboExporterDB.exportCompletedAchievs then parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. GetAchievementsData(true, false, isJSON) end
    if LoboExporterDB.exportIncompleteAchievs then parts[#parts+1] = (isJSON and (#parts > 1 and ",\n" or "") or "\n") .. GetAchievementsData(false, true, isJSON) end
    
    if isJSON then parts[#parts+1] = "\n}" end
    return table.concat(parts, isJSON and "" or "\n")
end

-- ==========================================================
-- INTERFAZ GRÁFICA (UI) REDISEÑADA
-- ==========================================================
local UIFrame = CreateFrame("Frame", "LoboExporterFrame", UIParent)
UIFrame:SetSize(700, 620)
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
tinsert(UISpecialFrames, "LoboExporterFrame")

local TitleTexture = UIFrame:CreateTexture(nil, "ARTWORK")
TitleTexture:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
TitleTexture:SetWidth(420)
TitleTexture:SetHeight(64)
TitleTexture:SetPoint("TOP", UIFrame, "TOP", 0, 12)

local TitleText = UIFrame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
TitleText:SetPoint("TOP", TitleTexture, "TOP", 0, -14)
TitleText:SetText("|cffFF7D0ALobo|r Exporter & Tracker 2.0")

local CloseBtn = CreateFrame("Button", nil, UIFrame, "UIPanelCloseButton")
CloseBtn:SetPoint("TOPRIGHT", UIFrame, "TOPRIGHT", -8, -8)

-- ==========================================================
-- PESTAÑAS (TABS)
-- ==========================================================
local tabs = {}
local panels = {}
local activeTab = 1

local function SelectTab(id)
    activeTab = id
    PanelTemplates_SetTab(UIFrame, id)
    for i = 1, #tabs do
        if i == id then
            panels[i]:Show()
        else
            panels[i]:Hide()
        end
    end
end

local function CreateTab(id, name, xOffset)
    local tab = CreateFrame("Button", "LoboExporterFrameTab"..id, UIFrame, "CharacterFrameTabButtonTemplate")
    tab:SetID(id)
    tab:SetText(name)
    if id == 1 then
        tab:SetPoint("BOTTOMLEFT", UIFrame, "BOTTOMLEFT", xOffset, -32)
    else
        tab:SetPoint("LEFT", tabs[id-1], "RIGHT", -16, 0)
    end
    tab:SetScript("OnClick", function(self) SelectTab(self:GetID()) end)
    table.insert(tabs, tab)
    
    local panel = CreateFrame("Frame", nil, UIFrame)
    panel:SetPoint("TOPLEFT", UIFrame, "TOPLEFT", 15, -45)
    panel:SetPoint("BOTTOMRIGHT", UIFrame, "BOTTOMRIGHT", -15, 15)
    panel:Hide()
    table.insert(panels, panel)
    
    return panel
end

local PanelStatus = CreateTab(1, "Progreso y Estado", 15)
local PanelLoot = CreateTab(2, "Bases de Datos (BiS)", 0)
local PanelChar = CreateTab(3, "Exportar Personaje", 0)
local PanelTools = CreateTab(4, "Opciones y Mapa", 0)

PanelTemplates_SetNumTabs(UIFrame, 4)
PanelTemplates_SetTab(UIFrame, 1)

-- ==========================================================
-- CAJA DE RESULTADOS (COMÚN EN BOTTOM)
-- ==========================================================
local ScrollFrame = CreateFrame("ScrollFrame", "LoboExporterScrollFrame", UIFrame, "UIPanelScrollFrameTemplate")
ScrollFrame:SetPoint("BOTTOMLEFT", UIFrame, "BOTTOMLEFT", 25, 60)
ScrollFrame:SetPoint("BOTTOMRIGHT", UIFrame, "BOTTOMRIGHT", -45, 60)
ScrollFrame:SetHeight(200)

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
EditBox:SetSize(600, 200)
EditBox:SetMultiLine(true)
EditBox:SetFontObject("ChatFontNormal")
EditBox:SetAutoFocus(false)
EditBox:EnableKeyboard(true)
EditBox:SetMaxBytes(10000000)
EditBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
ScrollFrame:SetScrollChild(EditBox)

local currentPages = {}
local currentPageIdx = 1

local CopyAllBtn = CreateFrame("Button", nil, UIFrame, "UIPanelButtonTemplate")
CopyAllBtn:SetSize(160, 24)
CopyAllBtn:SetPoint("BOTTOMRIGHT", ScrollFrame, "TOPRIGHT", 0, 5)
CopyAllBtn:SetFrameLevel(ScrollFrame:GetFrameLevel() + 10)
CopyAllBtn:SetText("📋 Seleccionar Todo")
CopyAllBtn:SetScript("OnClick", function()
    EditBox:SetFocus()
    EditBox:HighlightText()
end)

local PageText = UIFrame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
PageText:SetPoint("RIGHT", CopyAllBtn, "LEFT", -10, 0)
PageText:SetText("Pág. 1/1")

local NextPageBtn = CreateFrame("Button", nil, UIFrame, "UIPanelButtonTemplate")
NextPageBtn:SetSize(30, 24)
NextPageBtn:SetPoint("RIGHT", PageText, "LEFT", -5, 0)
NextPageBtn:SetFrameLevel(ScrollFrame:GetFrameLevel() + 10)
NextPageBtn:SetText(">")

local PrevPageBtn = CreateFrame("Button", nil, UIFrame, "UIPanelButtonTemplate")
PrevPageBtn:SetSize(30, 24)
PrevPageBtn:SetPoint("RIGHT", NextPageBtn, "LEFT", -5, 0)
PrevPageBtn:SetFrameLevel(ScrollFrame:GetFrameLevel() + 10)
PrevPageBtn:SetText("<")

local cbDisablePagination = CreateFrame("CheckButton", nil, UIFrame, "UICheckButtonTemplate")
cbDisablePagination:SetSize(24, 24)
cbDisablePagination:SetPoint("BOTTOMLEFT", ScrollFrame, "TOPLEFT", -5, 5)
cbDisablePagination:SetFrameLevel(ScrollFrame:GetFrameLevel() + 10)
cbDisablePagination.text = cbDisablePagination:CreateFontString(nil, "OVERLAY", "GameFontNormal")
cbDisablePagination.text:SetPoint("LEFT", cbDisablePagination, "RIGHT", 4, 1)
cbDisablePagination.text:SetText("Cargar todo (Riesgo crash)")
cbDisablePagination:SetScript("OnShow", function(self)
    if LoboExporterDB then self:SetChecked(LoboExporterDB.disablePagination) end
end)
cbDisablePagination:SetScript("OnClick", function(self)
    if not LoboExporterDB then LoboExporterDB = {} end
    LoboExporterDB.disablePagination = self:GetChecked()
end)

local function UpdatePaginationUI()
    if #currentPages <= 1 then
        PrevPageBtn:Hide()
        NextPageBtn:Hide()
        PageText:Hide()
    else
        PrevPageBtn:Show()
        NextPageBtn:Show()
        PageText:Show()
        PageText:SetText(string.format("Pág. %d/%d", currentPageIdx, #currentPages))
        PrevPageBtn:SetEnabled(currentPageIdx > 1)
        NextPageBtn:SetEnabled(currentPageIdx < #currentPages)
    end
end

PrevPageBtn:SetScript("OnClick", function()
    if currentPageIdx > 1 then
        currentPageIdx = currentPageIdx - 1
        EditBox:SetText(currentPages[currentPageIdx])
        UpdatePaginationUI()
    end
end)

NextPageBtn:SetScript("OnClick", function()
    if currentPageIdx < #currentPages then
        currentPageIdx = currentPageIdx + 1
        EditBox:SetText(currentPages[currentPageIdx])
        UpdatePaginationUI()
    end
end)

function LoboExporter_ShowTextPaginated(text)
    currentPages = {}
    currentPageIdx = 1
    
    local limit = 40000
    if LoboExporterDB and LoboExporterDB.disablePagination then
        limit = 99999999
    end
    
    if #text <= limit then
        table.insert(currentPages, text)
    else
        local idx = 1
        while idx <= #text do
            local slice = string.sub(text, idx, idx + limit - 1)
            table.insert(currentPages, slice)
            idx = idx + limit
        end
    end
    EditBox:SetText(currentPages[1] or "")
    UpdatePaginationUI()
end

-- ==========================================================
-- BARRA DE PROGRESO GLOBAL
-- ==========================================================
local ProgressBar = CreateFrame("StatusBar", nil, UIFrame)
ProgressBar:SetSize(620, 24)
ProgressBar:SetPoint("BOTTOM", UIFrame, "BOTTOM", 0, 20)
ProgressBar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
ProgressBar:SetStatusBarColor(0.2, 0.8, 0.2)
ProgressBar:Hide()

ProgressBar.bg = ProgressBar:CreateTexture(nil, "BACKGROUND")
ProgressBar.bg:SetAllPoints()
ProgressBar.bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
ProgressBar.bg:SetVertexColor(0.1, 0.1, 0.1, 0.8)

ProgressBar.text = ProgressBar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
ProgressBar.text:SetPoint("CENTER")
ProgressBar.text:SetText("Progreso: 0%")

-- ==========================================================
-- PANEL 1: ESTADO Y PROGRESO
-- ==========================================================
local StatusHeader = PanelStatus:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
StatusHeader:SetPoint("TOP", PanelStatus, "TOP", 0, -20)
StatusHeader:SetText("Resumen de Exportaciones")

local function CreateStatusLine(parent, label, yOffset)
    local frame = CreateFrame("Frame", nil, parent)
    frame:SetSize(600, 30)
    frame:SetPoint("TOP", parent, "TOP", 0, yOffset)
    
    frame.icon = frame:CreateTexture(nil, "ARTWORK")
    frame.icon:SetSize(24, 24)
    frame.icon:SetPoint("LEFT", frame, "LEFT", 0, 0)
    frame.icon:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-NotReady")
    
    frame.label = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    frame.label:SetPoint("LEFT", frame.icon, "RIGHT", 10, 0)
    frame.label:SetText(label)
    
    frame.info = frame:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    frame.info:SetPoint("RIGHT", frame, "RIGHT", 0, 0)
    frame.info:SetText("Nunca exportado")
    
    return frame
end

local StatusRaid = CreateStatusLine(PanelStatus, "⚔️ Base de Datos de Bandas", -70)
local StatusDungeon = CreateStatusLine(PanelStatus, "🏰 Base de Datos de Mazmorras", -120)
local StatusChar = CreateStatusLine(PanelStatus, "👤 Personaje", -170)

local function UpdateStatusUI()
    if not LoboExporterDB.ExportStatus then LoboExporterDB.ExportStatus = {} end
    local st = LoboExporterDB.ExportStatus
    
    if st.raidItems and st.raidItems > 0 then
        StatusRaid.icon:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-Ready")
        StatusRaid.info:SetText(string.format("|cff00FF00✅ Completado|r (%d objetos) - %s", st.raidItems, st.raidDate or ""))
    else
        StatusRaid.icon:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-NotReady")
        StatusRaid.info:SetText("|cffFF3333❌ Pendiente|r")
    end
    
    if st.dungeonItems and st.dungeonItems > 0 then
        StatusDungeon.icon:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-Ready")
        StatusDungeon.info:SetText(string.format("|cff00FF00✅ Completado|r (%d objetos) - %s", st.dungeonItems, st.dungeonDate or ""))
    else
        StatusDungeon.icon:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-NotReady")
        StatusDungeon.info:SetText("|cffFF3333❌ Pendiente|r")
    end
    
    if st.charDate then
        StatusChar.icon:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-Ready")
        StatusChar.info:SetText(string.format("|cff00FF00✅ Completado|r - %s", st.charDate))
    else
        StatusChar.icon:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-NotReady")
        StatusChar.info:SetText("|cffFF3333❌ Pendiente|r")
    end
end

-- ==========================================================
-- PANEL 2: BASES DE DATOS
-- ==========================================================
local ExportRaidBtn = CreateFrame("Button", nil, PanelLoot, "UIPanelButtonTemplate")
ExportRaidBtn:SetSize(280, 40)
ExportRaidBtn:SetPoint("TOPLEFT", PanelLoot, "TOPLEFT", 30, -20)
ExportRaidBtn:SetText("⚔️ Extraer Botín de BANDAS")

local ExportDungeonBtn = CreateFrame("Button", nil, PanelLoot, "UIPanelButtonTemplate")
ExportDungeonBtn:SetSize(280, 40)
ExportDungeonBtn:SetPoint("TOPRIGHT", PanelLoot, "TOPRIGHT", -30, -20)
ExportDungeonBtn:SetText("🏰 Extraer Botín de MAZMORRAS")

local ExportRaidCopyBtn = CreateFrame("Button", nil, PanelLoot, "UIPanelButtonTemplate")
ExportRaidCopyBtn:SetSize(280, 30)
ExportRaidCopyBtn:SetPoint("TOPLEFT", PanelLoot, "TOPLEFT", 30, -65)
ExportRaidCopyBtn:SetText("📋 Generar Texto de BANDAS para Copiar")

local ExportDungeonCopyBtn = CreateFrame("Button", nil, PanelLoot, "UIPanelButtonTemplate")
ExportDungeonCopyBtn:SetSize(280, 30)
ExportDungeonCopyBtn:SetPoint("TOPRIGHT", PanelLoot, "TOPRIGHT", -30, -65)
ExportDungeonCopyBtn:SetText("📋 Generar Texto de MAZMORRAS para Copiar")

local DbDesc = PanelLoot:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
DbDesc:SetPoint("TOP", PanelLoot, "TOP", 0, -110)
DbDesc:SetText("Las extracciones recorrerán todas las instancias, jefes, dificultades\ny las 12 clases para garantizar que no se pierda ningún objeto.\nPuede tardar unos 10-15 segundos. El juego NO se congelará.")

local function OnProgress(processed, total)
    ProgressBar:Show()
    local pct = (processed / total) * 100
    ProgressBar:SetValue(pct)
    ProgressBar.text:SetText(string.format("Progreso: %d/%d Jefes (%d%%)", processed, total, pct))
end

local function SetButtonsEnabled(enabled)
    if enabled then
        ExportRaidBtn:Enable()
        ExportDungeonBtn:Enable()
        ExportRaidCopyBtn:Enable()
        ExportDungeonCopyBtn:Enable()
    else
        ExportRaidBtn:Disable()
        ExportDungeonBtn:Disable()
        ExportRaidCopyBtn:Disable()
        ExportDungeonCopyBtn:Disable()
    end
end

ExportRaidBtn:SetScript("OnClick", function()
    SetButtonsEnabled(false)
    EditBox:SetText("Iniciando extracción de bandas... (Extrayendo solo para la clase seleccionada en la Guía de Aventuras)")
    ProgressBar:SetMinMaxValues(0, 100)
    ProgressBar:SetValue(0)
    ProgressBar.text:SetText("Progreso: 0%")
    ProgressBar:Show()
    
    ExportRaidLootAsync(OnProgress, function(json, count)
        if not LoboExporterDB then LoboExporterDB = {} end
        if not LoboExporterDB.ExportStatus then LoboExporterDB.ExportStatus = {} end
        LoboExporterDB.RaidLoot = json
        LoboExporterDB.ExportStatus.raidItems = count
        LoboExporterDB.ExportStatus.raidDate = date("%Y-%m-%d %H:%M:%S")
        UpdateStatusUI()
        
        ProgressBar:Hide()
        SetButtonsEnabled(true)
        LoboExporter_ShowTextPaginated("¡Completado! ("..count.." objetos)\n\nLa base de datos se ha guardado en la memoria de LoboExporter.\n\nRecuerda escribir /reload en el chat para guardarlo al disco (WTF).")
        print("|cffFF7D0A[LoboExporter]|r Botín de Bandas exportado con éxito.")
    end)
end)

ExportDungeonBtn:SetScript("OnClick", function()
    SetButtonsEnabled(false)
    EditBox:SetText("Iniciando extracción de mazmorras... (Extrayendo solo para la clase seleccionada en la Guía de Aventuras)")
    ProgressBar:SetMinMaxValues(0, 100)
    ProgressBar:SetValue(0)
    ProgressBar.text:SetText("Progreso: 0%")
    ProgressBar:Show()
    
    ExportDungeonLootAsync(OnProgress, function(json, count)
        if not LoboExporterDB then LoboExporterDB = {} end
        if not LoboExporterDB.ExportStatus then LoboExporterDB.ExportStatus = {} end
        LoboExporterDB.DungeonLoot = json
        LoboExporterDB.ExportStatus.dungeonItems = count
        LoboExporterDB.ExportStatus.dungeonDate = date("%Y-%m-%d %H:%M:%S")
        UpdateStatusUI()
        
        ProgressBar:Hide()
        SetButtonsEnabled(true)
        LoboExporter_ShowTextPaginated("¡Completado! ("..count.." objetos)\n\nLa base de datos se ha guardado en la memoria de LoboExporter.\n\nRecuerda escribir /reload en el chat para guardarlo al disco (WTF).")
        print("|cffFF7D0A[LoboExporter]|r Botín de Mazmorras exportado con éxito.")
    end)
end)

ExportRaidCopyBtn:SetScript("OnClick", function()
    SetButtonsEnabled(false)
    LoboExporter_ShowTextPaginated("Iniciando extracción de bandas para copiar... (Sólo la clase seleccionada)")
    ProgressBar:SetMinMaxValues(0, 100)
    ProgressBar:SetValue(0)
    ProgressBar.text:SetText("Progreso: 0%")
    ProgressBar:Show()
    
    ExportRaidLootAsync(OnProgress, function(json, count)
        ProgressBar:Hide()
        SetButtonsEnabled(true)
        LoboExporter_ShowTextPaginated(json)
        EditBox:SetFocus()
        EditBox:HighlightText()
        print("|cffFF7D0A[LoboExporter]|r Texto generado, listo para CTRL+C.")
    end)
end)

ExportDungeonCopyBtn:SetScript("OnClick", function()
    SetButtonsEnabled(false)
    LoboExporter_ShowTextPaginated("Iniciando extracción de mazmorras para copiar... (Sólo la clase seleccionada)")
    ProgressBar:SetMinMaxValues(0, 100)
    ProgressBar:SetValue(0)
    ProgressBar.text:SetText("Progreso: 0%")
    ProgressBar:Show()
    
    ExportDungeonLootAsync(OnProgress, function(json, count)
        ProgressBar:Hide()
        SetButtonsEnabled(true)
        LoboExporter_ShowTextPaginated(json)
        EditBox:SetFocus()
        EditBox:HighlightText()
        print("|cffFF7D0A[LoboExporter]|r Texto generado, listo para CTRL+C.")
    end)
end)

-- ==========================================================
-- PANEL 3: PERSONAJE
-- ==========================================================
local function CreateCheckbox(parent, label, key, x, y)
    local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    cb:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    cb.text = cb:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    cb.text:SetPoint("LEFT", cb, "RIGHT", 4, 1)
    cb.text:SetText(label)
    cb:SetChecked(LoboExporterDB[key])
    cb:SetScript("OnClick", function(self)
        LoboExporterDB[key] = self:GetChecked()
    end)
    return cb
end

local cbEquip = CreateCheckbox(PanelChar, "Equipamiento", "exportEquipment", 20, -20)
local cbCurr = CreateCheckbox(PanelChar, "Oro y Monedas", "exportCurrencies", 250, -20)
local cbRep = CreateCheckbox(PanelChar, "Reputaciones", "exportReputations", 450, -20)

local cbAchDone = CreateCheckbox(PanelChar, "Logros Completados", "exportCompletedAchievs", 20, -70)
local cbAchInc = CreateCheckbox(PanelChar, "Logros Pendientes", "exportIncompleteAchievs", 250, -70)
local cbFollowers = CreateCheckbox(PanelChar, "Seguidores (WoD)", "exportFollowers", 450, -70)

local FormatBtn = CreateFrame("Button", nil, PanelChar, "UIPanelButtonTemplate")
FormatBtn:SetSize(160, 24)
FormatBtn:SetPoint("TOPRIGHT", PanelChar, "TOPRIGHT", -10, -120)
local function UpdateFormatBtnText()
    FormatBtn:SetText(LoboExporterDB.formatJSON and "Formato: JSON { }" or "Formato: Texto Legible")
end
FormatBtn:SetScript("OnClick", function()
    LoboExporterDB.formatJSON = not LoboExporterDB.formatJSON
    UpdateFormatBtnText()
end)

local GenerateBtn = CreateFrame("Button", nil, PanelChar, "UIPanelButtonTemplate")
GenerateBtn:SetSize(280, 40)
GenerateBtn:SetPoint("TOPLEFT", PanelChar, "TOPLEFT", 10, -120)
GenerateBtn:SetText("⚡ Generar Datos del Personaje")
GenerateBtn:SetScript("OnClick", function()
    EditBox:SetText("Generando datos, por favor espera...")
    C_Timer.After(0.05, function()
        local result = GenerateExport()
        LoboExporter_ShowTextPaginated(result)
        EditBox:SetFocus()
        EditBox:HighlightText()
        
        if not LoboExporterDB.ExportStatus then LoboExporterDB.ExportStatus = {} end
        LoboExporterDB.ExportStatus.charDate = date("%Y-%m-%d %H:%M:%S")
        UpdateStatusUI()
        print("|cffFF7D0A[LoboExporter]|r Datos del personaje generados.")
    end)
end)

-- ==========================================================
-- PANEL 4: OPCIONES
-- ==========================================================
local cbMapPins = CreateCheckbox(PanelTools, "❌ Ver Logros Faltantes en el Mapa (LoboTracker)", "showMapPins", 20, -20)
cbMapPins:SetScript("OnClick", function(self) LoboExporterDB["showMapPins"] = self:GetChecked(); UpdateLoboMapPins() end)

local cbMapDone = CreateCheckbox(PanelTools, "✅ Ver Logros Completados en el Mapa", "showMapCompleted", 20, -60)
cbMapDone:SetScript("OnClick", function(self) LoboExporterDB["showMapCompleted"] = self:GetChecked(); UpdateLoboMapPins() end)

local BikiniBtn = CreateFrame("Button", nil, PanelTools, "UIPanelButtonTemplate")
BikiniBtn:SetSize(200, 30)
BikiniBtn:SetPoint("TOPLEFT", PanelTools, "TOPLEFT", 20, -120)
BikiniBtn:SetText("👙 Exportar Bikini Plate")
BikiniBtn:SetScript("OnClick", function()
    EditBox:SetText("Consultando la base de datos de Blizzard... (Forzando caché de objetos, espera 1.5s)")
    for _, ids in pairs(BIKINI_PLATES_IDS) do
        for _, itemID in ipairs(ids) do GetItemInfo(itemID) end
    end
    C_Timer.After(1.5, function()
        LoboExporter_ShowTextPaginated(GetBikiniDataJSON())
        EditBox:SetFocus()
        EditBox:HighlightText()
        print("|cffFF7D0A[LoboExporter]|r Datos de transfiguración (Bikini Plate) listos para copiar.")
    end)
end)

local ProgresoBtn = CreateFrame("Button", nil, PanelTools, "UIPanelButtonTemplate")
ProgresoBtn:SetSize(200, 30)
ProgresoBtn:SetPoint("LEFT", BikiniBtn, "RIGHT", 10, 0)
ProgresoBtn:SetText("📊 Mostrar Progreso (Chat)")
ProgresoBtn:SetScript("OnClick", function() SlashCmdList["LOBOEXPORTER"]("progreso") end)

local DebugBtn = CreateFrame("Button", nil, PanelTools, "UIPanelButtonTemplate")
DebugBtn:SetSize(200, 30)
DebugBtn:SetPoint("LEFT", ProgresoBtn, "RIGHT", 10, 0)
DebugBtn:SetText("⚙️ Info Mapa (Debug)")
DebugBtn:SetScript("OnClick", function() SlashCmdList["LOBOEXPORTER"]("debug") end)

-- Búsqueda
local SearchLabel = PanelTools:CreateFontString(nil, "ARTWORK", "GameFontNormal")
SearchLabel:SetPoint("TOPLEFT", PanelTools, "TOPLEFT", 20, -180)
SearchLabel:SetText("Buscador de Logros:")

local SearchEditBox = CreateFrame("EditBox", "LoboExporterSearchEditBox", PanelTools, "InputBoxTemplate")
SearchEditBox:SetSize(250, 24)
SearchEditBox:SetPoint("LEFT", SearchLabel, "RIGHT", 10, 0)
SearchEditBox:SetAutoFocus(false)
SearchEditBox:SetScript("OnEnterPressed", function(self)
    local query = self:GetText()
    self:ClearFocus()
    if not query or query == "" then EditBox:SetText("Escribe algo para buscar..."); return end
    EditBox:SetText("Buscando logros con: '" .. query .. "'...")
    C_Timer.After(0.05, function()
        local cats = GetCategoryList()
        local results = {}
        local found = 0
        local isJSON = LoboExporterDB.formatJSON
        if isJSON then results[#results+1] = "{\n  \"searchQuery\": \"" .. EscapeJSON(query) .. "\",\n  \"results\": [" else results[#results+1] = "=== RESULTADOS DE BÚSQUEDA: '" .. query .. "' ===" end
        local matchItems = {}
        for _, catID in ipairs(cats) do
            local num = GetCategoryNumAchievements(catID)
            for i = 1, num do
                local id, name, points = GetAchievementInfo(catID, i)
                if name and string.find(string.lower(name), string.lower(query), 1, true) then
                    local completed = IsAchievementDone(id)
                    found = found + 1
                    if isJSON then matchItems[#matchItems+1] = string.format('    {"id": %d, "name": "%s", "points": %d, "completed": %s}', id, EscapeJSON(name), points or 0, completed and "true" or "false")
                    else results[#results+1] = string.format("[%s] %s (ID: %d - %d pts)", completed and "X" or " ", name, id, points or 0) end
                end
            end
        end
        if isJSON then results[#results+1] = table.concat(matchItems, ",\n"); results[#results+1] = "  ]\n}"
        else results[#results+1] = string.format("\nTotal encontrados: %d logros.", found) end
        LoboExporter_ShowTextPaginated(table.concat(results, "\n"))
        EditBox:SetFocus()
        EditBox:HighlightText()
    end)
end)

local SearchBtn = CreateFrame("Button", nil, PanelTools, "UIPanelButtonTemplate")
SearchBtn:SetSize(80, 24)
SearchBtn:SetPoint("LEFT", SearchEditBox, "RIGHT", 10, 0)
SearchBtn:SetText("Buscar")
SearchBtn:SetScript("OnClick", function() SearchEditBox:GetScript("OnEnterPressed")(SearchEditBox) end)

local ClearBtn = CreateFrame("Button", nil, PanelTools, "UIPanelButtonTemplate")
ClearBtn:SetSize(80, 24)
ClearBtn:SetPoint("LEFT", SearchBtn, "RIGHT", 10, 0)
ClearBtn:SetText("Limpiar")
ClearBtn:SetScript("OnClick", function() SearchEditBox:SetText(""); EditBox:SetText(""); EditBox:ClearFocus() end)

-- ==========================================================
-- INICIALIZACIÓN
-- ==========================================================
UIFrame:SetScript("OnShow", function()
    UpdateFormatBtnText()
    UpdateStatusUI()
    SelectTab(activeTab)
    cbEquip:SetChecked(LoboExporterDB.exportEquipment)
    cbCurr:SetChecked(LoboExporterDB.exportCurrencies)
    cbRep:SetChecked(LoboExporterDB.exportReputations)
    cbAchDone:SetChecked(LoboExporterDB.exportCompletedAchievs)
    cbAchInc:SetChecked(LoboExporterDB.exportIncompleteAchievs)
    cbMapPins:SetChecked(LoboExporterDB.showMapPins)
    cbMapDone:SetChecked(LoboExporterDB.showMapCompleted)
end)

SLASH_LOBOEXPORTER1 = "/loboexport"
SLASH_LOBOEXPORTER2 = "/lex"
SLASH_LOBOEXPORTER3 = "/exportar"
SlashCmdList["LOBOEXPORTER"] = function(msg)
    msg = msg and strtrim(string.lower(msg)) or ""
    
    if msg == "debug" then SlashCmdList["LOBOEXPORTER"]("debug"); return end
    if msg == "progreso" or msg == "stats" then SlashCmdList["LOBOEXPORTER"]("progreso"); return end
    if msg == "raidloot" then
        if not UIFrame:IsShown() then UIFrame:Show() end
        SelectTab(2)
        ExportRaidBtn:Click()
        return
    end
    if msg == "dungeonloot" then
        if not UIFrame:IsShown() then UIFrame:Show() end
        SelectTab(2)
        ExportDungeonBtn:Click()
        return
    end
    
    if UIFrame:IsShown() then UIFrame:Hide() else UIFrame:Show() end
end

local EventFrame = CreateFrame("Frame")
EventFrame:RegisterEvent("ADDON_LOADED")
EventFrame:SetScript("OnEvent", function(self, event, arg1)
    if arg1 == ADDON_NAME then
        if not LoboExporterDB.ExportStatus then LoboExporterDB.ExportStatus = {} end
        print("|cffFF7D0A[LoboExporter]|r AddOn cargado. Escribe |cff00FF00/lex|r para opciones.")
    end
end)
