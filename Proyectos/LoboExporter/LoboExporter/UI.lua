--[[--------------------------------------------------------------------------
    LoboExporter 3.0 — Interfaz

    Cambios frente a la 2.x:
      * Nada de emoji: la fuente del cliente 7.3.5 no los tiene y se veían como
        cuadros. Se usan texturas del juego (|T...|t), que sí se renderizan.
      * La ventana se puede redimensionar y recuerda tamaño y posición.
      * Barra de progreso con botón de Cancelar (antes no se podía parar nada).
      * Todos los botones que lanzan trabajo se bloquean mientras dura, no sólo
        los de la pestaña de bases de datos.
      * El visor no revienta el cliente: paginación real + aviso al desactivarla.
----------------------------------------------------------------------------]]

local ADDON_NAME, LE = ...

local sformat = string.format
local ICON = LE.ICON

LE.UI = {}
local UI = LE.UI

local MIN_W, MIN_H = 700, 620

--=============================================================================
-- VENTANA PRINCIPAL
--=============================================================================

local frame = CreateFrame("Frame", "LoboExporterFrame", UIParent)
UI.frame = frame
frame:SetSize(MIN_W, MIN_H)
frame:SetPoint("CENTER")
frame:SetBackdrop({
    bgFile   = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true, tileSize = 32, edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 11 },
})
frame:SetMovable(true)
frame:SetResizable(true)
frame:SetMinResize(MIN_W, MIN_H)
frame:SetClampedToScreen(true)
frame:EnableMouse(true)
frame:RegisterForDrag("LeftButton")
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnDragStop", function(self)
    self:StopMovingOrSizing()
    UI:SaveGeometry()
end)
frame:Hide()
tinsert(UISpecialFrames, "LoboExporterFrame")

local titleTex = frame:CreateTexture(nil, "ARTWORK")
titleTex:SetTexture("Interface\\DialogFrame\\UI-DialogBox-Header")
titleTex:SetSize(420, 64)
titleTex:SetPoint("TOP", frame, "TOP", 0, 12)

local titleText = frame:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
titleText:SetPoint("TOP", titleTex, "TOP", 0, -14)
titleText:SetText("|cffFF7D0ALobo|r Exporter & Tracker " .. LE.VERSION)

local closeBtn = CreateFrame("Button", nil, frame, "UIPanelCloseButton")
closeBtn:SetPoint("TOPRIGHT", frame, "TOPRIGHT", -8, -8)

-- Asa de redimensionado en la esquina inferior derecha.
local resizer = CreateFrame("Button", nil, frame)
resizer:SetSize(16, 16)
resizer:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -6, 7)
resizer:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
resizer:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
resizer:SetScript("OnMouseDown", function() frame:StartSizing("BOTTOMRIGHT") end)
resizer:SetScript("OnMouseUp", function()
    frame:StopMovingOrSizing()
    UI:SaveGeometry()
end)

function UI:SaveGeometry()
    local db = LE:GetDB()
    db.ui = db.ui or {}
    db.ui.width, db.ui.height = frame:GetWidth(), frame:GetHeight()
    local point, _, relPoint, x, y = frame:GetPoint()
    db.ui.point, db.ui.relPoint, db.ui.x, db.ui.y = point, relPoint, x, y
end

function UI:RestoreGeometry()
    local db = LE:GetDB()
    if type(db.ui) ~= "table" then return end
    if db.ui.width and db.ui.height then
        frame:SetSize(math.max(db.ui.width, MIN_W), math.max(db.ui.height, MIN_H))
    end
    if db.ui.point then
        frame:ClearAllPoints()
        frame:SetPoint(db.ui.point, UIParent, db.ui.relPoint or db.ui.point, db.ui.x or 0, db.ui.y or 0)
    end
end

--=============================================================================
-- PESTAÑAS
--=============================================================================

local tabs, panels = {}, {}
local activeTab = 1

local function SelectTab(id)
    activeTab = id
    PanelTemplates_SetTab(frame, id)
    for i = 1, #panels do
        if i == id then panels[i]:Show() else panels[i]:Hide() end
    end
end
UI.SelectTab = function(_, id) SelectTab(id) end

