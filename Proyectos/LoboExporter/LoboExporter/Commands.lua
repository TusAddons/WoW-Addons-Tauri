--[[--------------------------------------------------------------------------
    LoboExporter 3.0 — Comandos de chat e inicialización

    En la 2.x los subcomandos "debug" y "progreso" se llamaban a SÍ MISMOS:

        if msg == "debug" then SlashCmdList["LOBOEXPORTER"]("debug"); return end

    Eso es una recursión infinita. Los botones "Mostrar Progreso" e "Info Mapa"
    disparaban justo esos comandos, así que colgaban el cliente. Aquí cada
    subcomando ejecuta su propia función, sin volver al despachador.
----------------------------------------------------------------------------]]

local ADDON_NAME, LE = ...

local sformat = string.format

LE.Commands = {}
local Cmd = LE.Commands

--=============================================================================
-- PROGRESO EN EL CHAT
--=============================================================================

function Cmd:ShowProgress()
    local db = LE:GetDB()
    local st = db.ExportStatus or {}
    local ch = LE.Character:GetIdentity()

    LE:Print(sformat("|cffFFD100%s-%s|r — %s %s nivel %d",
        ch.name, ch.realm, ch.race, ch.class, ch.level))

    local avg, equipped = GetAverageItemLevel()
    LE:Print(sformat("Nivel de objeto: %.1f (equipado %.1f)", avg or 0, equipped or 0))

    local points = GetTotalAchievementPoints and GetTotalAchievementPoints() or 0
    LE:Print(sformat("Puntos de logro: %d", points))

    if st.raidItems and st.raidItems > 0 then
        LE:Print(sformat("Bandas: %d objetos (%s)", st.raidItems, st.raidDate or "?"))
    else
        LE:Print("Bandas: |cffFF6666sin exportar|r")
    end

    if st.dungeonItems and st.dungeonItems > 0 then
        LE:Print(sformat("Mazmorras: %d objetos (%s)", st.dungeonItems, st.dungeonDate or "?"))
    else
        LE:Print("Mazmorras: |cffFF6666sin exportar|r")
    end

    LE:Print(sformat("Personaje: %s", st.charDate or "|cffFF6666sin exportar|r"))

    local total, maps = LE.Map:CountPins()
    LE:Print(sformat("Pines del mapa: %d en %d zonas", total, maps))
end

--=============================================================================
-- AYUDA
--=============================================================================

function Cmd:GetHelpText()
    return table.concat({
        "=== LoboExporter " .. LE.VERSION .. " ===",
        "",
        "Comandos disponibles (/lex, /loboexport o /exportar):",
        "",
        "  /lex                  Abre o cierra la ventana",
        "  /lex personaje        Genera los datos del personaje",
        "  /lex token            Genera el token para el bot de Discord",
        "  /lex raidloot         Extrae el botín de bandas",
        "  /lex dungeonloot      Extrae el botín de mazmorras",
        "  /lex buscar <texto>   Busca logros por nombre",
        "  /lex progreso         Resumen rápido en el chat",
        "  /lex pin [idLogro] [criterio]",
        "                        Añade un pin del mapa en tu posición actual",
        "  /lex pines            Exporta todos los pines en JSON",
        "  /lex debug            Información técnica del mapa",
        "  /lex cancelar         Detiene la exportación en curso",
        "  /lex reset            Restaura las opciones por defecto",
        "  /lex ayuda            Esta ayuda",
        "",
        "Notas:",
        "  - Las bases de datos de botín se guardan en memoria: escribe /reload",
        "    para volcarlas al archivo de la carpeta WTF.",
        "  - Para copiar: pulsa 'Seleccionar Todo' y luego CTRL+C.",
        "  - Si un texto es enorme se divide en páginas; usa < y > para pasarlas.",
    }, "\n")
end

--=============================================================================
-- DESPACHADOR
--=============================================================================

local handlers = {}

handlers["ayuda"] = function()
    LE.UI:Open(4)
    LE.UI:Show(Cmd:GetHelpText(), false)
end
handlers["help"] = handlers["ayuda"]

handlers["progreso"] = function() Cmd:ShowProgress() end
handlers["stats"] = handlers["progreso"]

handlers["debug"] = function()
    LE.UI:Open(4)
    LE.UI:Show(LE.Map:GetDebugInfo(), false)
