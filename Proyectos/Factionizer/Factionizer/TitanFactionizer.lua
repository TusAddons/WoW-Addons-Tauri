-- **************************************************************************
-- * TitanFactionizer.lua
-- *
-- * Titan Panel plugin for Factionizer
-- * Shows watched faction reputation in the Titan bar
-- **************************************************************************

-- Only load if Titan Panel is present
if not TitanPanelButton_OnLoad then return end

-- ******************************** Constants *******************************
local TITAN_FIZ_ID = "Factionizer"
local TITAN_FIZ_FREQUENCY = 2
local updateTable = {TITAN_FIZ_ID, TITAN_PANEL_UPDATE_ALL}

-- ******************************** Helpers *********************************
local function FIZ_Titan_GetStandingText(standingID)
	local gender = UnitSex("player")
	if standingID and standingID >= 1 and standingID <= 8 then
		return GetText("FACTION_STANDING_LABEL"..standingID, gender)
	end
	return ""
end

local function FIZ_Titan_GetStandingColor(standingID)
	if standingID and FACTION_BAR_COLORS and FACTION_BAR_COLORS[standingID] then
		return FACTION_BAR_COLORS[standingID]
	end
	return {r=1, g=1, b=1}
end

local function FIZ_Titan_FormatNumber(num)
	if not num then return "0" end
	num = math.floor(num + 0.5)
	local formatted = tostring(num)
	local k
	while true do
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", "%1.%2")
		if k == 0 then break end
	end
	return formatted
end

-- ******************************** OnLoad **********************************
function TitanPanelFactionizerButton_OnLoad(self)
	self.registry = {
		id = TITAN_FIZ_ID,
		category = "General",
		version = GetAddOnMetadata("Factionizer", "Version") or "7.0",
		menuText = "Factionizer",
		buttonTextFunction = "TitanPanelFactionizerButton_GetButtonText",
		tooltipTitle = "|cFF00FF96Factionizer|r",
		tooltipTextFunction = "TitanPanelFactionizerButton_GetTooltipText",
		icon = "Interface\\Icons\\Achievement_Reputation_08",
		iconWidth = 16,
		iconButtonWidth = 16,
		controlVariables = {
			ShowIcon = true,
			ShowLabelText = true,
			ShowRegularText = false,
			ShowColoredText = true,
			DisplayOnRightSide = false,
		},
		savedVariables = {
			ShowIcon = 1,
			ShowLabelText = 1,
			ShowColoredText = 1,
			ShowPercent = true,
			ShowMissing = true,
			ShowSessionGain = true,
		},
	}

	self:RegisterEvent("PLAYER_ENTERING_WORLD")
	self:RegisterEvent("UPDATE_FACTION")
	self:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")
end

-- ******************************** OnShow **********************************
function TitanPanelFactionizerButton_OnShow()
	-- Nothing special needed
end

-- ******************************** OnClick *********************************
function TitanPanelFactionizerButton_OnClick(self, button)
	if button == "LeftButton" then
		ToggleCharacter("ReputationFrame")
	end
	TitanPanelButton_OnClick(self, button)
end

-- ******************************** OnEvent *********************************
function TitanPanelFactionizerButton_OnEvent(self, event, ...)
	TitanPanelPluginHandle_OnUpdate(updateTable)
end

-- ******************************** OnUpdate ********************************
function TitanPanelFactionizerButton_OnUpdate(self, elapsed)
	TITAN_FIZ_FREQUENCY = TITAN_FIZ_FREQUENCY - elapsed
	if TITAN_FIZ_FREQUENCY <= 0 then
		TITAN_FIZ_FREQUENCY = 2
		TitanPanelPluginHandle_OnUpdate(updateTable)
	end
end

