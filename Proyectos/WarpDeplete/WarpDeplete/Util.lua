local ADDON_NAME, AddonTable = ...
local WarpDeplete = _G.WarpDeplete or AddonTable or {}
WarpDeplete.Util = WarpDeplete.Util or {}
local Util = WarpDeplete.Util
local L = WarpDeplete.L or {}

-- NOTE: Functions with the _OnUpdate suffix are
-- called in the frame update loop and should not allocate local tables.

-------------------------------------------------------------------------------
-- Deep Copy Table Utility
-------------------------------------------------------------------------------
function Util.copy(obj, seen)
	if type(obj) ~= "table" then
		return obj
	end
	if seen and seen[obj] then
		return seen[obj]
	end
	local s = seen or {}
	local res = setmetatable({}, getmetatable(obj))
	s[obj] = res
	for k, v in pairs(obj) do
		res[Util.copy(k, s)] = Util.copy(v, s)
	end
	return res
end

-------------------------------------------------------------------------------
-- Math & Value Clamping
-------------------------------------------------------------------------------
---@param value number
---@param minVal number
---@param maxVal number
---@return number
function Util.clamp(value, minVal, maxVal)
	if not value then return minVal or 0 end
	return math.min(maxVal, math.max(minVal, value))
end

-------------------------------------------------------------------------------
-- Color Engine: Parsing, Formatting & Escape Wrapping
-------------------------------------------------------------------------------

--- Converts a hex string into normalized (r, g, b, a) floats in range [0, 1].
--- Supports 6-character (RRGGBB), 8-character (AARRGGBB), and '#'-prefixed strings.
--- Gracefully falls back to opaque white (1, 1, 1, 1) on nil or invalid input.
---@param hex string?
---@return number r, number g, number b, number a
function Util.hexToRGBA(hex)
	if not hex or type(hex) ~= "string" then
		return 1, 1, 1, 1
	end

	-- Strip leading '#' if present
	hex = hex:gsub("^#", "")
	local len = #hex
	local a, r, g, b = 1, 1, 1, 1

	if len == 8 then
		-- ARGB format standard in WoW
		a = (tonumber(hex:sub(1, 2), 16) or 255) / 255
		r = (tonumber(hex:sub(3, 4), 16) or 255) / 255
		g = (tonumber(hex:sub(5, 6), 16) or 255) / 255
		b = (tonumber(hex:sub(7, 8), 16) or 255) / 255
	elseif len == 6 then
		-- Standard RGB format with full alpha
		r = (tonumber(hex:sub(1, 2), 16) or 255) / 255
		g = (tonumber(hex:sub(3, 4), 16) or 255) / 255
		b = (tonumber(hex:sub(5, 6), 16) or 255) / 255
		a = 1.0
	else
		return 1, 1, 1, 1
	end

	return Util.clamp(r, 0, 1), Util.clamp(g, 0, 1), Util.clamp(b, 0, 1), Util.clamp(a, 0, 1)
end

-- Backward compatibility alias for callers expecting (r, g, b) or (r, g, b, a)
Util.hexToRGB = Util.hexToRGBA

--- Converts normalized floats [0, 1] into an 8-character ARGB hex string ("AARRGGBB").
--- If alpha is omitted, full opacity "FF" is used.
---@param r number
---@param g number
---@param b number
---@param a number?
---@return string hex
function Util.rgbToHex(r, g, b, a)
	local rVal = Util.clamp(math.floor((r or 1) * 255 + 0.5), 0, 255)
	local gVal = Util.clamp(math.floor((g or 1) * 255 + 0.5), 0, 255)
	local bVal = Util.clamp(math.floor((b or 1) * 255 + 0.5), 0, 255)

	if not a then
		return string.format("FF%02X%02X%02X", rVal, gVal, bVal)
	end

	local aVal = Util.clamp(math.floor(a * 255 + 0.5), 0, 255)
	return string.format("%02X%02X%02X%02X", aVal, rVal, gVal, bVal)
end

--- Wraps a string in WoW UI color escape sequences (|cAARRGGBB...|r).
--- Robustly handles 6-char RGB (prepends "FF" for alpha) and '#'-prefixed hex.
---@param text string|number
---@param color string?
---@return string
function Util.colorText(text, color)
	if text == nil then return "" end
	if not color then return tostring(text) end

	local hex = tostring(color):gsub("^#", "")
	if #hex == 6 then
		hex = "FF" .. hex
	end

	return "|c" .. hex .. tostring(text) .. "|r"
end

-------------------------------------------------------------------------------
-- Time Formatting Utilities
-------------------------------------------------------------------------------

local formatTime_OnUpdate_state = {}