end

handlers["raidloot"] = function()
    LE.UI:Open(2)
    LE.UI.raidBtn:Click()
end

handlers["dungeonloot"] = function()
    LE.UI:Open(2)
    LE.UI.dungeonBtn:Click()
end

handlers["personaje"] = function()
    LE.UI:Open(3)
    LE.UI:Show("Usa el botón 'Generar Datos del Personaje'.", false)
end

handlers["token"] = function()
    LE.UI:Open(3)
    LE.UI:Show("Usa el botón 'Obtener Token para IA'.", false)
end

handlers["pines"] = function()
    LE.UI:Open(4)
    LE.UI:Show(LE.Map:ExportJSON(), true)
end

handlers["cancelar"] = function()
    if LE:IsBusy() then
        LE:CancelTask()
        LE:Print("Exportación cancelada.")
    else
        LE:Print("No hay ninguna exportación en curso.")
    end
end

handlers["reset"] = function()
    local db = LE:GetDB()
    for key, value in pairs(LE.DEFAULTS) do
        db[key] = value
    end
    LE.UI:SyncWidgets()
    LE:Print("Opciones restauradas. Los pines y las bases de datos se conservan.")
end

local function HandlePin(rest)
    local ach, crit = rest:match("^(%d+)%s*(%d*)$")
    local mapID, x, y = LE.Map:GetPlayerPosition()
    local ok, err = LE.Map:AddPin(mapID, x, y, {
        ach = tonumber(ach),
        crit = tonumber(crit),
        icon = ach and "missing" or "treasure",
    })
    if ok then
        LE:Print(sformat("Pin añadido en %.1f, %.1f%s.", x * 100, y * 100,
            ach and (" (logro " .. ach .. ")") or ""))
        if LE.UI.UpdateStatus then LE.UI:UpdateStatus() end
    else
        LE:Error(err)
    end
end

local function HandleSearch(rest)
    if rest == "" then
        LE:Error("Escribe qué quieres buscar. Ejemplo: /lex buscar tesoro")
        return
    end
    LE.UI:Open(4)
    local box = rawget(_G, "LoboExporterSearchEditBox")
    if box then
        box:SetText(rest)
        local handler = box:GetScript("OnEnterPressed")
        if handler then handler(box) end
    end
end

SLASH_LOBOEXPORTER1 = "/loboexport"
SLASH_LOBOEXPORTER2 = "/lex"
SLASH_LOBOEXPORTER3 = "/exportar"

SlashCmdList["LOBOEXPORTER"] = function(msg)
    msg = msg and strtrim(msg) or ""
    local command, rest = msg:match("^(%S*)%s*(.-)$")
    command = string.lower(command or "")
    rest = rest or ""

    if command == "" then
        LE.UI:Toggle()
        return
    end

    if command == "pin" then HandlePin(rest) return end
    if command == "buscar" or command == "search" then HandleSearch(rest) return end

    local handler = handlers[command]
    if handler then
        handler(rest)
    else
        LE:Error("Comando desconocido: '" .. command .. "'. Escribe /lex ayuda.")
    end
end

--=============================================================================
-- INICIALIZACIÓN
--=============================================================================

local loader = CreateFrame("Frame")
loader:RegisterEvent("ADDON_LOADED")
loader:RegisterEvent("PLAYER_LOGIN")

loader:SetScript("OnEvent", function(self, event, arg1)
    if event == "ADDON_LOADED" and arg1 == ADDON_NAME then
        -- Las SavedVariables ya están cargadas: aquí es donde hay que aplicar
        -- los valores por defecto de las opciones nuevas sin machacar las del
        -- usuario. En la 2.x se hacía con  DB = DB or {...}  al cargar el
        -- archivo, así que quien ya tuviera una base de datos antigua nunca
        -- recibía las claves nuevas y salían nil.
        LE:GetDB()
        self:UnregisterEvent("ADDON_LOADED")

    elseif event == "PLAYER_LOGIN" then
        LE.UI:RestoreGeometry()
        LE.Map:Initialize()
        LE.UI:SyncWidgets()
        LE:Print(sformat("v%s cargado. Escribe |cff00FF00/lex|r para abrirlo.", LE.VERSION))
        self:UnregisterEvent("PLAYER_LOGIN")
    end
end)
