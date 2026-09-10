-- FIX Legion 7.3.5: reimplementacion completa del panel de opciones.
--
-- El panel original (DFSettingsCategoryListMixin = la lista de categorias de la izquierda,
-- DFSettingsListMixin = la lista de opciones de la derecha) depende enteramente del framework
-- moderno de Blizzard que no existe en este cliente: TreeDataProvider real, WowScrollBoxList
-- virtualizado, ScrollUtil, SelectionBehavior, el Menu API (rootDescription:CreateRadio, etc.),
-- Settings.InitTooltip/SettingsTooltip, atlases de Dragonflight (Options_InnerFrame,
-- Options_CategoryHeader_1, Options_List_Active...) y TextureKitConstants. En _LegionShim.lua
-- se les puso stubs no-operativos solo para que CreateFrame() no reventara al montar el panel -
-- por eso el panel se abria pero se quedaba vacio (sin categorias, sin opciones).
--
-- Este archivo SUSTITUYE por completo el metodo de renderizado de esas dos listas, usando
-- unicamente widgets clasicos que existen de forma estable en Legion 7.3.5 (CheckButton con
-- UICheckButtonTemplate, Slider con OptionsSliderTemplate, EditBox con InputBoxTemplate,
-- Button con UIPanelButtonTemplate, UIDropDownMenuTemplate + UIDropDownMenu_*, ColorPickerFrame
-- clasico, ScrollFrame con UIPanelScrollFrameTemplate) en vez de depender del framework roto.
--
-- El CONTRATO PUBLICO de ambos mixins (los metodos que Config.mixin.lua/Config.lua llaman
-- desde fuera: OnLoad, Display, FlushDisplay, CallRefresh, RegisterCategory, RegisterElement,
-- UpdateElementData, EnableElement, el campo .selectedElement, y el evento
-- "DFSettingsCategoryListMixin.Event.OnSelectionChanged" via EventRegistry) se mantiene
-- identico para no tener que tocar Config.mixin.lua/Config.lua ni el resto del addon.
--
-- Debe cargarse DESPUES de Mixin\DFSettingsCategory.mixin.lua y Mixin\DFSettingsList.mixin.lua
-- en el .toc (esos archivos hacen "DFSettingsCategoryListMixin = CreateFromMixins(...)" y
-- "DFSettingsListMixin = CreateFromMixins(...)", lo que CREA una tabla nueva - si este archivo
-- cargara antes, esas lineas destruirian nuestras funciones al re-crear la tabla).

local DF = LibStub('AceAddon-3.0'):GetAddon('DragonflightUI')

-- Paso 2 (repaso de estetica): en vez de colores planos inventados, se reutiliza el mismo
-- textil que ya trae el addon para separadores (Editmode/ui-friendsframe-onlinedivider, la
-- misma textura que usaba el DFSettingsListDivider original en XML\DFSettingsList.xml) y una
-- paleta dorado/gris que imita los colores por defecto de las fuentes de Blizzard que ya usa
-- el resto del addon (GameFontNormal = dorado, GameFontHighlight = blanco resaltado,
-- GameFontDisable = gris apagado), en vez de inventar colores sueltos.
local DIVIDER_TEXTURE = 'Interface/AddOns/DragonflightUI/Textures/Editmode/ui-friendsframe-onlinedivider'
local COLOR_GOLD_SELECTED = {1, 0.82, 0, 0.18}
local COLOR_HOVER = {1, 1, 1, 0.08}

local function ApplyDividerTexture(tex)
    tex:SetTexture(DIVIDER_TEXTURE)
    tex:SetTexCoord(0, 1, 0, 1)
    tex:SetVertexColor(1, 1, 1, 1)
end

local function HexToRGB(hex)
    hex = hex or 'ffffff'
    hex = tostring(hex):gsub('^#', '')
    local r = tonumber(hex:sub(1, 2), 16) or 255
    local g = tonumber(hex:sub(3, 4), 16) or 255
    local b = tonumber(hex:sub(5, 6), 16) or 255
    return r / 255, g / 255, b / 255
