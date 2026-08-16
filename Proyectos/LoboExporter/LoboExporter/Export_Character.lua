--[[--------------------------------------------------------------------------
    LoboExporter 3.0 — Exportadores de personaje

    Cada recolector devuelve una TABLA LUA, no texto. El texto (JSON o legible)
    se genera al final desde esa tabla. Así es imposible producir JSON roto,
    que era el fallo del token para la IA en la versión 2.x.
----------------------------------------------------------------------------]]

local ADDON_NAME, LE = ...

local tinsert, tconcat = table.insert, table.concat
local sformat = string.format

LE.Character = {}
local C = LE.Character

--=============================================================================
-- IDENTIDAD
--=============================================================================

function C:GetIdentity()
    local name = UnitName("player")
    local realm = GetRealmName()
    local className, classFile = UnitClass("player")
    local raceName, raceFile = UnitRace("player")
    local faction = UnitFactionGroup("player")
    local sex = UnitSex("player")

    return {
        name    = name or "Desconocido",
        realm   = realm or "Desconocido",
        class   = className or "",
        classId = classFile or "",
        race    = raceName or "",
        raceId  = raceFile or "",
        faction = faction or "",
        gender  = (sex == 3) and "Femenino" or (sex == 2) and "Masculino" or "Desconocido",
        level   = UnitLevel("player") or 0,
        guild   = GetGuildInfo("player") or "",
    }
end

--=============================================================================
-- ESPECIALIZACIÓN Y ESTADÍSTICAS
--=============================================================================

function C:GetSpec()
    local out = { name = "", role = "", stats = {} }

    local specIndex = LE:Safe(GetSpecialization, nil)
    if specIndex then
        -- La firma de GetSpecializationInfo cambió entre builds (unos meten
        -- "background" antes del rol y otros no), así que el nombre se toma por
        -- posición y el rol se busca por su forma: sólo puede ser uno de tres.
        local ROLES = { TANK = true, HEALER = true, DAMAGER = true }
        local id, specName = LE:Safe(GetSpecializationInfo, nil, specIndex)
        out.id = id or 0
        out.name = specName or ""
        out.role = LE:FindReturn(
            function(v) return type(v) == "string" and ROLES[v] end,
            LE:Safe(GetSpecializationInfo, nil, specIndex)) or ""
    end

    -- Estadísticas primarias y secundarias. CR_* son constantes globales del
    -- cliente; si alguna no existe en este build, se omite en vez de petar.
    local function rating(constName)
        local id = rawget(_G, constName)
        if not id then return nil end
        return LE:Safe(GetCombatRating, 0, id)
    end

    local _, agility = UnitStat("player", 2)
    local _, strength = UnitStat("player", 1)
    local _, stamina = UnitStat("player", 3)
    local _, intellect = UnitStat("player", 4)

    out.stats = {
        strength   = strength or 0,
        agility    = agility or 0,
        stamina    = stamina or 0,
        intellect  = intellect or 0,
        health     = UnitHealthMax("player") or 0,
        power      = UnitPowerMax("player") or 0,
        critPct    = LE:Safe(GetCritChance, 0),
        hastePct   = LE:Safe(GetHaste, 0),
        masteryPct = LE:Safe(GetMasteryEffect, 0),
        versRating = rating("CR_VERSATILITY_DAMAGE_DONE") or 0,
        critRating = rating("CR_CRIT_MELEE") or 0,
        hasteRating = rating("CR_HASTE_MELEE") or 0,
        masteryRating = rating("CR_MASTERY") or 0,
    }
    return out
end

--=============================================================================
-- EQUIPO
--=============================================================================

