--[[
	WarpDeplete Legion 7.3.5 Recreation
	Module: Render.lua
	Description: Core Frame Hierarchy, StatusBars, Layout Geometry, Fonts & Textures
]]

local ADDON_NAME, AddonTable = ...
local WarpDeplete = _G.WarpDeplete or AddonTable or {}
local Render = WarpDeplete.Render or {}
WarpDeplete.Render = Render

local Util = WarpDeplete.Util

-- Reusable state buffer for 10Hz OnUpdate timer rendering
local timerState = {}

-- Safe Media Fetch Helpers with Legion Hardcoded Fallbacks
local function FetchFont(fontName)
	local path = WarpDeplete.LSM and WarpDeplete.LSM:Fetch("font", fontName)
	return path or [[Interface\AddOns\WarpDeplete\Media\Fonts\Expressway.ttf]]
end

local function FetchStatusBar(texName)
	local path = WarpDeplete.LSM and WarpDeplete.LSM:Fetch("statusbar", texName)
	return path or [[Interface\AddOns\WarpDeplete\Media\Textures\white.tga]]
end

local function FetchBorder(borderName)
	local path = WarpDeplete.LSM and WarpDeplete.LSM:Fetch("border", borderName)
	return path or [[Interface\AddOns\WarpDeplete\Media\Textures\white.tga]]
end

--- Initializes all frames, statusbars, textures, and fontstrings
function WarpDeplete:InitRender()
	if not self.frames then
		self.frames = {}
	end

	-- 1. Root Frame (WarpDepleteFrame)
	if not self.frames.root then
		local root = CreateFrame("Frame", "WarpDepleteFrame", UIParent)
		root:SetFrameStrata("MEDIUM")
		root:SetClampedToScreen(true)
		root:SetMovable(false)
		root:EnableMouse(false)

		-- Root background texture (highlighted when unlocked)
		root.texture = root:CreateTexture(nil, "BACKGROUND")
		root.texture:SetAllPoints(root)
		root.texture:SetColorTexture(0, 0, 0, 0)

		-- Legion native backdrop for visual unlock bounding box
		root:SetBackdrop({
			bgFile = "Interface\\Buttons\\WHITE8X8",
			edgeFile = "Interface\\Buttons\\WHITE8X8",
			edgeSize = 1,
			insets = { left = 0, right = 0, top = 0, bottom = 0 }
		})
		root:SetBackdropColor(0, 0, 0, 0)
		root:SetBackdropBorderColor(0, 0, 0, 0)

		-- Dragging scripts
		root:SetScript("OnMouseDown", function(frame, button)
			if self.isUnlocked and button == "LeftButton" and not frame.isMoving then
				frame:StartMoving()
				frame.isMoving = true
			end
		end)

		root:SetScript("OnMouseUp", function(frame, button)
			if button == "LeftButton" and frame.isMoving then
				frame:StopMovingOrSizing()
				frame.isMoving = false

				local frameAnchor, _, _, frameX, frameY = frame:GetPoint(1)
				if frameAnchor and self.db and self.db.profile then
					self.db.profile.frameAnchor = frameAnchor
					self.db.profile.frameX = frameX
					self.db.profile.frameY = frameY
				end
			end
		end)

		root:SetScript("OnHide", function(frame)
			if frame.isMoving then
				frame:StopMovingOrSizing()
				frame.isMoving = false
			end
		end)

		self.frames.root = root
	end

	-- 2. Deaths Text & Deaths Tooltip Hit-Box
	if not self.frames.root.deathsText then
		self.frames.root.deathsText = self.frames.root:CreateFontString(nil, "ARTWORK")
	end

	if not self.frames.deathsTooltip then
		local tooltipFrame = CreateFrame("Frame", "WarpDepleteDeathsTooltip", self.frames.root)
		tooltipFrame:EnableMouse(true)
		self.frames.deathsTooltip = tooltipFrame
		self:InitDeathsTooltip()
	end

	-- 3. Timer Text & Timer Split Text
	if not self.frames.root.timerText then
		self.frames.root.timerText = self.frames.root:CreateFontString(nil, "ARTWORK")
	end

	if not self.frames.root.timerSplitText then
		self.frames.root.timerSplitText = self.frames.root:CreateFontString(nil, "ARTWORK")
	end

	-- 4. Key Text & Key Details Text
	if not self.frames.root.keyText then
		self.frames.root.keyText = self.frames.root:CreateFontString(nil, "ARTWORK")
	end

	if not self.frames.root.keyDetailsText then
		self.frames.root.keyDetailsText = self.frames.root:CreateFontString(nil, "ARTWORK")
	end

	-- 5. WarpDepleteBars Container Frame
	if not self.frames.bars then
		local bars = CreateFrame("Frame", "WarpDepleteBars", self.frames.root)
		bars.texture = bars:CreateTexture(nil, "BACKGROUND")
		bars.texture:SetAllPoints(bars)
		bars.texture:SetColorTexture(0, 0, 0, 0)
		self.frames.bars = bars
	end

	-- 6. Timer Chest Bars (+3, +2, +1)
	if not self.bar3 then
		local bar3 = self:CreateProgressBar(self.frames.bars)
		bar3.text = bar3.bar:CreateFontString(nil, "ARTWORK")
		self.bar3 = bar3
	end

	if not self.bar2 then
		local bar2 = self:CreateProgressBar(self.frames.bars)
		bar2.text = bar2.bar:CreateFontString(nil, "ARTWORK")
		self.bar2 = bar2
	end

	if not self.bar1 then
		local bar1 = self:CreateProgressBar(self.frames.bars)
		bar1.text = bar1.bar:CreateFontString(nil, "ARTWORK")
		self.bar1 = bar1
	end

	self.bars = { self.bar1, self.bar2, self.bar3 }

	-- 7. Forces Bar & Overlay Bar
	if not self.forces then
		local forces = self:CreateProgressBar(self.frames.bars)
		forces.text = forces.bar:CreateFontString(nil, "ARTWORK")
		forces.overlayBar = CreateFrame("StatusBar", nil, forces.frame)
		self.forces = forces
	end

	-- 8. Objectives Pool (10 FontStrings)
	if not self.frames.root.objectiveTexts then
		local objectiveTexts = {}
		for i = 1, 10 do
			objectiveTexts[i] = self.frames.root:CreateFontString(nil, "ARTWORK")
		end
		self.frames.root.objectiveTexts = objectiveTexts
	end

	-- Apply initial layout geometry if db is available
	if self.db and self.db.profile then
		self:RenderLayout()
	end