end

local function RGBToHex(r, g, b)
    return string.format('%02x%02x%02x', math.floor((r or 1) * 255 + 0.5), math.floor((g or 1) * 255 + 0.5),
                          math.floor((b or 1) * 255 + 0.5))
end

-- ============================================================================
-- Lista de categorias (sidebar izquierdo)
-- ============================================================================

DFSettingsCategoryListMixin = DFSettingsCategoryListMixin or {}

local CAT_ROW_HEIGHT = 20
local CAT_HEADER_HEIGHT = 26
local CAT_ROW_SPACING = 2

function DFSettingsCategoryListMixin:OnLoad()
    self.categories = {}
    self.categoryByID = {}
    self.elementByKey = {}
    self.selectedElement = self.selectedElement or '_'
    self.rows = {}

    local scroll = CreateFrame('ScrollFrame', nil, self, 'UIPanelScrollFrameTemplate')
    scroll:SetPoint('TOPLEFT', self, 'TOPLEFT', 0, 0)
    scroll:SetPoint('BOTTOMRIGHT', self, 'BOTTOMRIGHT', -22, 0)
    self.RealScrollFrame = scroll

    local content = CreateFrame('Frame', nil, scroll)
    content:SetSize(1, 1)
    scroll:SetScrollChild(content)
    self.RealScrollChild = content

    scroll:SetScript('OnSizeChanged', function(_, w)
        if w and w > 0 then content:SetWidth(w) end
    end)

    -- Paso 2 (estetica): un fondo oscuro sutil para agrupar visualmente el sidebar de
    -- categorias (antes quedaba completamente transparente, flotando sobre el fondo general
    -- del panel) y una linea dorada fina a la derecha separandolo del contenido, imitando la
    -- separacion entre sidebar/contenido que tiene el DragonflightUI original.
    if not self.Background then
        local bg = self:CreateTexture(nil, 'BACKGROUND', nil, -8)
        bg:SetPoint('TOPLEFT', self, 'TOPLEFT', -4, 2)
        bg:SetPoint('BOTTOMRIGHT', self, 'BOTTOMRIGHT', 2, 0)
        bg:SetColorTexture(0, 0, 0, 0.18)
        self.Background = bg
    end

    if not self.Divider then
        local divider = self:CreateTexture(nil, 'ARTWORK')
        divider:SetWidth(1)
        divider:SetPoint('TOPRIGHT', self, 'TOPRIGHT', 2, 0)
        divider:SetPoint('BOTTOMRIGHT', self, 'BOTTOMRIGHT', 2, 0)
        divider:SetColorTexture(1, 0.82, 0, 0.25)
        self.Divider = divider
    end
end

function DFSettingsCategoryListMixin:AcquireRow(index)
    local row = self.rows[index]
    if row then
        row:Show()
        return row
    end

    row = CreateFrame('Button', nil, self.RealScrollChild)
    row:SetHeight(CAT_ROW_HEIGHT)

    local label = row:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
    label:SetPoint('LEFT', row, 'LEFT', 4, 0)
    label:SetPoint('RIGHT', row, 'RIGHT', -4, 0)
    label:SetJustifyH('LEFT')
    label:SetWordWrap(false)
    row.Label = label

    local hl = row:CreateTexture(nil, 'BACKGROUND')
    hl:SetPoint('TOPLEFT', row, 'TOPLEFT', -2, 0)
    hl:SetPoint('BOTTOMRIGHT', row, 'BOTTOMRIGHT', -2, 0)
    hl:SetColorTexture(unpack(COLOR_HOVER))
    hl:Hide()
    row.Highlight = hl

    self.rows[index] = row
    return row
end