--- High-performance, zero-allocation timer formatter for 10Hz OnUpdate loops.
---@param time number
---@return string "mm:ss"
function Util.formatTime_OnUpdate(time)
	if not time then return "0:00" end
	local absTime = math.abs(time)
	formatTime_OnUpdate_state.timeMin = math.floor(absTime / 60)
	formatTime_OnUpdate_state.timeSec = math.floor(absTime - (formatTime_OnUpdate_state.timeMin * 60))
	return ("%d:%02d"):format(formatTime_OnUpdate_state.timeMin, formatTime_OnUpdate_state.timeSec)
end

--- General time formatter. Supports seconds to "mm:ss" or "mm:ss.ms".
--- Also supports optional leading sign ("+mm:ss" or "-mm:ss").
---@param time number
---@param showMs boolean?
---@param sign boolean?
---@return string
function Util.formatTime(time, showMs, sign)
	if not time then return "0:00" end
	local absTime = math.abs(time)
	local timeMin = math.floor(absTime / 60)
	local timeSec = math.floor(absTime - (timeMin * 60))
	local formatted

	if showMs then
		local ms = math.floor(((absTime - math.floor(absTime)) * 1000) + 0.5)
		if ms >= 1000 then
			ms = 0
			timeSec = timeSec + 1
			if timeSec >= 60 then
				timeSec = 0
				timeMin = timeMin + 1
			end
		end
		formatted = ("%d:%02d.%03d"):format(timeMin, timeSec, ms)
	else
		formatted = ("%d:%02d"):format(timeMin, timeSec)
	end

	if sign or (sign == nil and time < 0) then
		if time < 0 then
			return "-" .. formatted
		elseif time > 0 and sign then
			return "+" .. formatted
		elseif time == 0 and sign then
			return "±" .. formatted
		end
	end

	return formatted
end

--- Formats integer milliseconds into "mm:ss.ms".
---@param timeMs number
---@return string "mm:ss.ms"
function Util.formatTimeMilliseconds(timeMs)
	if not timeMs then return "0:00.000" end
	local timeMin = math.floor(timeMs / 60000)
	local timeSec = math.floor((timeMs / 1000) - (timeMin * 60))
	local ms = math.floor(timeMs - (timeMin * 60000) - (timeSec * 1000))
	return ("%d:%02d.%03d"):format(timeMin, timeSec, ms)
end

--- Formats death penalty time into minutes and seconds.
---@param time number
---@return string "mm:ss"
function Util.formatDeathTimeMinutes(time)
	if not time then return "0:00" end
	local timeMin = math.floor(time / 60)
	local timeSec = math.floor(time - (timeMin * 60))
	return ("%d:%02d"):format(timeMin, timeSec)
end

--- Formats death counter display text with optional time penalty.
--- If deathCount is 0, returns a single space " " to preserve FontString height.
---@param deathCount number?
---@param timeLost number?
---@return string
function Util.formatDeathText(deathCount, timeLost)
	deathCount = deathCount or 0
	if deathCount == 0 then
		return " "
	end

	if timeLost == nil then
		timeLost = deathCount * 5
	end

	local localeTable = WarpDeplete.L or L or (LibStub and LibStub("AceLocale-3.0", true) and LibStub("AceLocale-3.0"):GetLocale("WarpDeplete", true)) or {}
	local deathLabel = (deathCount == 1 and (localeTable["Death"] or "Death")) or (localeTable["Deaths"] or "Deaths")
	local result = tostring(deathCount) .. " " .. deathLabel

	if timeLost > 0 then
		if timeLost < 60 then
			result = result .. " (+" .. tostring(timeLost) .. "s)"
		else
			result = result .. " (+" .. Util.formatDeathTimeMinutes(timeLost) .. ")"
		end
	end

	return result
end

--- Formats split difference relative to Personal Best, colored green for improvement
--- or red for lost time.
---@param deltaSeconds number
---@param fasterColor string? Default "FF64FF64" (light green)
---@param slowerColor string? Default "FFFF5656" (light red)
---@return string
function Util.formatSplitTime(deltaSeconds, fasterColor, slowerColor)
	deltaSeconds = deltaSeconds or 0
	fasterColor = fasterColor or (WarpDeplete.db and WarpDeplete.db.profile and WarpDeplete.db.profile.splitFasterTimeColor) or "FF64FF64"
	slowerColor = slowerColor or (WarpDeplete.db and WarpDeplete.db.profile and WarpDeplete.db.profile.splitSlowerTimeColor) or "FFFF5656"

	local absTime = math.abs(deltaSeconds)
	local timeMin = math.floor(absTime / 60)
	local timeSec = math.floor(absTime - (timeMin * 60))
	local formatted = ("%d:%02d"):format(timeMin, timeSec)

	if deltaSeconds <= 0 then
		return Util.colorText("-" .. formatted, fasterColor)
	else
		return Util.colorText("+" .. formatted, slowerColor)
	end
end

