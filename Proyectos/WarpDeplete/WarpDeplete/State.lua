--[[
	WarpDeplete Legion 7.3.5 Recreation
	Module: State.lua
	Description: Session state container, death tracking, keystone details & limits,
	             boss criteria detection, and enemy forces state management.
]]

local ADDON_NAME, AddonTable = ...
local WarpDeplete = _G.WarpDeplete or AddonTable or {}

local State = WarpDeplete.State or {}
WarpDeplete.State = State

local Util = WarpDeplete.Util

local defaultState = {
	inChallenge = false,
	demoModeActive = false,
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
	pullGlowActive = false,
	currentPull = {},
	objectives = {},
	ejObjectiveNames = nil,
	ejEncounterNames = nil,
	forcesCompleted = false,
	forcesCompletionTime = nil,
	level = 0,
	affixes = {},
	affixIds = {},
	hasChallengersPeril = false,
	mapId = nil,
	startTime = nil,
	startOffset = 0,
}

State.defaultState = defaultState

--- Resets session state table to default values and clears runtime splits
function WarpDeplete:ResetState()
	local s = {}
	for k, v in pairs(defaultState) do
		if type(v) == "table" then
			s[k] = {}
		else
			s[k] = v
		end
	end
	self.state = s

	if self.ResetCurrentSplits then
		self:ResetCurrentSplits()
	end
end

--- Sets dungeon keystone time limit and derives 3-chest thresholds
---@param timeLimit number
function WarpDeplete:SetTimeLimit(timeLimit)
	if not self.state then self.state = {} end
	self.state.timeLimit = timeLimit or 0
	self.state.timeLimits = {
		self.state.timeLimit,
		self.state.timeLimit * 0.8,
		self.state.timeLimit * 0.6,
	}
	if self.RenderTimer then
		self:RenderTimer()
	end
end

--- Sets current timer value
---@param timer number
function WarpDeplete:SetTimer(timer)
	if not self.state then self.state = {} end
	self.state.timer = timer or 0
	if self.RenderTimer then
		self:RenderTimer()
	end
end

--- Sets total required forces count and recalculates percentages
---@param totalCount number
function WarpDeplete:SetForcesTotal(totalCount)
	if not self.state then self.state = {} end
	totalCount = totalCount or 100
	self.state.totalCount = totalCount

	local pullCount = self.state.pullCount or 0
	self.state.pullPercent = totalCount > 0 and pullCount / totalCount or 0

	local currentCount = self.state.currentCount or 0
	local currentPercent = totalCount > 0 and currentCount / totalCount or 0
	self.state.currentPercent = math.min(currentPercent, 1.0)

	if self.RenderForces then
		self:RenderForces()
	end
end

--- Sets current engaged / killed forces count and recalculates percentages
---@param currentCount number
function WarpDeplete:SetForcesCurrent(currentCount)
	if not self.state then self.state = {} end
	currentCount = currentCount or 0

	if not self.state.currentCount or currentCount >= self.state.currentCount or self.state.demoModeActive then
		self.state.currentCount = currentCount
	end

	local total = (self.state.totalCount and self.state.totalCount > 0) and self.state.totalCount or 100
	local currentPercent = (self.state.currentCount or 0) / total
	self.state.currentPercent = math.min(currentPercent, 1.0)

	if self.RenderForces then
		self:RenderForces()
	end
end

--- Sets current in-combat pull forces count and recalculates pull percentage
---@param pullCount number
function WarpDeplete:SetForcesPull(pullCount)
	if not self.state then self.state = {} end
	pullCount = pullCount or 0
	self.state.pullCount = pullCount

	local total = (self.state.totalCount and self.state.totalCount > 0) and self.state.totalCount or 100
	self.state.pullPercent = total > 0 and pullCount / total or 0

	if self.RenderForces then
		self:RenderForces()
	end
end

--- Resets currently active pull data and forces pull counter
function WarpDeplete:ResetCurrentPull()
	if not self.state then self.state = {} end
	if not self.state.currentPull then
		self.state.currentPull = {}
	else
		for k in pairs(self.state.currentPull) do
			self.state.currentPull[k] = nil
		end
	end
	self:SetForcesPull(0)
