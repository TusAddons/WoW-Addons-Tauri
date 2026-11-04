WarpDeplete = LibStub("AceAddon-3.0"):NewAddon(
	"WarpDeplete",
	"AceComm-3.0",
	"AceConsole-3.0",
	"AceEvent-3.0",
	"AceTimer-3.0"
)
WarpDeplete.isShown = false
WarpDeplete.isUnlocked = false
WarpDeplete.L = LibStub("AceLocale-3.0"):GetLocale("WarpDeplete", true)

local Util = WarpDeplete.Util or {}
WarpDeplete.Util = Util

local Render = WarpDeplete.Render or {}
WarpDeplete.Render = Render

-- Register LSM Media
WarpDeplete.LSM = LibStub("LibSharedMedia-3.0")
local ruRU, western = WarpDeplete.LSM.LOCALE_BIT_ruRU, WarpDeplete.LSM.LOCALE_BIT_western
WarpDeplete.LSM:Register("border", "WarpDeplete Blank", [[Interface\AddOns\WarpDeplete\Media\Textures\white.tga]])
WarpDeplete.LSM:Register("statusbar", "WarpDeplete Blank", [[Interface\AddOns\WarpDeplete\Media\Textures\white.tga]])
WarpDeplete.LSM:Register("font", "Expressway", [[Interface\AddOns\WarpDeplete\Media\Fonts\Expressway.ttf]], ruRU + western)

-- LibCustomGlow Library
WarpDeplete.Glow = LibStub and LibStub("LibCustomGlow-1.0", true)

function WarpDeplete:OnInitialize()
	-- Ensure LibCustomGlow binding if loaded late
	if not self.Glow and LibStub then
		self.Glow = LibStub("LibCustomGlow-1.0", true)
	end

	-- Initialize AceDB database schema
	self:InitDb()

	-- Register slash commands (/wd, /warpdeplete, etc.)
	self:InitChatCommands()

	-- Initialize options panel if module loaded
	if self.InitOptions then
		self:InitOptions()
	end

	self:Print("WarpDeplete (Legion 7.3.5) initialized.")
end

function WarpDeplete:OnEnable()
	-- Initialize core frame hierarchy and layout engine
	if self.Render and self.Render.Init then
		self.Render:Init()
	elseif self.InitRender then
		self:InitRender()
	end

	-- Register challenge mode events if module loaded
	if self.RegisterGlobalEvents then
		self:RegisterGlobalEvents()
	end
end

function WarpDeplete:InitChatCommands()
	self:RegisterChatCommand("wd", "HandleChatCommand")
	self:RegisterChatCommand("wdp", "HandleChatCommand")
	self:RegisterChatCommand("warp", "HandleChatCommand")
	self:RegisterChatCommand("warpdeplete", "HandleChatCommand")
	self:RegisterChatCommand("WarpDeplete", "HandleChatCommand")
end

--- Sets keystone level, peril affix flag, affixes list, and map ID
---@param level number
---@param hasChallengersPeril boolean
---@param affixes table
---@param affixIds table
---@param mapId number
function WarpDeplete:SetKeyDetails(level, hasChallengersPeril, affixes, affixIds, mapId)
	if not self.state then self.state = {} end
	self.state.level = level or 0
	self.state.hasChallengersPeril = hasChallengersPeril or false
	self.state.affixes = affixes or {}
	self.state.affixIds = affixIds or {}
	self.state.mapId = mapId or 0

	if self.RenderKeyDetails then
		self:RenderKeyDetails()
	end
	if self.RenderLayout then
		self:RenderLayout()
	end
end

