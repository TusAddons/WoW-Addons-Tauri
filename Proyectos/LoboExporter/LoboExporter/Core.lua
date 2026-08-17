--[[--------------------------------------------------------------------------
    LoboExporter 3.0 — Core
    Namespace, base de datos, utilidades y motor de tareas asíncronas.

    Compatible con el cliente de WoW Legion 7.3.5 (Lua 5.1).
    Autor: Artiom97es
----------------------------------------------------------------------------]]

local ADDON_NAME, LE = ...

LE.ADDON_NAME = ADDON_NAME
LE.VERSION = "3.0.0"
LE.PREFIX = "|cffFF7D0A[Lobo]|r "

-- Lua 5.1: nada de goto, bitwise operators ni // . Todo lo de aquí es 5.1 puro.
local tinsert, tconcat, tremove = table.insert, table.concat, table.remove
local sformat, sgsub, sbyte, ssub, sfind = string.format, string.gsub, string.byte, string.sub, string.find
local floor = math.floor

--=============================================================================
-- 1. BASE DE DATOS (SavedVariables) CON MIGRACIÓN
--=============================================================================

-- Todas las opciones viven aquí con su valor por defecto. Al añadir una opción
-- nueva basta con ponerla en esta tabla: ApplyDefaults la inyecta en las bases
-- de datos antiguas sin machacar lo que el usuario ya tenía configurado.
LE.DEFAULTS = {
    -- Secciones del export de personaje
    exportEquipment          = true,
    exportCurrencies         = true,
    exportReputations        = true,
    exportFollowers          = true,
    exportCompletedAchievs   = true,
    exportIncompleteAchievs  = false,
    -- Secciones nuevas (3.0)
    exportSpec               = true,
    exportProfessions        = true,
    exportTalents            = true,
    exportArtifact           = true,
    -- Formato y visor
    formatJSON               = true,   -- true = JSON, false = texto legible
    disablePagination        = false,  -- "cargar todo", con riesgo de tirón
    pageSize                 = 250000,
    -- Mapa (LoboTracker)
    showMapPins              = true,   -- pines de logros pendientes
    showMapCompleted         = true,   -- pines de logros ya completados
    mapPinScale              = 1.0,
    -- Varios
    verbose                  = true,   -- mensajes en el chat
}

-- Estructuras que no son "opciones" pero deben existir siempre.
local CONTAINERS = { "ExportStatus", "MapPins" }

local function ApplyDefaults(db)
    for key, value in pairs(LE.DEFAULTS) do
        if db[key] == nil then
            db[key] = value
        end
    end
    for _, key in ipairs(CONTAINERS) do
        if type(db[key]) ~= "table" then
            db[key] = {}
        end
    end
    return db
end

LE.ApplyDefaults = ApplyDefaults

function LE:GetDB()
    if type(LoboExporterDB) ~= "table" then
        LoboExporterDB = {}
    end
    return ApplyDefaults(LoboExporterDB)
end

--=============================================================================
-- 2. MENSAJES
--=============================================================================

function LE:Print(...)
    local db = rawget(_G, "LoboExporterDB")
    if db and db.verbose == false then return end
    print(LE.PREFIX .. tconcat({ ... }, " "))
end

function LE:Error(msg)
    print(LE.PREFIX .. "|cffFF4444" .. tostring(msg) .. "|r")
end

--=============================================================================
-- 3. ICONOS EN TEXTO
--    Los emoji (📋 ⚔️ ✅) NO existen en las fuentes del cliente 7.3.5: se ven
--    como cuadros vacíos o basura. Se sustituyen por texturas del propio juego,
--    que sí se renderizan en cualquier FontString.
--=============================================================================

local function Tex(path, size)
    return sformat("|T%s:%d:%d:0:0|t", path, size or 16, size or 16)
end
LE.Tex = Tex

LE.ICON = {
    ok      = Tex("Interface\\RAIDFRAME\\ReadyCheck-Ready", 16),
    fail    = Tex("Interface\\RAIDFRAME\\ReadyCheck-NotReady", 16),
    wait    = Tex("Interface\\RAIDFRAME\\ReadyCheck-Waiting", 16),
    raid    = Tex("Interface\\Icons\\INV_Helmet_08", 16),
    dungeon = Tex("Interface\\Icons\\INV_Misc_Key_04", 16),
    player  = Tex("Interface\\Icons\\Achievement_Character_Human_Male", 16),
    copy    = Tex("Interface\\Icons\\INV_Misc_Note_02", 16),
    bolt    = Tex("Interface\\Icons\\Spell_Nature_Lightning", 16),
    robot   = Tex("Interface\\Icons\\INV_Pet_Mechanical_Prairiedog", 16),
    map     = Tex("Interface\\Icons\\INV_Misc_Map02", 16),
    search  = Tex("Interface\\Icons\\INV_Misc_Spyglass_02", 16),
    gear    = Tex("Interface\\Icons\\Trade_Engineering", 16),
    chart   = Tex("Interface\\Icons\\INV_Scroll_11", 16),
    shirt   = Tex("Interface\\Icons\\INV_Chest_Cloth_04", 16),
}

