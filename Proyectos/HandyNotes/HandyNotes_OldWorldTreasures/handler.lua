local myname, ns = ...
local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
local HL = LibStub("AceAddon-3.0"):NewAddon(myname, "AceEvent-3.0")

-- === LIBRERÍAS DE MAPAS ===
local HBD = LibStub("HereBeDragons-1.0", true) or LibStub("HereBeDragons-2.0", true)
local Astrolabe = LibStub("Astrolabe-1.0", true)

local nodes = ns.points
local HLHandler = {}

-- === CONFIGURACIÓN DE ICONOS ===
local ICON_DEFAULT = "Interface\\Icons\\inv_box_01" 
local ICON_RARE = "Interface\\WorldMap\\Skull_64"

local function getIcon(point)
    if point.type == "rare" then return ICON_RARE end
    if point.icon then return point.icon end
    return ICON_DEFAULT
end

local function getLabel(point)
    return point.label or "Tesoro / Objeto"
end

-- === TOMTOM INTEGRATION ===
function HLHandler:OnClick(button, down, mapFile, coord)
    if button == "RightButton" and down then
        if TomTom then
            local mapID = mapFile
            if type(mapFile) == "string" and HBD then
                mapID = HBD:GetMapIDFromFile(mapFile)
            end
            local x = math.floor(coord / 10000) / 10000
            local y = (coord % 10000) / 10000
            
            local point = nodes[mapID] and nodes[mapID][coord]
            local title = point and getLabel(point) or "Tesoro"
            
            TomTom:AddWaypoint(mapID, x, y, {
                title = title,
                persistent = nil,
                minimap = true,
                world = true
            })
            print("|cff33ff99HandyNotes:|r Ruta hacia " .. title .. " añadida a TomTom.")
        else
            print("|cff33ff99HandyNotes:|r TomTom no está instalado o activo.")
        end
    end
end

-- === TOOLTIPS ===
function HLHandler:OnEnter(mapFile, coord)
    local tooltip = GameTooltip
    if ( self:GetCenter() > UIParent:GetCenter() ) then
        tooltip:SetOwner(self, "ANCHOR_LEFT")
    else
        tooltip:SetOwner(self, "ANCHOR_RIGHT")
    end

    local mapID = mapFile
    if type(mapFile) == "string" and HBD then
        mapID = HBD:GetMapIDFromFile(mapFile)
    end

    local point = nodes[mapID] and nodes[mapID][coord]
    
    if point then
        if point.item then
            local itemName, itemLink, itemRarity, itemLevel, itemMinLevel, itemType, itemSubType, itemStackCount, itemEquipLoc, itemTexture = GetItemInfo(point.item)
            if itemLink then
                tooltip:SetHyperlink(itemLink)
            else
                tooltip:SetText("Cargando objeto ("..point.item..")...")
            end
        else
            tooltip:SetText(getLabel(point))
        end
        
        if point.note then tooltip:AddLine(point.note, 1, 1, 1) end
        if point.loot then tooltip:AddLine("Loot: " .. point.loot, 0.8, 0.8, 0.8) end
        if point.quest then 
            local status = IsQuestFlaggedCompleted(point.quest) and "|cFF00FF00Completado|r" or "|cFFFF0000No Completado|r"
            tooltip:AddLine("Misión ID: " .. point.quest .. " ("..status..")", 0.5, 0.5, 0.5) 
        end
        
        tooltip:AddLine("Click derecho para añadir ruta en TomTom", 0, 1, 0)
    end
    tooltip:Show()
end

function HLHandler:OnLeave() GameTooltip:Hide() end

