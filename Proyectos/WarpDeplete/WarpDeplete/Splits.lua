--[[
	WarpDeplete Legion 7.3.5 Recreation
	Module: Splits.lua
	Description: Objective Splits, Personal Best Tracking & Fallback Level Comparisons
]]

local ADDON_NAME, AddonTable = ...
local WarpDeplete = _G.WarpDeplete or AddonTable or {}

local Splits = WarpDeplete.Splits or {}
WarpDeplete.Splits = Splits

local Util = WarpDeplete.Util

--- Auto-vivifying accessor for personal best split data per map and key level
---@param mapId number
---@param keystoneLevel number
---@return table keystoneSplits
function WarpDeplete:GetSplits(mapId, keystoneLevel)
	if not self.db or not self.db.global then return {} end

	local mapSplits = self.db.global.splits[mapId]
	if not mapSplits then
		mapSplits = {}
		self.db.global.splits[mapId] = mapSplits
	end

	local keystoneSplits = mapSplits[keystoneLevel]
	if not keystoneSplits then
		keystoneSplits = {}
		mapSplits[keystoneLevel] = keystoneSplits
	end

	return keystoneSplits
end

--- Returns splits table for the active dungeon session
---@return table|nil
function WarpDeplete:GetSplitsForCurrentInstance()
	if not self.state or not self.state.mapId or not self.state.level then
		return nil
	end
	return self:GetSplits(self.state.mapId, self.state.level)
end

