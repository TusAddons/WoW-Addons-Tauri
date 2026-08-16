--[[--------------------------------------------------------------------------
    LoboExporter 3.0 — Botín de la Guía de Aventuras (BiS)

    Correcciones frente a la versión 2.x:
      * "dungeonName" era una errata de "instanceName": TODO el botín de
        mazmorras se exportaba con  "dungeon": ""  vacío.
      * Se restauran de verdad el nivel, la instancia, la dificultad y el filtro
        de botín que tuviera el jugador abiertos en la Guía de Aventuras.
      * La lectura de EJ_GetLootInfoByIndex usa primero la firma posicional y
        sólo cae al método por adivinación si el cliente devuelve algo raro
        (que es justo lo que hace el cliente de Tauri con algunas reliquias).
----------------------------------------------------------------------------]]

local ADDON_NAME, LE = ...

local sformat = string.format

LE.Journal = {}
local J = LE.Journal

--=============================================================================
-- LECTURA DE UNA ENTRADA DE BOTÍN
--=============================================================================

--- En 7.3.5 la firma documentada es:
--    itemID, encounterID, name, icon, slot, armorType, link = EJ_GetLootInfoByIndex(i)
--  Algunos objetos (reliquias de artefacto, monturas) devuelven los campos
--  descolocados en clientes no oficiales. Validamos y, si no cuadra, buscamos
--  cada dato por su forma entre todos los valores devueltos.
local function ReadLootEntry(index)
    local values = { EJ_GetLootInfoByIndex(index) }
    if #values == 0 then return nil end

    local itemID  = tonumber(values[1])
    local name    = type(values[3]) == "string" and values[3] or nil
    local slot    = type(values[5]) == "string" and values[5] or nil
    local link    = nil

    -- El enlace es el dato más fiable: si lo encontramos, manda sobre todo.
    for _, v in ipairs(values) do
        if type(v) == "string" and v:find("|Hitem:", 1, true) then
            link = v
            break
        end
    end

    -- ¿La firma posicional tiene sentido? El "nombre" no puede ser un número
    -- disfrazado ni una ruta de textura.
    local nameLooksWrong = (not name)
        or tonumber(name) ~= nil
        or name:find("Interface\\", 1, true) ~= nil
        or LE.ARMOR_TYPES[name]

    if nameLooksWrong then
        -- Reconstrucción por forma: strings "de texto" que no sean iconos ni
        -- tipos de armadura. El primero es el nombre, el segundo la ranura.
        name, slot = nil, nil
        for _, v in ipairs(values) do
            if type(v) == "string"
               and not v:find("|Hitem:", 1, true)
               and not v:find("Interface", 1, true)
               and not LE.ARMOR_TYPES[v]
               and #v > 2
               and tonumber(v) == nil then
                if not name then name = v else if not slot then slot = v end end
            end
        end
    end

    if not itemID or itemID < 1 then
        for _, v in ipairs(values) do
            if type(v) == "number" and v > 1000 then itemID = v break end
        end
    end

    -- El itemID del enlace es siempre el correcto (v2.0.7 arregló esto a medias).
    if link then
        local fromLink = LE:ItemIDFromLink(link)
        if fromLink then itemID = fromLink end
        if not name then name = LE:ItemNameFromLink(link) end
    end

    if not itemID or itemID == 0 then return nil end

    -- Completar con la caché del cliente si está disponible.
    local query = link or itemID
    local cName, _, quality, ilvl, _, _, subType, _, equipLoc = GetItemInfo(query)
    if cName and cName ~= "" then name = cName end

    local finalSlot = equipLoc
    if not finalSlot or finalSlot == "" then finalSlot = slot end
    if not finalSlot or finalSlot == "" then finalSlot = subType end

    if not name or name == "" then return nil end

    return {
        itemID   = itemID,
        itemName = name,
        slot     = finalSlot or "",
        quality  = quality or 0,
        ilvl     = ilvl or 0,
    }
end

--=============================================================================
-- ESCANEO GENÉRICO
--=============================================================================