function C:GetEquipment()
    local avg, avgEquipped = GetAverageItemLevel()
    local items = {}

    for _, slot in ipairs(LE.SLOT_ORDER) do
        local link = GetInventoryItemLink("player", slot)
        if link then
            local name, _, quality, ilvl, _, _, subType, _, equipLoc = GetItemInfo(link)
            -- GetItemInfo devuelve nil si el objeto no está en caché todavía;
            -- el nombre del enlace siempre está disponible.
            if not name or name == "" then
                name = LE:ItemNameFromLink(link) or "Objeto desconocido"
            end

            local enchant, gems = nil, {}
            local enchantId = link:match("item:%d+:(%d+)")
            if enchantId and enchantId ~= "0" then enchant = tonumber(enchantId) end

            items[#items + 1] = {
                slotId   = slot,
                slot     = LE.SLOT_NAMES[slot] or tostring(slot),
                name     = name,
                itemId   = LE:ItemIDFromLink(link) or 0,
                ilvl     = ilvl or 0,
                quality  = quality or 0,
                subType  = subType or "",
                equipLoc = equipLoc or "",
                enchant  = enchant,
                link     = link,
            }
        end
    end

    return {
        avgItemLevel      = avg or 0,
        equippedItemLevel = avgEquipped or 0,
        count             = #items,
        items             = (#items > 0) and items or LE.EMPTY_ARRAY,
    }
end

--=============================================================================
-- ARMA ARTEFACTO (Legion)
--=============================================================================

function C:GetArtifact()
    local out = { equipped = false }
    if not C_ArtifactUI then return out end

    -- Sin la interfaz del artefacto abierta sólo se puede leer lo básico.
    local itemId, altItemId, name, icon, totalXP, pointsSpent, quality
    local ok = pcall(function()
        itemId, altItemId, name, icon, totalXP, pointsSpent, quality = C_ArtifactUI.GetEquippedArtifactInfo()
    end)
    if not ok or not name then return out end

    out.equipped = true
    out.name = name
    out.itemId = itemId or 0
    out.pointsSpent = pointsSpent or 0
    out.totalXP = totalXP or 0

    local knowledge = LE:Safe(C_ArtifactUI.GetArtifactKnowledgeLevel, nil)
    if knowledge then out.knowledgeLevel = knowledge end

    return out
end

--=============================================================================
-- TALENTOS
--=============================================================================

function C:GetTalents()
    local rows = {}
    local activeGroup = LE:Safe(GetActiveSpecGroup, 1) or 1

    for tier = 1, MAX_TALENT_TIERS or 7 do
        for column = 1, NUM_TALENT_COLUMNS or 3 do
            local talentID, name, _, selected, available = LE:Safe(
                GetTalentInfo, nil, tier, column, activeGroup)
            if selected and name then
                rows[#rows + 1] = { tier = tier, column = column, name = name, id = talentID or 0 }
            end
        end
    end

    return (#rows > 0) and rows or LE.EMPTY_ARRAY
end

--=============================================================================
-- PROFESIONES
--=============================================================================

function C:GetProfessions()
    local out = {}
    local p1, p2, arch, fishing, cooking, firstAid = GetProfessions()

    local function add(index, kind)
        if not index then return end
        local name, _, rank, maxRank, _, _, skillLine = GetProfessionInfo(index)
        if name then
            out[#out + 1] = {
                name = name, rank = rank or 0, maxRank = maxRank or 0,
                skillLine = skillLine or 0, type = kind,
            }
        end
    end

    add(p1, "principal")
    add(p2, "principal")
    add(arch, "secundaria")
    add(fishing, "secundaria")
    add(cooking, "secundaria")
    add(firstAid, "secundaria")

    return (#out > 0) and out or LE.EMPTY_ARRAY
end

--=============================================================================
-- RIQUEZA Y MONEDAS
--=============================================================================

function C:GetWealth()
    local money = GetMoney() or 0
    local g, s, c = LE:FormatMoney(money)
    local currencies = {}

    local size = LE:Safe(GetCurrencyListSize, 0) or 0
    for i = 1, size do
        local name, isHeader, _, _, _, count, _, _, maximum = GetCurrencyListInfo(i)
        if not isHeader and name and count and count > 0 then
            currencies[#currencies + 1] = {
                name = name,
                count = count,
                maximum = (maximum and maximum > 0) and maximum or nil,
            }
        end
    end

    return {
        copperTotal = money,
        gold = g, silver = s, copper = c,
        currencies = (#currencies > 0) and currencies or LE.EMPTY_ARRAY,
    }
end

--=============================================================================
-- REPUTACIONES
--=============================================================================

function C:GetReputations()
    local out = {}
    local num = GetNumFactions() or 0

    for i = 1, num do
        local name, _, standingId, barMin, barMax, barValue, _, _, isHeader,
              _, hasRep = GetFactionInfo(i)
        if name and (not isHeader or hasRep) then
            local standingText = LE.STANDING_NAMES[standingId] or "Desconocido"
            local current = (barValue or 0) - (barMin or 0)
            local maximum = (barMax or 0) - (barMin or 0)

            -- Las facciones de amistad (Nomi, Chi-Ji...) usan otra escala.
            local friendId, friendRep, friendMax, friendName, _, _, friendText,
                  friendThreshold, nextThreshold = LE:Safe(GetFriendshipReputation, nil, i)
            if friendId and friendId > 0 and friendText then
                standingText = friendText
                if friendThreshold and nextThreshold then
                    current = (friendRep or 0) - friendThreshold
                    maximum = nextThreshold - friendThreshold
                end
            end

            out[#out + 1] = {
                faction  = name,
                standing = standingText,
                standingId = standingId or 0,
                current  = current,
                max      = maximum,
            }
        end
    end

    return (#out > 0) and out or LE.EMPTY_ARRAY
end

--=============================================================================
-- LOGROS
--=============================================================================

--- Comprobación robusta: en servidores privados con .accwide desactivado
--  GetAchievementInfo puede devolver completed = false aunque todos los
--  criterios estén hechos.
function C:IsAchievementDone(achID)
    if not achID then return false end

    local _, _, _, completed, _, _, _, _, _, _, _, _, wasEarnedByMe = GetAchievementInfo(achID)
    if completed or wasEarnedByMe then return true end

    local num = GetAchievementNumCriteria(achID)
    if not num or num == 0 then return false end

    for i = 1, num do
        local _, _, critDone = GetAchievementCriteriaInfo(achID, i)
        if not critDone then return false end
    end
    return true
end

--- Recorre TODOS los logros cediendo el control al cliente periódicamente.
--  `task` puede ser nil (modo síncrono, sólo para listas cortas).
--  filter = "completed" | "incomplete" | "all"
function C:ScanAchievements(task, filter, matchText)
    local out = {}
    local cats = GetCategoryList() or {}
    local lowerMatch = matchText and matchText ~= "" and string.lower(matchText) or nil

    -- Primero contamos para poder dar un progreso real.
    local total = 0
    for _, catID in ipairs(cats) do
        total = total + (GetCategoryNumAchievements(catID) or 0)
    end

    local processed = 0
    for _, catID in ipairs(cats) do
        local num = GetCategoryNumAchievements(catID) or 0
        for i = 1, num do
            local id, name, points = GetAchievementInfo(catID, i)
            processed = processed + 1

            if id and name then
                local include = true
                if lowerMatch then
                    include = string.find(string.lower(name), lowerMatch, 1, true) ~= nil
                end

                if include then
                    local done = self:IsAchievementDone(id)
                    if (filter == "all")
                       or (filter == "completed" and done)
                       or (filter == "incomplete" and not done) then
                        out[#out + 1] = {
                            id = id, name = name,
                            points = points or 0,
                            completed = done,
                        }
                    end
                end
            end

            if task then
                if task.cancelled then return out, true end
                task:Step()
                if processed % 250 == 0 then task:Report(processed, total) end
            end
        end
    end

    if task then task:Report(total, total) end
    return out, false
end

--=============================================================================
-- SEGUIDORES DE CIUDADELA (WoD) Y CAMPEONES (Legion)
--=============================================================================

local function ParseFollowerLink(followerID)
    local abilities, traits = {}, {}
    if type(followerID) ~= "string" or not C_Garrison.GetFollowerLink then
        return abilities, traits
    end

    local ok, link = pcall(C_Garrison.GetFollowerLink, followerID)
    if not ok or not link then return abilities, traits end

    local a1, a2, a3, a4, t1, t2, t3, t4 =
        link:match("garrfollower:%d+:%d+:%d+:%d+:(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+):(%d+)")

    local function nameOf(id)
        id = tonumber(id)
        if not id or id == 0 then return nil end
        local n = LE:Safe(C_Garrison.GetFollowerAbilityName, nil, id)
        if n then return n end
        local info = LE:Safe(C_Garrison.GetFollowerAbilityInfo, nil, id)
        return info and info.name or nil
    end

    for _, id in ipairs({ a1, a2, a3, a4 }) do
        local n = nameOf(id); if n then abilities[#abilities + 1] = n end
    end
    for _, id in ipairs({ t1, t2, t3, t4 }) do
        local n = nameOf(id); if n then traits[#traits + 1] = n end
    end
    return abilities, traits
end

function C:GetFollowers()
    if not C_Garrison or not C_Garrison.GetFollowers then
        return { available = false, followers = LE.EMPTY_ARRAY }
    end

    local out = {}

    -- 1 = seguidores de Ciudadela (WoD), 4 = campeones de la Sede de Clase.
    for _, followerType in ipairs({ 1, 4 }) do
        local ok, list = pcall(C_Garrison.GetFollowers, followerType)
        if ok and type(list) == "table" then
            for _, f in ipairs(list) do
                local status = "Disponible"
                if f.isCollected == false or f.status == GARRISON_FOLLOWER_INACTIVE or f.status == 6 then
                    status = "Inactivo"
                elseif f.status == GARRISON_FOLLOWER_ON_MISSION then
                    status = "Trabajando"
                end

                local abilities, traits = { }, { }
                if f.isCollected then
                    abilities, traits = ParseFollowerLink(f.followerID)
                end

                out[#out + 1] = {
                    name      = f.name or "Desconocido",
                    ilvl      = tonumber(f.iLevel or f.itemLevel) or 0,
                    level     = tonumber(f.level) or 0,
                    quality   = tonumber(f.quality) or 0,
                    status    = status,
                    type      = (followerType == 1) and "Ciudadela" or "Sede de Clase",
                    collected = f.isCollected and true or false,
                    abilities = (#abilities > 0) and abilities or LE.EMPTY_ARRAY,
                    traits    = (#traits > 0) and traits or LE.EMPTY_ARRAY,
                }
            end
        end
    end

    return { available = true, count = #out, followers = (#out > 0) and out or LE.EMPTY_ARRAY }
end

--=============================================================================
-- BIKINI PLATE (transfiguraciones)
--=============================================================================

function C:GetBikiniPlates()
    local out = {}
    local hasAPI = C_TransmogCollection and C_TransmogCollection.PlayerHasTransmog

    for key, ids in pairs(LE.BIKINI_PLATES) do
        local collected = false
        if hasAPI then
            for _, itemID in ipairs(ids) do
                if LE:Safe(C_TransmogCollection.PlayerHasTransmog, false, itemID) then
                    collected = true
                    break
                end
            end
        end
        out[key] = collected
    end
    return out
end

--- Fuerza la caché de objetos antes de consultar (el cliente devuelve nil si
--  nunca ha visto el objeto en esta sesión).
function C:PrimeBikiniCache()
    for _, ids in pairs(LE.BIKINI_PLATES) do
        for _, itemID in ipairs(ids) do
            GetItemInfo(itemID)
        end
    end
end

--=============================================================================
-- ENSAMBLADO DEL EXPORT COMPLETO
--=============================================================================

--- Construye la tabla completa según las casillas marcadas.
--  Asíncrono porque el escaneo de logros puede tardar segundos.
function C:BuildExport(task, db)
    db = db or LE:GetDB()
    local data = { character = self:GetIdentity() }

    if db.exportSpec then
        data.spec = self:GetSpec()
        if task then task:Step() end
    end
    if db.exportEquipment then
        data.equipment = self:GetEquipment()
        if task then task:Step() end
    end
    if db.exportArtifact then
        data.artifact = self:GetArtifact()
        if task then task:Step() end
    end
    if db.exportTalents then
        data.talents = self:GetTalents()
        if task then task:Step() end
    end
    if db.exportProfessions then
        data.professions = self:GetProfessions()
        if task then task:Step() end
    end
    if db.exportCurrencies then
        data.wealth = self:GetWealth()
        if task then task:Step() end
    end
    if db.exportReputations then
        data.reputations = self:GetReputations()
        if task then task:Step() end
    end
    if db.exportFollowers then
        data.followers = self:GetFollowers()
        if task then task:Step() end
    end

    -- Los dos filtros de logros comparten un único recorrido: en la versión 2.x
    -- se recorrían las categorías dos veces (y "Logros Pendientes" ni siquiera
    -- se usaba en el export normal, sólo en el token).
    if db.exportCompletedAchievs or db.exportIncompleteAchievs then
        local all = self:ScanAchievements(task, "all")
        local done, pending = {}, {}
        for _, a in ipairs(all) do
            if a.completed then done[#done + 1] = a else pending[#pending + 1] = a end
        end
        if db.exportCompletedAchievs then
            data.completedAchievements = (#done > 0) and done or LE.EMPTY_ARRAY
        end
        if db.exportIncompleteAchievs then
            data.incompleteAchievements = (#pending > 0) and pending or LE.EMPTY_ARRAY
        end
        data.achievementSummary = {
            total = #all, completed = #done, incomplete = #pending,
            points = GetTotalAchievementPoints and GetTotalAchievementPoints() or 0,
        }
    end

    data.exportedAt = LE:Now()
    data.addonVersion = LE.VERSION
    return data
end

--=============================================================================
-- RENDERIZADO A TEXTO LEGIBLE
--=============================================================================

local function Header(title)
    return "\n=== " .. title .. " ==="
end

function C:RenderReadable(data)
    local L = {}
    local ch = data.character or {}

    L[#L + 1] = sformat("=== EXPORTACIÓN DE PERSONAJE: %s-%s ===", ch.name or "?", ch.realm or "?")
    L[#L + 1] = sformat("%s %s | Nivel %d | %s%s",
        ch.race or "", ch.class or "", ch.level or 0, ch.faction or "",
        (ch.guild ~= "" and ch.guild) and (" | <" .. ch.guild .. ">") or "")

    if data.spec then
        L[#L + 1] = Header("ESPECIALIZACIÓN")
        L[#L + 1] = sformat("%s (%s)", data.spec.name or "-", data.spec.role or "-")
        local s = data.spec.stats or {}
        L[#L + 1] = sformat("Vida: %d | Crítico: %.2f%% | Celeridad: %.2f%% | Maestría: %.2f%%",
            s.health or 0, s.critPct or 0, s.hastePct or 0, s.masteryPct or 0)
    end

    if data.equipment then
        local e = data.equipment
        L[#L + 1] = Header(sformat("EQUIPAMIENTO (ilvl medio %.1f / equipado %.1f)",
            e.avgItemLevel or 0, e.equippedItemLevel or 0))
        if e.items ~= LE.EMPTY_ARRAY then
            for _, it in ipairs(e.items) do
                L[#L + 1] = sformat("[%s] %s (ilvl %d)", it.slot, it.name, it.ilvl)
            end
        end
    end

    if data.artifact and data.artifact.equipped then
        L[#L + 1] = Header("ARTEFACTO")
        L[#L + 1] = sformat("%s — %d rasgos gastados", data.artifact.name or "?", data.artifact.pointsSpent or 0)
    end

    if data.talents and data.talents ~= LE.EMPTY_ARRAY then
        L[#L + 1] = Header("TALENTOS")
        for _, t in ipairs(data.talents) do
            L[#L + 1] = sformat("Fila %d: %s", t.tier, t.name)
        end
    end

    if data.professions and data.professions ~= LE.EMPTY_ARRAY then
        L[#L + 1] = Header("PROFESIONES")
        for _, p in ipairs(data.professions) do
            L[#L + 1] = sformat("- %s: %d/%d (%s)", p.name, p.rank, p.maxRank, p.type)
        end
    end

    if data.wealth then
        local w = data.wealth
        L[#L + 1] = Header("RIQUEZA Y MONEDAS")
        L[#L + 1] = sformat("Oro: %dg %ds %dc", w.gold or 0, w.silver or 0, w.copper or 0)
        if w.currencies ~= LE.EMPTY_ARRAY then
            for _, c in ipairs(w.currencies) do
                L[#L + 1] = sformat("- %s: %d%s", c.name, c.count,
                    c.maximum and (" / " .. c.maximum) or "")
            end
        end
    end

    if data.reputations and data.reputations ~= LE.EMPTY_ARRAY then
        L[#L + 1] = Header("REPUTACIONES")
        for _, r in ipairs(data.reputations) do
            L[#L + 1] = sformat("- %s: %s (%d/%d)", r.faction, r.standing, r.current, r.max)
        end
    end

    if data.followers and data.followers.followers ~= LE.EMPTY_ARRAY then
        L[#L + 1] = Header("SEGUIDORES Y CAMPEONES")
        for _, f in ipairs(data.followers.followers) do
            L[#L + 1] = sformat("- %s (ilvl %d) [%s] {%s} | Facultades: %s | Rasgos: %s",
                f.name, f.ilvl, f.status, f.type,
                (f.abilities ~= LE.EMPTY_ARRAY) and tconcat(f.abilities, ", ") or "-",
                (f.traits ~= LE.EMPTY_ARRAY) and tconcat(f.traits, ", ") or "-")
        end
    end

    if data.achievementSummary then
        local a = data.achievementSummary
        L[#L + 1] = Header(sformat("LOGROS (%d completados / %d pendientes / %d puntos)",
            a.completed, a.incomplete, a.points))
    end

    if data.completedAchievements and data.completedAchievements ~= LE.EMPTY_ARRAY then
        L[#L + 1] = Header("LOGROS COMPLETADOS")
        for _, a in ipairs(data.completedAchievements) do
            L[#L + 1] = sformat("[X] %s (ID: %d - %d pts)", a.name, a.id, a.points)
        end
    end

    if data.incompleteAchievements and data.incompleteAchievements ~= LE.EMPTY_ARRAY then
        L[#L + 1] = Header("LOGROS PENDIENTES")
        for _, a in ipairs(data.incompleteAchievements) do
            L[#L + 1] = sformat("[ ] %s (ID: %d - %d pts)", a.name, a.id, a.points)
        end
    end

    L[#L + 1] = "\nGenerado por LoboExporter " .. LE.VERSION .. " el " .. (data.exportedAt or "")
    return tconcat(L, "\n")
end

function C:Render(data, db)
    db = db or LE:GetDB()
    if db.formatJSON then
        return LE:ToJSON(data, true)
    end
    return self:RenderReadable(data)
end

--=============================================================================
-- TOKEN PARA EL BOT DE DISCORD
--   v2.x concatenaba texto y generaba JSON inválido. Ahora se serializa una
--   tabla y se codifica en base64 de una pieza.
--=============================================================================

function C:BuildToken(task, db)
    db = db or LE:GetDB()
    local ch = self:GetIdentity()

    local payload = {
        v      = 3,
        verify = sformat("%s-%s", ch.name, ch.realm),
        character = ch,
        exportedAt = LE:Now(),
        context = {},
    }

    local data = self:BuildExport(task, db)
    for _, key in ipairs({
        "spec", "equipment", "artifact", "talents", "professions",
        "wealth", "reputations", "followers",
        "completedAchievements", "incompleteAchievements", "achievementSummary",
    }) do
        if data[key] ~= nil then payload.context[key] = data[key] end
    end

    -- Compacto: el token se pega en un chat de Discord, cada byte cuenta.
    return LE:Base64(LE:ToJSON(payload, false))
end