end

--- Constructs a standardized status bar with Legion native backdrop
function WarpDeplete:CreateProgressBar(parent)
	local result = {}

	-- Legion native frame with backdrop (no BackdropTemplateMixin needed)
	local barFrame = CreateFrame("Frame", nil, parent)
	result.frame = barFrame

	local bar = CreateFrame("StatusBar", nil, barFrame)
	bar:SetValue(0)
	bar:SetMinMaxValues(0, 1)
	result.bar = bar

	function result:SetLayout(barTexture, color, width, height, xOffset, yOffset)
		local r, g, b = Util.hexToRGB(color)

		barFrame:SetSize(width, height)
		barFrame:SetPoint("LEFT", xOffset, yOffset)
		barFrame:SetBackdrop({
			bgFile = FetchStatusBar(WarpDeplete.db and WarpDeplete.db.profile and WarpDeplete.db.profile.backdropTexture),
			edgeFile = FetchBorder("WarpDeplete Blank"),
			edgeSize = 1,
			insets = { top = 1, right = 1, bottom = 1, left = 1 },
		})
		local bgR, bgG, bgB, bgA = Util.hexToRGB(WarpDeplete.db and WarpDeplete.db.profile and WarpDeplete.db.profile.backdropTextureColor)
		barFrame:SetBackdropColor(bgR, bgG, bgB, bgA or 0.5)
		barFrame:SetBackdropBorderColor(0, 0, 0, 1)

		bar:SetPoint("CENTER", 0, 0)
		bar:SetSize(math.max(1, width - 2), math.max(1, height - 2))
		bar:SetStatusBarTexture(FetchStatusBar(barTexture))
		bar:SetStatusBarColor(r, g, b)
	end

	return result
end

--- Returns fractional widths for +1, +2, +3 timer chest bars
function WarpDeplete:GetTimerBarFractions()
	if not self.state or not self.state.hasChallengersPeril or not self.state.timeLimits then
		return 0.2, 0.2, 0.6
	end

	local fractions = {}
	for i = 1, 3 do
		local timeLimit = self.state.timeLimits[i] or 0
		local barMax = timeLimit - (self.state.timeLimits[i + 1] or 0)
		fractions[i] = (self.state.timeLimit and self.state.timeLimit > 0) and (barMax / self.state.timeLimit) or (i == 3 and 0.6 or 0.2)
	end

	return fractions[1] or 0.2, fractions[2] or 0.2, fractions[3] or 0.6
end

--- Toggles draggable state and visual bounding box
function WarpDeplete:SetUnlocked(unlocked)
	if self.isUnlocked == unlocked then
		return
	end

	self.isUnlocked = unlocked
	if self.db and self.db.profile then
		self.db.profile.unlocked = unlocked
	end

	if self.frames and self.frames.root then
		self.frames.root:SetMovable(unlocked)
		self.frames.root:EnableMouse(unlocked)

		if unlocked then
			self.frames.root.texture:SetColorTexture(0, 0, 0, 0.3)
			self.frames.root:SetBackdropColor(0, 0, 0, 0.3)
			self.frames.root:SetBackdropBorderColor(0.2, 0.8, 0.2, 0.8)
			self.frames.root:Show()
		else
			self.frames.root.texture:SetColorTexture(0, 0, 0, 0)
			self.frames.root:SetBackdropColor(0, 0, 0, 0)
			self.frames.root:SetBackdropBorderColor(0, 0, 0, 0)

			-- If not actively shown by dungeon session or demo mode, hide preview
			if not self.isShown and not (self.state and self.state.demoModeActive) then
				self.frames.root:Hide()
			end
		end
	end
end