function DFSettingsCategoryListMixin:Refresh()
    if not self.RealScrollChild then return end

    for _, row in ipairs(self.rows) do row:Hide() end

    local sortedCats = {}
    for _, cat in pairs(self.categoryByID) do table.insert(sortedCats, cat) end
    table.sort(sortedCats, function(a, b) return (a.order or 666) < (b.order or 666) end)

    local rowIndex = 0
    local y = 0

    for _, cat in ipairs(sortedCats) do
        rowIndex = rowIndex + 1
        local headerRow = self:AcquireRow(rowIndex)
        headerRow:ClearAllPoints()
        headerRow:SetHeight(CAT_HEADER_HEIGHT)
        headerRow:SetPoint('TOPLEFT', self.RealScrollChild, 'TOPLEFT', 0, -y)
        headerRow:SetPoint('TOPRIGHT', self.RealScrollChild, 'TOPRIGHT', 0, -y)
        headerRow.Label:SetFontObject('GameFontHighlightMedium')
        headerRow.Label:SetText((cat.collapsed and '+ ' or '- ') .. (cat.name or cat.id))
        headerRow.Highlight:Hide()
        headerRow:SetScript('OnClick', function()
            cat.collapsed = not cat.collapsed
            self:Refresh()
        end)
        headerRow:SetScript('OnEnter', nil)
        headerRow:SetScript('OnLeave', nil)
        headerRow:Show()
        y = y + CAT_HEADER_HEIGHT + CAT_ROW_SPACING

        if not cat.collapsed then
            local sortedElems = {}
            for _, el in ipairs(cat.elements) do table.insert(sortedElems, el) end

            local comparator = cat.elementSort
            local sorted = false
            if comparator then
                sorted = pcall(table.sort, sortedElems, function(a, b)
                    return comparator({data = {order = a.order, elementInfo = {name = a.name}}},
                                       {data = {order = b.order, elementInfo = {name = b.name}}})
                end)
            end
            if not sorted then
                table.sort(sortedElems, function(a, b) return (a.order or 99999) < (b.order or 99999) end)
            end

            for _, el in ipairs(sortedElems) do
                rowIndex = rowIndex + 1
                local row = self:AcquireRow(rowIndex)
                row:ClearAllPoints()
                row:SetHeight(CAT_ROW_HEIGHT)
                row:SetPoint('TOPLEFT', self.RealScrollChild, 'TOPLEFT', 14, -y)
                row:SetPoint('TOPRIGHT', self.RealScrollChild, 'TOPRIGHT', 0, -y)

                local isSelected = (self.selectedElement == el.key)
                row.isSelected = isSelected

                -- Paso 2 (estetica): jerarquia de 3 estados igual que el resto del addon -
                -- seleccionado = texto blanco resaltado + barra dorada fija; habilitado sin
                -- seleccionar = texto dorado normal; deshabilitado = gris atenuado.
                if isSelected then
                    row.Label:SetFontObject('GameFontHighlight')
                    row.Label:SetAlpha(1)
                elseif el.isEnabled then
                    row.Label:SetFontObject('GameFontNormal')
                    row.Label:SetAlpha(1)
                else
                    row.Label:SetFontObject('GameFontDisable')
                    row.Label:SetAlpha(0.6)
                end
                row.Label:SetText(el.name or el.id)

                if isSelected then
                    row.Highlight:SetColorTexture(unpack(COLOR_GOLD_SELECTED))
                    row.Highlight:Show()
                else
                    row.Highlight:Hide()
                end

                row:SetScript('OnClick', function()
                    if not el.isEnabled then return end
                    self.selectedElement = el.key
                    self:Refresh()
                    if EventRegistry then
                        EventRegistry:TriggerEvent('DFSettingsCategoryListMixin.Event.OnSelectionChanged', el.key, self)
                    end
                    if PlaySound and SOUNDKIT and SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON then
                        PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
                    end
                end)
                row:SetScript('OnEnter', function()
                    if not row.isSelected then
                        row.Highlight:SetColorTexture(unpack(COLOR_HOVER))
                        row.Highlight:Show()
                    end
                end)
                row:SetScript('OnLeave', function()
                    if row.isSelected then
                        row.Highlight:SetColorTexture(unpack(COLOR_GOLD_SELECTED))
                        row.Highlight:Show()
                    else
                        row.Highlight:Hide()
                    end
                end)
                row:Show()

                y = y + CAT_ROW_HEIGHT + CAT_ROW_SPACING
            end
        end
    end

    self.RealScrollChild:SetHeight(math.max(y, 1))