-------------------------------------------------------------------------------
-- Forces Calculation & Clamping
-------------------------------------------------------------------------------

--- Computes active pull count and pull percentage from the currentPull table.
---@param pull table<string, number|string>
---@param total number
---@return number count, number percent
function Util.calcPullCount(pull, total)
	local totalPull = 0
	if pull then
		for _, c in pairs(pull) do
			if c ~= "DEAD" and type(c) == "number" then
				totalPull = totalPull + c
			end
		end
	end

	local percent = (total and total > 0) and (totalPull / total) or 0
	return totalPull, percent
end

--- Clamps forces percentage display to maximum of 100.0%.
---@param forcesPercent number
---@return number
function Util.calcForcesPercent(forcesPercent)
	return math.min(forcesPercent or 0, 100.0)
end

-------------------------------------------------------------------------------
-- String & Truncation Utilities
-------------------------------------------------------------------------------

--- Trims leading and trailing whitespace.
---@param str string?
---@return string
function Util.trim(str)
	if not str then return "" end
	return str:match("^%s*(.-)%s*$") or ""
end

--- Joins an array of strings with a specified delimiter.
---@param strings table<number, string>
---@param delim string?
---@return string
function Util.joinStrings(strings, delim)
	if not strings or #strings == 0 then return "" end
	delim = delim or ""
	local result = ""
	for i, s in ipairs(strings) do
		result = result .. tostring(s)
		if i < #strings then
			result = result .. delim
		end
	end
	return result
end

--- Reverses a table in-place using descending sort.
---@param list table
function Util.reverseList(list)
	if not list then return end
	table.sort(list, function(a, b)
		return a > b
	end)
end

--- Multi-byte character safe UTF-8 substring truncation (adapted from WeakAuras2).
--- Prevents invalid byte sequence splitting for non-ASCII characters.
---@param input string?
---@param size number
---@return string
function Util.utf8Sub(input, size)
	local output = ""
	if type(input) ~= "string" or not size or size <= 0 then
		return output
	end

	local i = 1
	while size > 0 do
		local byte = input:byte(i)
		if not byte then
			return output
		end
		if byte < 128 then
			-- ASCII byte (1 byte)
			output = output .. input:sub(i, i)
			size = size - 1
		elseif byte < 192 then
			-- Continuation byte
			output = output .. input:sub(i, i)
		elseif byte < 244 then
			-- Start byte of multi-byte sequence
			output = output .. input:sub(i, i)
			size = size - 1
		end
		i = i + 1
	end

	-- Consume any trailing continuation bytes for the final multi-byte character
	while true do
		local byte = input:byte(i)
		if byte and byte >= 128 and byte < 192 then
			output = output .. input:sub(i, i)
		else
			break
		end
		i = i + 1
	end

	return output
end

--- Returns the number of UTF-8 characters (code points) in a string.
---@param input string?
---@return number
function Util.utf8Len(input)
	if type(input) ~= "string" or input == "" then
		return 0
	end
	local len = 0
	for i = 1, #input do
		local byte = input:byte(i)
		-- Non-continuation byte marks start of UTF-8 character
		if byte < 128 or byte >= 192 then
			len = len + 1
		end
	end
	return len
end

--- Truncates a string to maxChars using utf8Sub, appending an optional ellipsis.
---@param str string?
---@param maxChars number
---@param ellipsis string?
---@return string
function Util.truncate(str, maxChars, ellipsis)
	if not str then return "" end
	if not maxChars or maxChars <= 0 then return "" end
	ellipsis = ellipsis or ""

	local fullSub = Util.utf8Sub(str, maxChars)
	if #fullSub == #str then
		return str
	end

	local ellipsisLen = (Util.utf8Len and Util.utf8Len(ellipsis)) or #ellipsis
	local subChars = maxChars - ellipsisLen
	if subChars <= 0 or ellipsis == "" then
		return fullSub
	end

	return Util.utf8Sub(str, subChars) .. ellipsis
end

-------------------------------------------------------------------------------
-- Locale-Aware Boss & Affix Name Filtering
-------------------------------------------------------------------------------

local currentLocale = (GetLocale and GetLocale()) or "enUS"
if currentLocale == "enGB" then
	currentLocale = "enUS"
end

local affixNameFilters = {
	["enUS"] = { "Xal'atath's", "Challenger's", "Bargain:", "Eternus's", "Trial:", "Dusk", "of", "the", "Sands", "Timeways", "Twilight" },
	["esES"] = { "Xal'atath", "contendiente", "Trato", "de", ":" },
	["esMX"] = { "Xal'atath", "contendiente", "Trato", "de", ":" },
	["deDE"] = { "Xal'ataths", "des Herausforderers", "Handel:" },
	["koKR"] = { "잘아타스의 제안:", "도전자의" },
	["zhCN"] = { "萨拉塔斯的交易：", "挑战者的" },
	["zhTW"] = { "薩拉塔斯的交易：", "挑戰者的" },
	["ruRU"] = {},
	["frFR"] = {},
	["itIT"] = {},
	["ptBR"] = { "Barganha de Xal'atath:" },
}