--- isRaid = true -> bandas, false -> mazmorras
function J:Scan(task, isRaid)
    local difficulties = isRaid and LE.RAID_DIFFICULTIES or LE.DUNGEON_DIFFICULTIES
    local keyName = isRaid and "raid" or "dungeon"
    local results = {}

    -- Guardar el estado de la Guía de Aventuras para devolverlo tal cual.
    local prevTier      = LE:Safe(EJ_GetCurrentTier, nil)
    local prevInstance  = LE:Safe(EJ_GetInstanceInfo, nil)
    local prevClass, prevSpec = LE:Safe(EJ_GetLootFilter, nil)
    local prevDifficulty = LE:Safe(EJ_GetDifficulty, nil)

    EJ_SelectTier(LE.LEGION_TIER)

    -- 1ª pasada: contar jefes para que la barra de progreso sea real.
    local totalBosses, idx = 0, 1
    while true do
        local instanceID = EJ_GetInstanceByIndex(idx, isRaid)
        if not instanceID then break end
        EJ_SelectInstance(instanceID)
        local b = 1
        while EJ_GetEncounterInfoByIndex(b) do
            totalBosses = totalBosses + 1
            b = b + 1
        end
        idx = idx + 1
        task:Step()
    end

    -- 2ª pasada: recoger el botín.
    local processed = 0
    local instanceIndex = 1

    while true do
        local instanceID, instanceName = EJ_GetInstanceByIndex(instanceIndex, isRaid)
        if not instanceID then break end
        EJ_SelectInstance(instanceID)

        local bossIndex = 1
        while true do
            local bossName, _, encounterID = EJ_GetEncounterInfoByIndex(bossIndex)
            if not bossName then break end

            EJ_SelectEncounter(encounterID)

            -- seenItems por JEFE, no por dificultad: el mismo objeto aparece en
            -- Normal/Heroico/Mítico y antes se duplicaba una vez por dificultad.
            local seen = {}

            for _, diff in ipairs(difficulties) do
                EJ_SetDifficulty(diff.id)

                -- Sólo la clase que el jugador tenga filtrada, todas sus specs.
                if prevClass and prevClass > 0 then
                    EJ_SetLootFilter(prevClass, 0)
                end

                local numLoot = EJ_GetNumLoot() or 0
                for j = 1, numLoot do
                    local entry = ReadLootEntry(j)
                    if entry and not seen[entry.itemID] then
                        seen[entry.itemID] = true
                        entry[keyName]    = instanceName or "Desconocida"
                        entry.boss        = bossName
                        entry.difficulty  = diff.name
                        results[#results + 1] = entry
                    end
                    task:Step()
                    if task.cancelled then break end
                end
                if task.cancelled then break end
            end

            processed = processed + 1
            task:Report(processed, totalBosses)
            if task.cancelled then break end

            bossIndex = bossIndex + 1
            task:Step()
        end

        if task.cancelled then break end
        instanceIndex = instanceIndex + 1
    end

    -- Restaurar TODO lo que tocamos.
    if prevDifficulty then LE:Safe(EJ_SetDifficulty, nil, prevDifficulty) end
    if prevClass then LE:Safe(EJ_SetLootFilter, nil, prevClass, prevSpec or 0) end
    if prevTier then LE:Safe(EJ_SelectTier, nil, prevTier) end
    if prevInstance then LE:Safe(EJ_SelectInstance, nil, prevInstance) end

    return results
end

--=============================================================================
-- API PÚBLICA
--=============================================================================

--- Lanza el escaneo. onDone(data, count, json)
function J:Export(isRaid, onDone, onProgress, onError)
    local key = isRaid and "raidLoot" or "dungeonLoot"

    return LE:RunTask(
        function(task)
            local rows = self:Scan(task, isRaid)
            local payload = {}
            payload[key] = (#rows > 0) and rows or LE.EMPTY_ARRAY
            payload.count = #rows
            payload.exportedAt = LE:Now()
            payload.addonVersion = LE.VERSION
            return { rows = rows, payload = payload }
        end,
        function(result)
            if not result then
                if onError then onError("El escaneo no devolvió datos.") end
                return
            end
            if onDone then
                onDone(result.rows, #result.rows, LE:ToJSON(result.payload, true))
            end
        end,
        onProgress,
        onError
    )
end