end

function DFSettingsCategoryListMixin:RegisterCategory(id, info, sortComparator, isDragonflight)
    local cat = self.categoryByID[id]
    if not cat then
        cat = {id = id, elements = {}}
        self.categoryByID[id] = cat
        table.insert(self.categories, cat)
    end
    cat.name = info.name
    cat.order = info.order or 666
    cat.elementSort = sortComparator
    self:Refresh()
end

function DFSettingsCategoryListMixin:RegisterElement(id, categoryID, info)
    local key = categoryID .. '_' .. id
    local cat = self.categoryByID[categoryID]
    local el = self.elementByKey[key]
    if not el then
        el = {id = id, categoryID = categoryID, key = key}
        self.elementByKey[key] = el
        if cat then table.insert(cat.elements, el) end
    end
    el.name = info.name
    el.isEnabled = info.isEnabled
    el.order = info.order or 99999
    self:Refresh()
end

function DFSettingsCategoryListMixin:UpdateElementData(id, categoryID, info)
    self:RegisterElement(id, categoryID, info)
end

function DFSettingsCategoryListMixin:EnableElement(id, categoryID)
    local key = categoryID .. '_' .. id
    local el = self.elementByKey[key]
    if el then
        el.isEnabled = true
        self:Refresh()
    end
end

function DFSettingsCategoryListMixin:FindElementDataByPredicate(predicate)
    -- FIX Legion 7.3.5: ya no se usa un TreeDataProvider real; nadie fuera de este archivo
    -- llama a esto (verificado), se deja como no-op seguro por si acaso.
    return nil
end

function DFSettingsCategoryListMixin:FindElementDataByKey(key)
    return self.elementByKey[key]
end

function DFSettingsCategoryListMixin:SelectElement(id, scrollToElement)
    -- FIX Legion 7.3.5: no usado externamente en este addon; se deja como no-op seguro.
end

-- ============================================================================
-- Lista de opciones (panel derecho)
-- ============================================================================

DFSettingsListMixin = DFSettingsListMixin or {}

local ROW_SPACING = 4
local ROW_HEIGHTS = {
    header = 30,
    divider = 10,
    description = 20,
    toggle = 26,
    range = 26,
    execute = 26,
    select = 26,
    editbox = 26,
    color = 26
}

function DFSettingsListMixin:OnLoad()
    local parent = self:GetParent()
    self:SetPoint('TOPLEFT', parent, 'TOPLEFT', 0, 0)
    self:SetPoint('BOTTOMRIGHT', parent, 'BOTTOMRIGHT', 0, 0)
    self:Show()

    self.collapsedGroups = {}
    self.rows = {}
    self.ddCounter = 0

    -- Paso 2 (estetica): self.Header.HorizontalDivider (definido en XML\DFSettingsList.xml)
    -- usa atlas="Options_HorizontalDivider", un atlas de Dragonflight que no existe en este
    -- cliente - el mismo tipo de atlas que causaba el cuadrado verde del fondo del panel
    -- (ver Config.mixin.lua:OnLoad). Se oculta y se sustituye por la misma textura de
    -- separador que ya trae el addon (la que usaba el DFSettingsListDivider original).
    if self.Header and self.Header.HorizontalDivider then
        self.Header.HorizontalDivider:Hide()
        self.Header.HorizontalDivider:SetTexture(nil)
    end
    if self.Header and not self.Header.RealDivider then
        local headerDivider = self.Header:CreateTexture(nil, 'ARTWORK')
        ApplyDividerTexture(headerDivider)
        headerDivider:SetHeight(10)
        headerDivider:SetPoint('TOPLEFT', self.Header, 'TOPLEFT', 4, -50)
        headerDivider:SetPoint('TOPRIGHT', self.Header, 'TOPRIGHT', -4, -50)
        self.Header.RealDivider = headerDivider
    end

    local scroll = CreateFrame('ScrollFrame', nil, self, 'UIPanelScrollFrameTemplate')
    scroll:SetPoint('TOPLEFT', self.Header, 'BOTTOMLEFT', 4, -6)
    scroll:SetPoint('BOTTOMRIGHT', self, 'BOTTOMRIGHT', -28, 6)
    self.RealScrollFrame = scroll

    local content = CreateFrame('Frame', nil, scroll)
    content:SetSize(1, 1)
    scroll:SetScrollChild(content)
    self.RealScrollChild = content

    scroll:SetScript('OnSizeChanged', function(_, w)
        if w and w > 0 then content:SetWidth(w) end
    end)