--- Applies font families, sizes, outline flags, and colors
function WarpDeplete:UpdateFonts()
	if not self.db or not self.db.profile then return end
	local p = self.db.profile
	local alignRight = p.alignTexts == "right"
	local alignBarTextRight = p.alignBarTexts == "right"
	local justify = alignRight and "RIGHT" or "LEFT"
	local barJustify = alignBarTextRight and "RIGHT" or "LEFT"

	local r, g, b

	-- 1. Deaths Text
	local deathsText = self.frames.root.deathsText
	deathsText:SetFont(FetchFont(p.deathsFont), p.deathsFontSize, p.deathsFontFlags or "OUTLINE")
	deathsText:SetNonSpaceWrap(false)
	deathsText:SetJustifyH(justify)
	r, g, b = Util.hexToRGB(p.deathsColor)
	deathsText:SetTextColor(r, g, b, 1)

	-- 2. Timer Text & Split
	local timerText = self.frames.root.timerText
	timerText:SetFont(FetchFont(p.timerFont), p.timerFontSize, p.timerFontFlags or "OUTLINE")
	timerText:SetNonSpaceWrap(false)
	timerText:SetJustifyH(justify)
	r, g, b = Util.hexToRGB(p.timerRunningColor)
	timerText:SetTextColor(r, g, b, 1)

	local timerSplitText = self.frames.root.timerSplitText
	local splitFont = p.timerSplitFont or p.timerFont
	local splitFontSize = p.timerSplitFontSize or (p.timerFontSize * 0.6)
	local splitFontFlags = p.timerSplitFontFlags or p.timerFontFlags or "OUTLINE"
	timerSplitText:SetFont(FetchFont(splitFont), splitFontSize, splitFontFlags)
	timerSplitText:SetNonSpaceWrap(false)
	timerSplitText:SetJustifyH(justify)

	-- 3. Key & Key Details
	local keyText = self.frames.root.keyText
	keyText:SetFont(FetchFont(p.keyFont), p.keyFontSize, p.keyFontFlags or "OUTLINE")
	keyText:SetNonSpaceWrap(false)
	keyText:SetJustifyH(justify)
	r, g, b = Util.hexToRGB(p.keyColor)
	keyText:SetTextColor(r, g, b, 1)

	local keyDetailsText = self.frames.root.keyDetailsText
	keyDetailsText:SetFont(FetchFont(p.keyDetailsFont), p.keyDetailsFontSize, p.keyDetailsFontFlags or "OUTLINE")
	keyDetailsText:SetNonSpaceWrap(false)
	keyDetailsText:SetJustifyH(justify)
	r, g, b = Util.hexToRGB(p.keyDetailsColor)
	keyDetailsText:SetTextColor(r, g, b, 1)

	-- 4. Bar Texts
	r, g, b = Util.hexToRGB(p.timerRunningColor)
	for i, barObj in ipairs({ self.bar1, self.bar2, self.bar3 }) do
		local fontName = p["bar" .. i .. "Font"]
		local fontSize = p["bar" .. i .. "FontSize"]
		local fontFlags = p["bar" .. i .. "FontFlags"]
		barObj.text:SetFont(FetchFont(fontName), fontSize, fontFlags or "OUTLINE")
		barObj.text:SetNonSpaceWrap(false)
		barObj.text:SetJustifyH(barJustify)
		barObj.text:SetTextColor(r, g, b, 1)
	end

	-- 5. Forces Text
	local forcesText = self.forces.text
	forcesText:SetFont(FetchFont(p.forcesFont), p.forcesFontSize, p.forcesFontFlags or "OUTLINE")
	forcesText:SetNonSpaceWrap(false)
	forcesText:SetJustifyH(barJustify)
	r, g, b = Util.hexToRGB(p.forcesColor)
	forcesText:SetTextColor(r, g, b, 1)

	-- 6. Objectives Texts
	r, g, b = Util.hexToRGB(p.objectivesColor)
	for i = 1, 10 do
		local objText = self.frames.root.objectiveTexts[i]
		objText:SetFont(FetchFont(p.objectivesFont), p.objectivesFontSize, p.objectivesFontFlags or "OUTLINE")
		objText:SetNonSpaceWrap(false)
		objText:SetJustifyH(justify)
		objText:SetTextColor(r, g, b, 1)
	end
end

--- Updates statusbar textures and backdrop colors
function WarpDeplete:UpdateBars()
	if not self.db or not self.db.profile then return end
	local p = self.db.profile
	local barWidth = p.barWidth
	local barHeight = p.barHeight
	local barPadding = p.barPadding
	local timerBarOffsetX = p.timerBarOffsetX
	local timerBarPixelAdjust = 0.5
	local forcesBarPixelAdjust = 0.5

	local bar1Fraction, bar2Fraction, bar3Fraction = self:GetTimerBarFractions()

	local bar3Width = barWidth * bar3Fraction
	local bar2Width = barWidth * bar2Fraction - timerBarOffsetX
	local bar1Width = barWidth * bar1Fraction - timerBarOffsetX

	self.bar3:SetLayout(
		p.bar3Texture,
		p.bar3TextureColor,
		bar3Width,
		barHeight + timerBarPixelAdjust,
		0,
		barPadding + barHeight / 2
	)

	self.bar2:SetLayout(
		p.bar2Texture,
		p.bar2TextureColor,
		bar2Width,
		barHeight + timerBarPixelAdjust,
		bar3Width + timerBarOffsetX,
		barPadding + barHeight / 2
	)

	self.bar1:SetLayout(
		p.bar1Texture,
		p.bar1TextureColor,
		bar1Width,
		barHeight + timerBarPixelAdjust,
		bar3Width + bar2Width + timerBarOffsetX * 2,
		barPadding + barHeight / 2
	)

	self.forces:SetLayout(
		p.forcesTexture,
		p.forcesTextureColor,
		barWidth,
		barHeight + forcesBarPixelAdjust,
		0,
		-barPadding - barHeight / 2
	)

	local r, g, b = Util.hexToRGB(p.forcesOverlayTextureColor)
	self.forces.overlayBar:SetMinMaxValues(0, 1)
	self.forces.overlayBar:SetValue(0)
	self.forces.overlayBar:ClearAllPoints()
	self.forces.overlayBar:SetPoint("LEFT", 0, 0)
	self.forces.overlayBar:SetSize(math.max(1, barWidth - 2), math.max(1, barHeight - 2))
	self.forces.overlayBar:SetStatusBarTexture(FetchStatusBar(p.forcesOverlayTexture))
	self.forces.overlayBar:SetStatusBarColor(r, g, b, 0.7)
end