local function CreateTab(id, name)
    local tab = CreateFrame("Button", "LoboExporterFrameTab" .. id, frame, "CharacterFrameTabButtonTemplate")
    tab:SetID(id)
    tab:SetText(name)
    if id == 1 then
        tab:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 15, -32)
    else
        tab:SetPoint("LEFT", tabs[id - 1], "RIGHT", -16, 0)
    end
    tab:SetScript("OnClick", function(self) SelectTab(self:GetID()) end)
    tabs[id] = tab

    local panel = CreateFrame("Frame", nil, frame)
    panel:SetPoint("TOPLEFT", frame, "TOPLEFT", 15, -45)
    panel:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -15, 15)
    panel:Hide()
    panels[id] = panel
    return panel
end

local PanelStatus = CreateTab(1, "Progreso y Estado")
local PanelLoot   = CreateTab(2, "Bases de Datos (BiS)")
local PanelChar   = CreateTab(3, "Exportar Personaje")
local PanelTools  = CreateTab(4, "Opciones y Mapa")

PanelTemplates_SetNumTabs(frame, 4)
PanelTemplates_SetTab(frame, 1)

--=============================================================================
-- VISOR DE RESULTADOS (compartido por todas las pestañas)
--=============================================================================

local scroll = CreateFrame("ScrollFrame", "LoboExporterScrollFrame", frame, "UIPanelScrollFrameTemplate")
scroll:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 25, 60)
scroll:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -45, 60)
scroll:SetHeight(200)

local scrollBG = CreateFrame("Frame", nil, frame)
scrollBG:SetPoint("TOPLEFT", scroll, "TOPLEFT", -6, 6)
scrollBG:SetPoint("BOTTOMRIGHT", scroll, "BOTTOMRIGHT", 26, -6)
scrollBG:SetBackdrop({
    bgFile   = "Interface\\Tooltips\\UI-Tooltip-Background",
    edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
    tile = true, tileSize = 16, edgeSize = 16,
    insets = { left = 4, right = 4, top = 4, bottom = 4 },
})
scrollBG:SetBackdropColor(0.05, 0.05, 0.08, 0.95)
scrollBG:SetFrameLevel(math.max(0, scroll:GetFrameLevel() - 1))

local editBox = CreateFrame("EditBox", nil, scroll)
editBox:SetMultiLine(true)
editBox:SetFontObject("ChatFontNormal")
editBox:SetAutoFocus(false)
editBox:EnableKeyboard(true)
editBox:SetMaxBytes(0)          -- 0 = sin límite artificial
editBox:SetWidth(600)
editBox:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
scroll:SetScrollChild(editBox)

scroll:SetScript("OnSizeChanged", function(self, w)
    if w and w > 0 then editBox:SetWidth(w - 10) end
end)

local pages, pageIdx = { "" }, 1

--=============================================================================
-- BOTONERA DEL VISOR
--=============================================================================

local copyBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
copyBtn:SetSize(150, 24)
copyBtn:SetPoint("BOTTOMRIGHT", scroll, "TOPRIGHT", 0, 6)
copyBtn:SetFrameLevel(scroll:GetFrameLevel() + 10)
copyBtn:SetText(ICON.copy .. " Seleccionar Todo")
copyBtn:SetScript("OnClick", function()
    editBox:SetFocus()
    editBox:HighlightText()
end)

local pageText = frame:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
pageText:SetPoint("RIGHT", copyBtn, "LEFT", -10, 0)
pageText:SetText("Pág. 1/1")

local nextBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
nextBtn:SetSize(30, 24)
nextBtn:SetPoint("RIGHT", pageText, "LEFT", -6, 0)
nextBtn:SetFrameLevel(scroll:GetFrameLevel() + 10)
nextBtn:SetText(">")

local prevBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
prevBtn:SetSize(30, 24)
prevBtn:SetPoint("RIGHT", nextBtn, "LEFT", -4, 0)
prevBtn:SetFrameLevel(scroll:GetFrameLevel() + 10)
prevBtn:SetText("<")

local cbNoPaging = CreateFrame("CheckButton", nil, frame, "UICheckButtonTemplate")
cbNoPaging:SetSize(24, 24)
cbNoPaging:SetPoint("BOTTOMLEFT", scroll, "TOPLEFT", -5, 4)
cbNoPaging:SetFrameLevel(scroll:GetFrameLevel() + 10)
cbNoPaging.text = cbNoPaging:CreateFontString(nil, "OVERLAY", "GameFontNormal")
cbNoPaging.text:SetPoint("LEFT", cbNoPaging, "RIGHT", 4, 1)
cbNoPaging.text:SetText("Cargar todo de una vez (puede dar tirones)")
cbNoPaging:SetScript("OnClick", function(self)
    LE:GetDB().disablePagination = self:GetChecked() and true or false
end)