end

function DFSettingsListMixin:ReleaseRows()
    if not self.rows then return end
    for _, row in ipairs(self.rows) do
        row:Hide()
        row:SetParent(nil)
    end
    for i = #self.rows, 1, -1 do
        self.rows[i] = nil
    end
end

function DFSettingsListMixin:FlushDisplay()
    self.Args_Data = nil
    self:ReleaseRows()
    if self.RealScrollChild then self.RealScrollChild:SetHeight(1) end
end

function DFSettingsListMixin:CallRefresh()
    if self.Args_Data then
        self:Display(self.Args_Data, self.Args_Small)
    end
end

function DFSettingsListMixin:RenderHeaderRow(g, y)
    local row = CreateFrame('Button', nil, self.RealScrollChild)
    row:SetHeight(ROW_HEIGHTS.header)
    row:SetPoint('TOPLEFT', self.RealScrollChild, 'TOPLEFT', 0, -y)
    row:SetPoint('TOPRIGHT', self.RealScrollChild, 'TOPRIGHT', 0, -y)

    local text = row:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightLarge')
    text:SetPoint('LEFT', row, 'LEFT', 4, -4)
    text:SetText((self.collapsedGroups[g.key] and '+ ' or '- ') .. (g.name or g.key))

    local line = row:CreateTexture(nil, 'ARTWORK')
    ApplyDividerTexture(line)
    line:SetHeight(8)
    line:SetPoint('BOTTOMLEFT', row, 'BOTTOMLEFT', 0, 0)
    line:SetPoint('BOTTOMRIGHT', row, 'BOTTOMRIGHT', 0, 0)

    row:SetScript('OnClick', function()
        self.collapsedGroups[g.key] = not self.collapsedGroups[g.key]
        self:CallRefresh()
    end)
    row:Show()

    table.insert(self.rows, row)
    return y + ROW_HEIGHTS.header + ROW_SPACING
end

