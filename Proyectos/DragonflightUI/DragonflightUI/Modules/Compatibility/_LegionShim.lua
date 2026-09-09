-- _LegionShim.lua
-- Capa de compatibilidad para poder cargar DragonflightUI en clientes Legion 7.3.5 (build 26972).
-- DragonflightUI está escrito contra APIs modernas (Cata Classic/Retail reciente) que en Legion
-- todavía no existen bajo su nombre "C_*" y siguen siendo funciones globales sueltas.
-- Este archivo se carga ANTES que el resto del addon (ver el .toc) y crea esos namespaces
-- "C_*" como wrappers sobre las funciones globales viejas, solo si no existen ya.
-- Esto NO garantiza que todo funcione: cubre el patrón de error más común (API con nombre
-- moderno que no existe todavía en 7.3.5), pero sistemas que no existen conceptualmente en
-- Legion (Edit Mode, C_Spell/C_Item con formas de retorno más nuevas, etc.) pueden seguir
-- fallando y habrá que ir parcheándolos según los errores que salten en el juego.

local function ensureTable(name)
    if type(_G[name]) ~= 'table' then
        _G[name] = {}
    end
    return _G[name]
end

-- ### ExtractColorValueFromHex (utilidad de ColorUtil de Blizzard, no existe en Legion) ###
if type(ExtractColorValueFromHex) ~= 'function' then
    function ExtractColorValueFromHex(hexColor, startIndex)
        return tonumber(hexColor:sub(startIndex, startIndex + 1), 16) / 255
    end
end

-- ### GenerateClosure / CreateAnchor (utilidades de Blizzard mas modernas que no existen
-- en Legion, usadas por muchos mixins de estilo retail de este addon) ###
if type(GenerateClosure) ~= 'function' then
    function GenerateClosure(method, ...)
        local args = {...}
        local argsCount = select('#', ...)
        return function(...)
            return method(unpack(args, 1, argsCount), ...)
        end
    end
end

if type(CreateAnchor) ~= 'function' then
    function CreateAnchor(point, relativeTo, relativePoint, offsetX, offsetY)
        return {
            point = point,
            relativeTo = relativeTo,
            relativePoint = relativePoint or point,
            offsetX = offsetX or 0,
            offsetY = offsetY or 0,
            GetPoint = function(self)
                return self.point, self.relativeTo, self.relativePoint, self.offsetX, self.offsetY
            end
        }
    end
end

-- ### C_CVar (no existe en Legion; SetCVar/GetCVar eran globales) ###
if type(C_CVar) ~= 'table' then
    local C_CVar = ensureTable('C_CVar')
    C_CVar.SetCVar = SetCVar
    C_CVar.GetCVar = GetCVar
    C_CVar.GetCVarBool = GetCVarBool
    C_CVar.GetCVarDefault = GetCVarDefault
    C_CVar.ResetTestCVars = function() end
    C_CVar.RegisterCVar = function() end
end

-- ### ButtonStateBehaviorMixin (llego en Shadowlands 9.0, no existe en Legion) ###
-- Usado por DFConfigCategoryList.mixin.lua via CreateFromMixins(ButtonStateBehaviorMixin).
-- Implementacion minima: solo trackea over/down y siempre devuelve true (el llamador
-- solo lo usa para decidir si debe refrescar el estado visual del boton).
if type(ButtonStateBehaviorMixin) ~= 'table' then
    local mixin = ensureTable('ButtonStateBehaviorMixin')
    function mixin:OnMouseDown(button)
        self.down = true
        return true
    end
    function mixin:OnMouseUp(button)
        self.down = false
        return true
    end
    function mixin:OnEnter()
        self.over = true
        return true
    end
    function mixin:OnLeave()
        self.over = false
        self.down = false
        return true
    end
end

