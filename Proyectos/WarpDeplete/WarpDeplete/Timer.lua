--[[
	WarpDeplete Legion 7.3.5 Recreation
	Module: Timer.lua
	Description: 10Hz OnUpdate loop, GetWorldElapsedTime sync, start/stop lifecycle
]]

local ADDON_NAME, AddonTable = ...
local WarpDeplete = _G.WarpDeplete or AddonTable or {}

local Timer = WarpDeplete.Timer or {}
WarpDeplete.Timer = Timer

local Util = WarpDeplete.Util

local UPDATE_INTERVAL = 0.1
local sinceLastUpdate = 0

--- High-performance 10Hz OnUpdate tick handler
---@param elapsed number
function WarpDeplete:OnTimerTick(elapsed)
	sinceLastUpdate = sinceLastUpdate + (elapsed or 0)
	if sinceLastUpdate <= UPDATE_INTERVAL then
		return
	end
	sinceLastUpdate = 0

	if not self.state then
		self.state = {}
	end

	if self.state.challengeCompleted then
		return
	end

	-- Synchronize with server world elapsed timer (ID 1 = Active Challenge Mode)
	local _, worldElapsed
	if GetWorldElapsedTime then
		_, worldElapsed = GetWorldElapsedTime(1)
	end

	if worldElapsed and worldElapsed > 0 then
		self.state.timer = worldElapsed
	elseif self.state.timerStarted and self.state.startTime and GetTime then
		self.state.timer = (GetTime() - self.state.startTime) + (self.state.startOffset or 0)
	else
		self.state.timer = self.state.timer or 0
	end

	-- Detect transition from countdown (0s) to active running timer
	if self.state.timer > 0 and not self.state.timerStarted then
		self.state.timerStarted = true
		if not self.state.startTime and GetTime then
			self.state.startTime = GetTime() - self.state.timer
		end
		if self.RenderForces then
			self:RenderForces()
		end
		if self.RenderObjectives then
			self:RenderObjectives()
		end
	end

	-- Render main timer text and chest bars
	if self.RenderTimer then
		self:RenderTimer()
	end
end

--- Starts the 10Hz frame OnUpdate loop
function WarpDeplete:StartTimerLoop()
	if not self.state then
		self.state = {}
	end

	if self.state.timerLoopRunning then
		return
	end

	self.state.timerLoopRunning = true
	sinceLastUpdate = 0

	if not self.state.startTime and GetTime then
		self.state.startTime = GetTime()
	end

	-- Ensure root frame exists before attaching script
	if not self.frames or not self.frames.root then
		if self.InitRender then
			self:InitRender()
		end
	end

	if self.frames and self.frames.root then
		self.frames.root:SetScript("OnUpdate", function(_, elapsed)
			WarpDeplete:OnTimerTick(elapsed)
		end)
	end
end

--- Freezes and stops the OnUpdate timer loop
function WarpDeplete:StopTimerLoop()
	sinceLastUpdate = 0
	if self.state then
		self.state.timerLoopRunning = false
	end

	if self.frames and self.frames.root then
		self.frames.root:SetScript("OnUpdate", nil)
	end
end

-- ============================================================================
-- Interface Contract Aliases (PROJECT.md Core <-> Timer Contract)
-- ============================================================================

function Timer:Start()
	WarpDeplete:StartTimerLoop()
end

function Timer:Stop()
	WarpDeplete:StopTimerLoop()
end

function Timer:OnTimerTick(elapsed)
	WarpDeplete:OnTimerTick(elapsed)
end

function Timer:GetElapsedTime()
	return (WarpDeplete.state and WarpDeplete.state.timer) or 0
end

function Timer:IsRunning()
	return (WarpDeplete.state and WarpDeplete.state.timerLoopRunning) or false
end
