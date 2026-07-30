--[[
    WoWDiscordRPC.lua
    IntegraciÃ³n de Discord Rich Presence para World of Warcraft: Legion 7.3.5

    Este addon implementa un sistema de transmisiÃ³n de datos IPC mediante bloques de pÃ­xeles
    con redundancia de doble anclaje (TOPLEFT y TOPRIGHT) y un panel nativo de opciones de Blizzard.

    Autor: Teamwork
    VersiÃ³n: 1.0.0
    Interfaz: 70300 (Legion 7.3.5)
--]]

--------------------------------------------------------------------------------
-- 1. BASE DE DATOS Y CONFIGURACIÃ“N INICIAL
--------------------------------------------------------------------------------

-- DeclaraciÃ³n de variables globales requeridas
WoWDiscordRPC_DB = WoWDiscordRPC_DB or {}

-- Mapeo de tokens de clase nativos de WoW Legion 7.3.5 a sus IDs numÃ©ricos (1..12)
local TABLA_CLASES_WOW = {
    ["WARRIOR"]     = 1,  -- Guerrero
    ["PALADIN"]     = 2,  -- PaladÃ­n
    ["HUNTER"]      = 3,  -- Cazador
    ["ROGUE"]       = 4,  -- PÃ­caro
    ["PRIEST"]      = 5,  -- Sacerdote
    ["DEATHKNIGHT"] = 6,  -- Caballero de la Muerte
    ["SHAMAN"]      = 7,  -- ChamÃ¡n
    ["MAGE"]        = 8,  -- Mago
    ["WARLOCK"]     = 9,  -- Brujo
    ["MONK"]        = 10, -- Monje
    ["DRUID"]       = 11, -- Druida
    ["DEMONHUNTER"] = 12  -- Cazador de Demonios
}

--------------------------------------------------------------------------------
-- 2. FUNCIONES AUXILIARES DE EXTRACCIÃ“N DE DATOS DE JUGADOR
--------------------------------------------------------------------------------

--- Obtiene el ID numÃ©rico de la clase del jugador (rango 1..12)
-- @return number ID de la clase entre 1 y 12
local function ObtenerIDClaseJugador()
    local _, claseToken, claseID = UnitClass("player")
    if claseID and type(claseID) == "number" and claseID >= 1 and claseID <= 12 then
        return claseID
    end

    if not claseToken and UnitClassBase then
        claseToken = UnitClassBase("player")
    end

    if claseToken and TABLA_CLASES_WOW[claseToken] then
        return TABLA_CLASES_WOW[claseToken]
    end

    return 1 -- Valor predeterminado (Guerrero)
end

--- Calcula la mÃ¡scara de bits de privacidad segÃºn la configuraciÃ³n del usuario
-- Bit 0 (1): Ocultar Nombre del Personaje
-- Bit 1 (2): Ocultar Nivel
-- Bit 2 (4): Ocultar Zona Actual
-- Bit 3 (8): Ocultar Estado de Combate / Grupo
-- @return number MÃ¡scara de bits entre 0 y 15
local function ObtenerMascaraPrivacidad()
    local db = WoWDiscordRPC_DB or {}
    local mascara = 0
    if db.hide_name then mascara = mascara + 1 end
    if db.hide_level then mascara = mascara + 2 end
    if db.hide_zone then mascara = mascara + 4 end
    if db.hide_status then mascara = mascara + 8 end
    return mascara
end

--- Determina el estado actual de combate, grupo o actividad del jugador
-- 0: Normal ("En solitario")
-- 1: En Combate
-- 2: En Grupo (Party: IsInGroup() y no IsInRaid())
-- 3: Ausente (AFK)
-- 4: Muerto o Fantasma
-- 5: En Banda (Raid)
-- @return number CÃ³digo de estado entre 0 y 5
local function ObtenerEstadoJugador()
    if UnitIsDeadOrGhost and UnitIsDeadOrGhost("player") then
        return 4 -- Muerto o Fantasma
    elseif UnitAffectingCombat and UnitAffectingCombat("player") then
        return 1 -- En Combate
    elseif UnitIsAFK and UnitIsAFK("player") then
        return 3 -- Ausente (AFK)
    elseif IsInRaid and IsInRaid() then
        return 5 -- En Banda (Raid)
    elseif IsInGroup and IsInGroup() then
        return 2 -- En Grupo (Party)
    else
        return 0 -- Normal ("En solitario")
    end
end