function DFSettingsListMixin:RenderRow(elementData, indent, y)
    local args = elementData.args
    local elementType = args.type
    local height = ROW_HEIGHTS[elementType] or 26

    local row = CreateFrame('Frame', nil, self.RealScrollChild)
    row:SetPoint('TOPLEFT', self.RealScrollChild, 'TOPLEFT', indent, -y)
    row:SetPoint('TOPRIGHT', self.RealScrollChild, 'TOPRIGHT', 0, -y)
    row:SetHeight(height)
    table.insert(self.rows, row)
    row:Show()

    if elementType == 'divider' then
        local line = row:CreateTexture(nil, 'ARTWORK')
        ApplyDividerTexture(line)
        line:SetPoint('LEFT', row, 'LEFT', 0, 0)
        line:SetPoint('RIGHT', row, 'RIGHT', 0, 0)
        line:SetHeight(8)
        return y + height + ROW_SPACING
    end

    -- Paso 2 (estetica): resaltado sutil al pasar el raton por encima, igual que
    -- DFHoverBackgroundTemplate en el XML original (una textura blanca casi transparente
    -- que se extiende un poco mas alla de los bordes de la fila). Se aplica a todas las
    -- filas menos los dividers (arriba, ya se ha salido con return).
    row:EnableMouse(true)
    local rowHighlight = row:CreateTexture(nil, 'BACKGROUND')
    rowHighlight:SetPoint('TOPLEFT', row, 'TOPLEFT', -6, 1)
    rowHighlight:SetPoint('BOTTOMRIGHT', row, 'BOTTOMRIGHT', 6, -1)
    rowHighlight:SetColorTexture(1, 1, 1, 0.05)
    rowHighlight:Hide()
    row:SetScript('OnEnter', function() rowHighlight:Show() end)
    row:SetScript('OnLeave', function() rowHighlight:Hide() end)

    if elementType == 'description' then
        local text = row:CreateFontString(nil, 'ARTWORK', 'GameFontHighlightSmall')
        text:SetPoint('TOPLEFT', row, 'TOPLEFT', 4, 0)
        text:SetPoint('TOPRIGHT', row, 'TOPRIGHT', -4, 0)
        text:SetJustifyH('LEFT')
        text:SetWordWrap(true)
        text:SetText(args.name or '')
        local h = (text:GetStringHeight() or 20) + 6
        row:SetHeight(h)
        return y + h + ROW_SPACING
    end

    local label = row:CreateFontString(nil, 'ARTWORK', 'GameFontNormal')
    label:SetPoint('LEFT', row, 'LEFT', 4, 0)
    label:SetWidth(elementData.small and 130 or 200)
    label:SetJustifyH('LEFT')
    label:SetWordWrap(false)
    label:SetText(args.name or '')

    if args.desc and args.desc ~= '' then
        row:SetScript('OnEnter', function()
            rowHighlight:Show()
            GameTooltip:SetOwner(row, 'ANCHOR_RIGHT')
            GameTooltip:SetText(args.name or '', 1, 1, 1)
            GameTooltip:AddLine(args.desc, nil, nil, nil, true)
            GameTooltip:Show()
        end)
        row:SetScript('OnLeave', function()
            rowHighlight:Hide()
            GameTooltip:Hide()
        end)
    end

    local function safeGet()
        if not elementData.get then return nil end
        local ok, value = pcall(elementData.get, {elementData.key})
        if ok then return value end
        return nil
    end
    local function safeSet(value)
        if not elementData.set then return end
        pcall(elementData.set, {elementData.key}, value)
    end

    if elementType == 'toggle' then
        local cb = CreateFrame('CheckButton', nil, row, 'UICheckButtonTemplate')
        cb:SetSize(24, 24)
        cb:SetPoint('LEFT', label, 'RIGHT', 4, 0)
        cb:SetChecked(safeGet() and true or false)
        cb:SetScript('OnClick', function(button)
            safeSet(button:GetChecked() and true or false)
        end)

    elseif elementType == 'range' then
        local slider = CreateFrame('Slider', nil, row, 'OptionsSliderTemplate')
        slider:SetPoint('LEFT', label, 'RIGHT', 10, 0)
        slider:SetWidth(140)
        slider:SetHeight(16)
        slider:SetOrientation('HORIZONTAL')
        slider:SetMinMaxValues(args.min or 0, args.max or 100)
        slider:SetValueStep(args.bigStep or args.step or 1)
        if slider.Text then slider.Text:SetText('') end
        if slider.Low then slider.Low:SetText(tostring(args.min or 0)) end
        if slider.High then slider.High:SetText(tostring(args.max or 100)) end

        local editbox = CreateFrame('EditBox', nil, row, 'InputBoxTemplate')
        editbox:SetSize(46, 18)
        editbox:SetPoint('LEFT', slider, 'RIGHT', 14, 0)
        editbox:SetAutoFocus(false)
        editbox:SetJustifyH('CENTER')

        local currentValue = safeGet()
        if type(currentValue) ~= 'number' then currentValue = args.min or 0 end
        slider:SetValue(currentValue)
        editbox:SetText(tostring(currentValue))

        slider:SetScript('OnValueChanged', function(_, value)
            editbox:SetText(tostring(value))
            safeSet(value)
        end)
        editbox:SetScript('OnEnterPressed', function(box)
            local n = tonumber(box:GetText())
            if n then slider:SetValue(n) end
            box:ClearFocus()
        end)
        editbox:SetScript('OnEscapePressed', function(box) box:ClearFocus() end)

    elseif elementType == 'execute' then
        local btn = CreateFrame('Button', nil, row, 'UIPanelButtonTemplate')
        btn:SetSize(elementData.small and 140 or 180, 22)
        btn:SetPoint('LEFT', label, 'RIGHT', 10, 0)
        btn:SetText(args.btnName or args.name or '')
        btn:SetScript('OnClick', function()
            if args.func then pcall(args.func) end
        end)

    elseif elementType == 'select' then
        self.ddCounter = self.ddCounter + 1
        local dd = CreateFrame('Frame', 'DragonflightUISettingsDropdown' .. self.ddCounter, row, 'UIDropDownMenuTemplate')
        dd:SetPoint('LEFT', label, 'RIGHT', -14, -2)
        UIDropDownMenu_SetWidth(dd, elementData.small and 110 or 140)

        local optionList = {}
        if type(args.dropdownValues) == 'table' then
            for _, entry in ipairs(args.dropdownValues) do
                table.insert(optionList, {value = entry.value, text = entry.text or tostring(entry.value)})
            end
        elseif type(args.values) == 'table' then
            for value, text in pairs(args.values) do
                table.insert(optionList, {value = value, text = tostring(text)})
            end
            table.sort(optionList, function(a, b) return tostring(a.text) < tostring(b.text) end)
        end

        local function refreshDropdownText()
            local current = safeGet()
            local displayText = tostring(current)
            for _, opt in ipairs(optionList) do
                if opt.value == current then
                    displayText = opt.text
                    break
                end
            end
            UIDropDownMenu_SetText(dd, displayText)
        end

        if #optionList > 0 then
            UIDropDownMenu_Initialize(dd, function(_, level)
                for _, opt in ipairs(optionList) do
                    local info = UIDropDownMenu_CreateInfo()
                    info.text = opt.text
                    info.value = opt.value
                    info.checked = (safeGet() == opt.value)
                    info.func = function()
                        safeSet(opt.value)
                        refreshDropdownText()
                    end
                    UIDropDownMenu_AddButton(info, level)
                end
            end)
            refreshDropdownText()
        else
            -- args.dropdownValuesFunc: generador con la API de Menu moderna (rootDescription),
            -- no soportado en este renderizador clasico - se muestra deshabilitado en vez de crashear.
            UIDropDownMenu_Initialize(dd, function() end)
            UIDropDownMenu_SetText(dd, '(no soportado)')
            if UIDropDownMenu_DisableDropDown then UIDropDownMenu_DisableDropDown(dd) end
        end

    elseif elementType == 'editbox' then
        local editbox = CreateFrame('EditBox', nil, row, 'InputBoxTemplate')
        editbox:SetSize(elementData.small and 150 or 180, 20)
        editbox:SetPoint('LEFT', label, 'RIGHT', 8, 0)
        editbox:SetAutoFocus(false)
        editbox:SetJustifyH('CENTER')
        editbox:SetText(tostring(safeGet() or ''))
        editbox:SetScript('OnEscapePressed', function(box) box:ClearFocus() end)
        editbox:SetScript('OnEnterPressed', function(box)
            box:ClearFocus()
            local text = box:GetText()
            if args.Validate then
                local ok, valid, reset = pcall(args.Validate, text)
                if ok and (text == '' or valid) then
                    safeSet(text)
                elseif ok and reset then
                    box:SetText(tostring(safeGet() or ''))
                end
            else
                safeSet(text)
            end
        end)

    elseif elementType == 'color' then
        local swatch = CreateFrame('Button', nil, row)
        swatch:SetSize(24, 24)
        swatch:SetPoint('LEFT', label, 'RIGHT', 10, 0)
        local tex = swatch:CreateTexture(nil, 'OVERLAY')
        tex:SetAllPoints()
        tex:SetColorTexture(1, 1, 1, 1)

        local function applyColor()
            local r, g, b = HexToRGB(safeGet())
            tex:SetVertexColor(r, g, b, 1)
        end
        applyColor()

        swatch:SetScript('OnClick', function()
            local startR, startG, startB = HexToRGB(safeGet())

            ColorPickerFrame.hasOpacity = false
            ColorPickerFrame.previousValues = {r = startR, g = startG, b = startB}
            ColorPickerFrame.func = function()
                local r, g, b = ColorPickerFrame:GetColorRGB()
                safeSet(RGBToHex(r, g, b))
                applyColor()
            end
            ColorPickerFrame.cancelFunc = function(previousValues)
                previousValues = previousValues or {r = startR, g = startG, b = startB}
                safeSet(RGBToHex(previousValues.r, previousValues.g, previousValues.b))
                applyColor()
            end
            ColorPickerFrame:SetColorRGB(startR, startG, startB)
            if ShowUIPanel then
                ShowUIPanel(ColorPickerFrame)
            else
                ColorPickerFrame:Show()
            end
        end)
    end

    return y + height + ROW_SPACING