-- ### CreateTreeDataProvider / SettingsTooltip (sistema de Settings/ScrollBox moderno, no
-- existe en Legion) ### El panel de opciones propio de DragonflightUI (DFSettingsList/
-- DFSettingsCategory) depende de este framework de retail reciente para el arbol con scroll.
-- Portarlo entero es un trabajo aparte; de momento se ponen stubs "no-op" seguros para que
-- CreateFrame() del panel de opciones no reviente el login/reload. El PANEL DE OPCIONES en si
-- puede seguir sin funcionar visualmente hasta que se porte esto de verdad.
-- Un "nodo" stub reusado por Insert()/AddNode(): trae todos los metodos que el codigo del
-- addon suele encadenar sobre lo que le devuelve el data provider (SetSortComparator,
-- GetData, AddNode anidado, etc), todos no-op salvo GetData que devuelve lo insertado.
local function makeStubNode(data)
    local node = {}
    node._data = data or {}
    function node:SetSortComparator() end
    function node:GetData() return node._data end
    function node:AddNode(childData) return makeStubNode(childData) end
    function node:Insert(childData) return makeStubNode(childData) end
    function node:IsCollapsed() return false end
    function node:ToggleCollapsed() end
    function node:SetCollapsed() end
    return node
end

if type(CreateTreeDataProvider) ~= 'function' then
    function CreateTreeDataProvider()
        local provider = {}
        function provider:Insert(data) return makeStubNode(data) end
        function provider:GetRootNode() return makeStubNode() end
        function provider:SetSortComparator() end
        function provider:Enumerate() return function() return nil end end
        function provider:GetSize() return 0 end
        return provider
    end
end

if type(CreateScrollBoxListTreeListView) ~= 'function' then
    function CreateScrollBoxListTreeListView()
        local view = {}
        function view:SetElementFactory() end
        function view:SetElementExtentCalculator() end
        function view:SetPadding() end
        function view:SetDataProvider() end
        function view:GetDataProvider() end
        function view:AddManagedScrollBarVisibilityBehavior() end
        return view
    end
end

-- ### SelectionBehaviorMixin (framework de seleccion de ScrollBox, no existe en Legion) ###
if type(SelectionBehaviorMixin) ~= 'table' then
    local mixin = ensureTable('SelectionBehaviorMixin')
    mixin.Event = {OnSelectionChanged = 'OnSelectionChanged'}
end

if type(ScrollUtil) ~= 'table' then
    local scrollUtil = ensureTable('ScrollUtil')
    function scrollUtil.InitScrollBoxListWithScrollBar() end
    function scrollUtil.RegisterScrollBoxWithScrollBar() end
    function scrollUtil.AddManagedScrollBarVisibilityBehavior() end
    function scrollUtil.AddSelectionBehavior()
        local behavior = {}
        function behavior:RegisterCallback() end
        function behavior:Select() end
        function behavior:SelectElementDataByPredicate() return nil end
        return behavior
    end
end

if type(SettingsTooltip) ~= 'table' then
    local tooltip = ensureTable('SettingsTooltip')
    function tooltip:SetScale() end
    function tooltip:SetOwner() end
    function tooltip:Hide() end
    function tooltip:Show() end
    function tooltip:ClearLines() end
    function tooltip:AddLine() end
end

-- ### C_AddOns (no existe en Legion; todo era global) ###
if type(C_AddOns) ~= 'table' then
    local C_AddOns = ensureTable('C_AddOns')
    C_AddOns.GetAddOnMetadata = GetAddOnMetadata
    C_AddOns.IsAddOnLoaded = IsAddOnLoaded
    C_AddOns.EnableAddOn = EnableAddOn
    C_AddOns.DisableAddOn = DisableAddOn
    C_AddOns.LoadAddOn = LoadAddOn
    C_AddOns.GetAddOnInfo = GetAddOnInfo
    C_AddOns.GetAddOnEnableState = GetAddOnEnableState
    C_AddOns.GetNumAddOns = GetNumAddOns
end

