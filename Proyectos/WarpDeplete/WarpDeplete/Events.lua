--[[
	WarpDeplete Legion 7.3.5 Recreation
	Module: Events.lua
	Description: Challenge Mode event registration, lifecycle triggers & Legion API adaptations
]]

local ADDON_NAME, AddonTable = ...
local WarpDeplete = _G.WarpDeplete or AddonTable or {}

local Events = WarpDeplete.Events or {}
WarpDeplete.Events = Events

local Util = WarpDeplete.Util

---@type table<string, boolean>
WarpDeplete.registeredChallengeEvents = WarpDeplete.registeredChallengeEvents or {}

-- Legion 7.3.5 Adaptive API Wrappers
local function GetMapInfo(mapId)
	if C_ChallengeMode and C_ChallengeMode.GetMapUIInfo then
		return C_ChallengeMode.GetMapUIInfo(mapId)
	elseif C_ChallengeMode and C_ChallengeMode.GetMapInfo then
		return C_ChallengeMode.GetMapInfo(mapId)
	end
end

local function GetCompletionInfo()
	if C_ChallengeMode and C_ChallengeMode.GetCompletionInfo then
		local mapID, level, timeElapsedMs, onTime, keystoneUpgradeLevels = C_ChallengeMode.GetCompletionInfo()
		return {
			mapID = mapID,
			level = level,
			time = timeElapsedMs,
			onTime = onTime,
			keystoneUpgradeLevels = keystoneUpgradeLevels,
		}
	elseif C_ChallengeMode and C_ChallengeMode.GetChallengeCompletionInfo then
		return C_ChallengeMode.GetChallengeCompletionInfo()
	end
	return nil
end

local feignDeathSpellName = (GetSpellInfo and GetSpellInfo(5384)) or "Feign Death"

--- Unified combat log argument extractor for Legion 7.3.5 and modern/test harnesses
local function GetCLEUInfo(...)
	if CombatLogGetCurrentEventInfo then
		return CombatLogGetCurrentEventInfo()
	else
		local event, timestamp, subEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = ...
		if event == "COMBAT_LOG_EVENT_UNFILTERED" then
			return timestamp, subEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags
		else
			return ...
		end
	end
end

function WarpDeplete:RegisterGlobalEvent(event)
	if self.RegisterEvent then
		self:RegisterEvent(event, event)
	end
end

function WarpDeplete:RegisterChallengeEvent(event)
	if self.RegisterEvent then
		self:RegisterEvent(event, event)
	end
	if not self.registeredChallengeEvents then
		self.registeredChallengeEvents = {}
	end
	self.registeredChallengeEvents[event] = true
end

function WarpDeplete:UnregisterChallengeEvents()
	if self.registeredChallengeEvents and self.UnregisterEvent then
		for event, _ in pairs(self.registeredChallengeEvents) do
			self:UnregisterEvent(event)
		end
	end
	self.registeredChallengeEvents = {}
end

function WarpDeplete:RegisterGlobalEvents()
	self:RegisterGlobalEvent("PLAYER_ENTERING_WORLD")
	self:RegisterGlobalEvent("ZONE_CHANGED")
	self:RegisterGlobalEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterGlobalEvent("ZONE_CHANGED_INDOORS")
	self:RegisterGlobalEvent("PLAYER_DIFFICULTY_CHANGED")
	self:RegisterGlobalEvent("CHALLENGE_MODE_START")
	self:RegisterGlobalEvent("CHALLENGE_MODE_RESET")
	self:RegisterGlobalEvent("GROUP_ROSTER_UPDATE")

	if self.InitDeathsTooltip then
		self:InitDeathsTooltip()
	end
end

function WarpDeplete:RegisterChallengeEvents()
	self:RegisterChallengeEvent("CHALLENGE_MODE_COMPLETED")
	self:RegisterChallengeEvent("WORLD_STATE_TIMER_START")
	self:RegisterChallengeEvent("SCENARIO_POI_UPDATE")
	self:RegisterChallengeEvent("SCENARIO_CRITERIA_UPDATE")
	self:RegisterChallengeEvent("ENCOUNTER_END")
	self:RegisterChallengeEvent("PLAYER_REGEN_ENABLED")
	self:RegisterChallengeEvent("COMBAT_LOG_EVENT_UNFILTERED")
end

-- Zone / Difficulty Triggers
function WarpDeplete:PLAYER_ENTERING_WORLD()
	self:CheckForChallengeMode()
end

function WarpDeplete:ZONE_CHANGED()
	self:CheckForChallengeMode()
end