--- Strips boilerplate affix prefix words.
---@param name string
---@return string
function Util.formatAffixName(name)
	if not name then return "" end
	local result = name
	local filters = affixNameFilters[currentLocale] or {}
	for _, filter in ipairs(filters) do
		result = result:gsub(filter, "")
	end
	return Util.trim(result)
end

local objectiveNameFilters = {
	["enUS"] = { "Defeated", "defeated" },
	["esES"] = { "Derrotado", "derrotado", "Derrotada", "derrotada" },
	["esMX"] = { "Derrotado", "derrotado", "Derrotada", "derrotada" },
	["deDE"] = { "Besiegt", "besiegt" },
	["frFR"] = { "Vaincu", "vaincu", "Vaincue", "vaincue" },
	["itIT"] = { "Sconfitto", "sconfitto", "Sconfitta", "sconfitta" },
	["koKR"] = { "처치", "처치함" },
	["zhCN"] = { "已消灭", "消灭", "已击败", "击败" },
	["zhTW"] = { "已消滅", "消滅", "已擊敗", "擊敗" },
	["ruRU"] = { "побежден", "побеждена", "Побежден", "Побеждена" },
	["ptBR"] = { "Derrotado", "derrotado", "Derrotada", "derrotada" },
}

--- Cleans localized objective status prefixes ("Defeated", "Derrotado", etc.).
---@param name string
---@return string
function Util.formatObjectiveName(name)
	if not name then return "" end
	local result = name
	local filters = objectiveNameFilters[currentLocale] or {}
	for _, filter in ipairs(filters) do
		result = result:gsub(filter, "")
	end
	return Util.trim(result)
end

-------------------------------------------------------------------------------
-- Encounter Journal & Legion Map Resolution
-------------------------------------------------------------------------------

--- Mapping of Legion Mythic+ Challenge Map IDs to Encounter Journal Instance IDs.
--- (MapChallengeModeID -> { JournalInstanceID, ShortDungeonName })
Util.mapIDToEJID = {
	[197] = { 716, "Eye of Azshara" },
	[198] = { 762, "Darkheart Thicket" },
	[199] = { 740, "Black Rook Hold" },
	[200] = { 721, "Halls of Valor" },
	[206] = { 767, "Neltharion's Lair" },
	[207] = { 707, "Vault of the Wardens" },
	[208] = { 727, "Maw of Souls" },
	[209] = { 726, "The Arcway" },
	[210] = { 800, "Court of Stars" },
	[227] = { 860, "Return to Karazhan: Lower" },
	[233] = { 900, "Cathedral of Eternal Night" },
	[234] = { 860, "Return to Karazhan: Upper" },
	[239] = { 945, "Seat of the Triumvirate" },
}

--- Resolves the Encounter Journal instance ID for the active dungeon.
--- Uses Legion 7.3.5 APIs (GetCurrentMapAreaID) and table fallback.
--- Safe for headless / offline environments.
---@return number? instanceID
function Util.getEJInstanceID()
	-- 1. Try Map Area ID via Legion API
	local mapID = (GetCurrentMapAreaID and GetCurrentMapAreaID()) or nil

	local instanceID = (mapID and EJ_GetInstanceForMap and EJ_GetInstanceForMap(mapID)) or nil
	if instanceID and instanceID ~= 0 then
		return instanceID
	end

	-- 2. Try Challenge Mode active map lookup from static table
	local challengeMapID = C_ChallengeMode and C_ChallengeMode.GetActiveChallengeMapID and C_ChallengeMode.GetActiveChallengeMapID()
	if challengeMapID and Util.mapIDToEJID[challengeMapID] then
		return Util.mapIDToEJID[challengeMapID][1]
	end

	return nil
end

-------------------------------------------------------------------------------
-- UI & Debug Dialogs
-------------------------------------------------------------------------------

--- Displays a StaticPopup dialog if available.
---@param key string
---@param message string
---@param okMessage string?
function Util.showAlert(key, message, okMessage)
	if not StaticPopupDialogs or not StaticPopup_Show then return end
	StaticPopupDialogs[key] = {
		text = message,
		button1 = okMessage or "OK",
		timeout = 0,
		whileDead = true,
		hideOnEscape = true,
		preferredIndex = 3,
	}
	StaticPopup_Show(key)
end

--- Addon-level debug printer.
function WarpDeplete:PrintDebug(...)
	if not self.db or not self.db.global or not self.db.global.DEBUG then
		return
	end
	if self.Print then
		self:Print("|cFF479AEDDEBUG|r", ...)
	end
end