local function UpdatePagingUI()
    if #pages <= 1 then
        prevBtn:Hide(); nextBtn:Hide(); pageText:Hide()
    else
        prevBtn:Show(); nextBtn:Show(); pageText:Show()
        pageText:SetText(sformat("Pág. %d/%d", pageIdx, #pages))
        prevBtn:SetEnabled(pageIdx > 1)
        nextBtn:SetEnabled(pageIdx < #pages)
    end
end

prevBtn:SetScript("OnClick", function()
    if pageIdx > 1 then
        pageIdx = pageIdx - 1
        editBox:SetText(pages[pageIdx])
        UpdatePagingUI()
    end
end)

nextBtn:SetScript("OnClick", function()
    if pageIdx < #pages then
        pageIdx = pageIdx + 1
        editBox:SetText(pages[pageIdx])
        UpdatePagingUI()
    end
end)

--- Muestra texto en el visor, paginándolo si hace falta.
function UI:Show(text, autoSelect)
    local db = LE:GetDB()
    local limit = db.disablePagination and math.huge or (db.pageSize or 250000)
    pages = LE:Paginate(text or "", limit)
    pageIdx = 1
    editBox:SetText(pages[1] or "")
    UpdatePagingUI()
    if autoSelect then
        editBox:SetFocus()
        editBox:HighlightText()
    end
end

function UI:SetStatusText(text)
    pages, pageIdx = { text or "" }, 1
    editBox:SetText(text or "")
    UpdatePagingUI()
end

-- Alias público que ya usaban scripts externos en la 2.x.
_G.LoboExporter_ShowTextPaginated = function(text) UI:Show(text, false) end

--=============================================================================
-- BARRA DE PROGRESO CON CANCELAR
--=============================================================================

local progress = CreateFrame("StatusBar", nil, frame)
progress:SetSize(560, 22)
progress:SetPoint("BOTTOMLEFT", frame, "BOTTOMLEFT", 25, 22)
progress:SetPoint("BOTTOMRIGHT", frame, "BOTTOMRIGHT", -125, 22)
progress:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
progress:SetStatusBarColor(0.2, 0.8, 0.2)
progress:SetMinMaxValues(0, 100)
progress:Hide()

progress.bg = progress:CreateTexture(nil, "BACKGROUND")
progress.bg:SetAllPoints()
progress.bg:SetTexture("Interface\\TargetingFrame\\UI-StatusBar")
progress.bg:SetVertexColor(0.1, 0.1, 0.1, 0.8)

progress.text = progress:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
progress.text:SetPoint("CENTER")
progress.text:SetText("Progreso: 0%")

local cancelBtn = CreateFrame("Button", nil, frame, "UIPanelButtonTemplate")
cancelBtn:SetSize(90, 22)
cancelBtn:SetPoint("LEFT", progress, "RIGHT", 8, 0)
cancelBtn:SetText("Cancelar")
cancelBtn:Hide()
cancelBtn:SetScript("OnClick", function()
    LE:CancelTask()
    UI:SetStatusText("Cancelando...")
end)

--=============================================================================
-- BLOQUEO DE BOTONES DURANTE UNA TAREA
--=============================================================================

local workButtons = {}

local function RegisterWorkButton(button)
    workButtons[#workButtons + 1] = button
    return button
end

function UI:SetBusy(busy, label)
    for _, b in ipairs(workButtons) do
        if busy then b:Disable() else b:Enable() end
    end
    if busy then
        progress:SetValue(0)
        progress.text:SetText(label or "Progreso: 0%")
        progress:Show()
        cancelBtn:Show()
    else
        progress:Hide()
        cancelBtn:Hide()
    end
end

function UI:OnProgress(done, total)
    if not total or total <= 0 then return end
    local pct = (done / total) * 100
    progress:SetValue(pct)
    progress.text:SetText(sformat("%d / %d  (%d%%)", done, total, pct))
end

--=============================================================================
-- PESTAÑA 1: PROGRESO Y ESTADO
--=============================================================================

local statusHeader = PanelStatus:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
statusHeader:SetPoint("TOP", PanelStatus, "TOP", 0, -15)
statusHeader:SetText("Resumen de Exportaciones")

local function CreateStatusLine(parent, icon, label, y)
    local line = CreateFrame("Frame", nil, parent)
    line:SetSize(620, 28)
    line:SetPoint("TOP", parent, "TOP", 0, y)

    line.state = line:CreateTexture(nil, "ARTWORK")
    line.state:SetSize(22, 22)
    line.state:SetPoint("LEFT", line, "LEFT", 4, 0)
    line.state:SetTexture("Interface\\RAIDFRAME\\ReadyCheck-NotReady")

    line.label = line:CreateFontString(nil, "OVERLAY", "GameFontHighlightLarge")
    line.label:SetPoint("LEFT", line.state, "RIGHT", 8, 0)
    line.label:SetText(icon .. " " .. label)

    line.info = line:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    line.info:SetPoint("RIGHT", line, "RIGHT", -4, 0)
    line.info:SetText("Nunca exportado")
    return line
end

local statusRaid    = CreateStatusLine(PanelStatus, ICON.raid,    "Base de Datos de Bandas",    -55)
local statusDungeon = CreateStatusLine(PanelStatus, ICON.dungeon, "Base de Datos de Mazmorras", -95)
local statusChar    = CreateStatusLine(PanelStatus, ICON.player,  "Personaje",                  -135)
local statusPins    = CreateStatusLine(PanelStatus, ICON.map,     "Pines del Mapa",             -175)

local hintText = PanelStatus:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
hintText:SetPoint("TOP", PanelStatus, "TOP", 0, -215)
hintText:SetJustifyH("CENTER")
hintText:SetText("Las bases de datos se guardan en memoria. Escribe /reload para volcarlas al disco (carpeta WTF).")

local function SetLine(line, done, text)
    line.state:SetTexture(done and "Interface\\RAIDFRAME\\ReadyCheck-Ready"
                               or "Interface\\RAIDFRAME\\ReadyCheck-NotReady")
    line.info:SetText(text)
end

function UI:UpdateStatus()
    local db = LE:GetDB()
    local st = db.ExportStatus or {}

    if st.raidItems and st.raidItems > 0 then
        SetLine(statusRaid, true, sformat("|cff00FF00%d objetos|r  %s", st.raidItems, st.raidDate or ""))
    else
        SetLine(statusRaid, false, "|cffFF6666Pendiente|r")
    end

    if st.dungeonItems and st.dungeonItems > 0 then
        SetLine(statusDungeon, true, sformat("|cff00FF00%d objetos|r  %s", st.dungeonItems, st.dungeonDate or ""))
    else
        SetLine(statusDungeon, false, "|cffFF6666Pendiente|r")
    end

    if st.charDate then
        SetLine(statusChar, true, "|cff00FF00Generado|r  " .. st.charDate)
    else
        SetLine(statusChar, false, "|cffFF6666Pendiente|r")
    end

    local total, maps = LE.Map:CountPins()
    if total > 0 then
        SetLine(statusPins, true, sformat("|cff00FF00%d pines|r en %d zonas", total, maps))
    else
        SetLine(statusPins, false, "|cffFF6666Sin pines|r")
    end
end

--=============================================================================
-- PESTAÑA 2: BASES DE DATOS (BiS)
--=============================================================================

local function MakeButton(parent, w, h, text, point, rel, relPoint, x, y)
    local b = CreateFrame("Button", nil, parent, "UIPanelButtonTemplate")
    b:SetSize(w, h)
    b:SetPoint(point, rel, relPoint, x, y)
    b:SetText(text)
    return b
end

local raidBtn = RegisterWorkButton(MakeButton(PanelLoot, 290, 38,
    ICON.raid .. " Extraer Botín de BANDAS", "TOPLEFT", PanelLoot, "TOPLEFT", 25, -15))
local dungeonBtn = RegisterWorkButton(MakeButton(PanelLoot, 290, 38,
    ICON.dungeon .. " Extraer Botín de MAZMORRAS", "TOPRIGHT", PanelLoot, "TOPRIGHT", -25, -15))
local raidCopyBtn = RegisterWorkButton(MakeButton(PanelLoot, 290, 28,
    ICON.copy .. " Generar Texto de BANDAS", "TOPLEFT", PanelLoot, "TOPLEFT", 25, -58))
local dungeonCopyBtn = RegisterWorkButton(MakeButton(PanelLoot, 290, 28,
    ICON.copy .. " Generar Texto de MAZMORRAS", "TOPRIGHT", PanelLoot, "TOPRIGHT", -25, -58))

local dbDesc = PanelLoot:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
dbDesc:SetPoint("TOP", PanelLoot, "TOP", 0, -100)
dbDesc:SetJustifyH("CENTER")
dbDesc:SetText(
    "Recorre todas las instancias, jefes y dificultades de Legion.\n" ..
    "Se extrae el botín de la clase que tengas filtrada en la Guía de Aventuras\n" ..
    "(todas sus especializaciones). El juego no se congela y puedes cancelar.")

--- Lanza un escaneo de botín. saveToDB = guardar en SavedVariables.
local function RunJournalExport(isRaid, saveToDB)
    UI:SetBusy(true, "Preparando...")
    UI:SetStatusText(sformat("Recorriendo %s de Legion...\nPuedes pulsar Cancelar en cualquier momento.",
        isRaid and "bandas" or "mazmorras"))

    LE.Journal:Export(isRaid,
        function(rows, count, json)
            UI:SetBusy(false)
            local db = LE:GetDB()
            db.ExportStatus = db.ExportStatus or {}

            if saveToDB then
                if isRaid then
                    db.RaidLoot = json
                    db.ExportStatus.raidItems = count
                    db.ExportStatus.raidDate = LE:Now()
                else
                    db.DungeonLoot = json
                    db.ExportStatus.dungeonItems = count
                    db.ExportStatus.dungeonDate = LE:Now()
                end
                UI:UpdateStatus()
                UI:Show(sformat(
                    "Completado: %d objetos.\n\nGuardado en la memoria del addon.\n" ..
                    "Escribe /reload para volcarlo al archivo de la carpeta WTF.\n\n" ..
                    "Si sólo querías el texto para copiar, usa el botón \"Generar Texto\".", count), false)
            else
                UI:Show(json, true)
            end
            LE:Print(sformat("Botín de %s: %d objetos.", isRaid and "bandas" or "mazmorras", count))
        end,
        function(done, total) UI:OnProgress(done, total) end,
        function(err)
            UI:SetBusy(false)
            UI:SetStatusText("Extracción interrumpida: " .. tostring(err))
        end)
end

raidBtn:SetScript("OnClick",        function() RunJournalExport(true,  true)  end)
dungeonBtn:SetScript("OnClick",     function() RunJournalExport(false, true)  end)
raidCopyBtn:SetScript("OnClick",    function() RunJournalExport(true,  false) end)
dungeonCopyBtn:SetScript("OnClick", function() RunJournalExport(false, false) end)

UI.raidBtn, UI.dungeonBtn = raidBtn, dungeonBtn

--=============================================================================
-- PESTAÑA 3: EXPORTAR PERSONAJE
--=============================================================================

local checkboxes = {}

local function CreateCheckbox(parent, label, key, x, y, onClick)
    local cb = CreateFrame("CheckButton", nil, parent, "UICheckButtonTemplate")
    cb:SetPoint("TOPLEFT", parent, "TOPLEFT", x, y)
    cb.text = cb:CreateFontString(nil, "OVERLAY", "GameFontNormal")
    cb.text:SetPoint("LEFT", cb, "RIGHT", 4, 1)
    cb.text:SetText(label)
    cb.dbKey = key
    cb:SetChecked(LE:GetDB()[key] and true or false)
    cb:SetScript("OnClick", function(self)
        LE:GetDB()[key] = self:GetChecked() and true or false
        if onClick then onClick(self) end
    end)
    checkboxes[#checkboxes + 1] = cb
    return cb
end

local secHeader = PanelChar:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
secHeader:SetPoint("TOPLEFT", PanelChar, "TOPLEFT", 15, -10)
secHeader:SetText("¿Qué quieres incluir?")

CreateCheckbox(PanelChar, "Equipamiento e ilvl",  "exportEquipment",        20,  -38)
CreateCheckbox(PanelChar, "Oro y Monedas",        "exportCurrencies",      240,  -38)
CreateCheckbox(PanelChar, "Reputaciones",         "exportReputations",     450,  -38)

CreateCheckbox(PanelChar, "Logros Completados",   "exportCompletedAchievs", 20,  -68)
CreateCheckbox(PanelChar, "Logros Pendientes",    "exportIncompleteAchievs",240, -68)
CreateCheckbox(PanelChar, "Seguidores y Campeones","exportFollowers",       450, -68)

CreateCheckbox(PanelChar, "Especialización y stats","exportSpec",            20,  -98)
CreateCheckbox(PanelChar, "Talentos",             "exportTalents",         240,  -98)
CreateCheckbox(PanelChar, "Profesiones",          "exportProfessions",     450,  -98)

CreateCheckbox(PanelChar, "Arma Artefacto",       "exportArtifact",         20, -128)

local achWarn = PanelChar:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
achWarn:SetPoint("TOPLEFT", PanelChar, "TOPLEFT", 240, -132)
achWarn:SetText("Los logros son lo más lento: se escanean sin congelar el juego.")

local formatBtn = MakeButton(PanelChar, 190, 24, "", "TOPRIGHT", PanelChar, "TOPRIGHT", -15, -160)
local function UpdateFormatBtn()
    formatBtn:SetText(LE:GetDB().formatJSON and "Formato: JSON { }" or "Formato: Texto Legible")
end
formatBtn:SetScript("OnClick", function()
    local db = LE:GetDB()
    db.formatJSON = not db.formatJSON
    UpdateFormatBtn()
end)

local genBtn = RegisterWorkButton(MakeButton(PanelChar, 290, 38,
    ICON.bolt .. " Generar Datos del Personaje", "TOPLEFT", PanelChar, "TOPLEFT", 15, -160))

local aiBtn = RegisterWorkButton(MakeButton(PanelChar, 290, 38,
    ICON.robot .. " Obtener Token para IA (Discord)", "TOPLEFT", genBtn, "BOTTOMLEFT", 0, -8))

genBtn:SetScript("OnClick", function()
    UI:SetBusy(true, "Recopilando datos...")
    UI:SetStatusText("Recopilando los datos de tu personaje...")

    LE:RunTask(
        function(task) return LE.Character:BuildExport(task) end,
        function(data)
            UI:SetBusy(false)
            if not data then return end
            local db = LE:GetDB()
            db.ExportStatus = db.ExportStatus or {}
            db.ExportStatus.charDate = LE:Now()
            UI:UpdateStatus()
            UI:Show(LE.Character:Render(data, db), true)
            LE:Print("Datos del personaje generados.")
        end,
        function(done, total) UI:OnProgress(done, total) end,
        function(err)
            UI:SetBusy(false)
            UI:SetStatusText("Generación interrumpida: " .. tostring(err))
        end)
end)

aiBtn:SetScript("OnClick", function()
    UI:SetBusy(true, "Generando token...")
    UI:SetStatusText("Generando el token para el bot...")

    LE:RunTask(
        function(task) return LE.Character:BuildToken(task) end,
        function(token)
            UI:SetBusy(false)
            if not token then return end
            UI:Show(token, true)
            LE:Print("Token generado (" .. #token .. " caracteres). Cópialo con CTRL+C y pégalo en Discord.")
        end,
        function(done, total) UI:OnProgress(done, total) end,
        function(err)
            UI:SetBusy(false)
            UI:SetStatusText("Token interrumpido: " .. tostring(err))
        end)
end)

--=============================================================================
-- PESTAÑA 4: OPCIONES Y MAPA
--=============================================================================

local mapHeader = PanelTools:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
mapHeader:SetPoint("TOPLEFT", PanelTools, "TOPLEFT", 15, -10)
mapHeader:SetText(ICON.map .. " LoboTracker — pines en el mapa")

CreateCheckbox(PanelTools, "Ver pines de logros PENDIENTES", "showMapPins", 20, -38,
    function() LE.Map:Refresh() end)
CreateCheckbox(PanelTools, "Ver pines de logros COMPLETADOS", "showMapCompleted", 320, -38,
    function() LE.Map:Refresh() end)

local pinAchLabel = PanelTools:CreateFontString(nil, "ARTWORK", "GameFontNormal")
pinAchLabel:SetPoint("TOPLEFT", PanelTools, "TOPLEFT", 20, -76)
pinAchLabel:SetText("ID de logro (opcional):")

local pinAchBox = CreateFrame("EditBox", nil, PanelTools, "InputBoxTemplate")
pinAchBox:SetSize(70, 22)
pinAchBox:SetPoint("LEFT", pinAchLabel, "RIGHT", 8, 0)
pinAchBox:SetAutoFocus(false)
pinAchBox:SetNumeric(true)

local pinCritLabel = PanelTools:CreateFontString(nil, "ARTWORK", "GameFontNormal")
pinCritLabel:SetPoint("LEFT", pinAchBox, "RIGHT", 12, 0)
pinCritLabel:SetText("Criterio:")

local pinCritBox = CreateFrame("EditBox", nil, PanelTools, "InputBoxTemplate")
pinCritBox:SetSize(40, 22)
pinCritBox:SetPoint("LEFT", pinCritLabel, "RIGHT", 8, 0)
pinCritBox:SetAutoFocus(false)
pinCritBox:SetNumeric(true)

local pinNoteLabel = PanelTools:CreateFontString(nil, "ARTWORK", "GameFontNormal")
pinNoteLabel:SetPoint("LEFT", pinCritBox, "RIGHT", 12, 0)
pinNoteLabel:SetText("Nota:")

local pinNoteBox = CreateFrame("EditBox", nil, PanelTools, "InputBoxTemplate")
pinNoteBox:SetSize(200, 22)
pinNoteBox:SetPoint("LEFT", pinNoteLabel, "RIGHT", 8, 0)
pinNoteBox:SetAutoFocus(false)

local addPinBtn = MakeButton(PanelTools, 190, 26, "Añadir pin en mi posición",
    "TOPLEFT", PanelTools, "TOPLEFT", 20, -108)
addPinBtn:SetScript("OnClick", function()
    local mapID, x, y = LE.Map:GetPlayerPosition()
    local ok, err = LE.Map:AddPin(mapID, x, y, {
        ach  = pinAchBox:GetNumber() > 0 and pinAchBox:GetNumber() or nil,
        crit = pinCritBox:GetNumber() > 0 and pinCritBox:GetNumber() or nil,
        note = pinNoteBox:GetText(),
        icon = pinAchBox:GetNumber() > 0 and "missing" or "treasure",
    })
    if ok then
        LE:Print(sformat("Pin añadido en %.1f, %.1f.", x * 100, y * 100))
        pinNoteBox:SetText("")
        UI:UpdateStatus()
    else
        LE:Error(err)
    end
end)

local exportPinsBtn = MakeButton(PanelTools, 190, 26, "Exportar pines (JSON)",
    "LEFT", addPinBtn, "RIGHT", 10, 0)
exportPinsBtn:SetScript("OnClick", function()
    UI:Show(LE.Map:ExportJSON(), true)
end)

local mapInfoBtn = MakeButton(PanelTools, 190, 26, ICON.gear .. " Info Mapa (Debug)",
    "LEFT", exportPinsBtn, "RIGHT", 10, 0)
mapInfoBtn:SetScript("OnClick", function()
    UI:Show(LE.Map:GetDebugInfo(), false)
end)

local pinHelp = PanelTools:CreateFontString(nil, "OVERLAY", "GameFontDisableSmall")
pinHelp:SetPoint("TOPLEFT", PanelTools, "TOPLEFT", 20, -140)
pinHelp:SetJustifyH("LEFT")
pinHelp:SetText("Colócate donde quieras marcar y pulsa el botón. Si pones un ID de logro, el pin\n" ..
                "se oculta solo al completarlo. Clic derecho sobre un pin del mapa para borrarlo.")

-- Herramientas varias
local toolsHeader = PanelTools:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
toolsHeader:SetPoint("TOPLEFT", PanelTools, "TOPLEFT", 15, -180)
toolsHeader:SetText("Herramientas")

local bikiniBtn = RegisterWorkButton(MakeButton(PanelTools, 190, 26,
    ICON.shirt .. " Exportar Bikini Plate", "TOPLEFT", PanelTools, "TOPLEFT", 20, -208))
bikiniBtn:SetScript("OnClick", function()
    UI:SetStatusText("Consultando la colección de transfiguración...\n(forzando la caché de objetos, 1,5 s)")
    LE.Character:PrimeBikiniCache()
    C_Timer.After(1.5, function()
        local data = { bikiniTracker = LE.Character:GetBikiniPlates() }
        UI:Show(LE:ToJSON(data, true), true)
        LE:Print("Datos de Bikini Plate listos para copiar.")
    end)
end)

local progressBtn = MakeButton(PanelTools, 190, 26, ICON.chart .. " Mostrar Progreso (Chat)",
    "LEFT", bikiniBtn, "RIGHT", 10, 0)
progressBtn:SetScript("OnClick", function() LE.Commands:ShowProgress() end)

local helpBtn = MakeButton(PanelTools, 190, 26, "Ayuda y comandos",
    "LEFT", progressBtn, "RIGHT", 10, 0)
helpBtn:SetScript("OnClick", function() UI:Show(LE.Commands:GetHelpText(), false) end)

-- Buscador de logros
local searchLabel = PanelTools:CreateFontString(nil, "ARTWORK", "GameFontNormal")
searchLabel:SetPoint("TOPLEFT", PanelTools, "TOPLEFT", 20, -248)
searchLabel:SetText(ICON.search .. " Buscador de Logros:")

local searchBox = CreateFrame("EditBox", "LoboExporterSearchEditBox", PanelTools, "InputBoxTemplate")
searchBox:SetSize(240, 24)
searchBox:SetPoint("LEFT", searchLabel, "RIGHT", 10, 0)
searchBox:SetAutoFocus(false)

local function RunSearch()
    local query = searchBox:GetText()
    searchBox:ClearFocus()
    if not query or query == "" then
        UI:SetStatusText("Escribe algo en el buscador.")
        return
    end

    UI:SetBusy(true, "Buscando...")
    UI:SetStatusText("Buscando logros que contengan: '" .. query .. "'")

    LE:RunTask(
        function(task) return LE.Character:ScanAchievements(task, "all", query) end,
        function(results)
            UI:SetBusy(false)
            results = results or {}
            local db = LE:GetDB()
            if db.formatJSON then
                UI:Show(LE:ToJSON({
                    searchQuery = query,
                    count = #results,
                    results = (#results > 0) and results or LE.EMPTY_ARRAY,
                }, true), true)
            else
                local L = { sformat("=== RESULTADOS: '%s' ===", query) }
                for _, a in ipairs(results) do
                    L[#L + 1] = sformat("[%s] %s (ID: %d - %d pts)",
                        a.completed and "X" or " ", a.name, a.id, a.points)
                end
                L[#L + 1] = sformat("\nTotal encontrados: %d logros.", #results)
                UI:Show(table.concat(L, "\n"), true)
            end
        end,
        function(done, total) UI:OnProgress(done, total) end,
        function(err)
            UI:SetBusy(false)
            UI:SetStatusText("Búsqueda interrumpida: " .. tostring(err))
        end)
end

searchBox:SetScript("OnEnterPressed", RunSearch)

local searchBtn = RegisterWorkButton(MakeButton(PanelTools, 80, 24, "Buscar",
    "LEFT", searchBox, "RIGHT", 10, 0))
searchBtn:SetScript("OnClick", RunSearch)

local clearBtn = MakeButton(PanelTools, 80, 24, "Limpiar", "LEFT", searchBtn, "RIGHT", 8, 0)
clearBtn:SetScript("OnClick", function()
    searchBox:SetText("")
    UI:SetStatusText("")
    editBox:ClearFocus()
end)

--=============================================================================
-- SINCRONIZACIÓN AL ABRIR
--=============================================================================

function UI:SyncWidgets()
    local db = LE:GetDB()
    for _, cb in ipairs(checkboxes) do
        cb:SetChecked(db[cb.dbKey] and true or false)
    end
    cbNoPaging:SetChecked(db.disablePagination and true or false)
    UpdateFormatBtn()
    self:UpdateStatus()
end

frame:SetScript("OnShow", function()
    UI:SyncWidgets()
    SelectTab(activeTab)
end)

function UI:Toggle()
    if frame:IsShown() then frame:Hide() else frame:Show() end
end

function UI:Open(tabId)
    if not frame:IsShown() then frame:Show() end
    if tabId then SelectTab(tabId) end
end