--- Obtiene el nivel del jugador delimitado en el rango de bytes (1..255)
-- @return number Nivel del jugador
local function ObtenerNivelJugador()
    local nivel = UnitLevel("player") or 1
    if nivel < 1 then nivel = 1 end
    if nivel > 255 then nivel = 255 end
    return nivel
end

--- Obtiene el indice de especializacion (1..4) o 0 si no tiene
local function ObtenerSpecJugador()
    if GetSpecialization then
        local spec = GetSpecialization()
        if spec and spec >= 1 and spec <= 4 then
            return spec
        end
    end
    return 0
end

--- Obtiene un identificador de 16 bits para la zona actual del jugador
-- Intenta usar C_Map.GetBestMapForUnit, GetCurrentMapAreaID o hashing de texto de zona.
-- @return number ID de zona de 16 bits (0..65535)
local function ObtenerIDZona()
    if C_Map and C_Map.GetBestMapForUnit then
        local mapID = C_Map.GetBestMapForUnit("player")
        if mapID and type(mapID) == "number" and mapID > 0 then
            return mapID % 65536
        end
    end

    if SetMapToCurrentZone then
        SetMapToCurrentZone()
    end

    if GetCurrentMapAreaID then
        local mapID = GetCurrentMapAreaID()
        if mapID and type(mapID) == "number" and mapID > 0 then
            return mapID % 65536
        end
    end

    local nombreZona = (GetZoneText and GetZoneText()) or ""
    local hash = 0
    for i = 1, #nombreZona do
        hash = (hash * 31 + string.byte(nombreZona, i)) % 65536
    end
    return hash
end

--------------------------------------------------------------------------------
-- 3. RENDERIZADO DE MARCOS IPC CON DOBLE ANCLAJE (TOPLEFT Y TOPRIGHT)
--------------------------------------------------------------------------------

local marcoIPC1 = nil -- Anclaje Principal: TOPLEFT (0,0)
local marcoIPC2 = nil -- Anclaje Secundario: TOPRIGHT (0,0)
local bloquesTextura1 = {}
local bloquesTextura2 = {}

--- Crea un marco de transmisiÃ³n IPC compuesto por 4 bloques de pÃ­xeles (32x8 pÃ­xeles en total)
-- @param nombreMarco string Nombre del marco en el registro global
-- @param puntoAnclaje string Punto de anclaje ("TOPLEFT" o "TOPRIGHT")
-- @return table Marco creado, table Lista de texturas de bloques
local function CrearMarcoIPC(nombreMarco, puntoAnclaje)
    local marco = CreateFrame("Frame", nombreMarco, UIParent)
    marco:SetSize(16, 4)
    marco:SetPoint(puntoAnclaje, UIParent, puntoAnclaje, 0, 0)
    marco:SetFrameStrata("TOOLTIP")
    marco:SetFrameLevel(9999)
    marco:Show()

    local bloques = {}
    for i = 1, 4 do
        local tex = marco:CreateTexture(nil, "OVERLAY")
        tex:SetSize(4, 4)
        tex:SetPoint("TOPLEFT", marco, "TOPLEFT", (i - 1) * 4, 0)
        if tex.SetColorTexture then
            tex:SetColorTexture(0, 0, 0, 1)
        else
            tex:SetTexture(0, 0, 0, 1)
        end
        bloques[i] = tex
    end

    return marco, bloques
end

--- Ajusta la escala de los marcos IPC para garantizar dimensiones fÃ­sicas exactas 1:1 en pantalla
local function AjustarEscalaIPC()
    if UIParent and UIParent.GetEffectiveScale then
        local escalaEfectiva = UIParent:GetEffectiveScale()
        if escalaEfectiva and escalaEfectiva > 0 then
            local escalaObjetivo = 1 / escalaEfectiva
            if marcoIPC1 then marcoIPC1:SetScale(escalaObjetivo) end
            if marcoIPC2 then marcoIPC2:SetScale(escalaObjetivo) end
        end
    end
end

--- Asigna un color RGB normalizado (0..1) a un bloque de textura
-- @param tex Texture Objeto de textura de WoW
-- @param rByte number Valor de byte Rojo (0..255)
-- @param gByte number Valor de byte Verde (0..255)
-- @param bByte number Valor de byte Azul (0..255)
local function EstablecerColorBloque(tex, rByte, gByte, bByte)
    local r = rByte / 255
    local g = gByte / 255
    local b = bByte / 255
    if tex.SetColorTexture then
        tex:SetColorTexture(r, g, b, 1)
    else
        tex:SetTexture(r, g, b, 1)
    end