--=============================================================================
-- 4. CODIFICADOR JSON
--    La versión 2.x pegaba trozos de texto a mano y producía JSON inválido
--    (p.ej. el token para la IA salía como  "currencies":   "wealth": {...} ).
--    Aquí se construyen tablas Lua normales y se serializan al final, así que
--    es imposible que la estructura salga rota.
--
--    Convención: para forzar un array vacío usa LE.EMPTY_ARRAY; una tabla Lua
--    vacía es ambigua y se serializa como objeto {}.
--=============================================================================

LE.EMPTY_ARRAY = setmetatable({}, { __tostring = function() return "[]" end })

local ESCAPES = {
    ['"']  = '\\"',
    ['\\'] = '\\\\',
    ['\b'] = '\\b',
    ['\f'] = '\\f',
    ['\n'] = '\\n',
    ['\r'] = '\\r',
    ['\t'] = '\\t',
}

local function EscapeString(s)
    s = sgsub(s, '[%c"\\]', function(c)
        local mapped = ESCAPES[c]
        if mapped then return mapped end
        return sformat('\\u%04x', sbyte(c))
    end)
    return s
end
LE.EscapeString = EscapeString

-- ¿Es la tabla un array (claves 1..n sin huecos)?
local function IsArray(t)
    local n = 0
    for k in pairs(t) do
        if type(k) ~= "number" then return false end
        n = n + 1
    end
    for i = 1, n do
        if t[i] == nil then return false end
    end
    return true, n
end