-- === ITERADOR (MOTOR GRÁFICO) ===
local function iter(t, prestate)
    if not t then return nil end
    local state, value = next(t, prestate)
    while state do
        if value then
            -- SMART HIDING LOGIC (Quest Tracking)
            local showNode = true
            if not ns.db.show_looted and value.quest then
                if IsQuestFlaggedCompleted(value.quest) then
                    showNode = false
                end
            end
            
            if showNode then
                local icon = getIcon(value)
                local scale = (ns.db.icon_scale or 1.3)
                if value.type == "rare" then scale = scale * 1.2 end
                return state, nil, icon, scale, (ns.db.icon_alpha or 1.0)
            end
        end
        state, value = next(t, state)
    end
    return nil, nil, nil, nil, nil
end

-- === LECTURA DE NODOS ===
function HLHandler:GetNodes(mapFile, minimap)
    local mapID = mapFile
    if type(mapFile) == "string" then
        if HBD then
            mapID = HBD:GetMapIDFromFile(mapFile)
        elseif Astrolabe then
            mapID = Astrolabe:GetMapID(mapFile)
        end
    end
    return iter, nodes[mapID], nil
end

function HLHandler:GetNodes2(mapID, minimap)
    return HLHandler:GetNodes(mapID, minimap)
end

local function SetupTrackingMenu()
    if HL._hookedTracking then return end
    local dropDown = (WorldMapFrame and WorldMapFrame.UIElementsFrame and WorldMapFrame.UIElementsFrame.TrackingOptionsButton and WorldMapFrame.UIElementsFrame.TrackingOptionsButton.DropDown) or _G["WorldMapTrackingOptionsDropDown"]
    if dropDown then
        HL._hookedTracking = true
        hooksecurefunc(dropDown, "initialize", function()
            if (UIDROPDOWNMENU_MENU_LEVEL == 1 or not UIDROPDOWNMENU_MENU_LEVEL) then
                local info = UIDropDownMenu_CreateInfo()
                info.text = "Tesoros (Old World)"
                info.value = myname
                info.isNotRadio = true
                info.keepShownOnClick = true
                info.checked = HandyNotes.db.profile.enabledPlugins[myname]
                info.func = function()
                    local state = not HandyNotes.db.profile.enabledPlugins[myname]
                    HandyNotes.db.profile.enabledPlugins[myname] = state
                    HandyNotes:UpdatePluginMap(nil, myname)
                end
                UIDropDownMenu_AddButton(info)
            end
        end)
    end
end

-- === INICIALIZACIÓN ===
function HL:OnInitialize()
    self.db = LibStub("AceDB-3.0"):New("HandyNotes_OldWorldDB", ns.defaults)
    ns.db = self.db.profile
    HandyNotes:RegisterPluginDB(myname, HLHandler, ns.options)
    SetupTrackingMenu()
    self:RegisterEvent("PLAYER_LOGIN", SetupTrackingMenu)
    if WorldMapFrame then
        WorldMapFrame:HookScript("OnShow", SetupTrackingMenu)
    end
end

function HL:Refresh()
    self:SendMessage("HandyNotes_NotifyUpdate", myname)
end

-- === HERRAMIENTA DE DESARROLLO ===
SLASH_HWNOW1 = "/hwnow"
SlashCmdList["HWNOW"] = function(msg)
    local HBD = LibStub("HereBeDragons-1.0", true) or LibStub("HereBeDragons-2.0", true)
    if not HBD then print("Error: Librería HBD no cargada."); return end

    local x, y, mapID = HBD:GetPlayerZonePosition()
    if mapID and x and y then
        local coord = math.floor(x * 10000) * 10000 + math.floor(y * 10000)
        print("======== DATOS PARA NODES.LUA ========")
        print("Zona Actual: " .. GetZoneText())
        print("Map ID (Correcto para 7.3.5): " .. mapID)
        print("Coordenada Player: " .. coord)
        print("--------------------------------------")
        print("Copia esto en nodes.lua:")
        print("[" .. mapID .. "] = {")
        print("    [" .. coord .. "] = { label = \"Mi Tesoro Nuevo\", type = \"rare\" },")
        print("},")
    else
        print("No se pudo obtener la posición.")
    end
end