end

function DFSettingsListMixin:Display(data, small)
    if not data then return end

    self.Args_Data = data
    self.Args_Small = small

    if self.Header and self.Header.Title then
        self.Header.Title:SetText(data.name)
    end

    if self.Header and self.Header.DefaultsButton then
        if data.default then
            self.Header.DefaultsButton:Show()
            self.Header.DefaultsButton:SetText(SETTINGS_DEFAULTS or 'Defaults')
            self.Header.DefaultsButton:SetScript('OnClick', function()
                local ok = pcall(data.default)
                self:CallRefresh()
            end)
        else
            self.Header.DefaultsButton:Hide()
            self.Header.DefaultsButton:SetScript('OnClick', nil)
        end
    end

    -- FIX Legion 7.3.5: el boton "visible en modo edicion" (Header.EditModeButton) depende del
    -- mismo framework de tooltip moderno que el resto - se deja oculto en vez de arriesgar un
    -- crash con una API que no existe en este cliente.
    if self.Header and self.Header.EditModeButton then
        self.Header.EditModeButton:Hide()
    end

    self:ReleaseRows()

    if not data.options or not data.options.args then
        if self.RealScrollChild then self.RealScrollChild:SetHeight(1) end
        return
    end

    local getFunc, setFunc
    local sub = data.sub
    if sub then
        getFunc = function(info)
            local ok, value = pcall(data.options.get, {sub, info[1]})
            if ok then return value end
        end
        setFunc = function(info, value)
            pcall(data.options.set, {sub, info[1]}, value)
        end
    else
        getFunc = data.options.get
        setFunc = data.options.set
    end

    local groups = {}
    local groupList = {}
    local noGroupItems = {}

    for k, v in pairs(data.options.args) do
        if v.type == 'header' then
            local g = {key = k, order = v.order or 9999, name = v.name or '', args = v, children = {}}
            groups[k] = g
            table.insert(groupList, g)
        end
    end

    for k, v in pairs(data.options.args) do
        if v.type ~= 'header' then
            local elementData = {
                key = k,
                order = v.order or 9999,
                name = v.name or '',
                args = v,
                get = getFunc,
                set = setFunc,
                small = small
            }
            local group = v.group
            if group and groups[group] then
                table.insert(groups[group].children, elementData)
            else
                table.insert(noGroupItems, elementData)
            end
        end
    end

    table.sort(groupList, function(a, b) return a.order < b.order end)
    table.sort(noGroupItems, function(a, b) return a.order < b.order end)
    for _, g in ipairs(groupList) do
        table.sort(g.children, function(a, b) return a.order < b.order end)
    end

    local y = 0

    for _, item in ipairs(noGroupItems) do
        y = self:RenderRow(item, 0, y)
    end

    for _, g in ipairs(groupList) do
        y = self:RenderHeaderRow(g, y)
        if not self.collapsedGroups[g.key] then
            for _, item in ipairs(g.children) do
                y = self:RenderRow(item, 14, y)
            end
        end
    end

    if self.RealScrollChild then
        self.RealScrollChild:SetHeight(math.max(y, 1))
    end
end