-- Serializa un valor Lua a JSON. `indent` = nil para compacto.
local function Encode(value, indent, level)
    level = level or 0
    local vtype = type(value)

    if value == LE.EMPTY_ARRAY then return "[]" end

    if value == nil then
        return "null"
    elseif vtype == "boolean" then
        return value and "true" or "false"
    elseif vtype == "number" then
        -- Sin notación científica ni nan/inf, que rompen los parsers.
        if value ~= value or value == math.huge or value == -math.huge then return "0" end
        if floor(value) == value and math.abs(value) < 1e15 then
            return sformat("%d", value)
        end
        return sformat("%.4f", value)
    elseif vtype == "string" then
        return '"' .. EscapeString(value) .. '"'
    elseif vtype ~= "table" then
        return '"' .. EscapeString(tostring(value)) .. '"'
    end

    local nl, pad, padInner = "", "", ""
    if indent then
        nl = "\n"
        pad = string.rep(indent, level)
        padInner = string.rep(indent, level + 1)
    end

    local isArr, count = IsArray(value)
    local out = {}

    if isArr then
        if count == 0 then return "[]" end
        for i = 1, count do
            out[#out + 1] = padInner .. Encode(value[i], indent, level + 1)
        end
        return "[" .. nl .. tconcat(out, "," .. nl) .. nl .. pad .. "]"
    end

    -- Objeto: claves ordenadas para que dos exportaciones iguales den el mismo
    -- texto (facilita comparar y cachear en el bot).
    local keys = {}
    for k in pairs(value) do keys[#keys + 1] = tostring(k) end
    table.sort(keys)
    if #keys == 0 then return "{}" end

    for _, k in ipairs(keys) do
        local v = value[k]
        if v == nil then v = value[tonumber(k)] end
        out[#out + 1] = padInner .. '"' .. EscapeString(k) .. '":' .. (indent and " " or "")
                        .. Encode(v, indent, level + 1)
    end
    return "{" .. nl .. tconcat(out, "," .. nl) .. nl .. pad .. "}"
end

function LE:ToJSON(value, pretty)
    return Encode(value, pretty and "  " or nil, 0)
end

--=============================================================================
-- 5. BASE64 (para el token del bot de Discord)
--    Implementación por tabla de bytes: la versión 2.x usaba gsub con
--    exponenciales por carácter y tardaba segundos con textos grandes.
--=============================================================================

local B64_CHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local B64 = {}
for i = 1, 64 do B64[i - 1] = ssub(B64_CHARS, i, i) end

function LE:Base64(data)
    if not data or data == "" then return "" end
    local out, n = {}, #data
    local i = 1
    while i + 2 <= n do
        local a, b, c = sbyte(data, i, i + 2)
        local v = a * 65536 + b * 256 + c
        out[#out + 1] = B64[floor(v / 262144)] .. B64[floor(v / 4096) % 64]
                     .. B64[floor(v / 64) % 64] .. B64[v % 64]
        i = i + 3
    end
    local rest = n - i + 1
    if rest == 1 then
        local a = sbyte(data, i)
        local v = a * 65536
        out[#out + 1] = B64[floor(v / 262144)] .. B64[floor(v / 4096) % 64] .. "=="
    elseif rest == 2 then
        local a, b = sbyte(data, i, i + 1)
        local v = a * 65536 + b * 256
        out[#out + 1] = B64[floor(v / 262144)] .. B64[floor(v / 4096) % 64]
                     .. B64[floor(v / 64) % 64] .. "="
    end
    return tconcat(out)
end

--=============================================================================
-- 6. MOTOR DE TAREAS ASÍNCRONAS
--    Una corrutina que cede el control cada N milisegundos reales, en vez de
--    "cada X elementos". Así el cliente nunca se congela, dé igual lo lento que
--    sea el PC o lo grande que sea el escaneo.
--=============================================================================

local RUNNER_INTERVAL = 0.01   -- cada cuánto se reanuda la corrutina
local BUDGET_MS = 0.008        -- ~8 ms de trabajo por fotograma

local activeTask = nil

local Task = {}
Task.__index = Task

function Task:ShouldYield()
    return (debugprofilestop() - self._sliceStart) > (BUDGET_MS * 1000)
end

-- Llamar dentro del bucle de trabajo: cede el control si toca.
function Task:Step()
    if self:ShouldYield() then
        coroutine.yield()
        self._sliceStart = debugprofilestop()
    end
end

function Task:Cancel()
    self.cancelled = true
end

function LE:IsBusy()
    return activeTask ~= nil and not activeTask.finished
end

function LE:CancelTask()
    if activeTask then activeTask:Cancel() end
end

--- Ejecuta `worker(task)` en una corrutina.
--  worker recibe el objeto task; debe llamar a task:Step() dentro de sus bucles
--  y puede llamar a task:Report(done, total) para la barra de progreso.
function LE:RunTask(worker, onDone, onProgress, onError)
    if self:IsBusy() then
        self:Error("Ya hay una exportación en curso. Espera a que termine o pulsa Cancelar.")
        return nil
    end

    local task = setmetatable({
        _sliceStart = debugprofilestop(),
        cancelled = false,
        finished = false,
    }, Task)

    task.Report = function(_, done, total)
        if onProgress then onProgress(done, total) end
    end

    local co = coroutine.create(function()
        return worker(task)
    end)

    activeTask = task

    local ticker
    ticker = C_Timer.NewTicker(RUNNER_INTERVAL, function()
        if task.cancelled then
            ticker:Cancel()
            task.finished = true
            activeTask = nil
            if onError then onError("Cancelado por el usuario.") end
            return
        end

        task._sliceStart = debugprofilestop()
        local ok, result = coroutine.resume(co)

        if not ok then
            ticker:Cancel()
            task.finished = true
            activeTask = nil
            LE:Error("Error durante la exportación: " .. tostring(result))
            if onError then onError(tostring(result)) end
            return
        end

        if coroutine.status(co) == "dead" then
            ticker:Cancel()
            task.finished = true
            activeTask = nil
            if onDone then onDone(result) end
        end
    end)

    task.ticker = ticker
    return task
end

--=============================================================================
-- 7. UTILIDADES VARIAS
--=============================================================================

function LE:Now()
    return date("%Y-%m-%d %H:%M:%S")
end

function LE:FormatMoney(copper)
    copper = copper or 0
    local g = floor(copper / 10000)
    local s = floor((copper % 10000) / 100)
    local c = copper % 100
    return g, s, c
end

--- pcall que además devuelve un valor por defecto en vez de propagar el fallo.
--  Devuelve TODOS los valores de la función, no los cuatro primeros: varias
--  APIs del cliente (GetFriendshipReputation, GetSpecializationInfo,
--  GetAchievementInfo) tienen el dato interesante en la posición 5, 9 o 13.
local function packResults(...)
    return select("#", ...), { ... }
end

function LE:Safe(fn, default, ...)
    if type(fn) ~= "function" then return default end
    local count, results = packResults(pcall(fn, ...))
    if results[1] then
        return unpack(results, 2, count)
    end
    return default
end

--- Busca entre los valores devueltos por una función el primero que cumpla
--  `predicate`. Sirve para APIs cuya firma cambia entre builds del cliente.
function LE:FindReturn(predicate, ...)
    for i = 1, select("#", ...) do
        local value = select(i, ...)
        if value ~= nil and predicate(value) then return value end
    end
    return nil
end

--- Extrae el itemID de un enlace de objeto.
function LE:ItemIDFromLink(link)
    if type(link) ~= "string" then return nil end
    local id = link:match("item:(%d+)")
    return id and tonumber(id) or nil
end

--- Nombre "bonito" de un objeto a partir de un enlace, sin depender de la caché.
function LE:ItemNameFromLink(link)
    if type(link) ~= "string" then return nil end
    return link:match("%[(.-)%]")
end

--- Trocea un texto largo en páginas seguras para el EditBox.
function LE:Paginate(text, limit)
    local pages = {}
    text = text or ""
    limit = limit or 250000
    if #text <= limit then
        pages[1] = text
        return pages
    end
    local idx = 1
    while idx <= #text do
        pages[#pages + 1] = ssub(text, idx, idx + limit - 1)
        idx = idx + limit
    end
    return pages
end

_G.LoboExporter = LE
