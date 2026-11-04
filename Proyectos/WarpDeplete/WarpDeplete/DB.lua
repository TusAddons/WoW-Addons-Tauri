-- ============================================================================
-- WarpDeplete: DB.lua (Legion 7.3.5 Recreation)
-- Database schema, AceDB-3.0 initialization, defaults table, and profile hooks
-- ============================================================================

local ADDON_NAME, AddonTable = ...
local WarpDeplete = _G.WarpDeplete or AddonTable or {}

local defaults = {
	global = {
		DEBUG = false,
		mdtAlertShown = false,
		splits = {},
	},

	char = {
		currentChallenge = {
			mapId = nil,
		},
	},

	profile = {
		-- Positioning & Scale
		frameScale = 1.0,
		frameAnchor = "RIGHT",
		frameX = -20,
		frameY = 0,
		unlocked = false,

		-- Element Visibility Toggles
		showDeaths = true,
		showForces = true,
		showObjectives = true,
		showSplits = true,
		splitsEnabled = true,
		showMillisecondsWhenDungeonCompleted = true,

		-- Alignments
		alignTexts = "right",
		alignBarTexts = "right",
		alignBossClear = "start",

		-- Layout Dimensions & Offsets
		barWidth = 360,
		barHeight = 10,
		barPadding = 3.8,
		timerBarOffsetX = 5,
		barFontOffsetX = 3,
		barFontOffsetY = 3,
		framePadding = 20,
		barFramePaddingTop = 4,
		barFramePaddingBottom = 10,
		verticalOffset = 2,
		objectivesOffset = 4,

		-- Font Families
		deathsFont = "Expressway",
		timerFont = "Expressway",
		timerSplitFont = "Expressway",
		keyFont = "Expressway",
		keyDetailsFont = "Expressway",
		bar1Font = "Expressway",
		bar2Font = "Expressway",
		bar3Font = "Expressway",
		forcesFont = "Expressway",
		objectivesFont = "Expressway",

		-- Font Flags ("OUTLINE", "THICKOUTLINE", "MONOCHROME", "")
		deathsFontFlags = "OUTLINE",
		timerFontFlags = "OUTLINE",
		timerSplitFontFlags = "OUTLINE",
		keyFontFlags = "OUTLINE",
		keyDetailsFontFlags = "OUTLINE",
		bar1FontFlags = "OUTLINE",
		bar2FontFlags = "OUTLINE",
		bar3FontFlags = "OUTLINE",
		forcesFontFlags = "OUTLINE",
		objectivesFontFlags = "OUTLINE",

		-- Font Sizes
		deathsFontSize = 16,
		timerFontSize = 34,
		timerSplitFontSize = 20,
		keyFontSize = 20,
		keyDetailsFontSize = 16,
		objectivesFontSize = 18,
		bar1FontSize = 16,
		bar2FontSize = 16,
		bar3FontSize = 16,
		forcesFontSize = 16,

		-- Colors (ARGB Hex)
		deathsColor = "FFFFFFFF",
		timerRunningColor = "FFFFFFFF",
		timerExpiredColor = "FFFF2A2E",
		timerSuccessColor = "FFFFD338",
		keyColor = "FFB1B1B1",
		keyDetailsColor = "FFB1B1B1",
		forcesColor = "FFFFFFFF",
		completedForcesColor = "FF00FF24",
		objectivesColor = "FFFFFFFF",
		completedObjectivesColor = "FF00FF24",

		-- Bar Textures
		backdropTexture = "WarpDeplete Blank",
		bar1Texture = "WarpDeplete Blank",
		bar2Texture = "WarpDeplete Blank",
		bar3Texture = "WarpDeplete Blank",
		forcesTexture = "WarpDeplete Blank",
		forcesOverlayTexture = "WarpDeplete Blank",

		-- Bar Colors (ARGB Hex)
		backdropTextureColor = "80000000",
		bar1TextureColor = "FF979797",
		bar2TextureColor = "FF979797",
		bar3TextureColor = "FF979797",
		forcesTextureColor = "FFBB9E22",
		forcesOverlayTextureColor = "FFFF5515",

		-- Forces Glow & Pull Alerts
		showForcesGlow = true,
		demoForcesGlow = false,
		forcesGlowColor = "FFD12F14",
		forcesGlowLineCount = 18,
		forcesGlowFrequency = 0.13,
		forcesGlowLength = 10,
		forcesGlowThickness = 2,

		-- Forces & Tooltip Formats
		forcesFormat = ":percent:",
		customForcesFormat = ":percent:",
		currentPullFormat = "(+:percent:)",
		customCurrentPullFormat = "(+:percent:)",
		showTooltipCount = true,
		tooltipCountFormat = "+:count: / :percent:",
		customTooltipCountFormat = "+:count: / :percent:",

		-- Deaths Tooltip & Log
		showDeathsTooltip = true,
		deathLogStyle = "time",

		-- Splits & Personal Best Tracking
		showSplitRecords = "countdown",
		splitFallbackLevel = "none",
		fallbackSplitBehavior = "none",
		splitFasterTimeColor = "FF64FF64",
		splitSlowerTimeColor = "FFFF5656",
		splitRecordsColor = "FFAAAAAA",

		-- Automation
		insertKeystoneAutomatically = true,
	},
}

--- Initializes the AceDB database and hooks profile lifecycle callbacks.
function WarpDeplete:InitDb()
	if not LibStub then return end
	local aceDB = LibStub("AceDB-3.0", true)
	if not aceDB then return end

	self.db = aceDB:New("WarpDepleteDB", defaults, true)

	-- Register profile lifecycle callbacks to synchronize UI state immediately
	self.db.RegisterCallback(self, "OnProfileChanged", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileCopied", "OnProfileChanged")
	self.db.RegisterCallback(self, "OnProfileReset", "OnProfileChanged")
end

--- Handler invoked when the user switches, copies, or resets the active AceDB profile.
function WarpDeplete:OnProfileChanged()
	if not self.db or not self.db.profile then return end

	-- Sync unlock state if defined
	if self.db.profile.unlocked ~= nil and self.SetUnlocked then
		self:SetUnlocked(self.db.profile.unlocked)
	end

	-- Re-render UI elements if Render system is initialized
	if self.RenderLayout then
		self:RenderLayout()
	end
	if self.RenderForces then
		self:RenderForces()
	end
	if self.RenderTimer then
		self:RenderTimer()
	end
	if self.RenderObjectives then
		self:RenderObjectives()
	end
	if self.UpdateGlowAppearance then
		self:UpdateGlowAppearance()
	end
end

-- Export DB sub-table to conform to PROJECT.md interface contract
WarpDeplete.DB = {
	defaults = defaults,
	Init = function(self)
		WarpDeplete:InitDb()
	end,
}