end

--- Actualiza la codificaciÃ³n de bytes de los 4 pÃ­xeles IPC en ambos anclajes
function WoWDiscordRPC_ActualizarIPC()
    if not bloquesTextura1 or #bloquesTextura1 < 4 or not bloquesTextura2 or #bloquesTextura2 < 4 then
        return
    end

    -- PÃ­xel 1 (Header Magic): 'W' (87), 'O' (79), 'W' (87)
    local p1_r = 87
    local p1_g = 79
    local p1_b = 87

    -- PÃ­xel 2 (Clase, Banderas de Privacidad, Estado)
    local claseID = ObtenerIDClaseJugador()
    local mascaraPrivacidad = ObtenerMascaraPrivacidad()
    local estado = ObtenerEstadoJugador()

    local p2_r = claseID
    local p2_g = mascaraPrivacidad
    local p2_b = estado

    -- PÃ­xel 3 (Nivel e ID de Zona de 16 bits)
    local nivel = ObtenerNivelJugador()
    local zoneID = ObtenerIDZona()
    local zoneHigh = math.floor(zoneID / 256)
    local zoneLow = zoneID % 256

    local p3_r = nivel
    local p3_g = zoneHigh
    local p3_b = zoneLow

    -- PÃ­xel 4 (VersiÃ³n, Checksum Modulo 256 y Spec)
    -- VersiÃ³n = 1, Checksum = (P2_R + P2_G + P2_B + P3_R + P3_G + P3_B) % 256, B = Spec (0..4)
    local sumaChecksum = (p2_r + p2_g + p2_b + p3_r + p3_g + p3_b) % 256
    local specIndex = ObtenerSpecJugador()

    local p4_r = 1
    local p4_g = sumaChecksum
    local p4_b = specIndex

    -- Aplicar colores a PÃ­xeles del Anclaje 1 (TOPLEFT)
    EstablecerColorBloque(bloquesTextura1[1], p1_r, p1_g, p1_b)
    EstablecerColorBloque(bloquesTextura1[2], p2_r, p2_g, p2_b)
    EstablecerColorBloque(bloquesTextura1[3], p3_r, p3_g, p3_b)
    EstablecerColorBloque(bloquesTextura1[4], p4_r, p4_g, p4_b)

    -- Aplicar colores a PÃ­xeles del Anclaje 2 (TOPRIGHT)
    EstablecerColorBloque(bloquesTextura2[1], p1_r, p1_g, p1_b)
    EstablecerColorBloque(bloquesTextura2[2], p2_r, p2_g, p2_b)
    EstablecerColorBloque(bloquesTextura2[3], p3_r, p3_g, p3_b)
    EstablecerColorBloque(bloquesTextura2[4], p4_r, p4_g, p4_b)
end

--------------------------------------------------------------------------------
-- 4. PANEL NATIVO DE OPCIONES DE BLIZZARD (INTERFACE OPTIONS)
--------------------------------------------------------------------------------

local function CrearPanelOpciones()
    local panel = CreateFrame("Frame", "WoWDiscordRPCOptionsPanel", UIParent)
    panel.name = "WoW Discord RPC"

    -- TÃ­tulo del Panel de Opciones
    local titulo = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    titulo:SetPoint("TOPLEFT", 16, -16)
    titulo:SetText("WoW Discord RPC")

    -- Subtexto explicativo en espaÃ±ol
    local subtitulo = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    subtitulo:SetPoint("TOPLEFT", titulo, "BOTTOMLEFT", 0, -8)
    subtitulo:SetText("Configuracion de privacidad y opciones de Discord Rich Presence.")

    -- DefiniciÃ³n de las 3 casillas de verificaciÃ³n
    local definicionesCasillas = {
        { clave = "hide_level",  texto = "Ocultar Nivel" },
        { clave = "hide_zone",   texto = "Ocultar Zona Actual" },
        { clave = "hide_status", texto = "Ocultar Estado de Combate / Grupo" }
    }

    panel.casillas = {}

    for i, def in ipairs(definicionesCasillas) do
        local casilla = CreateFrame("CheckButton", "WoWDiscordRPCOptionCheck" .. i, panel, "InterfaceOptionsCheckButtonTemplate")
        casilla:SetPoint("TOPLEFT", subtitulo, "BOTTOMLEFT", 0, -20 - (i - 1) * 32)

        local textoEtiqueta = _G[casilla:GetName() .. "Text"]
        if textoEtiqueta then
            textoEtiqueta:SetText(def.texto)
        end

        casilla:SetScript("OnClick", function(self)
            local estaMarcado = self:GetChecked() and true or false
            WoWDiscordRPC_DB[def.clave] = estaMarcado
            WoWDiscordRPC_ActualizarIPC()
        end)

        panel.casillas[def.clave] = casilla
    end

    -- MÃ©todo de actualizaciÃ³n del estado de los controles cuando se abre el panel
    panel.refresh = function(self)
        for clave, casilla in pairs(self.casillas) do
            if WoWDiscordRPC_DB and WoWDiscordRPC_DB[clave] ~= nil then
                casilla:SetChecked(WoWDiscordRPC_DB[clave])
            end
        end
    end

    panel:SetScript("OnShow", function(self)
        if self.refresh then
            self:refresh()
        end
    end)

    -- Registrar el panel en el menÃº nativo de opciones de Blizzard
    InterfaceOptions_AddCategory(panel)
