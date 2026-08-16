--[[--------------------------------------------------------------------------
    LoboExporter 3.0 — LoboTracker (pines en el mapa del mundo)

    En la versión 2.x las dos casillas de la pestaña "Opciones y Mapa" llamaban
    a UpdateLoboMapPins(), una función que NUNCA existió: pulsarlas soltaba un
    error de Lua y la funcionalidad entera estaba sin programar.

    Aquí está implementada de verdad. El cliente 7.3.5 no expone en ninguna API
    las coordenadas de un logro (eso no existe ni en el cliente actual), así que
    el addon trae el motor completo más un editor dentro del juego: te pones
    encima del sitio, pulsas "Añadir pin aquí" y queda asociado a un logro o a
    un criterio concreto. Los pines se guardan en SavedVariables y se pueden
    exportar/importar en JSON para compartirlos por Discord.

    Reglas de visibilidad:
      showMapPins      -> se ven los pines de logros/criterios PENDIENTES
      showMapCompleted -> se ven además los ya COMPLETADOS (con el check verde)
----------------------------------------------------------------------------]]

local ADDON_NAME, LE = ...

local sformat = string.format

LE.Map = {}
local M = LE.Map

local pinPool = {}          -- todos los frames creados
local activePins = 0        -- cuántos se están usando ahora
local pendingUpdate = false

--=============================================================================
-- ACCESO A LA BASE DE DATOS DE PINES
--=============================================================================

function M:GetStore()
    local db = LE:GetDB()
    if type(db.MapPins) ~= "table" then db.MapPins = {} end
    return db.MapPins
end

function M:GetPinsForMap(mapID)
    if not mapID then return nil end
    local store = self:GetStore()
    return store[tostring(mapID)]
end

--- Devuelve mapID, x, y (0..1) de la posición actual del jugador, o nil.
function M:GetPlayerPosition()
    -- SetMapToCurrentZone cambia el mapa mostrado; guardamos para restaurar.
    local previous = LE:Safe(GetCurrentMapAreaID, nil)
    LE:Safe(SetMapToCurrentZone, nil)

    local mapID = LE:Safe(GetCurrentMapAreaID, nil)
    local x, y = LE:Safe(GetPlayerMapPosition, nil, "player")

    if previous and previous ~= mapID then
        LE:Safe(SetMapByID, nil, previous)
    end

    if not mapID or not x or not y then return nil end
    if x == 0 and y == 0 then return nil end   -- mazmorra o mapa sin posición
    return mapID, x, y
end

--- Añade un pin. Devuelve true, o false + motivo.
function M:AddPin(mapID, x, y, info)
    if not mapID or not x or not y then
        return false, "No he podido leer tu posición. ¿Estás dentro de una mazmorra o instancia?"
    end

    info = info or {}
    local store = self:GetStore()
    local key = tostring(mapID)
    store[key] = store[key] or {}

    local pin = {
        x     = x,
        y     = y,
        ach   = tonumber(info.ach) or nil,
        crit  = tonumber(info.crit) or nil,
        icon  = info.icon or "treasure",
        note  = info.note or "",
        added = LE:Now(),
    }

    -- Evitar duplicados exactos a menos de ~0.5% del mapa.
    for _, existing in ipairs(store[key]) do
        if math.abs(existing.x - x) < 0.005 and math.abs(existing.y - y) < 0.005
           and existing.ach == pin.ach and existing.crit == pin.crit then
            return false, "Ya tienes un pin igual prácticamente en el mismo sitio."
        end
    end

    table.insert(store[key], pin)
    self:Refresh()
    return true
end

function M:RemovePin(mapID, index)
    local pins = self:GetPinsForMap(mapID)
    if not pins or not pins[index] then return false end
    table.remove(pins, index)
    if #pins == 0 then self:GetStore()[tostring(mapID)] = nil end
    self:Refresh()
    return true
end

function M:CountPins()
    local total, maps = 0, 0
    for _, pins in pairs(self:GetStore()) do
        maps = maps + 1
        total = total + #pins
    end
    return total, maps
end

--=============================================================================
-- ESTADO DE UN PIN (completado o no)
--=============================================================================

function M:IsPinDone(pin)
    if not pin.ach then return false end
    if pin.crit then
        local _, _, done = LE:Safe(GetAchievementCriteriaInfo, nil, pin.ach, pin.crit)
        return done and true or false
    end
    return LE.Character:IsAchievementDone(pin.ach)
end