--- Full Layout calculation matching modern WarpDeplete dynamic height math
function WarpDeplete:RenderLayout()
	if not self.db or not self.db.profile or not self.frames or not self.frames.root then return end
	local p = self.db.profile
	local alignRight = p.alignTexts == "right"
	local alignBarTextRight = p.alignBarTexts == "right"

	local barWidth = p.barWidth
	local barHeight = p.barHeight
	local barPadding = p.barPadding
	local timerBarOffsetX = p.timerBarOffsetX
	local barFontOffsetX = p.barFontOffsetX
	local barFontOffsetY = p.barFontOffsetY

	local framePadding = p.framePadding
	local barFramePaddingTop = p.barFramePaddingTop
	local barFramePaddingBottom = p.barFramePaddingBottom
	local verticalOffset = p.verticalOffset
	local objectivesOffset = p.objectivesOffset

	-- Update root frame width, anchor and scale
	self.frames.root:SetWidth(barWidth + framePadding * 2)
	self.frames.root:ClearAllPoints()
	self.frames.root:SetPoint(p.frameAnchor, p.frameX, p.frameY)
	self.frames.root:SetScale(p.frameScale)
	self.frames.root.texture:SetAllPoints(self.frames.root)

	-- Apply font and bar styling
	self:UpdateFonts()
	self:UpdateBars()

	local currentOffset = framePadding

	-- 1. Deaths Text & Deaths Tooltip Hitbox
	local deathsText = self.frames.root.deathsText
	deathsText:ClearAllPoints()
	deathsText:SetPoint(
		alignRight and "TOPRIGHT" or "TOPLEFT",
		alignRight and -framePadding - 4 or framePadding + 4,
		-currentOffset
	)

	local deathsTooltipFrameHeight = p.deathsFontSize + verticalOffset + framePadding
	local deathsTooltipFrameWidth = deathsText:GetStringWidth() + framePadding
	self.frames.deathsTooltip.offsetWidth = deathsTooltipFrameWidth - framePadding
	self.frames.deathsTooltip:SetHeight(deathsTooltipFrameHeight)
	self.frames.deathsTooltip:SetWidth(deathsTooltipFrameWidth)
	self.frames.deathsTooltip:ClearAllPoints()
	self.frames.deathsTooltip:SetPoint(
		alignRight and "TOPRIGHT" or "TOPLEFT",
		alignRight and -framePadding * 0.5 or framePadding * 0.5,
		-framePadding * 0.5
	)

	currentOffset = currentOffset + deathsText:GetStringHeight() + verticalOffset

	-- 2. Timer Text & Timer Split Text
	local timerText = self.frames.root.timerText
	timerText:ClearAllPoints()
	timerText:SetPoint(
		alignRight and "TOPRIGHT" or "TOPLEFT",
		alignRight and -framePadding or framePadding,
		-currentOffset
	)

	local timerSplitText = self.frames.root.timerSplitText
	timerSplitText:ClearAllPoints()
	timerSplitText:SetPoint(
		alignRight and "BOTTOMRIGHT" or "BOTTOMLEFT",
		timerText,
		alignRight and "BOTTOMLEFT" or "BOTTOMRIGHT",
		alignRight and -8 or 8,
		2
	)

	currentOffset = currentOffset + timerText:GetStringHeight() + verticalOffset

	-- 3. Key Details & Key Level Text
	local keyText = self.frames.root.keyText
	local keyDetailsText = self.frames.root.keyDetailsText
	keyText:ClearAllPoints()
	keyDetailsText:ClearAllPoints()

	local keyTextHeight = keyText:GetStringHeight()
	local keyDetailsTextHeight = keyDetailsText:GetStringHeight()
	local keyRowHeight = math.max(keyTextHeight, keyDetailsTextHeight)

	if keyTextHeight >= keyDetailsTextHeight then
		local offset = (keyTextHeight - keyDetailsTextHeight) / 2
		if alignRight then
			keyDetailsText:SetPoint("TOPRIGHT", -framePadding - 3, -currentOffset - offset - 1)
			keyText:SetPoint("TOPRIGHT", keyDetailsText, "TOPLEFT", -3, offset)
		else
			keyText:SetPoint("TOPLEFT", framePadding, -currentOffset)
			keyDetailsText:SetPoint("TOPLEFT", keyText, "TOPRIGHT", 3, -offset - 1)
		end
	else
		local offset = (keyDetailsTextHeight - keyTextHeight) / 2
		if alignRight then
			keyDetailsText:SetPoint("TOPRIGHT", -framePadding - 3, -currentOffset - 1)
			keyText:SetPoint("TOPRIGHT", keyDetailsText, "TOPLEFT", -3, -offset)
		else
			keyText:SetPoint("TOPLEFT", framePadding, -currentOffset - offset)
			keyDetailsText:SetPoint("TOPLEFT", keyText, "TOPRIGHT", 3, offset - 1)
		end
	end

	currentOffset = currentOffset + keyRowHeight + verticalOffset + barFramePaddingTop + 1

	-- 4. WarpDepleteBars Container Frame & Children
	self.frames.bars:SetWidth(barWidth)
	self.frames.bars:ClearAllPoints()
	self.frames.bars:SetPoint(
		alignRight and "TOPRIGHT" or "TOPLEFT",
		alignRight and -framePadding or framePadding,
		-currentOffset
	)

	-- Bar text anchor points
	for _, barObj in ipairs({ self.bar1, self.bar2, self.bar3 }) do
		barObj.text:ClearAllPoints()
		barObj.text:SetPoint(
			alignBarTextRight and "BOTTOMRIGHT" or "BOTTOMLEFT",
			alignBarTextRight and -barFontOffsetX or barFontOffsetX,
			barFontOffsetY
		)
	end

	local bar3Height = math.max(barHeight, self.bar3.text:GetStringHeight() + barFontOffsetY)
	local bar2Height = math.max(barHeight, self.bar2.text:GetStringHeight() + barFontOffsetY)
	local bar1Height = math.max(barHeight, self.bar1.text:GetStringHeight() + barFontOffsetY)
	local timerBarsHeight = math.max(bar1Height, bar2Height, bar3Height)

	self.forces.text:ClearAllPoints()
	self.forces.text:SetPoint(
		alignBarTextRight and "TOPRIGHT" or "TOPLEFT",
		alignBarTextRight and -barFontOffsetX or barFontOffsetX,
		-barFontOffsetY
	)

	local forcesBarHeight = math.max(barHeight, self.forces.text:GetStringHeight() + barFontOffsetY)
	local barFrameHeight = timerBarsHeight + forcesBarHeight + barPadding * 2
	self.frames.bars:SetHeight(barFrameHeight)

	currentOffset = currentOffset + barFrameHeight + barFramePaddingBottom + verticalOffset

	-- 5. Objectives List
	for i = 1, 10 do
		local objText = self.frames.root.objectiveTexts[i]
		objText:ClearAllPoints()
		objText:SetPoint(
			alignRight and "TOPRIGHT" or "TOPLEFT",
			alignRight and -framePadding or framePadding,
			-currentOffset
		)
		currentOffset = currentOffset + objText:GetStringHeight() + objectivesOffset
	end

	-- 6. Dynamic Root Frame Dimensions
	currentOffset = currentOffset + framePadding
	self.frames.root:SetHeight(currentOffset)

	-- Update active contents if state available
	if self.RenderDeaths then self:RenderDeaths() end
	if self.RenderTimer then self:RenderTimer() end
	if self.RenderForces then self:RenderForces() end
	if self.RenderObjectives then self:RenderObjectives() end
