-- WorldBossTracker: UI_Main.lua
local WorldBossTracker = WorldBossTracker
local rares = WorldBossTracker.rares or {}
local raresOrder = WorldBossTracker.raresOrder or {}
local CHECK_TEX = "|TInterface\\Buttons\\UI-CheckBox-Check:14:14|t"
local CROSS_TEX = "|TInterface\\Buttons\\UI-GroupLoot-Pass-Up:14:14|t"

-------------------------------------------------------------
-- BACKDROP & STYLING
-------------------------------------------------------------
local function CreateBackdrop(frame)
    frame:SetBackdrop({
        bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
        edgeFile = "Interface\\Tooltips\\UI-Tooltip-Border",
        tile = true, tileSize = 16, edgeSize = 12,
        insets = { left = 4, right = 4, top = 4, bottom = 4 }
    })
    frame:SetBackdropColor(0.06, 0.06, 0.07, 0.9)
    frame:SetBackdropBorderColor(0, 0, 0, 0.9)
end

-------------------------------------------------------------
-- MAIN FRAME CREATION
-------------------------------------------------------------
function WorldBossTracker.CreateMainFrame()
    if InCombatLockdown() then return end
    if WorldBossTracker.mainFrame then
        WorldBossTracker.mainFrame:Show()
        return
    end

    local f = CreateFrame("Frame", "WorldBossTracker_MainFrame", UIParent)
    f:SetSize(500, 320)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 20)
    CreateBackdrop(f)
    
    f:SetMovable(true)
    f:SetResizable(true)
    f:EnableMouse(true)
    f:SetMinResize(400, 250)
    f:SetMaxResize(800, 600)
    f:RegisterForDrag("LeftButton")
    f:SetScript("OnDragStart", f.StartMoving)
    f:SetScript("OnDragStop", f.StopMovingOrSizing)

    -- Resize Grip
    local grip = CreateFrame("Button", nil, f)
    grip:SetSize(16, 16)
    grip:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -1, 1)
    grip:SetNormalTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Up")
    grip:SetHighlightTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Highlight")
    grip:SetPushedTexture("Interface\\ChatFrame\\UI-ChatIM-SizeGrabber-Down")
    grip:SetScript("OnMouseDown", function(self, button)
        if button == "LeftButton" then f:StartSizing("BOTTOMRIGHT") end
    end)
    grip:SetScript("OnMouseUp", function(self, button)
        f:StopMovingOrSizing()
        if WorldBossTracker.UpdateUI then WorldBossTracker.UpdateUI() end
    end)

    -- Title
    local title = f:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", f, "TOPLEFT", 12, -10)
    title:SetText("|cff66c0f4World Boss Tracker|r")

    -- Close button
    local close = CreateFrame("Button", nil, f, "UIPanelCloseButton")
    close:SetPoint("TOPRIGHT", f, "TOPRIGHT", -4, -4)

    -------------------------------------------------------------
    -- TABS
    -------------------------------------------------------------
    local currentTab = "TANAAN"
    f.tabs = {}
    f.contentFrames = {}

    local function TabOnClick(self)
        currentTab = self.tabName
        for _, tab in pairs(f.tabs) do
            if tab.tabName == currentTab then
                tab:LockHighlight()
            else
                tab:UnlockHighlight()
            end
        end
        for name, frame in pairs(f.contentFrames) do
            if name == currentTab then
                frame:Show()
            else
                frame:Hide()
            end
        end
        if WorldBossTracker.UpdateUI then WorldBossTracker.UpdateUI() end
    end

    local function CreateTab(name, label, relativeTo, xOffset)
        local btn = CreateFrame("Button", nil, f, "UIPanelButtonTemplate")
        btn:SetSize(100, 24)
        if relativeTo then
            btn:SetPoint("LEFT", relativeTo, "RIGHT", xOffset, 0)
        else
            btn:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -10)
        end
        btn:SetText(label)
        btn.tabName = name
        btn:SetScript("OnClick", TabOnClick)
        f.tabs[name] = btn
        return btn
    end

    local tabTanaan = CreateTab("TANAAN", "Tanaan (WOD)")
    local tabLegion = CreateTab("LEGION", "Legion", tabTanaan, 5)

    -------------------------------------------------------------
    -- TANAAN CONTENT
    -------------------------------------------------------------
    local tanaanFrame = CreateFrame("Frame", nil, f)
    tanaanFrame:SetPoint("TOPLEFT", tabTanaan, "BOTTOMLEFT", 0, -10)
    tanaanFrame:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -10, 20)
    f.contentFrames["TANAAN"] = tanaanFrame

    local realmBtn = CreateFrame("Button", "WorldBossTrackerRealmBtn", tanaanFrame, "UIPanelButtonTemplate")
    realmBtn:SetPoint("TOP", tanaanFrame, "TOP", 0, -5)
    realmBtn:SetSize(170, 24)
    f.realmBtn = realmBtn

    local function SortedRealmNames()
        local out = {}
        if WorldBossTrackerDB and WorldBossTrackerDB.realms then
            for k in pairs(WorldBossTrackerDB.realms) do out[#out+1] = k end
        end
        table.sort(out)
        return out
    end

    local function UpdateRealmBtnText()
        local current = WorldBossTracker.currentRealmView or (GetRealmName() or "Unknown Realm")
        realmBtn:SetText("Realm: " .. current)
    end

    realmBtn:SetScript("OnClick", function()
        if InCombatLockdown() then return end
        local realms = SortedRealmNames()
        if #realms == 0 then return end
        local current = WorldBossTracker.currentRealmView or (GetRealmName() or "Unknown Realm")
        local idx = 1
        for i, r in ipairs(realms) do
            if r == current then idx = i; break end
        end
        idx = idx + 1
        if idx > #realms then idx = 1 end
        WorldBossTracker.currentRealmView = realms[idx]
        UpdateRealmBtnText()
        if WorldBossTracker.UpdateUI then WorldBossTracker.UpdateUI() end
    end)
    UpdateRealmBtnText()

    f.bars = {}
    local spacing = 32
    for i, rareName in ipairs(raresOrder) do
        local bar = CreateFrame("StatusBar", nil, tanaanFrame)
        bar:SetSize(300, 24)
        bar:SetPoint("TOP", realmBtn, "BOTTOM", 0, -15 - ((i-1) * spacing))
        bar:SetStatusBarTexture("Interface\\TargetingFrame\\UI-StatusBar")
        bar:SetMinMaxValues(0, 7200)
        
        local bg = bar:CreateTexture(nil, "BACKGROUND")
        bg:SetAllPoints()
        bg:SetColorTexture(0, 0, 0, 0.5)

        local label = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        label:SetPoint("LEFT", bar, "LEFT", 8, 0)
        
        local timeText = bar:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        timeText:SetPoint("RIGHT", bar, "RIGHT", -8, 0)
        
        bar.label = label
        bar.timeText = timeText
        bar.rareName = rareName
        
        f.bars[rareName] = bar
    end

    -------------------------------------------------------------
    -- LEGION CONTENT
    -------------------------------------------------------------
    local legionFrame = CreateFrame("Frame", nil, f)
    legionFrame:SetPoint("TOPLEFT", tabTanaan, "BOTTOMLEFT", 0, -10)
    legionFrame:SetPoint("BOTTOMRIGHT", f, "BOTTOMRIGHT", -10, 20)
    legionFrame:Hide()
    f.contentFrames["LEGION"] = legionFrame

    local scrollFrame = CreateFrame("ScrollFrame", "WorldBossTracker_LegionScroll", legionFrame, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", legionFrame, "TOPLEFT", 10, -10)
    scrollFrame:SetPoint("BOTTOMRIGHT", legionFrame, "BOTTOMRIGHT", -30, 10)

    local content = CreateFrame("Frame", nil, scrollFrame)
    content:SetSize(400, 400)
    scrollFrame:SetScrollChild(content)
    f.legionContent = content

    f.legionRows = {}
    local rowHeight = 25
    for i = 1, 15 do
        local row = CreateFrame("Frame", nil, content)
        row:SetSize(380, rowHeight)
        row:SetPoint("TOPLEFT", content, "TOPLEFT", 0, -((i-1)*rowHeight))
        
        local tex = row:CreateTexture(nil, "BACKGROUND")
        tex:SetAllPoints()
        tex:SetColorTexture(1, 1, 1, i%2==0 and 0.05 or 0)
        
        local text = row:CreateFontString(nil, "OVERLAY", "GameFontNormal")
        text:SetPoint("LEFT", row, "LEFT", 10, 0)
        row.text = text
        
        local status = row:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
        status:SetPoint("RIGHT", row, "RIGHT", -10, 0)
        row.status = status
        
        f.legionRows[i] = row
    end

    -------------------------------------------------------------
    -- ELVUI SKINNING
    -------------------------------------------------------------
    if ElvUI and ElvUI[1] and ElvUI[1].GetModule then
        local S = ElvUI[1]:GetModule("Skins", true)
        if S then
            S:HandleFrame(f, true)
            S:HandleCloseButton(close)
            S:HandleButton(realmBtn, true)
            for _, btn in pairs(f.tabs) do S:HandleButton(btn, true) end
            S:HandleScrollBar(WorldBossTracker_LegionScrollScrollBar)
            for _, bar in pairs(f.bars) do S:HandleStatusBar(bar) end
        end
    end

    WorldBossTracker.mainFrame = f
    TabOnClick(tabTanaan)
    
    f:SetScript("OnUpdate", function(self, elapsed)
        self.timer = (self.timer or 0) + elapsed
        if self.timer >= 1 then
            if WorldBossTracker.UpdateUI then WorldBossTracker.UpdateUI() end
            self.timer = 0
        end
    end)
end

function WorldBossTracker.ToggleMainFrame()
    if InCombatLockdown() then return end
    if not WorldBossTracker.mainFrame then WorldBossTracker.CreateMainFrame() end
    local f = WorldBossTracker.mainFrame
    if f:IsShown() then f:Hide() else f:Show() end
end

function WorldBossTracker.UpdateUI()
    if not WorldBossTracker.mainFrame or not WorldBossTracker.mainFrame:IsShown() then return end
    
    local db = WorldBossTracker:ViewedRealmDB()
    local now = time()
    
    -- Update Tanaan Bars
    local f = WorldBossTracker.mainFrame
    local w = f:GetWidth()
    for _, bar in pairs(f.bars) do
        bar:SetWidth(w - 200)
        local rareName = bar.rareName
        local rData = rares[rareName]
        local lastKill = db[rareName] or 0
        
        if lastKill == 0 then
            bar:SetMinMaxValues(0, 1)
            bar:SetValue(1)
            bar:SetStatusBarColor(0.2, 0.2, 0.2)
            bar.label:SetText(rareName .. " |cff888888(Sin datos)|r")
            bar.timeText:SetText("--")
        else
            local elapsed = now - lastKill
            local remain = math.max(0, rData.respawn - elapsed)
            bar:SetValue(elapsed)
            
            if remain == 0 then
                bar:SetStatusBarColor(0.2, 0.8, 0.2)
                bar.label:SetText(rareName .. " |cff00ff00(Activo / Vivo)|r")
                bar.timeText:SetText("¡VIVO!")
            else
                bar:SetStatusBarColor(0.8, 0.2, 0.2)
                local m = math.floor(remain / 60)
                local s = remain % 60
                bar.label:SetText(rareName)
                bar.timeText:SetText(string.format("%02d:%02d", m, s))
            end
        end
    end

    -- Update Legion Rows
    if WorldBossTracker.GetActiveLegionBosses then
        local legionBosses = WorldBossTracker.GetActiveLegionBosses()
        for i, row in ipairs(f.legionRows) do
            local boss = legionBosses[i]
            if boss then
                row.text:SetText(boss.name)
                if boss.isDead then
                    row.status:SetText(CHECK_TEX .. " |cff00ff00Completado|r")
                else
                    row.status:SetText(CROSS_TEX .. " |cffff0000Vivo / Lock Libre|r")
                end
                row:Show()
            else
                row:Hide()
            end
        end
    end
end