function WarpDeplete:ZONE_CHANGED_NEW_AREA()
	self:CheckForChallengeMode()
end

function WarpDeplete:ZONE_CHANGED_INDOORS()
	self:CheckForChallengeMode()
end

function WarpDeplete:PLAYER_DIFFICULTY_CHANGED()
	self:CheckForChallengeMode()
end

function WarpDeplete:GROUP_ROSTER_UPDATE()
	if self.UpdatePartyCache then
		self:UpdatePartyCache()
	end
end

function WarpDeplete:CHALLENGE_MODE_START()
	self:EnableChallengeMode()
end

function WarpDeplete:CHALLENGE_MODE_RESET()
	self:DisableChallengeMode()
end

function WarpDeplete:WORLD_STATE_TIMER_START()
	if not self.state then
		self.state = {}
	end
	self.state.timerStarted = true
	if GetTime then
		self.state.startTime = GetTime()
	end
	if self.RenderTimer then self:RenderTimer() end
	if self.RenderForces then self:RenderForces() end
	if self.RenderObjectives then self:RenderObjectives() end
end

function WarpDeplete:CHALLENGE_MODE_COMPLETED()
	self:CompleteChallenge()
end

function WarpDeplete:SCENARIO_POI_UPDATE()
	if self.UpdateObjectives then
		self:UpdateObjectives()
	end
end

function WarpDeplete:SCENARIO_CRITERIA_UPDATE()
	if self.UpdateObjectives then
		self:UpdateObjectives()
	end
end

function WarpDeplete:ENCOUNTER_END()
	if self.ResetCurrentPull then
		self:ResetCurrentPull()
	end
end

function WarpDeplete:PLAYER_REGEN_ENABLED()
	if self.ResetCurrentPull then
		self:ResetCurrentPull()
	end
end

--- Detects if player is inside an active Mythic+ dungeon
function WarpDeplete:CheckForChallengeMode()
	local type, difficulty
	if GetInstanceInfo then
		local _, instType, instDiff = GetInstanceInfo()
		type = instType
		difficulty = instDiff
	end

	local inChallenge = (difficulty == 8 and type == "party")

	if self.state and self.state.inChallenge == inChallenge then
		return
	end

	if inChallenge then
		self:EnableChallengeMode()
	else
		self:DisableChallengeMode()
	end
end

--- Initializes and displays keystone session
function WarpDeplete:EnableChallengeMode()
	if self.state and self.state.demoModeActive and self.DisableDemoMode then
		self:DisableDemoMode()
	end

	if self.ResetState then
		self:ResetState()
	else
		self.state = {
			inChallenge = true,
			challengeCompleted = false,
			completedOnTime = nil,
			completionTimeMs = nil,
			timerLoopRunning = false,
			timerStarted = false,
			timer = 0,
			timeLimit = 0,
			timeLimits = {},
			deathCount = 0,
			deathTimeLost = 0,
			deathDetails = {},
			partyCache = {},
			pullCount = 0,
			currentCount = 0,
			totalCount = 100,
			pullPercent = 0,
			currentPercent = 0,
			objectives = {},
			currentPull = {},
		}
	end

	self.state.inChallenge = true
	if self.UpdatePartyCache then
		self:UpdatePartyCache()
	end

	self:RegisterChallengeEvents()

	-- Load Key Details & Time Limit
	local mapId = C_ChallengeMode and C_ChallengeMode.GetActiveChallengeMapID and C_ChallengeMode.GetActiveChallengeMapID()
	if mapId then
		self.state.mapId = mapId
		local name, id, timeLimit = GetMapInfo(mapId)
		if timeLimit and timeLimit > 0 and self.SetTimeLimit then
			self:SetTimeLimit(timeLimit)
		end

		if C_ChallengeMode and C_ChallengeMode.GetActiveKeystoneInfo then
			local level, affixes = C_ChallengeMode.GetActiveKeystoneInfo()
			self.state.level = level or 0
			self.state.affixes = {}
			self.state.affixIds = affixes or {}
			if affixes and C_ChallengeMode.GetAffixInfo then
				for i, affixID in ipairs(affixes) do
					local aName = C_ChallengeMode.GetAffixInfo(affixID)
					if aName then
						self.state.affixes[i] = (Util.formatAffixName and Util.formatAffixName(aName)) or aName
					end
				end
			end
			if self.RenderKeyDetails then
				self:RenderKeyDetails()
			end
		end
	end

	self.state.timerStarted = false

	if self.GetEJObjectiveNames then
		self.state.ejObjectiveNames, self.state.ejEncounterNames = self:GetEJObjectiveNames()
	end
	if self.UpdateObjectives then
		self:UpdateObjectives()
	end

	if self.RenderDeaths then
		self:RenderDeaths()
	end

	if self.Show then
		self:Show()
	end

	if self.StartTimerLoop then
		self:StartTimerLoop()
	end