end

--- Updates death count and calculated time lost
---@param count number?
---@param timeLost number?
function WarpDeplete:SetDeathCount(count, timeLost)
	if not self.state then self.state = {} end
	count = count or 0
	timeLost = timeLost or (count * 5)
	self.state.deathCount = count
	self.state.deathTimeLost = timeLost
	if self.RenderDeaths then
		self:RenderDeaths()
	end
end

--- Appends an entry to death details history
---@param time number
---@param name string
---@param class string
function WarpDeplete:AddDeathDetails(time, name, class)
	if not self.state then self.state = {} end
	if not self.state.deathDetails then self.state.deathDetails = {} end
	self.state.deathDetails[#self.state.deathDetails + 1] = {
		time = time or 0,
		name = name or "Unknown",
		class = class or "PRIEST",
	}
end

--- Records a confirmed player death with timestamp and class
---@param destName string
---@param class string?
---@param deathTime number?
function WarpDeplete:RecordDeath(destName, class, deathTime)
	if not self.state then
		self.state = {}
	end
	if not self.state.inChallenge or self.state.challengeCompleted then
		return
	end

	local resolvedTime = deathTime
	if not resolvedTime then
		if self.state.timer and self.state.timer > 0 then
			resolvedTime = self.state.timer
		elseif GetWorldElapsedTime then
			local _, worldElapsed = GetWorldElapsedTime(1)
			resolvedTime = worldElapsed or 0
		else
			resolvedTime = 0
		end
	end

	class = class or "PRIEST"
	destName = destName or "Unknown"

	self.state.deathCount = (self.state.deathCount or 0) + 1
	self.state.deathTimeLost = self.state.deathCount * 5

	if not self.state.deathDetails then
		self.state.deathDetails = {}
	end
	self.state.deathDetails[#self.state.deathDetails + 1] = {
		time = resolvedTime,
		name = destName,
		class = class,
	}

	if self.RenderDeaths then
		self:RenderDeaths()
	end
end

--- Caches party members' GUIDs, names, and English class tokens
function WarpDeplete:UpdatePartyCache()
	if not self.state then self.state = {} end
	self.state.partyCache = {}

	if UnitName and UnitClass and UnitGUID then
		local pName = UnitName("player")
		local _, pClass = UnitClass("player")
		local pGUID = UnitGUID("player")
		if pGUID then
			self.state.partyCache[pGUID] = { name = pName, class = pClass or "PRIEST", unit = "player" }
		end

		for i = 1, 4 do
			local unit = "party" .. i
			if UnitExists and UnitExists(unit) then
				local uGUID = UnitGUID(unit)
				local uName = UnitName(unit)
				local _, uClass = UnitClass(unit)
				if uGUID then
					self.state.partyCache[uGUID] = { name = uName, class = uClass or "PRIEST", unit = unit }
				end
			end
		end
	end
end

-- ============================================================================
-- Feature 16: Scenario & Boss Criteria Detection
-- ============================================================================

--- Unified criteria info getter supporting Legion multi-return & modern struct formats
---@param criteriaIndex number
---@return table|nil
local function GetCriteriaInfo(criteriaIndex)
	if C_ScenarioInfo and C_ScenarioInfo.GetCriteriaInfo then
		local info = C_ScenarioInfo.GetCriteriaInfo(criteriaIndex)
		if type(info) == "table" then
			return info
		end
	end

	if C_Scenario and C_Scenario.GetCriteriaInfo then
		local ret1, ret2, ret3, ret4, ret5, ret6, ret7, ret8, ret9, ret10, ret11, ret12, ret13 = C_Scenario.GetCriteriaInfo(criteriaIndex)
		if type(ret1) == "table" then
			return ret1
		end
		if ret1 ~= nil then
			return {
				description = ret1,
				criteriaType = ret2,
				completed = ret3,
				quantity = ret4,
				totalQuantity = ret5,
				flags = ret6,
				assetID = ret7,
				quantityString = ret8,
				criteriaID = ret9,
				duration = ret10,
				elapsed = ret11,
				criteriaFlags = ret12,
				isWeightedProgress = ret13,
			}
		end
	end

	return nil