-- ### C_Container (en Legion las funciones de bolsas son globales: GetContainerNumSlots, etc.) ###
if type(C_Container) ~= 'table' then
    local C_Container = ensureTable('C_Container')
    C_Container.GetContainerNumSlots = GetContainerNumSlots
    C_Container.GetContainerItemInfo = function(bag, slot)
        local icon, itemCount, locked, quality, readable, lootable, itemLink, isFiltered, noValue, itemID =
            GetContainerItemInfo(bag, slot)
        if not itemID then return nil end
        return {
            iconFileID = icon,
            stackCount = itemCount,
            isLocked = locked,
            quality = quality,
            isReadable = readable,
            hasLoot = lootable,
            hyperlink = itemLink,
            isFiltered = isFiltered,
            hasNoValue = noValue,
            itemID = itemID
        }
    end
    C_Container.GetContainerItemLink = GetContainerItemLink
    C_Container.GetContainerItemID = GetContainerItemID
    C_Container.GetContainerNumFreeSlots = GetContainerNumFreeSlots
    C_Container.UseContainerItem = UseContainerItem
    C_Container.PickupContainerItem = PickupContainerItem
    C_Container.SplitContainerItem = SplitContainerItem
    C_Container.GetContainerItemCooldown = GetContainerItemCooldown
    C_Container.GetContainerItemDurability = GetContainerItemDurability
    C_Container.GetContainerItemQuestInfo = GetContainerItemQuestInfo
    C_Container.SortBags = function() end -- no existe en Legion, no-op
end

-- ### C_Item (Legion todavía usa GetItemInfo/GetItemIcon globales) ###
if type(C_Item) ~= 'table' then
    local C_Item = ensureTable('C_Item')
    C_Item.GetItemInfo = GetItemInfo
    C_Item.GetItemIconByID = GetItemIcon
    C_Item.GetItemCount = GetItemCount
    C_Item.GetItemInventoryTypeByID = function(itemID)
        local _, _, _, _, _, _, _, _, invType = GetItemInfo(itemID)
        return invType
    end
    C_Item.IsEquippedItem = IsEquippedItem
end

-- ### C_Spell (Legion todavía usa GetSpellInfo/GetSpellTexture globales) ###
if type(C_Spell) ~= 'table' then
    local C_Spell = ensureTable('C_Spell')
    C_Spell.GetSpellName = function(spellID)
        local name = GetSpellInfo(spellID)
        return name
    end
    C_Spell.GetSpellTexture = function(spellID)
        local _, _, icon = GetSpellInfo(spellID)
        return icon
    end
    C_Spell.GetSpellDescription = GetSpellDescription
    C_Spell.GetSpellLink = GetSpellLink
    C_Spell.GetSpellCooldown = function(spellID)
        local start, duration, enabled, modRate = GetSpellCooldown(spellID)
        return {startTime = start, duration = duration, isEnabled = enabled == 1, modRate = modRate}
    end
end

-- ### C_ChatInfo (no existe en este cliente; SendAddonMessage sigue siendo global) ###
if type(C_ChatInfo) ~= 'table' then
    local C_ChatInfo = ensureTable('C_ChatInfo')
    C_ChatInfo.SendAddonMessage = SendAddonMessage
    -- SendAddonMessageLogged no existe en Legion (llego en clientes mas modernos), no hay
    -- global equivalente al que mapearlo, se deja sin definir a proposito.
    C_ChatInfo.RegisterAddonMessagePrefix = RegisterAddonMessagePrefix
    C_ChatInfo.IsAddonMessagePrefixRegistered = IsAddonMessagePrefixRegistered
end