end

--------------------------------------------------------------------------------
-- 5. REGISTRO DE EVENTOS Y BUCLE ONUPDATE TICKER
--------------------------------------------------------------------------------

local marcoEventos = CreateFrame("Frame", "WoWDiscordRPCEventFrame", UIParent)

-- Registrar eventos requeridos por la especificaciÃ³n tÃ©cnica
marcoEventos:RegisterEvent("ADDON_LOADED")
marcoEventos:RegisterEvent("PLAYER_LOGIN")
marcoEventos:RegisterEvent("PLAYER_ENTERING_WORLD")
marcoEventos:RegisterEvent("ZONE_CHANGED_NEW_AREA")
marcoEventos:RegisterEvent("PLAYER_TARGET_CHANGED")
marcoEventos:RegisterEvent("PLAYER_REGEN_DISABLED")
marcoEventos:RegisterEvent("PLAYER_REGEN_ENABLED")
marcoEventos:RegisterEvent("PLAYER_FLAGS_CHANGED")
marcoEventos:RegisterEvent("UI_SCALE_CHANGED")

-- Control de eventos principales
marcoEventos:SetScript("OnEvent", function(self, evento, arg1)
    if evento == "ADDON_LOADED" and arg1 == "WoWDiscordRPC" then
        -- InicializaciÃ³n de la base de datos SavedVariables WoWDiscordRPC_DB
        if not WoWDiscordRPC_DB then
            WoWDiscordRPC_DB = {}
        end
        if WoWDiscordRPC_DB.hide_name == nil then WoWDiscordRPC_DB.hide_name = false end
        if WoWDiscordRPC_DB.hide_level == nil then WoWDiscordRPC_DB.hide_level = false end
        if WoWDiscordRPC_DB.hide_zone == nil then WoWDiscordRPC_DB.hide_zone = false end
        if WoWDiscordRPC_DB.hide_status == nil then WoWDiscordRPC_DB.hide_status = false end

        -- DUMP DE MAPAS NATIVOS EN ESPANOL
        if not WoWDiscordRPC_DB.Mapas then
            WoWDiscordRPC_DB.Mapas = {}
            for i = 1, 2000 do
                local nombre = GetMapNameByID(i)
                if nombre and nombre ~= "" then
                    WoWDiscordRPC_DB.Mapas[i] = nombre
                end
            end
        end

        -- Crear marcos IPC e interfaz de opciones al cargar el addon
        if not marcoIPC1 then
            marcoIPC1, bloquesTextura1 = CrearMarcoIPC("WoWDiscordRPC_IPCAnchor1", "BOTTOMLEFT")
            marcoIPC2, bloquesTextura2 = CrearMarcoIPC("WoWDiscordRPC_IPCAnchor2", "BOTTOMRIGHT")
            CrearPanelOpciones()
        end
    elseif evento == "PLAYER_LOGIN" or evento == "UI_SCALE_CHANGED" then
        AjustarEscalaIPC()
        WoWDiscordRPC_ActualizarIPC()
    else
        WoWDiscordRPC_ActualizarIPC()
    end
end)

-- Temporizador OnUpdate (frecuencia de refresco: 1.0s)
local acumuladorTiempo = 0
marcoEventos:SetScript("OnUpdate", function(self, transcurrido)
    acumuladorTiempo = acumuladorTiempo + transcurrido
    if acumuladorTiempo >= 1.0 then
        acumuladorTiempo = 0
        WoWDiscordRPC_ActualizarIPC()
    end
end)