end

--- Renders death text and updates hover tooltip hit-box width
function WarpDeplete:RenderDeaths()
	if not self.frames or not self.frames.root or not self.frames.root.deathsText then return end

	local deathCount = (self.state and self.state.deathCount) or 0
	local deathTimeLost = (self.state and self.state.deathTimeLost) or (deathCount * 5)
	local deathText = Util.formatDeathText(deathCount, deathTimeLost)
	self.frames.root.deathsText:SetText(deathText)

	if self.frames.deathsTooltip then
		local p = self.db and self.db.profile
		local framePadding = p and p.framePadding or 20
		local deathsTooltipFrameWidth = self.frames.root.deathsText:GetStringWidth() + framePadding
		self.frames.deathsTooltip:SetWidth(deathsTooltipFrameWidth)
	end
end

--- Initializes OnEnter and OnLeave tooltip handlers on deathsTooltip frame
function WarpDeplete:InitDeathsTooltip()
	local tooltipFrame = self.frames and self.frames.deathsTooltip
	if not tooltipFrame then return end

	tooltipFrame:SetScript("OnEnter", function(frame)
		if not self.db or not self.db.profile or not self.db.profile.showDeathsTooltip then return end
		if not GameTooltip then return end

		local deathDetails = self.state and self.state.deathDetails
		local deathCount = (self.state and self.state.deathCount) or 0
		local timeLost = (self.state and self.state.deathTimeLost) or (deathCount * 5)

		local alignRight = self.db.profile.alignTexts == "right"
		GameTooltip:SetOwner(frame, alignRight and "ANCHOR_BOTTOMLEFT" or "ANCHOR_BOTTOMRIGHT")
		GameTooltip:ClearLines()

		-- 1. Header
		local L = self.L or {}
		local deathHeader = L["Deaths"] or "Deaths"
		local deathSummaryText = ("%d (+%ds)"):format(deathCount, timeLost)
		GameTooltip:AddDoubleLine(deathHeader, deathSummaryText, 1, 1, 1, 1, 0.82, 0)

		if not deathDetails or #deathDetails == 0 then
			GameTooltip:AddLine(L["No deaths recorded."] or "No deaths recorded.", 0.6, 0.6, 0.6)
			GameTooltip:Show()
			return
		end

		-- 2. Chronological Death Log
		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(L["Death Log"] or "Death Log", 0.7, 0.7, 0.7)

		for _, entry in ipairs(deathDetails) do
			local timeStr = "[" .. Util.formatTime(entry.time or 0) .. "]"
			local classColor = (RAID_CLASS_COLORS and entry.class and RAID_CLASS_COLORS[entry.class]) or HIGHLIGHT_FONT_COLOR
			local cr = (classColor and classColor.r) or 1
			local cg = (classColor and classColor.g) or 1
			local cb = (classColor and classColor.b) or 1
			GameTooltip:AddDoubleLine(timeStr, entry.name or "Unknown", 0.85, 0.85, 0.85, cr, cg, cb)
		end

		-- 3. Player Totals Breakdown
		local playerTotals = {}
		local playerClasses = {}
		for _, entry in ipairs(deathDetails) do
			local name = entry.name or "Unknown"
			playerTotals[name] = (playerTotals[name] or 0) + 1
			if entry.class then playerClasses[name] = entry.class end
		end

		local sortedPlayers = {}
		for name, count in pairs(playerTotals) do
			sortedPlayers[#sortedPlayers + 1] = { name = name, count = count, class = playerClasses[name] or "PRIEST" }
		end
		table.sort(sortedPlayers, function(a, b)
			if a.count ~= b.count then return a.count > b.count else return a.name < b.name end
		end)

		GameTooltip:AddLine(" ")
		GameTooltip:AddLine(L["Player Breakdown"] or "Player Breakdown", 0.7, 0.7, 0.7)
		for _, item in ipairs(sortedPlayers) do
			local c = (RAID_CLASS_COLORS and item.class and RAID_CLASS_COLORS[item.class]) or HIGHLIGHT_FONT_COLOR
			local cr = (c and c.r) or 1
			local cg = (c and c.g) or 1
			local cb = (c and c.b) or 1
			local penaltyStr = ("%d (+%ds)"):format(item.count, item.count * 5)
			GameTooltip:AddDoubleLine(item.name, penaltyStr, cr, cg, cb, 1, 0.82, 0)
		end

		-- 4. Total Time Lost
		GameTooltip:AddLine(" ")
		local totalPenaltyStr = ("+%ds"):format(timeLost)
		GameTooltip:AddDoubleLine(L["Total Time Lost"] or "Total Time Lost", totalPenaltyStr, 1, 0.3, 0.3, 1, 0.3, 0.3)

		GameTooltip:Show()
	end)

	tooltipFrame:SetScript("OnLeave", function()
		if GameTooltip then
			GameTooltip:Hide()
		end
	end)
end

--- Renders timer text and chest statusbars (10Hz tick)
function WarpDeplete:RenderTimer()
	if not self.state or not self.state.timer or not self.db or not self.db.profile or not self.frames or not self.frames.root then return end
	wipe(timerState)

	local p = self.db.profile
	timerState.percent = (self.state.timeLimit and self.state.timeLimit > 0) and (self.state.timer / self.state.timeLimit) or 1

	timerState.timerText = Util.formatTime_OnUpdate(self.state.timer)
		.. " / "
		.. Util.formatTime_OnUpdate(self.state.timeLimit or 0)

	if self.state.challengeCompleted then
		local completionText = ""
		if p.showMillisecondsWhenDungeonCompleted and self.state.completionTimeMs then
			completionText = Util.formatTimeMilliseconds(self.state.completionTimeMs)
		else
			completionText = Util.formatTime((self.state.completionTimeMs or 0) / 1000)
		end
		timerState.timerText = completionText .. " / " .. Util.formatTime_OnUpdate(self.state.timeLimit or 0)
		timerState.color = self.state.completedOnTime and p.timerSuccessColor or p.timerExpiredColor
		timerState.timerText = "|c" .. timerState.color .. timerState.timerText .. "|r"
	end

	self.frames.root.timerText:SetText(timerState.timerText)

	for i = 1, 3 do
		timerState.barLimit = (self.state.timeLimits and self.state.timeLimits[i]) or 1
		timerState.timeRemaining = timerState.barLimit - self.state.timer
		timerState.barMax = timerState.barLimit - ((self.state.timeLimits and self.state.timeLimits[i + 1]) or 0)
		timerState.barElapsed = timerState.barMax - timerState.timeRemaining
		timerState.barValue = timerState.barMax > 0 and Util.clamp(timerState.barElapsed / timerState.barMax, 0.0, 1.0) or 0.0
		timerState.timeText = Util.formatTime_OnUpdate(math.abs(timerState.timeRemaining))

		if not self.state.challengeCompleted then
			if i == 1 and timerState.timeRemaining < 0 then
				timerState.timeText = "|c" .. p.timerExpiredColor .. "-" .. timerState.timeText .. "|r"
			end
			if i ~= 1 and timerState.timeRemaining < 0 then
				timerState.timeText = ""
			end
		else
			if timerState.timeRemaining <= 0 then
				timerState.color = p.timerExpiredColor
				timerState.timeText = "-" .. timerState.timeText
			else
				timerState.color = p.timerSuccessColor
			end
			timerState.timeText = "|c" .. timerState.color .. timerState.timeText .. "|r"
		end

		if self.bars and self.bars[i] then
			self.bars[i].bar:SetValue(timerState.barValue)
			self.bars[i].text:SetText(timerState.timeText)
		end
	end

	-- Splits & Personal Best Display on Main Keystone Timer
	if self.frames.root.timerSplitText then
		self.frames.root.timerSplitText:SetText("")
		self.frames.root.timerSplitText:Hide()

		if p.splitsEnabled then
			local shouldShowSplits = p.showSplitRecords == "always"
				or (p.showSplitRecords == "countdown" and not self.state.timerStarted)

			if shouldShowSplits and self.GetBestSplit then
				local best, sourceLevel = self:GetBestSplit("challenge")
				if best then
					local bestStr = Util.formatTime(best / 1000)
					if sourceLevel and sourceLevel ~= self.state.level then
						bestStr = bestStr .. " (+" .. sourceLevel .. ")"
					end
					self.frames.root.timerSplitText:SetText("|c" .. (p.splitRecordsColor or "FFAAAAAA") .. bestStr .. "|r")
					self.frames.root.timerSplitText:Show()
				end
			end

			if (self.state.challengeCompleted or self.state.demoModeActive) and self.GetCurrentDiff then
				local diff = self:GetCurrentDiff("challenge")
				if diff then
					local diffStr = Util.formatSplitTime(diff / 1000, p.splitFasterTimeColor, p.splitSlowerTimeColor)
					self.frames.root.timerSplitText:SetText(diffStr)
					self.frames.root.timerSplitText:Show()
				end
			end
		end
	end
end

--- Renders enemy forces dual statusbars and glow triggers
function WarpDeplete:RenderForces()
	if not self.state or not self.state.currentPercent or not self.db or not self.db.profile or not self.forces then return end
	local p = self.db.profile

	if self.state.currentPercent < 1.0 then
		local pullPercent = self.state.pullPercent or 0
		if pullPercent + self.state.currentPercent > 1.0 then
			pullPercent = 1 - self.state.currentPercent
		end
		self.forces.overlayBar:SetValue(math.max(0, pullPercent - 0.005))
	else
		self.forces.overlayBar:SetValue(0)
	end

	self.forces.overlayBar:ClearAllPoints()
	self.forces.overlayBar:SetPoint("LEFT", 1 + p.barWidth * self.state.currentPercent, 0)
	self.forces.bar:SetValue(self.state.currentPercent)
	self.forces.text:SetText(self.FormatForcesText and self:FormatForcesText() or "")

	-- Glow alert handling
	if self.ShowGlow and self.HideGlow then
		local showGlowSetting = p.showForcesGlow ~= false
		if self.state.pullGlowActive and (self.state.challengeCompleted or self.state.forcesCompleted or not showGlowSetting) then
			self:HideGlow()
		else
			local percentBeforePull = self.state.currentPercent or 0
			local percentAfterPull = percentBeforePull + (self.state.pullPercent or 0)
			local isDemoGlow = self.state and self.state.demoModeActive and (p.demoForcesGlow == true)
			local shouldGlow = showGlowSetting and (isDemoGlow or (percentBeforePull < 1 and percentAfterPull >= 1.0))

			if shouldGlow ~= self.state.pullGlowActive then
				if shouldGlow then
					self:ShowGlow()
				else
					self:HideGlow()
				end
			end
		end
	end
end

--- Displays glow border around forces bar using LibCustomGlow if available
function WarpDeplete:ShowGlow()
	local p = self.db and self.db.profile
	if p and p.showForcesGlow == false then return end
	if self.state then self.state.pullGlowActive = true end

	-- Lazy fallback protection: resolve Glow library if not already bound
	if not self.Glow and LibStub then
		self.Glow = LibStub("LibCustomGlow-1.0", true)
	end
	if not (self.Glow and self.Glow.PixelGlow_Start) or not self.forces then return end
	if not p then return end
	local glowR, glowG, glowB = Util.hexToRGB(p.forcesGlowColor)
	self.Glow.PixelGlow_Start(
		self.forces.bar,
		{ glowR, glowG, glowB, 1 },
		p.forcesGlowLineCount or 18,
		p.forcesGlowFrequency or 0.13,
		p.forcesGlowLength or 10,
		p.forcesGlowThickness or 2,
		1.5,
		1.5,
		false,
		"forcesComplete",
		0
	)
end

function WarpDeplete:HideGlow()
	if self.state then self.state.pullGlowActive = false end

	-- Lazy fallback protection: resolve Glow library if not already bound
	if not self.Glow and LibStub then
		self.Glow = LibStub("LibCustomGlow-1.0", true)
	end
	if self.Glow and self.Glow.PixelGlow_Stop and self.forces then
		self.Glow.PixelGlow_Stop(self.forces.bar, "forcesComplete")
	end
end

--- Renders boss objectives list and personal best split comparisons
function WarpDeplete:RenderObjectives()
	if not self.frames or not self.frames.root or not self.frames.root.objectiveTexts then return end

	-- Clear all 10 pooled FontStrings
	for i = 1, 10 do
		if self.frames.root.objectiveTexts[i] then
			self.frames.root.objectiveTexts[i]:SetText("")
		end
	end

	if not self.state or not self.state.objectives or not self.db or not self.db.profile then return end

	local p = self.db.profile
	local completionColor = p.completedObjectivesColor
	local alignStart = p.alignBossClear == "start"
	local shouldShowSplits = p.splitsEnabled
		and (p.showSplitRecords == "always" or (p.showSplitRecords == "countdown" and not self.state.timerStarted))

	for i, boss in ipairs(self.state.objectives) do
		if self.frames.root.objectiveTexts[i] then
			local objectiveStr = boss.name or ""

			if boss.time then
				objectiveStr = Util.colorText(objectiveStr, completionColor)
				local completionTimeStr = Util.formatTime(boss.time)
				completionTimeStr = Util.colorText(completionTimeStr, completionColor)

				if alignStart then
					objectiveStr = completionTimeStr .. " " .. objectiveStr
				else
					objectiveStr = objectiveStr .. " " .. completionTimeStr
				end

				if p.splitsEnabled and self.GetCurrentDiff then
					local diff = self:GetCurrentDiff(i)
					if diff then
						local diffStr = Util.formatSplitTime(diff, p.splitFasterTimeColor, p.splitSlowerTimeColor)

						if alignStart then
							objectiveStr = diffStr .. " " .. objectiveStr
						else
							objectiveStr = objectiveStr .. " " .. diffStr
						end
					end
				end
			elseif shouldShowSplits and self.GetBestSplit then
				local best = self:GetBestSplit(i)
				if best then
					local bestStr = "|c" .. p.splitRecordsColor .. Util.formatTime(best) .. "|r"

					if alignStart then
						objectiveStr = bestStr .. " " .. objectiveStr
					else
						objectiveStr = objectiveStr .. " " .. bestStr
					end
				end
			end

			self.frames.root.objectiveTexts[i]:SetText(objectiveStr)
		end
	end
end

--- Formats keystone level and affixes string
function WarpDeplete:RenderKeyDetails()
	if not self.state or not self.frames or not self.frames.root then return end
	if self.frames.root.keyText and self.state.level then
		local key = ("[%d]"):format(self.state.level)
		self.frames.root.keyText:SetText(key)
	end

	if self.frames.root.keyDetailsText then
		local affixesStr = Util.joinStrings(self.state.affixes or {}, " - ")
		self.frames.root.keyDetailsText:SetText(affixesStr)
	end
end

--- Formats forces display text with token replacements
function WarpDeplete:FormatForcesText()
	if not self.state or not self.db or not self.db.profile then return "" end
	local p = self.db.profile
	local completedColor = p.completedForcesColor
	local forcesFormat = p.forcesFormat or ":percent:"
	local customForcesFormat = p.customForcesFormat or ":percent:"
	local currentPullFormat = p.currentPullFormat or "(+:percent:)"
	local customCurrentPullFormat = p.customCurrentPullFormat or "(+:percent:)"
	local pullCount = self.state.pullCount or 0
	local currentCount = self.state.currentCount or 0
	local totalCount = (self.state.totalCount and self.state.totalCount > 0) and self.state.totalCount or 1
	local completionTime = self.state.forcesCompleted and self.state.forcesCompletionTime or nil
	local splitsEnabled = p.splitsEnabled
	local diff = self.GetCurrentDiff and self:GetCurrentDiff("forces") or nil
	local splitFasterTimeColor = p.splitFasterTimeColor
	local splitSlowerTimeColor = p.splitSlowerTimeColor
	local align = p.alignBarTexts

	local best = self.GetBestSplit and self:GetBestSplit("forces") or nil
	local shouldShowSplits = p.showSplitRecords == "always"
		or (p.showSplitRecords == "countdown" and not self.state.timerStarted)

	local currentPercent = Util.calcForcesPercent((currentCount / totalCount) * 100)

	local percentText = ("%.2f"):format(currentPercent)
	local countText = ("%d"):format(currentCount)
	local totalCountText = ("%d"):format(totalCount)
	local remainingCountText = ("%d"):format(math.max(0, totalCount - currentCount))
	local remainingPercentText = ("%.2f"):format(math.max(0, 100 - currentPercent))
	local result = forcesFormat == ":custom:" and customForcesFormat or forcesFormat

	result = result:gsub(":count:", countText)
	result = result:gsub(":percent:", percentText .. "%%")
	result = result:gsub(":totalcount:", totalCountText)
	result = result:gsub(":remainingcount:", remainingCountText)
	result = result:gsub(":remainingpercent:", remainingPercentText .. "%%")
	result = result:gsub(":remaining:", remainingCountText)

	if pullCount > 0 then
		local pullText = currentPullFormat == ":custom:" and customCurrentPullFormat or currentPullFormat

		local pullPercent = (pullCount / totalCount) * 100
		local pullPercentText = ("%.2f"):format(pullPercent)
		local pullCountText = ("%d"):format(pullCount)

		local countAfterPull = currentCount + pullCount
		local countAfterPullText = ("%d"):format(countAfterPull)

		local remainingCountAfterPull = math.max(0, totalCount - countAfterPull)
		local remainingCountAfterPullText = ("%d"):format(remainingCountAfterPull)

		local remainingPercentAfterPull = math.max(0, 100 - currentPercent - pullPercent)
		local remainingPercentAfterPullText = ("%.2f"):format(remainingPercentAfterPull)

		local percentAfterPull = Util.calcForcesPercent(pullPercent + currentPercent)
		local pulledPercentText = ("%.2f"):format(percentAfterPull)

		pullText = pullText:gsub(":count:", pullCountText)
		pullText = pullText:gsub(":percent:", pullPercentText .. "%%")
		pullText = pullText:gsub(":countafterpull:", countAfterPullText)
		pullText = pullText:gsub(":remainingcountafterpull:", remainingCountAfterPullText)
		pullText = pullText:gsub(":percentafterpull:", pulledPercentText .. "%%")
		pullText = pullText:gsub(":remainingpercentafterpull:", remainingPercentAfterPullText .. "%%")
		pullText = pullText:gsub(":remaining:", remainingCountAfterPullText)

		result = result:gsub(":countafterpull:", countAfterPullText)
		result = result:gsub(":remainingcountafterpull:", remainingCountAfterPullText)
		result = result:gsub(":percentafterpull:", pulledPercentText .. "%%")
		result = result:gsub(":remainingpercentafterpull:", remainingPercentAfterPullText .. "%%")

		if pullText and #pullText > 0 then
			result = pullText .. "  " .. result
		end
	else
		result = result:gsub(":countafterpull:", countText)
		result = result:gsub(":remainingcountafterpull:", remainingCountText)
		result = result:gsub(":percentafterpull:", percentText .. "%%")
		result = result:gsub(":remainingpercentafterpull:", remainingPercentText .. "%%")
	end

	-- Record split display (PB)
	local diffStr = nil
	if splitsEnabled and diff then
		diffStr = Util.formatSplitTime(diff, splitFasterTimeColor, splitSlowerTimeColor)
	end

	local bestStr = nil
	if splitsEnabled and shouldShowSplits and best then
		bestStr = "|c" .. (p.splitRecordsColor or "FFAAAAAA") .. Util.formatTime(best) .. "|r"
	end

	local hasDiffToken = result:find(":diff:") ~= nil
	if hasDiffToken then
		result = result:gsub(":diff:", diffStr or bestStr or "")
	end

	if completionTime then
		local completedText = ("%s"):format(Util.formatTime(completionTime))
		if align == "right" then
			result = "|c" .. completedColor .. completedText .. " " .. result .. "|r"
		else
			result = "|c" .. completedColor .. result .. " " .. completedText .. "|r"
		end

		if splitsEnabled and diffStr and not hasDiffToken then
			if align == "right" then
				result = diffStr .. " " .. result
			else
				result = result .. " " .. diffStr
			end
		end
	elseif splitsEnabled and shouldShowSplits and bestStr and not hasDiffToken then
		if align == "right" then
			result = bestStr .. " " .. result
		else
			result = result .. " " .. bestStr
		end
	end

	return result or ""
end

-- Export Render table interface contract
Render.Init = function(self) return WarpDeplete:InitRender() end
Render.RenderLayout = function(self) return WarpDeplete:RenderLayout() end
Render.UpdateFonts = function(self) return WarpDeplete:UpdateFonts() end
Render.UpdateBars = function(self) return WarpDeplete:UpdateBars() end
Render.SetUnlocked = function(self, unlocked) return WarpDeplete:SetUnlocked(unlocked) end
Render.RenderTimer = function(self) return WarpDeplete:RenderTimer() end
Render.RenderDeaths = function(self) return WarpDeplete:RenderDeaths() end
Render.InitDeathsTooltip = function(self) return WarpDeplete:InitDeathsTooltip() end
Render.RenderForces = function(self) return WarpDeplete:RenderForces() end
Render.ShowGlow = function(self) return WarpDeplete:ShowGlow() end
Render.HideGlow = function(self) return WarpDeplete:HideGlow() end
Render.RenderObjectives = function(self) return WarpDeplete:RenderObjectives() end
Render.RenderKeyDetails = function(self) return WarpDeplete:RenderKeyDetails() end
Render.FormatForcesText = function(self) return WarpDeplete:FormatForcesText() end