end

--- Freezes timer and records final completion stats
function WarpDeplete:CompleteChallenge()
	if self.StopTimerLoop then
		self:StopTimerLoop()
	end
	if self.ResetCurrentPull then
		self:ResetCurrentPull()
	end

	if not self.state then self.state = {} end
	self.state.challengeCompleted = true

	local completion = GetCompletionInfo()
	if completion then
		self.state.completionTimeMs = completion.time
		self.state.completedOnTime = completion.onTime
		if completion.time then
			self.state.timer = completion.time / 1000
		end
	else
		self.state.completionTimeMs = (self.state.timer or 0) * 1000
		self.state.completedOnTime = (self.state.timer or 0) <= (self.state.timeLimit or 0)
	end

	-- Lock any unfinished boss objectives to final completion time
	if self.state.objectives then
		for _, objective in pairs(self.state.objectives) do
			if not objective.time then
				objective.time = self.state.timer
			end
		end
	end

	if self.UpdateSplits then self:UpdateSplits() end
	if self.UpdateBestSplits then self:UpdateBestSplits() end

	if self.RenderTimer then self:RenderTimer() end
	if self.RenderObjectives then self:RenderObjectives() end
	if self.RenderForces then self:RenderForces() end
end

--- Shuts down challenge tracking on exit
function WarpDeplete:DisableChallengeMode()
	if self.isShown and self.Hide then
		self:Hide()
	end

	if not self.state or not self.state.inChallenge then
		return
	end

	if self.StopTimerLoop then
		self:StopTimerLoop()
	end

	if self.ResetState then
		self:ResetState()
	else
		self.state.inChallenge = false
	end

	self:UnregisterChallengeEvents()
end

--- Combat log parser for deaths and penalties
function WarpDeplete:COMBAT_LOG_EVENT_UNFILTERED(...)
	local timestamp, subEvent, hideCaster, sourceGUID, sourceName, sourceFlags, sourceRaidFlags, destGUID, destName, destFlags, destRaidFlags = GetCLEUInfo(...)

	if subEvent ~= "UNIT_DIED" then return end
	if not self.state or not self.state.inChallenge or self.state.challengeCompleted then return end

	-- 1. Must be a player
	local COMBATLOG_FILTER_PLAYER = COMBATLOG_OBJECT_TYPE_PLAYER or 0x00000400
	if not destFlags then
		return
	end
	if bit and bit.band then
		if bit.band(destFlags, COMBATLOG_FILTER_PLAYER) == 0 then
			return
		end
	end

	-- 2. Must be in group (party / raid / self)
	local partyInfo = self.state.partyCache and destGUID and self.state.partyCache[destGUID]
	local isInGroup = partyInfo ~= nil
	if not isInGroup and destName then
		if UnitIsUnit and UnitIsUnit(destName, "player") then
			isInGroup = true
		elseif UnitInParty and UnitInParty(destName) then
			isInGroup = true
		elseif UnitInRaid and UnitInRaid(destName) then
			isInGroup = true
		end
	end
	if not isInGroup then
		return
	end

	-- 3. Filter Feign Death
	local unit = partyInfo and partyInfo.unit
	if (destName and UnitIsFeignDeath and UnitIsFeignDeath(destName)) or
	   (unit and UnitIsFeignDeath and UnitIsFeignDeath(unit)) then
		self:PrintDebug("Ignored Feign Death for: " .. tostring(destName))
		return
	end

	if feignDeathSpellName then
		if (unit and UnitBuff and UnitBuff(unit, feignDeathSpellName)) or
		   (destName and UnitBuff and UnitBuff(destName, feignDeathSpellName)) then
			self:PrintDebug("Ignored Feign Death aura for: " .. tostring(destName))
			return
		end
	end

	-- 4. Class resolution
	local class = (partyInfo and partyInfo.class) or (destName and UnitClass and select(2, UnitClass(destName))) or "PRIEST"

	-- 5. Record Death
	local deathTime = self.state.timer
	if not deathTime or deathTime == 0 then
		if GetWorldElapsedTime then
			local _, worldElapsed = GetWorldElapsedTime(1)
			deathTime = worldElapsed or 0
		else
			deathTime = 0
		end
	end

	if self.RecordDeath then
		self:RecordDeath(destName or "Unknown", class, deathTime)
	end
end