-- ******************************** ButtonText ******************************
function TitanPanelFactionizerButton_GetButtonText(id)
	local name, standingID, barMin, barMax, barValue, factionID
	-- Use GetWatchedFactionInfo if available
	if GetWatchedFactionInfo then
		name, standingID, barMin, barMax, barValue, factionID = GetWatchedFactionInfo()
	end

	if not name or name == "" then
		return "Repu: ", TitanUtils_GetHighlightText("Sin vigilar")
	end

	local current = (barValue or 0) - (barMin or 0)
	local maximum = (barMax or 0) - (barMin or 0)
	if maximum <= 0 then maximum = 1 end

	local standingText = ""
	local color = {r=1, g=1, b=1}

	-- Check friendship first
	if factionID and GetFriendshipReputation then
		local friendID, friendRep, friendMaxRep, friendName, friendText, friendTexture, friendTextLevel, friendThreshold, nextFriendThreshold = GetFriendshipReputation(factionID)
		if friendID ~= nil then
			standingText = friendTextLevel or "Amistad"
			color = {r=0, g=0.8, b=0.2}
			current = (barValue or friendRep or 0) - (friendThreshold or 0)
			maximum = (nextFriendThreshold or friendThreshold or 1) - (friendThreshold or 0)
			if nextFriendThreshold == nil then
				current, maximum = 1, 1
			end
			if maximum <= 0 then maximum = 1 end
		end
	end

	if standingText == "" then
		standingText = FIZ_Titan_GetStandingText(standingID)
		color = FIZ_Titan_GetStandingColor(standingID)
	end

	local coloredStanding = TitanUtils_GetColoredText(standingText, color)

	-- Check for Paragon
	local paragonStr = ""
	if standingID == 8 and factionID and C_Reputation and C_Reputation.IsFactionParagon and C_Reputation.IsFactionParagon(factionID) then
		local currentValue, threshold, _, hasRewardPending = C_Reputation.GetFactionParagonInfo(factionID)
		if currentValue and threshold and threshold > 0 then
			local paraCur = currentValue % threshold
			current = paraCur
			maximum = threshold
			if hasRewardPending then
				paragonStr = " |cff00ff00[COFRE!]|r"
			end
		end
	end

	local percent = math.floor(current / maximum * 100 + 0.5)

	-- Build value part based on saved settings
	local valueParts = coloredStanding

	if TitanGetVar(TITAN_FIZ_ID, "ShowPercent") then
		valueParts = valueParts .. " " .. TitanUtils_GetHighlightText(percent .. "%")
	end

	if TitanGetVar(TITAN_FIZ_ID, "ShowMissing") then
		local missing = maximum - current
		valueParts = valueParts .. " |cffff6666(-" .. FIZ_Titan_FormatNumber(missing) .. ")|r"
	end

	valueParts = valueParts .. paragonStr

	-- Session gain
	if TitanGetVar(TITAN_FIZ_ID, "ShowSessionGain") and FIZ_StoredRep and FIZ_StoredRep[name] and FIZ_StoredRep[name].origRep and barValue then
		local gained = barValue - FIZ_StoredRep[name].origRep
		if gained ~= 0 then
			local gainColor = gained > 0 and "|cff00ff00+" or "|cffff0000"
			valueParts = valueParts .. " " .. gainColor .. FIZ_Titan_FormatNumber(gained) .. "|r"
		end
	end

	return name .. ": ", valueParts
end