--- Returns reference split records and the keystone level they belong to.
--- If records exist for current level, returns those. Otherwise applies fallback
--- behavior configured in db.profile.fallbackSplitBehavior (or splitFallbackLevel).
---@return table|nil referenceSplits, number|nil sourceLevel
function WarpDeplete:GetReferenceSplits()
	if not self.state or not self.state.mapId or not self.state.level then
		return nil, nil
	end

	local currentSplits = self:GetSplits(self.state.mapId, self.state.level)

	-- If current level has records, use them directly
	if currentSplits and currentSplits.best and next(currentSplits.best) then
		return currentSplits, self.state.level
	end

	local p = self.db and self.db.profile
	local behavior = (p and (p.fallbackSplitBehavior or p.splitFallbackLevel)) or "none"
	if behavior == "none" then
		return currentSplits, nil
	end

	local mapSplits = self.db.global.splits[self.state.mapId]
	if not mapSplits then
		return currentSplits, nil
	end

	local levels = {}
	for level, data in pairs(mapSplits) do
		if data.best and next(data.best) then
			table.insert(levels, level)
		end
	end

	if #levels == 0 then
		return currentSplits, nil
	end

	table.sort(levels)

	local targetLevel = nil
	if behavior == "highest" then
		targetLevel = levels[#levels]
	elseif behavior == "lowest" then
		targetLevel = levels[1]
	elseif behavior == "closest_higher" then
		for _, l in ipairs(levels) do
			if l > self.state.level then
				targetLevel = l
				break
			end
		end
		if not targetLevel then
			targetLevel = levels[#levels]
		end
	elseif behavior == "closest_lower" then
		for i = #levels, 1, -1 do
			if levels[i] < self.state.level then
				targetLevel = levels[i]
				break
			end
		end
		if not targetLevel then
			targetLevel = levels[1]
		end
	end

	if targetLevel then
		return mapSplits[targetLevel], targetLevel
	end

	return currentSplits, nil
end

--- Updates current instance split completion times and calculates deltas vs reference PB
function WarpDeplete:UpdateSplits()
	local splits = self:GetSplitsForCurrentInstance()
	if not splits then
		return
	end

	local best = splits.best
	if not best then
		best = {}
		splits.best = best
	end

	local current = splits.current
	if not current then
		current = {}
		splits.current = current
	end

	local currentDiff = splits.currentDiff
	if not currentDiff then
		currentDiff = {}
		splits.currentDiff = currentDiff
	end

	local referenceSplits = self:GetReferenceSplits()
	local referenceBest = (referenceSplits and referenceSplits.best) or best

	-- 1. Boss Objectives
	if self.state and self.state.objectives then
		for i, boss in ipairs(self.state.objectives) do
			if boss.time and boss.time ~= current[i] then
				current[i] = boss.time
				if referenceBest[i] then
					currentDiff[i] = boss.time - referenceBest[i]
				end
			elseif not boss.time then
				current[i] = nil
				currentDiff[i] = nil
			end
		end
	end

	-- 2. Enemy Forces
	if self.state and self.state.forcesCompleted and self.state.forcesCompletionTime ~= current.forces then
		current.forces = self.state.forcesCompletionTime
		if referenceBest.forces then
			currentDiff.forces = self.state.forcesCompletionTime - referenceBest.forces
		end
	elseif self.state and not self.state.forcesCompleted then
		current.forces = nil
		currentDiff.forces = nil
	end

	-- 3. Challenge Run Completion
	if self.state and self.state.challengeCompleted and self.state.completionTimeMs ~= current.challenge then
		current.challenge = self.state.completionTimeMs
		if referenceBest.challenge then
			currentDiff.challenge = self.state.completionTimeMs - referenceBest.challenge
		end
	elseif self.state and not self.state.challengeCompleted then
		current.challenge = nil
		currentDiff.challenge = nil
	end
end

--- Returns the time difference between current run and reference best for an objective
---@param objective number|"forces"|"challenge"
---@return number|nil
function WarpDeplete:GetCurrentDiff(objective)
	if self.state and self.state.demoModeActive then
		if type(objective) == "number" then
			return -60 + (objective * 30)
		elseif objective == "forces" then
			return -40
		elseif objective == "challenge" then
			return 100 * 1000
		end
		return 0
	end

	local splits = self:GetSplitsForCurrentInstance()
	if not splits or not splits.currentDiff then
		return nil
	end

	return splits.currentDiff[objective]
end

--- Returns the reference best time and source level for an objective
---@param objective number|"forces"|"challenge"
---@return number|nil best, number|nil sourceLevel
function WarpDeplete:GetBestSplit(objective)
	if self.state and self.state.demoModeActive then
		if type(objective) == "number" then
			return 60 * 3 * objective, nil
		elseif objective == "forces" then
			return 60 * 30, nil
		elseif objective == "challenge" then
			return 60 * 36 * 1000, nil
		end
		return 0, nil
	end

	local splits, sourceLevel = self:GetReferenceSplits()
	if not splits or not splits.best then
		return nil, nil
	end

	return splits.best[objective], sourceLevel
end

--- Clears runtime current run splits and deltas
function WarpDeplete:ResetCurrentSplits()
	local splits = self:GetSplitsForCurrentInstance()
	if not splits then return end
	splits.current = {}
	splits.currentDiff = {}
end

--- Evaluates completed run splits against stored bests, updating improved times
function WarpDeplete:UpdateBestSplits()
	local splits = self:GetSplitsForCurrentInstance()
	if not splits or not splits.current then
		return
	end

	if not splits.best then
		splits.best = {}
	end

	for k, v in pairs(splits.current) do
		if not splits.best[k] then
			splits.best[k] = v
		elseif splits.best[k] > v then
			splits.best[k] = v
		end
	end
end

-- ============================================================================
-- Interface Contract Aliases (PROJECT.md State <-> Splits Contract)
-- ============================================================================

--- State ↔ Splits Contract: Records split time for criteria and updates diffs
---@param criteriaIndex number|"forces"|"challenge"
---@param time number
---@return number|nil diff
function Splits:OnObjectiveCompleted(criteriaIndex, time)
	if not WarpDeplete.state then return nil end

	if type(criteriaIndex) == "number" then
		if not WarpDeplete.state.objectives then
			WarpDeplete.state.objectives = {}
		end
		if not WarpDeplete.state.objectives[criteriaIndex] then
			WarpDeplete.state.objectives[criteriaIndex] = { name = "Boss " .. criteriaIndex }
		end
		WarpDeplete.state.objectives[criteriaIndex].time = time
	elseif criteriaIndex == "forces" then
		WarpDeplete.state.forcesCompleted = true
		WarpDeplete.state.forcesCompletionTime = time
	elseif criteriaIndex == "challenge" then
		WarpDeplete.state.challengeCompleted = true
		WarpDeplete.state.completionTimeMs = time
	end

	WarpDeplete:UpdateSplits()

	if WarpDeplete.RenderObjectives then WarpDeplete:RenderObjectives() end
	if WarpDeplete.RenderForces then WarpDeplete:RenderForces() end
	if WarpDeplete.RenderTimer then WarpDeplete:RenderTimer() end

	return WarpDeplete:GetCurrentDiff(criteriaIndex)
end

--- State ↔ Splits Contract: Retrieves stored personal best time for map/level/criteria
---@param mapId number?
---@param level number?
---@param criteriaIndex number|"forces"|"challenge"
---@return number|nil
function Splits:GetBestTime(mapId, level, criteriaIndex)
	if mapId and level then
		local splits = WarpDeplete:GetSplits(mapId, level)
		return splits and splits.best and splits.best[criteriaIndex]
	end
	local best = WarpDeplete:GetBestSplit(criteriaIndex)
	return best
end

Splits.UpdateSplits = function(self) return WarpDeplete:UpdateSplits() end
Splits.UpdateBestSplits = function(self) return WarpDeplete:UpdateBestSplits() end
Splits.GetCurrentDiff = function(self, obj) return WarpDeplete:GetCurrentDiff(obj) end
Splits.GetBestSplit = function(self, obj) return WarpDeplete:GetBestSplit(obj) end
Splits.ResetCurrentSplits = function(self) return WarpDeplete:ResetCurrentSplits() end