-- ### EventRegistry (llego en Shadowlands 9.0, no existe en Legion) ###
-- Se implementa una version minima con RegisterCallback/TriggerEvent (y Unregister*),
-- suficiente para lo que usa DragonflightUI internamente.
if type(EventRegistry) ~= 'table' then
    local registry = ensureTable('EventRegistry')
    local callbacksByEvent = {}

    function registry:RegisterCallback(event, func, owner)
        callbacksByEvent[event] = callbacksByEvent[event] or {}
        table.insert(callbacksByEvent[event], {func = func, owner = owner})
        return owner
    end

    function registry:UnregisterCallback(event, owner)
        local list = callbacksByEvent[event]
        if not list then return end
        for i = #list, 1, -1 do
            if list[i].owner == owner then
                table.remove(list, i)
            end
        end
    end

    function registry:TriggerEvent(event, ...)
        local list = callbacksByEvent[event]
        if not list then return end
        for _, entry in ipairs(list) do
            local ok, err = pcall(entry.func, entry.owner, ...)
            if not ok then
                geterrorhandler()(err)
            end
        end
    end

    -- RegisterFrameEventAndCallback: distinto de RegisterCallback (eso es para eventos internos
    -- disparados via TriggerEvent). Este suscribe a un EVENTO DE JUEGO real (p.ej.
    -- UNIT_SPELLCAST_SUCCEEDED) usado por Helper.lua:CreateFrameEventCallback y
    -- Castbar.mixin.lua. Se implementa con un frame proxy oculto que hace RegisterEvent().
    local frameEventProxy = CreateFrame('Frame')
    frameEventProxy:Hide()
    local frameEventCallbacks = {}

    frameEventProxy:SetScript('OnEvent', function(self, event, ...)
        local list = frameEventCallbacks[event]
        if not list then return end
        for i = 1, #list do
            local entry = list[i]
            if entry then
                local ok, err = pcall(entry.callback, entry.owner, ...)
                if not ok then
                    geterrorhandler()(err)
                end
            end
        end
    end)

    function registry:RegisterFrameEventAndCallback(event, callback, owner)
        if not frameEventCallbacks[event] then
            frameEventCallbacks[event] = {}
            frameEventProxy:RegisterEvent(event)
        end
        local entry = {callback = callback, owner = owner}
        table.insert(frameEventCallbacks[event], entry)
        return entry
    end

    function registry:UnregisterFrameEventAndCallback(event, owner)
        local list = frameEventCallbacks[event]
        if not list then return end
        for i = #list, 1, -1 do
            if list[i].owner == owner then
                table.remove(list, i)
            end
        end
    end
end

-- ### CallbackRegistryMixin (llego en Shadowlands 9.0, no existe en Legion) ###
-- CRITICO: Modules\Core\Config.lua y Modules\Compatibility\Compatibility.lua construyen
-- DFSettingsListMixin = CreateFromMixins(CallbackRegistryMixin) en la CABECERA de
-- Mixin/DFSettingsList.mixin.lua. Si CallbackRegistryMixin no existe, CreateFromMixins(nil)
-- revienta ahi mismo, DFSettingsListMixin se queda nil, y eso hace que el chunk entero de
-- Modules\Core\Config.lua aborte en la linea que usa DFSettingsListMixin.AlphaSortComparator
-- ANTES de llegar a definir Module:OnInitialize/OnEnable/ApplySettings. Como es ApplySettings
-- quien realmente hace DF:GetModule(k,true):Enable() para Actionbar/Unitframe/Minimap/etc.
-- segun los defaults, el resultado es "0 errores pero tampoco cambia nada en pantalla".
-- Implementacion minima pero funcional (mismo patron RegisterCallback/UnregisterCallback/
-- TriggerEvent con owner que ya usa el resto del addon).
if type(CallbackRegistryMixin) ~= 'table' then
    local mixin = ensureTable('CallbackRegistryMixin')

    function mixin:OnLoad()
        self.callbacks = {}
    end

    function mixin:GenerateCallbackEvents(eventList)
        self.Event = self.Event or {}
        for _, event in ipairs(eventList) do
            self.Event[event] = event
        end
    end

    function mixin:SetUndefinedEventsAllowed(allowed)
        self.undefinedEventsAllowed = allowed
    end

    function mixin:IsEventRegistered(event)
        return self.callbacks ~= nil and self.callbacks[event] ~= nil and next(self.callbacks[event]) ~= nil
    end

    function mixin:TriggerEvent(event, ...)
        if not self.callbacks then return end
        local callbacks = self.callbacks[event]
        if not callbacks then return end
        for owner, callback in pairs(callbacks) do
            local ok, err = pcall(callback, owner, ...)
            if not ok then geterrorhandler()(err) end
        end
    end

    function mixin:RegisterCallback(event, callback, owner)
        self.callbacks = self.callbacks or {}
        owner = owner or callback
        self.callbacks[event] = self.callbacks[event] or {}
        self.callbacks[event][owner] = callback
    end

    function mixin:UnregisterCallback(event, owner)
        if self.callbacks and self.callbacks[event] then
            self.callbacks[event][owner] = nil
        end
    end

    function mixin:UnregisterAllCallbacks(owner)
        if not self.callbacks then return end
        for _, callbacks in pairs(self.callbacks) do
            callbacks[owner] = nil
        end
    end
end

-- Aviso en el chat (solo la primera vez) para que quede claro en /console scriptErrors 1 que este shim se cargó.
DragonflightUI_LegionShimLoaded = true