-- ******************************** Tooltip **********************************
function TitanPanelFactionizerButton_GetTooltipText()
	local numFactions = GetNumFactions()
	if not numFactions or numFactions == 0 then
		return "No se encontraron facciones."
	end

	local lines = ""
	local gender = UnitSex("player")

	-- Watched faction header
	local wName, wStandingID, wBarMin, wBarMax, wBarValue, wFactionID
	if GetWatchedFactionInfo then
		wName, wStandingID, wBarMin, wBarMax, wBarValue, wFactionID = GetWatchedFactionInfo()
	end

	if wName then
		local wCurrent = (wBarValue or 0) - (wBarMin or 0)
		local wMaximum = (wBarMax or 0) - (wBarMin or 0)
		if wMaximum <= 0 then wMaximum = 1 end
		local wPercent = math.floor(wCurrent / wMaximum * 100 + 0.5)
		local wColor = FIZ_Titan_GetStandingColor(wStandingID)
		local wStanding = FIZ_Titan_GetStandingText(wStandingID)

		lines = lines .. "|cffffffffFaccion vigilada:|r\n"
		lines = lines .. TitanUtils_GetColoredText(wName, wColor) .. "\t" .. TitanUtils_GetHighlightText(wStanding) .. "\n"
		lines = lines .. "Reputacion actual:\t" .. TitanUtils_GetHighlightText(FIZ_Titan_FormatNumber(wCurrent) .. " / " .. FIZ_Titan_FormatNumber(wMaximum)) .. "\n"
		lines = lines .. "Progreso:\t" .. TitanUtils_GetHighlightText(wPercent .. "%") .. "\n"
		lines = lines .. "Faltante:\t" .. TitanUtils_GetHighlightText(FIZ_Titan_FormatNumber(wMaximum - wCurrent)) .. "\n"

		-- Paragon info
		if wStandingID == 8 and wFactionID and C_Reputation and C_Reputation.IsFactionParagon and C_Reputation.IsFactionParagon(wFactionID) then
			local currentValue, threshold, _, hasRewardPending = C_Reputation.GetFactionParagonInfo(wFactionID)
			if currentValue and threshold and threshold > 0 then
				local paraCur = currentValue % threshold
				lines = lines .. "Paragon:\t" .. TitanUtils_GetHighlightText(FIZ_Titan_FormatNumber(paraCur) .. " / " .. FIZ_Titan_FormatNumber(threshold)) .. "\n"
				if hasRewardPending then
					lines = lines .. "|cff00ff00>>> COFRE PARAGON DISPONIBLE! <<<|r\n"
				end
			end
		end

		-- Session gain from Factionizer data
		if FIZ_StoredRep and FIZ_StoredRep[wName] and FIZ_StoredRep[wName].origRep and wBarValue then
			local gained = wBarValue - FIZ_StoredRep[wName].origRep
			local gainColor = gained >= 0 and {r=0, g=1, b=0} or {r=1, g=0, b=0}
			lines = lines .. "Ganada esta sesion:\t" .. TitanUtils_GetColoredText(FIZ_Titan_FormatNumber(gained), gainColor) .. "\n"
		end

		-- Bag/bank items from Factionizer
		if FIZ_CurrentRepInBag and FIZ_CurrentRepInBag > 0 then
			lines = lines .. "Repu en bolsas:\t" .. TitanUtils_GetHighlightText(FIZ_Titan_FormatNumber(FIZ_CurrentRepInBag)) .. "\n"
		end

		lines = lines .. "\n"
	end

	-- Top 5 closest to next standing
	lines = lines .. "|cffffffffFacciones mas cercanas a subir:|r\n"
	local factionList = {}

	for i = 1, numFactions do
		local name, _, standingID, barMin, barMax, barValue, _, _, isHeader, _, hasRep = GetFactionInfo(i)
		if name and not isHeader and standingID and standingID < 8 then
			local current = (barValue or 0) - (barMin or 0)
			local maximum = (barMax or 0) - (barMin or 0)
			if maximum > 0 then
				local missing = maximum - current
				local percent = math.floor(current / maximum * 100 + 0.5)
				table.insert(factionList, {
					name = name,
					standingID = standingID,
					percent = percent,
					missing = missing,
				})
			end
		end
	end

	-- Sort by percentage (highest first = closest to next standing)
	table.sort(factionList, function(a, b) return a.percent > b.percent end)

	local count = 0
	for _, f in ipairs(factionList) do
		if count >= 5 then break end
		local color = FIZ_Titan_GetStandingColor(f.standingID)
		local standing = FIZ_Titan_GetStandingText(f.standingID)
		lines = lines .. TitanUtils_GetColoredText(f.name, color) .. "\t" .. TitanUtils_GetHighlightText(f.percent .. "% (" .. FIZ_Titan_FormatNumber(f.missing) .. ")") .. "\n"
		count = count + 1
	end

	lines = lines .. "\n"
	lines = lines .. "|cff00ff00Clic izquierdo:|r Abrir Reputacion\n"
	lines = lines .. "|cff00ff00Clic derecho:|r Menu de opciones"

	return lines
end

-- ******************************** RightClick Menu *************************
function TitanPanelRightClickMenu_PrepareFactionizerMenu()
	local info = {}

	TitanPanelRightClickMenu_AddTitle("|cFF00FF96Factionizer|r")

	info = {}
	info.text = "Mostrar porcentaje"
	info.func = function() TitanPanelRightClickMenu_ToggleVar({TITAN_FIZ_ID, "ShowPercent"}) end
	info.checked = TitanUtils_Ternary(TitanGetVar(TITAN_FIZ_ID, "ShowPercent"), 1, nil)
	info.keepShownOnClick = 1
	L_UIDropDownMenu_AddButton(info)

	info = {}
	info.text = "Mostrar repu faltante"
	info.func = function() TitanPanelRightClickMenu_ToggleVar({TITAN_FIZ_ID, "ShowMissing"}) end
	info.checked = TitanUtils_Ternary(TitanGetVar(TITAN_FIZ_ID, "ShowMissing"), 1, nil)
	info.keepShownOnClick = 1
	L_UIDropDownMenu_AddButton(info)

	info = {}
	info.text = "Mostrar ganancia de sesion"
	info.func = function() TitanPanelRightClickMenu_ToggleVar({TITAN_FIZ_ID, "ShowSessionGain"}) end
	info.checked = TitanUtils_Ternary(TitanGetVar(TITAN_FIZ_ID, "ShowSessionGain"), 1, nil)
	info.keepShownOnClick = 1
	L_UIDropDownMenu_AddButton(info)

	TitanPanelRightClickMenu_AddSpacer()
	TitanPanelRightClickMenu_AddToggleIcon(TITAN_FIZ_ID)
	TitanPanelRightClickMenu_AddToggleLabelText(TITAN_FIZ_ID)

	TitanPanelRightClickMenu_AddSpacer()
	TitanPanelRightClickMenu_AddCommand(L and L["TITAN_PANEL_MENU_HIDE"] or "Ocultar", TITAN_FIZ_ID, TITAN_PANEL_MENU_FUNC_HIDE)
end