end

--- Queries EncounterJournal for boss and encounter names
---@return table|nil result, table|nil encounterResults
function WarpDeplete:GetEJObjectiveNames()
	local instanceID = Util and Util.getEJInstanceID and Util.getEJInstanceID()
	if not instanceID then
		return nil
	end

	local wasShown = EncounterJournal and EncounterJournal.IsShown and EncounterJournal:IsShown()
	if not wasShown then
		if C_AddOns and C_AddOns.LoadAddOn then
			C_AddOns.LoadAddOn("Blizzard_EncounterJournal")
		elseif LoadAddOn then
			LoadAddOn("Blizzard_EncounterJournal")
		end
	end

	if EncounterJournal_OpenJournal then
		EncounterJournal_OpenJournal(8, instanceID)
	end

	if not wasShown and HideUIPanel and EncounterJournal then
		HideUIPanel(EncounterJournal)
	end

	local result = {}
	local encounterResults = {}

	if EJ_SelectInstance then
		EJ_SelectInstance(instanceID)
	end

	if EJ_GetEncounterInfoByIndex then
		for i = 1, 20 do
			local name, _, _, _, _, _, dungeonEncounterID = EJ_GetEncounterInfoByIndex(i, instanceID)
			if name then
				result[#result + 1] = name
				if dungeonEncounterID then
					encounterResults[dungeonEncounterID] = name
				end
			end
		end
	end

	if #result == 0 then
		return nil
	end

	return result, encounterResults
end

--- Resolves clean boss objective name using EncounterJournal with fallback to string filtering
---@param description string
---@param index number
---@param dungeonEncounterID number?
---@return string
function WarpDeplete:FindObjectiveName(description, index, dungeonEncounterID)
	if dungeonEncounterID and self.state and self.state.ejEncounterNames and self.state.ejEncounterNames[dungeonEncounterID] then
		local name = self.state.ejEncounterNames[dungeonEncounterID]
		return Util and Util.utf8Sub and Util.utf8Sub(name, 40) or name
	end

	if self.state and self.state.ejObjectiveNames and self.state.ejObjectiveNames[index] then
		local name = self.state.ejObjectiveNames[index]
		return Util and Util.utf8Sub and Util.utf8Sub(name, 40) or name
	end

	local filtered = (Util and Util.formatObjectiveName and Util.formatObjectiveName(description)) or description or ""
	return Util and Util.utf8Sub and Util.utf8Sub(filtered, 40) or filtered
end

--- Refreshes boss names with EncounterJournal retry loop
---@param count number?
function WarpDeplete:RefreshObjectiveNames(count)
	count = count or 6
	self.state.ejObjectiveNames, self.state.ejEncounterNames = self:GetEJObjectiveNames()
	if not self.state.ejObjectiveNames then
		if count > 0 and C_Timer and C_Timer.After then
			C_Timer.After(2, function()
				self:RefreshObjectiveNames(count - 1)
			end)
		end
		return
	end

	if self.state and self.state.objectives then
		for i, boss in ipairs(self.state.objectives) do
			boss.name = self:FindObjectiveName(boss.description, i, boss.dungeonEncounterID)
		end
	end
end

--- Iterates scenario criteria, detects boss criteria and enemy forces progress
function WarpDeplete:UpdateObjectives()
	if not self.state then self.state = {} end
	if not self.state.objectives then self.state.objectives = {} end

	local stepCount
	if C_Scenario and C_Scenario.GetStepInfo then
		stepCount = select(3, C_Scenario.GetStepInfo())
	end
	if not stepCount or stepCount <= 0 then
		return
	end

	local completionChanged = false
	local bossesLoaded = false

	for i = 1, 10 do
		if i > stepCount then
			if self.state.objectives[i] then
				bossesLoaded = true
			end
			self.state.objectives[i] = nil
		else
			local info = GetCriteriaInfo(i)
			if info then
				if not info.isWeightedProgress then
					local dungeonEncounterID = (info.criteriaType == 165 and info.assetID) or nil
					local name = self:FindObjectiveName(info.description, i, dungeonEncounterID)

					if not self.state.objectives[i] or self.state.objectives[i].name ~= name then
						self.state.objectives[i] = {
							name = name,
							description = info.description,
							time = nil,
							dungeonEncounterID = dungeonEncounterID,
						}
						bossesLoaded = true
					end

					local objective = self.state.objectives[i]
					if not objective.time and info.completed then
						local worldElapsed = 0
						if GetWorldElapsedTime then
							local _, we = GetWorldElapsedTime(1)
							worldElapsed = we or 0
						elseif self.state.timer then
							worldElapsed = self.state.timer
						end
						local time = worldElapsed - (info.elapsed or 0)
						objective.time = time
						completionChanged = true
					end

				elseif info.isWeightedProgress and info.totalQuantity and info.totalQuantity > 0 then
					if self.state.objectives[i] then
						bossesLoaded = true
					end
					self.state.objectives[i] = nil

					local currentCount = 0
					if info.quantityString then
						currentCount = tonumber(info.quantityString:match("%d+")) or 0
					elseif info.quantity then
						currentCount = info.quantity
					end

					if currentCount ~= self.state.currentCount then
						self:SetForcesCurrent(currentCount)
					end

					if info.totalQuantity ~= self.state.totalCount then
						self:SetForcesTotal(info.totalQuantity)
					end

					if currentCount >= info.totalQuantity then
						if not self.state.forcesCompleted then
							self.state.forcesCompleted = true
							if self.RenderForces then
								self:RenderForces()
							end
						end

						if not self.state.forcesCompletionTime then
							local worldElapsed = 0
							if GetWorldElapsedTime then
								local _, we = GetWorldElapsedTime(1)
								worldElapsed = we or 0
							elseif self.state.timer then
								worldElapsed = self.state.timer
							end
							self.state.forcesCompletionTime = worldElapsed - (info.elapsed or 0)
							completionChanged = true
						end
					end
				end
			end
		end
	end

	if bossesLoaded then
		if self.RenderObjectives then self:RenderObjectives() end
		if self.RenderLayout then self:RenderLayout() end

		if not self.state.ejObjectiveNames then
			self:RefreshObjectiveNames()
		end
	end

	if completionChanged then
		if self.UpdateSplits then self:UpdateSplits() end
		if self.RenderForces then self:RenderForces() end
		if self.RenderObjectives then self:RenderObjectives() end
	end
end

-- ============================================================================
-- Interface Contract Aliases (PROJECT.md Core <-> State Contract)
-- ============================================================================

function State:Init()
	return WarpDeplete:ResetState()
end

function State:ResetState()
	return WarpDeplete:ResetState()
end

function State:SetTimeLimit(timeLimit)
	return WarpDeplete:SetTimeLimit(timeLimit)
end

function State:SetTimer(timer)
	return WarpDeplete:SetTimer(timer)
end

function State:SetDeathCount(count, timeLost)
	return WarpDeplete:SetDeathCount(count, timeLost)
end

function State:RecordDeath(destName, class, deathTime)
	return WarpDeplete:RecordDeath(destName, class, deathTime)
end

function State:UpdatePartyCache()
	return WarpDeplete:UpdatePartyCache()
end

function State:GetState()
	return WarpDeplete.state
end

function State:UpdateCriteria()
	return WarpDeplete:UpdateObjectives()
end

function State:UpdateObjectives()
	return WarpDeplete:UpdateObjectives()
end

function State:SetForcesTotal(total)
	return WarpDeplete:SetForcesTotal(total)
end

function State:SetForcesCurrent(current)
	return WarpDeplete:SetForcesCurrent(current)
end

function State:SetForcesPull(pull)
	return WarpDeplete:SetForcesPull(pull)
end

function State:ResetCurrentPull()
	return WarpDeplete:ResetCurrentPull()
end

function State:SetKeyDetails(level, hasChallengersPeril, affixes, affixIds, mapId)
	return WarpDeplete:SetKeyDetails(level, hasChallengersPeril, affixes, affixIds, mapId)
end