function M:DescribePin(pin)
    local lines = {}
    if pin.ach then
        local _, achName = GetAchievementInfo(pin.ach)
        lines[#lines + 1] = achName or ("Logro " .. pin.ach)
        if pin.crit then
            local critName = LE:Safe(GetAchievementCriteriaInfo, nil, pin.ach, pin.crit)
            if critName and critName ~= "" then
                lines[#lines + 1] = "|cffAAAAAA" .. critName .. "|r"
            end
        end
    else
        lines[#lines + 1] = "Marca personal"
    end
    if pin.note and pin.note ~= "" then
        lines[#lines + 1] = pin.note
    end
    return lines
end

--=============================================================================
-- FRAMES DE LOS PINES
--=============================================================================

local function GetMapCanvas()
    -- En 7.3.5 WorldMapButton es la capa clicable sobre el mapa; si un addon la
    -- ha tocado, caemos al marco de detalle.
    return rawget(_G, "WorldMapButton") or rawget(_G, "WorldMapDetailFrame")
end

local function AcquirePin(index)
    if pinPool[index] then return pinPool[index] end

    local canvas = GetMapCanvas()
    if not canvas then return nil end

    local pin = CreateFrame("Button", "LoboExporterMapPin" .. index, canvas)
    pin:SetSize(18, 18)
    pin:SetFrameStrata("HIGH")

    pin.texture = pin:CreateTexture(nil, "OVERLAY")
    pin.texture:SetAllPoints()

    pin:SetScript("OnEnter", function(self)
        if not self.pinData then return end
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        for i, line in ipairs(LE.Map:DescribePin(self.pinData)) do
            if i == 1 then
                GameTooltip:SetText(line, 1, 0.82, 0)
            else
                GameTooltip:AddLine(line, 1, 1, 1, true)
            end
        end
        GameTooltip:AddLine(sformat("%.1f, %.1f", self.pinData.x * 100, self.pinData.y * 100), 0.6, 0.6, 0.6)
        if LE.Map:IsPinDone(self.pinData) then
            GameTooltip:AddLine("Completado", 0.2, 1, 0.2)
        else
            GameTooltip:AddLine("Pendiente", 1, 0.4, 0.4)
        end
        GameTooltip:AddLine("Clic derecho para borrar este pin", 0.5, 0.5, 0.5)
        GameTooltip:Show()
    end)

    pin:SetScript("OnLeave", function() GameTooltip:Hide() end)

    pin:RegisterForClicks("RightButtonUp")
    pin:SetScript("OnClick", function(self)
        if self.mapID and self.pinIndex then
            if LE.Map:RemovePin(self.mapID, self.pinIndex) then
                LE:Print("Pin borrado.")
                GameTooltip:Hide()
            end
        end
    end)

    pinPool[index] = pin
    return pin
end

local function HidePinsFrom(index)
    for i = index, #pinPool do
        pinPool[i]:Hide()
    end
end

--=============================================================================
-- REFRESCO
--=============================================================================

function M:Refresh()
    local canvas = GetMapCanvas()
    local detail = rawget(_G, "WorldMapDetailFrame")
    if not canvas or not detail then return end

    local worldMap = rawget(_G, "WorldMapFrame")
    if not worldMap or not worldMap:IsShown() then
        HidePinsFrom(1)
        activePins = 0
        return
    end

    local db = LE:GetDB()
    local mapID = LE:Safe(GetCurrentMapAreaID, nil)
    local pins = self:GetPinsForMap(mapID)

    if not pins or (not db.showMapPins and not db.showMapCompleted) then
        HidePinsFrom(1)
        activePins = 0
        return
    end

    local width, height = detail:GetWidth(), detail:GetHeight()
    if not width or width <= 0 then return end

    local scale = db.mapPinScale or 1.0
    local used = 0

    for index, pinData in ipairs(pins) do
        local done = self:IsPinDone(pinData)
        local visible = (done and db.showMapCompleted) or ((not done) and db.showMapPins)

        if visible then
            used = used + 1
            local frame = AcquirePin(used)
            if frame then
                local iconKey = done and "done" or (pinData.icon or "missing")
                local path = LE.PIN_ICON_BY_KEY[iconKey] or LE.PIN_ICON_BY_KEY.missing
                frame.texture:SetTexture(path)
                frame:SetSize(18 * scale, 18 * scale)
                frame:ClearAllPoints()
                frame:SetPoint("CENTER", detail, "TOPLEFT",
                    pinData.x * width, -(pinData.y * height))
                frame.pinData = pinData
                frame.mapID = mapID
                frame.pinIndex = index
                frame:Show()
            end
        end
    end

    HidePinsFrom(used + 1)
    activePins = used
end

--- Refresco perezoso: WORLD_MAP_UPDATE se dispara muchas veces por segundo
--  mientras el mapa está abierto; sin esto el juego iría a tirones.
function M:RequestRefresh()
    if pendingUpdate then return end
    pendingUpdate = true
    C_Timer.After(0.1, function()
        pendingUpdate = false
        local ok, err = pcall(function() M:Refresh() end)
        if not ok then LE:Error("LoboTracker: " .. tostring(err)) end
    end)
end

--=============================================================================
-- IMPORTACIÓN / EXPORTACIÓN DE PINES
--=============================================================================

function M:ExportJSON()
    local out = { addonVersion = LE.VERSION, exportedAt = LE:Now(), maps = {} }
    for mapKey, pins in pairs(self:GetStore()) do
        local mapName = LE:Safe(GetMapNameByID, nil, tonumber(mapKey)) or ""
        local list = {}
        for _, p in ipairs(pins) do
            list[#list + 1] = {
                x = p.x, y = p.y, ach = p.ach, crit = p.crit,
                icon = p.icon, note = p.note,
            }
        end
        out.maps[mapKey] = { name = mapName, pins = list }
    end
    return LE:ToJSON(out, true)
end

--- Importa desde una tabla ya parseada (el addon no incluye parser de JSON:
--  para volver a meter pines usa /lex pin o pásalos por el bot).
function M:ImportTable(tbl)
    if type(tbl) ~= "table" or type(tbl.maps) ~= "table" then
        return false, "Formato no reconocido."
    end
    local store = self:GetStore()
    local added = 0
    for mapKey, entry in pairs(tbl.maps) do
        if type(entry) == "table" and type(entry.pins) == "table" then
            store[mapKey] = store[mapKey] or {}
            for _, p in ipairs(entry.pins) do
                if tonumber(p.x) and tonumber(p.y) then
                    table.insert(store[mapKey], {
                        x = tonumber(p.x), y = tonumber(p.y),
                        ach = tonumber(p.ach), crit = tonumber(p.crit),
                        icon = p.icon or "treasure", note = p.note or "",
                        added = LE:Now(),
                    })
                    added = added + 1
                end
            end
        end
    end
    self:Refresh()
    return true, added
end

--=============================================================================
-- INFORMACIÓN DE DEPURACIÓN (botón "Info Mapa")
--=============================================================================

function M:GetDebugInfo()
    local L = {}
    local mapID, x, y = self:GetPlayerPosition()
    local total, maps = self:CountPins()
    local db = LE:GetDB()

    L[#L + 1] = "=== LoboTracker: información del mapa ==="
    if mapID then
        L[#L + 1] = sformat("Zona actual: %s (mapID %d)",
            LE:Safe(GetMapNameByID, nil, mapID) or "?", mapID)
        L[#L + 1] = sformat("Tu posición: %.2f, %.2f", x * 100, y * 100)
    else
        L[#L + 1] = "Posición no disponible (estás en una instancia o en un mapa sin coordenadas)."
    end
    L[#L + 1] = sformat("Mapa mostrado: %s",
        tostring(LE:Safe(GetCurrentMapAreaID, nil) or "?"))
    L[#L + 1] = sformat("Pines guardados: %d en %d zonas", total, maps)
    L[#L + 1] = sformat("Pines visibles ahora: %d", activePins)
    L[#L + 1] = sformat("Mostrar pendientes: %s | Mostrar completados: %s",
        db.showMapPins and "sí" or "no", db.showMapCompleted and "sí" or "no")
    L[#L + 1] = sformat("Lienzo del mapa: %s", GetMapCanvas() and GetMapCanvas():GetName() or "NO ENCONTRADO")

    local pins = self:GetPinsForMap(mapID)
    if pins then
        L[#L + 1] = "\nPines en esta zona:"
        for i, p in ipairs(pins) do
            L[#L + 1] = sformat("  %d) %.1f,%.1f  %s  [%s]", i, p.x * 100, p.y * 100,
                p.ach and ("logro " .. p.ach .. (p.crit and (" crit " .. p.crit) or "")) or "marca",
                self:IsPinDone(p) and "hecho" or "pendiente")
        end
    end

    return table.concat(L, "\n")
end

--=============================================================================
-- ENGANCHES
--=============================================================================

function M:Initialize()
    local worldMap = rawget(_G, "WorldMapFrame")
    if worldMap then
        worldMap:HookScript("OnShow", function() M:RequestRefresh() end)
        worldMap:HookScript("OnHide", function() HidePinsFrom(1); activePins = 0 end)
    end

    local events = CreateFrame("Frame")
    events:RegisterEvent("WORLD_MAP_UPDATE")
    events:RegisterEvent("ACHIEVEMENT_EARNED")
    events:RegisterEvent("CRITERIA_UPDATE")
    events:RegisterEvent("ZONE_CHANGED_NEW_AREA")
    events:SetScript("OnEvent", function() M:RequestRefresh() end)

    M:RequestRefresh()
end