--- Activates synthetic Mythic+ session preview for layout configuration
function WarpDeplete:EnableDemoMode()
	if self.state and self.state.inChallenge then
		local msg = (self.L and self.L["Can't enable demo mode while in an active challenge!"])
			or "Can't enable demo mode while in an active challenge!"
		self:Print(msg)
		return
	end

	if self.state and self.state.demoModeActive then
		return
	end

	self:ResetState()
	self.state.demoModeActive = true

	-- 1. Synthetic Boss Objectives (3 killed with deltas, 2 unkilled with PB splits)
	local objectives = {}
	local testBossName = (self.L and self.L["Test Boss Name"]) or "Test Boss Name"
	for i = 1, 5 do
		objectives[i] = { name = testBossName .. " " .. i }
		if i < 4 then
			objectives[i].time = 520 * i
		end
	end
	self.state.objectives = objectives

	-- 2. Keystone Details (Level 30, Affixes list & IDs)
	local affixes = {
		(self.L and self.L["Ascendance"]) or "Ascendance",
		(self.L and self.L["Tyrannical"]) or "Tyrannical",
		(self.L and self.L["Fortified"]) or "Fortified",
		(self.L and self.L["Peril"]) or "Peril",
	}
	local affixIds = { 9, 7, 123, 152 }
	self:SetTimeLimit(35 * 60)
	self:SetKeyDetails(30, true, affixes, affixIds, 1)

	-- 3. Enemy Forces: 240/284 (84.5%) with 20-count engaged pull overlay (~7.0%)
	self:SetForcesTotal(284)
	self:SetForcesCurrent(240)
	self:SetForcesPull(20)

	-- 4. Main Timer: 20 minutes elapsed (remaining 15m, +3 chest active at 1:00)
	self:SetTimer(20 * 60)

	-- 5. Death Counter & 30 Detailed Historical Death Records
	self:SetDeathCount(3, 45)
	local classTable = {
		"SHAMAN",
		"DEMONHUNTER",
		"MONK",
		"DRUID",
		"MAGE",
	}
	local nameTable = {
		"GroupMember1",
		"GroupMember2",
		"GroupMember3",
		"GroupMember4",
		"GroupMember5",
	}
	for i = 1, 30 do
		local class = classTable[(i % #classTable) + 1]
		local name = nameTable[(i % #nameTable) + 1]
		local time = i * 7
		self:AddDeathDetails(time, name, class)
	end

	-- 6. Render & Display
	self:Show()
	if self.RenderObjectives then self:RenderObjectives() end
	if self.RenderForces then self:RenderForces() end
	if self.RenderTimer then self:RenderTimer() end
	if self.RenderDeaths then self:RenderDeaths() end
	if self.RenderKeyDetails then self:RenderKeyDetails() end
	if self.RenderLayout then self:RenderLayout() end
end

--- Deactivates synthetic preview and restores clean idle state
function WarpDeplete:DisableDemoMode()
	if not self.state or not self.state.demoModeActive then
		return
	end
	self.state.demoModeActive = false

	if self.HideGlow then
		self:HideGlow()
	end
	self:Hide()
	self:ResetState()
end

--- Toggles synthetic preview mode on or off
function WarpDeplete:ToggleDemo()
	if self.state and self.state.demoModeActive then
		self:DisableDemoMode()
	else
		self:EnableDemoMode()
	end
end

--- Opens configuration panel in Blizzard Interface Options or AceConfigDialog
function WarpDeplete:OpenOptions()
	local optionsFrame = self.optionsFrame or self.optionsGeneralFrame
	if optionsFrame then
		if InterfaceOptionsFrame_OpenToCategory then
			InterfaceOptionsFrame_OpenToCategory(optionsFrame)
			InterfaceOptionsFrame_OpenToCategory(optionsFrame)
			return
		end
	end

	local AceConfigDialog = LibStub and LibStub("AceConfigDialog-3.0", true)
	if AceConfigDialog then
		AceConfigDialog:Open("WarpDeplete")
		return
	end

	if InterfaceOptionsFrame_OpenToCategory then
		InterfaceOptionsFrame_OpenToCategory("WarpDeplete")
		InterfaceOptionsFrame_OpenToCategory("WarpDeplete")
		return
	end

	self:Print("Options panel is not yet available.")
end

--- Dispatches slash command arguments (/wd, /warpdeplete, /wdp)
---@param input string
function WarpDeplete:HandleChatCommand(input)
	local text = (input or ""):match("^%s*(.-)%s*$") or ""
	local cmd, rest = text:match("^(%S+)%s*(.*)$")
	cmd = string.lower(cmd or "")

	if cmd == "demo" then
		self:ToggleDemo()
		return
	end

	if cmd == "reset" then
		if self.db and self.db.profile then
			self.db.profile.frameAnchor = "RIGHT"
			self.db.profile.frameX = -20
			self.db.profile.frameY = 0
		end
		if self.Render and self.Render.frame then
			self.Render.frame:ClearAllPoints()
			self.Render.frame:SetPoint("RIGHT", UIParent, "RIGHT", -20, 0)
		end
		if self.frames and self.frames.root then
			self.frames.root:ClearAllPoints()
			self.frames.root:SetPoint("RIGHT", UIParent, "RIGHT", -20, 0)
		end
		if self.RenderLayout then
			self:RenderLayout()
		end
		local msg = (self.L and self.L["Frame position reset to default."])
			or "Frame position reset to default."
		self:Print(msg)
		return
	end

	if cmd == "unlock" then
		self:SetUnlocked(true)
		local msg = (self.L and self.L["WarpDeplete unlocked. Drag frame to reposition."])
			or "WarpDeplete unlocked. Drag frame to reposition."
		self:Print(msg)
		return
	end

	if cmd == "lock" then
		self:SetUnlocked(false)
		local msg = (self.L and self.L["WarpDeplete locked."]) or "WarpDeplete locked."
		self:Print(msg)
		return
	end

	if cmd == "toggle" then
		self:SetUnlocked(not self.isUnlocked)
		if self.isUnlocked then
			local msg = (self.L and self.L["WarpDeplete unlocked. Drag frame to reposition."])
				or "WarpDeplete unlocked. Drag frame to reposition."
			self:Print(msg)
		else
			local msg = (self.L and self.L["WarpDeplete locked."]) or "WarpDeplete locked."
			self:Print(msg)
		end
		return
	end

	if cmd == "splits" then
		if not self.db or not self.db.global or not self.db.global.splits or next(self.db.global.splits) == nil then
			self:Print("No recorded splits.")
			return
		end
		local count = 0
		for mapId, mapSplits in pairs(self.db.global.splits) do
			local mapName = (C_ChallengeMode and C_ChallengeMode.GetMapUIInfo and C_ChallengeMode.GetMapUIInfo(mapId))
				or (C_ChallengeMode and C_ChallengeMode.GetMapInfo and C_ChallengeMode.GetMapInfo(mapId))
				or tostring(mapId)
			for level, levelSplits in pairs(mapSplits) do
				count = count + 1
				self:Print(("Splits for %s (+%s):"):format(tostring(mapName), tostring(level)))
				if levelSplits.best then
					for objective, split in pairs(levelSplits.best) do
						local timeStr = (Util and Util.formatTime and Util.formatTime(split)) or tostring(split)
						self:Print(("  %s: %s"):format(tostring(objective), timeStr))
					end
				end
			end
		end
		if count == 0 then
			self:Print("No recorded splits found.")
		end
		return
	end

	if cmd == "clearallsplits" then
		if self.db and self.db.global then
			self.db.global.splits = {}
		end
		local msg = (self.L and self.L["Splits cleared!"]) or "Splits cleared!"
		self:Print(msg)
		return
	end

	if cmd == "debug" then
		if self.db and self.db.global then
			self.db.global.DEBUG = not self.db.global.DEBUG
			if self.db.global.DEBUG then
				local msg = (self.L and self.L["Debug mode enabled"]) or "Debug mode enabled"
				self:Print("|cFF479AEDDEBUG|r " .. msg)
			else
				local msg = (self.L and self.L["Debug mode disabled"]) or "Debug mode disabled"
				self:Print("|cFF479AEDDEBUG|r " .. msg)
			end
		end
		return
	end

	if cmd == "config" or cmd == "options" or cmd == "" then
		self:OpenOptions()
		return
	end

	-- Help summary for unrecognized commands
	self:Print("WarpDeplete Slash Commands:")
	self:Print("  /wd demo - Toggle Demo Preview Mode")
	self:Print("  /wd reset - Reset frame position to default")
	self:Print("  /wd unlock - Unlock and drag timer frame")
	self:Print("  /wd lock - Lock timer frame")
	self:Print("  /wd toggle - Toggle lock/unlock state")
	self:Print("  /wd config - Open configuration panel")
	self:Print("  /wd splits - List recorded personal best splits")
	self:Print("  /wd clearallsplits - Reset all recorded splits")
	self:Print("  /wd debug - Toggle debug output mode")
end


function WarpDeplete:ShowObjectiveTracker()
	local isSylingLoaded = (C_AddOns and C_AddOns.IsAddOnLoaded and C_AddOns.IsAddOnLoaded("SylingTracker"))
		or (IsAddOnLoaded and IsAddOnLoaded("SylingTracker"))
	if isSylingLoaded then
		return
	end

	if KalielsTracker and KalielsTracker.Toggle then
		KalielsTracker:Toggle(true)
		return
	end

	if ObjectiveTrackerFrame then
		if ObjectiveTrackerFrame.SetRolesets then
			ObjectiveTrackerFrame:SetRolesets(nil)
		else
			ObjectiveTrackerFrame:Show()
		end
	end
end

function WarpDeplete:HideObjectiveTracker()
	if KalielsTracker and KalielsTracker.Toggle then
		KalielsTracker:Toggle(false)
		return
	end

	if ObjectiveTrackerFrame then
		if ObjectiveTrackerFrame.SetRolesets then
			ObjectiveTrackerFrame:SetRolesets("alwaysBlocked")
		else
			ObjectiveTrackerFrame:Hide()
		end
	end
end

function WarpDeplete:Show()
	self.isShown = true
	if self.frames and self.frames.root then
		self.frames.root:Show()
	end
	if self.RenderLayout then
		self:RenderLayout()
	end
	if self.HideObjectiveTracker then
		self:HideObjectiveTracker()
	end
end

function WarpDeplete:Hide()
	self.isShown = false
	if self.frames and self.frames.root then
		self.frames.root:Hide()
	end
	if self.ShowObjectiveTracker then
		self:ShowObjectiveTracker()
	end
end
