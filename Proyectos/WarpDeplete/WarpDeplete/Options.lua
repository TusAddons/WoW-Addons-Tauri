--[[
	WarpDeplete Legion 7.3.5 Recreation
	Module: Options.lua
	Description: AceConfig-3.0 Options Panel, LSM Dropdowns, Profile Management,
	             Blizzard Interface Options Registration, and Splits Administration.
]]

local ADDON_NAME, AddonTable = ...
local WarpDeplete = _G.WarpDeplete or AddonTable or {}

local Util = WarpDeplete.Util
local L = WarpDeplete.L or (LibStub and LibStub("AceLocale-3.0", true) and LibStub("AceLocale-3.0"):GetLocale("WarpDeplete", true)) or {}

local selectedClearMapId = "ALL"
local selectedClearLevel = "ALL"

local function getLSMValues(mediaType)
	if WarpDeplete.LSM and WarpDeplete.LSM.HashTable then
		return WarpDeplete.LSM:HashTable(mediaType)
	elseif LibStub then
		local lsm = LibStub("LibSharedMedia-3.0", true)
		if lsm and lsm.HashTable then
			return lsm:HashTable(mediaType)
		end
	end
	return {}
end

local function font(name, profileVar, updateFn, extraOptions)
	local result = {
		type = "select",
		dialogControl = "LSM30_Font",
		name = name,
		values = getLSMValues("font"),
		get = function(_)
			return WarpDeplete.db.profile[profileVar]
		end,
		set = function(_, value)
			WarpDeplete.db.profile[profileVar] = value
			if updateFn and WarpDeplete[updateFn] then
				WarpDeplete[updateFn](WarpDeplete)
			end
		end,
	}

	if extraOptions and type(extraOptions) == "table" then
		for k, v in pairs(extraOptions) do
			result[k] = v
		end
	end

	return result
end

local function range(name, profileVar, updateFn, extraOptions)
	local result = {
		type = "range",
		name = name,
		min = 8,
		max = 40,
		step = 1,
		get = function(_)
			return WarpDeplete.db.profile[profileVar]
		end,
		set = function(_, value)
			WarpDeplete.db.profile[profileVar] = value
			if updateFn and WarpDeplete[updateFn] then
				WarpDeplete[updateFn](WarpDeplete)
			end
		end,
	}

	if extraOptions and type(extraOptions) == "table" then
		for k, v in pairs(extraOptions) do
			result[k] = v
		end
	end

	return result
end

local function toggle(name, profileVar, updateFn, extraOptions)
	local result = {
		type = "toggle",
		name = name,
		get = function(_)
			return WarpDeplete.db.profile[profileVar]
		end,
		set = function(_, value)
			WarpDeplete.db.profile[profileVar] = value
			if updateFn and WarpDeplete[updateFn] then
				WarpDeplete[updateFn](WarpDeplete)
			end
		end,
	}

	if extraOptions and type(extraOptions) == "table" then
		for k, v in pairs(extraOptions) do
			result[k] = v
		end
	end

	return result
end

local function fontFlags(name, profileVar, updateFn, extraOptions)
	local result = {
		type = "select",
		name = name,
		desc = (L["Default:"] or "Default:") .. " " .. (L["OUTLINE"] or "OUTLINE"),
		values = {
			["OUTLINE"] = L["OUTLINE"] or "OUTLINE",
			["OUTLINE, SLUG"] = L["OUTLINESLUG"] or "OUTLINESLUG",
			["THICKOUTLINE"] = L["THICKOUTLINE"] or "THICKOUTLINE",
			["MONOCHROME"] = L["MONOCHROME"] or "MONOCHROME",
			[""] = L["NONE"] or "NONE",
		},
		get = function(_)
			return WarpDeplete.db.profile[profileVar]
		end,
		set = function(_, value)
			WarpDeplete.db.profile[profileVar] = value
			if updateFn and WarpDeplete[updateFn] then
				WarpDeplete[updateFn](WarpDeplete)
			end
		end,
	}

	if extraOptions and type(extraOptions) == "table" then
		for k, v in pairs(extraOptions) do
			result[k] = v
		end
	end

	return result
end

local function lineBreak(hidden, width)
	local result = {
		type = "description",
		name = "\n",
		hidden = hidden or false,
	}

	if width then
		result.width = width
	end

	return result
end

local function color(name, profileVar, updateFn, extraOptions)
	local result = {
		type = "color",
		name = name,
		hasAlpha = false,
		get = function(_)
			local r, g, b, a = Util.hexToRGBA(WarpDeplete.db.profile[profileVar])
			return r, g, b, a or 1
		end,
		set = function(_, r, g, b, a)
			WarpDeplete.db.profile[profileVar] = Util.rgbToHex(r, g, b, a)
			if updateFn and WarpDeplete[updateFn] then
				WarpDeplete[updateFn](WarpDeplete)
			end
		end,
	}

	if extraOptions and type(extraOptions) == "table" then
		for k, v in pairs(extraOptions) do
			result[k] = v
		end
	end

	return result
end

local function barTexture(name, profileVar, updateFn, extraOptions)
	local result = {
		name = name,
		type = "select",
		dialogControl = "LSM30_Statusbar",
		values = getLSMValues("statusbar"),
		get = function(_)
			return WarpDeplete.db.profile[profileVar]
		end,
		set = function(_, value)
			WarpDeplete.db.profile[profileVar] = value
			if updateFn and WarpDeplete[updateFn] then
				WarpDeplete[updateFn](WarpDeplete)
			end
		end,
	}

	if extraOptions and type(extraOptions) == "table" then
		for k, v in pairs(extraOptions) do
			result[k] = v
		end
	end

	return result
end

local function group(name, inline, args, extraOptions)
	local order = 1

	local result = {
		name = name,
		inline = inline,
		type = "group",
		args = {},
	}

	if args then
		for _, arg in ipairs(args) do
			arg.order = order
			result.args[(arg.type or "arg") .. order] = arg
			order = order + 1
		end
	end

	if extraOptions and type(extraOptions) == "table" then
		for k, v in pairs(extraOptions) do
			result[k] = v
		end
	end

	return result
end

function WarpDeplete:InitOptions()
	self.isUnlocked = false

	local options = {
		name = "WarpDeplete",
		handler = self,
		type = "group",
		childGroups = "tab",
		args = {
			unlocked = {
				order = 1,
				type = "toggle",
				name = L["Unlocked"] or "Unlocked",
				desc = L["Unlocks the timer window and allows it to be moved around"] or "Unlocks the timer window and allows it to be moved around",
				get = function(_)
					return WarpDeplete.isUnlocked or false
				end,
				set = function(_, value)
					WarpDeplete:SetUnlocked(value)
				end,
			},

			demo = {
				order = 2,
				type = "toggle",
				name = L["Demo Mode"] or "Demo Mode",
				desc = L["Enables the demo mode, used for configuring the timer"] or "Enables the demo mode, used for configuring the timer",
				get = function(_)
					return (WarpDeplete.state and WarpDeplete.state.demoModeActive) or false
				end,
				set = function(_, value)
					if value then
						if WarpDeplete.EnableDemoMode then
							WarpDeplete:EnableDemoMode()
						end
					else
						if WarpDeplete.DisableDemoMode then
							WarpDeplete:DisableDemoMode()
						end
					end
				end,
			},

			general = group(L["General"] or "General", false, {
				lineBreak(),
				toggle(L["Insert keystone automatically"] or "Insert keystone automatically", "insertKeystoneAutomatically", "RenderLayout"),
				toggle(
					L["Show millisecond precision after dungeon completion"] or "Show millisecond precision after dungeon completion",
					"showMillisecondsWhenDungeonCompleted",
					"RenderLayout"
				),
				lineBreak(),

				group(L["Forces Display"] or "Forces Display", true, {
					{
						type = "select",
						name = L["Forces text format"] or "Forces text format",
						desc = L["Choose how your forces progress will be displayed"] or "Choose how your forces progress will be displayed",
						sorting = {
							":percent:",
							":percentafterpull:",
							":count:/:totalcount:",
							":count:/:totalcount: - :percent:",
							":custom:",
						},
						values = {
							[":percent:"] = "82.52%",
							[":percentafterpull:"] = "87.84%",
							[":count:/:totalcount:"] = "198/240",
							[":count:/:totalcount: - :percent:"] = "198/240 - 82.52%",
							[":custom:"] = L["Custom"] or "Custom",
						},
						get = function(_)
							return WarpDeplete.db.profile.forcesFormat
						end,
						set = function(_, value)
							WarpDeplete.db.profile.forcesFormat = value
							WarpDeplete:RenderLayout()
						end,
					},
					lineBreak(function()
						return WarpDeplete.db.profile.forcesFormat == ":custom:"
					end, 2),

					{
						type = "input",
						name = L["Custom forces text format"] or "Custom forces text format",
						desc = (L["Use the following tags to set your custom format"] or "Use the following tags to set your custom format")
							.. ":"
							.. "\n- :percent: "
							.. (L["Shows the current forces percentage (e.g. 82.52%)"] or "Shows current forces percentage")
							.. "\n- :count: "
							.. (L["Shows the current forces count (e.g. 198)"] or "Shows current forces count")
							.. "\n- :totalcount: "
							.. (L["Shows the total forces count (e.g. 240)"] or "Shows total forces count")
							.. "\n- :remainingcount: "
							.. (L["Shows the remaining amount of forces needed to complete"] or "Shows remaining forces")
							.. "\n- :countafterpull: "
							.. (L["Shows the current forces count including current pull (e.g. 205)"] or "Shows count including pull")
							.. "\n- :remainingcountafterpull: "
							.. (L["Shows the remaining amount of forces needed to complete after current pull"] or "Shows remaining after pull")
							.. "\n- :remainingpercent: "
							.. (L["Shows the remaining percentage of forces to achieve 100%"] or "Shows remaining percent")
							.. "\n- :percentafterpull: "
							.. (L["Shows the current forces percentage including current pull (e.g. 87.84%)"] or "Shows percent including pull")
							.. "\n- :remainingpercentafterpull: "
							.. (L["Shows the remaining percentage of forces to achieve 100% after current pull"] or "Shows remaining percent after pull"),
						multiline = false,
						width = 2,
						hidden = function()
							return WarpDeplete.db.profile.forcesFormat ~= ":custom:"
						end,
						get = function(_)
							return WarpDeplete.db.profile.customForcesFormat
						end,
						set = function(_, value)
							WarpDeplete.db.profile.customForcesFormat = value
							WarpDeplete:RenderLayout()
						end,
					},

					{
						type = "select",
						name = L["Current pull text format"] or "Current pull text format",
						desc = L["Choose how your current pull count will be displayed"] or "Choose how current pull count is displayed",
						sorting = {
							"(+:percent:)",
							"(+:count:)",
							"(+:count: - :percent:)",
							":custom:",
						},
						values = {
							["(+:percent:)"] = "(+5.32%)",
							["(+:count:)"] = "(+14)",
							["(+:count: - :percent:)"] = "(+14 / 5.32%)",
							[":custom:"] = L["Custom"] or "Custom",
						},
						get = function(_)
							return WarpDeplete.db.profile.currentPullFormat
						end,
						set = function(_, value)
							WarpDeplete.db.profile.currentPullFormat = value
							WarpDeplete:RenderLayout()
						end,
					},
					lineBreak(function()
						return WarpDeplete.db.profile.currentPullFormat == ":custom:"
					end, 2),

					{
						type = "input",
						name = L["Custom current pull text format"] or "Custom current pull text format",
						desc = (L["Use the following tags to set your custom format"] or "Use the following tags to set your custom format")
							.. ":"
							.. "\n- :percent: "
							.. (L["Shows the current pull percentage (e.g. 82.52%)"] or "Shows pull percentage")
							.. "\n- :count: "
							.. (L["Shows the current pull count (e.g. 198)"] or "Shows pull count")
							.. "\n- :countafterpull: "
							.. (L["Shows the current forces count including current pull (e.g. 205)"] or "Shows count after pull")
							.. "\n- :remainingcountafterpull: "
							.. (L["Shows the remaining amount of forces needed to complete after current pull"] or "Shows remaining after pull")
							.. "\n- :percentafterpull: "
							.. (L["Shows the current forces percentage including current pull (e.g. 87.84%)"] or "Shows percent after pull"),
						multiline = false,
						width = 2,
						hidden = function()
							return WarpDeplete.db.profile.currentPullFormat ~= ":custom:"
						end,
						get = function(_)
							return WarpDeplete.db.profile.customCurrentPullFormat
						end,
						set = function(_, value)
							WarpDeplete.db.profile.customCurrentPullFormat = value
							WarpDeplete:RenderLayout()
						end,
					},
				}),

				group(L["Forces count in tooltip"] or "Forces count in tooltip", true, {
					toggle(L["Show forces count in tooltip"] or "Show forces count in tooltip", "showTooltipCount", "RenderLayout", {
						desc = L["Add a line to the tooltip, showing how much count a mob will award upon death"] or "Add a line to the tooltip",
					}),
				}),

				group(L["Forces Glow"] or "Forces Glow", true, {
					{
						type = "toggle",
						name = L["Show Forces Glow"] or "Show Forces Glow",
						desc = L["Show a glow around the forces action bar if the current pull will bring it to 100%"] or "Show glow around forces bar",
						get = function(_)
							return WarpDeplete.db.profile.showForcesGlow
						end,
						set = function(_, value)
							WarpDeplete.db.profile.showForcesGlow = value
							WarpDeplete:RenderLayout()
						end,
					},

					{
						type = "toggle",
						name = L["Show in Demo Mode"] or "Show in Demo Mode",
						desc = L["Show the forces glow in demo mode"] or "Show glow in demo mode",
						hidden = function()
							return not WarpDeplete.db.profile.showForcesGlow
						end,
						get = function(_)
							return WarpDeplete.db.profile.demoForcesGlow
						end,
						set = function(_, value)
							WarpDeplete.db.profile.demoForcesGlow = value
							WarpDeplete:RenderLayout()
						end,
					},

					lineBreak(function()
						return not WarpDeplete.db.profile.showForcesGlow
					end, 3),

					color(L["Color"] or "Color", "forcesGlowColor", "UpdateGlowAppearance", {
						hidden = function()
							return not WarpDeplete.db.profile.showForcesGlow
						end,
						width = 1 / 2,
					}),

					lineBreak(function()
						return not WarpDeplete.db.profile.showForcesGlow
					end, 3),

					range(L["Line Count"] or "Line Count", "forcesGlowLineCount", "UpdateGlowAppearance", {
						hidden = function()
							return not WarpDeplete.db.profile.showForcesGlow
						end,
						min = 1,
						max = 30,
						step = 1,
						width = 5 / 6,
					}),

					range(L["Line Length"] or "Line Length", "forcesGlowLength", "UpdateGlowAppearance", {
						hidden = function()
							return not WarpDeplete.db.profile.showForcesGlow
						end,
						min = 1,
						max = 10,
						step = 1,
						width = 5 / 6,
					}),

					range(L["Line Thickness"] or "Line Thickness", "forcesGlowThickness", "UpdateGlowAppearance", {
						hidden = function()
							return not WarpDeplete.db.profile.showForcesGlow
						end,
						min = 1,
						max = 5,
						step = 0.1,
						width = 5 / 6,
					}),

					range(L["Frequency"] or "Frequency", "forcesGlowFrequency", "UpdateGlowAppearance", {
						hidden = function()
							return not WarpDeplete.db.profile.showForcesGlow
						end,
						min = 0.05,
						max = 0.5,
						step = 0.01,
						width = 5 / 6,
					}),
				}),

				group(L["Death log tooltip"] or "Death log tooltip", true, {
					{
						type = "toggle",
						name = L["Show death log when hovering deaths text"] or "Show death log when hovering deaths text",
						desc = L["NOTE: This will only record deaths that happen while you're online. If you disconnect and/or reconnect, this will not show deaths that happened previously."] or "Records online deaths",
						get = function(_)
							return WarpDeplete.db.profile.showDeathsTooltip
						end,
						set = function(_, value)
							WarpDeplete.db.profile.showDeathsTooltip = value
						end,
						width = 3 / 2,
					},
					{
						type = "select",
						name = L["Death log style"] or "Death log style",
						desc = L["Choose how players deaths will be displayed in the tooltip. Hover the deaths text while in demo mode for a preview."] or "Choose how deaths are displayed",
						sorting = {
							"count",
							"time",
						},
						values = {
							["count"] = L["Overall amount of deaths by player"] or "Overall amount of deaths by player",
							["time"] = L["Recent deaths with timestamps"] or "Recent deaths with timestamps",
						},
						hidden = function()
							return not WarpDeplete.db.profile.showDeathsTooltip
						end,
						get = function(_)
							return WarpDeplete.db.profile.deathLogStyle
						end,
						set = function(_, value)
							WarpDeplete.db.profile.deathLogStyle = value
						end,
						width = 3 / 2,
					},
				}),

				group(L["Splits"] or "Splits", true, {
					{
						type = "toggle",
						name = L["Enable Splits"] or "Enable Splits",
						desc = L["Show time difference to best objective completion times"] or "Show time difference to best completion times",
						get = function(_)
							return WarpDeplete.db.profile.splitsEnabled
						end,
						set = function(_, value)
							WarpDeplete.db.profile.splitsEnabled = value
							WarpDeplete:RenderLayout()
						end,
						width = 3 / 2,
					},
					group(L["Show Split Records"] or "Show Split Records", true, {
						{
							type = "toggle",
							name = L["Always"] or "Always",
							get = function(_) return WarpDeplete.db.profile.showSplitRecords == "always" end,
							set = function(_, _)
								WarpDeplete.db.profile.showSplitRecords = "always"
								WarpDeplete:RenderLayout()
							end,
							width = 0.6,
						},
						{
							type = "toggle",
							name = L["During Countdown"] or "During Countdown",
							get = function(_) return WarpDeplete.db.profile.showSplitRecords == "countdown" end,
							set = function(_, _)
								WarpDeplete.db.profile.showSplitRecords = "countdown"
								WarpDeplete:RenderLayout()
							end,
							width = 1.1,
						},
						{
							type = "toggle",
							name = L["Never"] or "Never",
							get = function(_) return WarpDeplete.db.profile.showSplitRecords == "never" end,
							set = function(_, _)
								WarpDeplete.db.profile.showSplitRecords = "never"
								WarpDeplete:RenderLayout()
							end,
							width = 0.6,
						},
					}, {
						hidden = function()
							return not WarpDeplete.db.profile.splitsEnabled
						end,
					}),
					lineBreak(),
					color(L["Split Records Color"] or "Split Records Color", "splitRecordsColor", "RenderLayout", {
						desc = L["The color to use for personal best splits shown during the run"] or "Personal best splits color",
					}),
					lineBreak(),
					{
						type = "select",
						name = L["Fallback Split Level"] or "Fallback Split Level",
						desc = L["If there is no record for the current key level, fallback to the highest or lowest recorded level for this dungeon."] or "Fallback level behavior",
						sorting = { "none", "highest", "closest_higher", "closest_lower", "lowest" },
						values = {
							["none"] = L["None"] or "None",
							["highest"] = L["Highest Level"] or "Highest Level",
							["closest_higher"] = L["Closest Higher Level"] or "Closest Higher Level",
							["closest_lower"] = L["Closest Lower Level"] or "Closest Lower Level",
							["lowest"] = L["Lowest Level"] or "Lowest Level",
						},
						hidden = function()
							return not WarpDeplete.db.profile.splitsEnabled
						end,
						get = function(_)
							return WarpDeplete.db.profile.fallbackSplitBehavior or WarpDeplete.db.profile.splitFallbackLevel or "none"
						end,
						set = function(_, value)
							WarpDeplete.db.profile.fallbackSplitBehavior = value
							WarpDeplete.db.profile.splitFallbackLevel = value
							WarpDeplete:RenderLayout()
						end,
						width = 3 / 2,
					},
					lineBreak(),
					group(L["Clear Splits"] or "Clear Splits", true, {
						{
							type = "select",
							name = L["Dungeon to clear"] or "Dungeon to clear",
							values = function()
								local values = { ["ALL"] = L["All Dungeons"] or "All Dungeons" }
								if WarpDeplete.db and WarpDeplete.db.global and WarpDeplete.db.global.splits then
									for mapId, _ in pairs(WarpDeplete.db.global.splits) do
										local name = (C_ChallengeMode and C_ChallengeMode.GetMapUIInfo and C_ChallengeMode.GetMapUIInfo(mapId))
											or (C_ChallengeMode and C_ChallengeMode.GetMapInfo and C_ChallengeMode.GetMapInfo(mapId))
										if name then
											values[tostring(mapId)] = name
										else
											values[tostring(mapId)] = tostring(mapId)
										end
									end
								end
								return values
							end,
							get = function() return selectedClearMapId end,
							set = function(_, value) 
								selectedClearMapId = value or "ALL"
								selectedClearLevel = "ALL"
							end,
							width = 1.1,
						},
						{
							type = "select",
							name = L["Level to clear"] or "Level to clear",
							values = function()
								local values = { ["ALL"] = L["All Levels"] or "All Levels" }
								local levelsToInclude = {}
								if WarpDeplete.db and WarpDeplete.db.global and WarpDeplete.db.global.splits then
									if selectedClearMapId ~= "ALL" then
										local mapKey = tonumber(selectedClearMapId)
										local mapSplits = (mapKey ~= nil and WarpDeplete.db.global.splits[mapKey])
										if not mapSplits and selectedClearMapId ~= nil then
											mapSplits = WarpDeplete.db.global.splits[selectedClearMapId]
										end
										if mapSplits and type(mapSplits) == "table" then
											for level, _ in pairs(mapSplits) do
												levelsToInclude[level] = true
											end
										end
									else
										for _, mapSplits in pairs(WarpDeplete.db.global.splits) do
											if type(mapSplits) == "table" then
												for level, _ in pairs(mapSplits) do
													levelsToInclude[level] = true
												end
											end
										end
									end
								end
								
								for level, _ in pairs(levelsToInclude) do
									values[tostring(level)] = "+" .. tostring(level)
								end
								
								return values
							end,
							get = function() return selectedClearLevel end,
							set = function(_, value) selectedClearLevel = value or "ALL" end,
							width = 0.8,
						},
						{
							type = "execute",
							name = L["Clear Splits"] or "Clear Splits",
							desc = L["Deletes recorded splits for the selected dungeon."] or "Deletes recorded splits",
							confirm = function()
								local count = 0
								if not WarpDeplete.db or not WarpDeplete.db.global or not WarpDeplete.db.global.splits then
									return true
								end
								if selectedClearMapId == "ALL" then
									if selectedClearLevel == "ALL" then
										for _, mapSplits in pairs(WarpDeplete.db.global.splits) do
											if type(mapSplits) == "table" then
												for _ in pairs(mapSplits) do
													count = count + 1
												end
											end
										end
									else
										local levelNum = tonumber(selectedClearLevel)
										for _, mapSplits in pairs(WarpDeplete.db.global.splits) do
											if type(mapSplits) == "table" then
												if (levelNum ~= nil and mapSplits[levelNum]) or (selectedClearLevel ~= nil and mapSplits[selectedClearLevel]) then
													count = count + 1
												end
											end
										end
									end
								else
									local mapKey = tonumber(selectedClearMapId)
									local mapSplits = (mapKey ~= nil and WarpDeplete.db.global.splits[mapKey])
									if not mapSplits and selectedClearMapId ~= nil then
										mapSplits = WarpDeplete.db.global.splits[selectedClearMapId]
									end
									if mapSplits and type(mapSplits) == "table" then
										if selectedClearLevel == "ALL" then
											for _ in pairs(mapSplits) do
												count = count + 1
											end
										else
											local levelNum = tonumber(selectedClearLevel)
											if (levelNum ~= nil and mapSplits[levelNum]) or (selectedClearLevel ~= nil and mapSplits[selectedClearLevel]) then
												count = 1
											end
										end
									end
								end

								if count > 1 then
									local fmt = L["%d recorded runs will be deleted. Are you sure?"] or "%d recorded runs will be deleted. Are you sure?"
									return string.format(fmt, count)
								else
									return true
								end
							end,
							confirmText = L["Are you sure you want to delete these splits?"] or "Are you sure you want to delete these splits?",
							func = function()
								if not WarpDeplete.db or not WarpDeplete.db.global or not WarpDeplete.db.global.splits then
									return
								end
								if selectedClearMapId == "ALL" then
									if selectedClearLevel == "ALL" then
										WarpDeplete.db.global.splits = {}
									else
										local levelNum = tonumber(selectedClearLevel)
										for mapId, mapSplits in pairs(WarpDeplete.db.global.splits) do
											if type(mapSplits) == "table" then
												if levelNum ~= nil and mapSplits[levelNum] then
													mapSplits[levelNum] = nil
												end
												if selectedClearLevel ~= nil and mapSplits[selectedClearLevel] then
													mapSplits[selectedClearLevel] = nil
												end
												if next(mapSplits) == nil then
													WarpDeplete.db.global.splits[mapId] = nil
												end
											end
										end
									end
								else
									local mapKey = tonumber(selectedClearMapId)
									if selectedClearLevel == "ALL" then
										if mapKey ~= nil then
											WarpDeplete.db.global.splits[mapKey] = nil
										end
										if selectedClearMapId ~= nil then
											WarpDeplete.db.global.splits[selectedClearMapId] = nil
										end
									else
										local targetMap = (mapKey ~= nil and WarpDeplete.db.global.splits[mapKey])
										local targetMapKey = mapKey
										if not targetMap and selectedClearMapId ~= nil then
											targetMap = WarpDeplete.db.global.splits[selectedClearMapId]
											targetMapKey = selectedClearMapId
										end

										if targetMap and type(targetMap) == "table" then
											local levelNum = tonumber(selectedClearLevel)
											if levelNum ~= nil then
												targetMap[levelNum] = nil
											end
											if selectedClearLevel ~= nil then
												targetMap[selectedClearLevel] = nil
											end
											if next(targetMap) == nil and targetMapKey ~= nil then
												WarpDeplete.db.global.splits[targetMapKey] = nil
											end
										end
									end
								end
								selectedClearMapId = "ALL"
								selectedClearLevel = "ALL"
								WarpDeplete:Print(L["Splits cleared!"] or "Splits cleared!")
							end,
						},
					}),
				}),
			}, { order = 3 }),

			texts = group(L["Display"] or "Display", false, {
				group(L["General"] or "General", true, {
					range(L["Scale"] or "Scale", "frameScale", "RenderLayout", { min = 0.5, max = 2, step = 0.01, width = 3 }),
					{
						type = "select",
						name = L["Text Alignment"] or "Text Alignment",
						desc = L["Choose the alignment for all texts in the timer window"] or "Choose text alignment",
						sorting = { "right", "left" },
						values = {
							["left"] = L["Left"] or "Left",
							["right"] = L["Right"] or "Right",
						},
						get = function(_)
							return WarpDeplete.db.profile.alignTexts
						end,
						set = function(_, value)
							WarpDeplete.db.profile.alignTexts = value
							WarpDeplete:RenderLayout()
						end,
					},
					{
						type = "select",
						name = L["Bar Text Alignment"] or "Bar Text Alignment",
						desc = L["Choose the alignment for the captions on the timer and forces bars"] or "Choose bar text alignment",
						sorting = { "right", "left" },
						values = {
							["left"] = L["Left"] or "Left",
							["right"] = L["Right"] or "Right",
						},
						get = function(_)
							return WarpDeplete.db.profile.alignBarTexts
						end,
						set = function(_, value)
							WarpDeplete.db.profile.alignBarTexts = value
							WarpDeplete:RenderLayout()
						end,
					},
					{
						type = "select",
						name = L["Boss Clear Time Position"] or "Boss Clear Time Position",
						desc = L["Choose where the clear times for bosses will be displayed"] or "Choose boss clear time position",
						sorting = { "start", "end" },
						values = {
							["start"] = L["Start"] or "Start",
							["end"] = L["End"] or "End",
						},
						get = function(_)
							return WarpDeplete.db.profile.alignBossClear
						end,
						set = function(_, value)
							WarpDeplete.db.profile.alignBossClear = value
							if WarpDeplete.RenderObjectives then
								WarpDeplete:RenderObjectives()
							end
						end,
					},

					lineBreak(),

					range(L["Element Padding"] or "Element Padding", "verticalOffset", "RenderLayout", { min = 0, max = 100, step = 0.01 }),
					range(L["Boss Name Padding"] or "Boss Name Padding", "objectivesOffset", "RenderLayout", { min = 0, max = 100, step = 0.01 }),
					range(L["Bar Padding"] or "Bar Padding", "barPadding", "RenderLayout", { min = 0, max = 100, step = 0.01 }),
				}),

				group(L["Timer Colors"] or "Timer Colors", true, {
					color(L["Timer color"] or "Timer color", "timerRunningColor", "RenderLayout"),
					color(L["Timer success color"] or "Timer success color", "timerSuccessColor", "RenderLayout"),
					color(L["Timer expired color"] or "Timer expired color", "timerExpiredColor", "RenderLayout"),
				}, { desc = L["These colors are used for both the main timer, as well as the bar texts."] or "Timer and bar colors" }),

				group(L["Main Timer"] or "Main Timer", true, {
					font(L["Timer font"] or "Timer font", "timerFont", "RenderLayout"),
					range(L["Timer font size"] or "Timer font size", "timerFontSize", "RenderLayout", { max = 80 }),
					fontFlags(L["Timer font flags"] or "Timer font flags", "timerFontFlags", "RenderLayout"),
				}),

				group(L["Deaths"] or "Deaths", true, {
					font(L["Deaths font"] or "Deaths font", "deathsFont", "RenderLayout"),
					range(L["Deaths font size"] or "Deaths font size", "deathsFontSize", "RenderLayout"),
					fontFlags(L["Deaths font flags"] or "Deaths font flags", "deathsFontFlags", "RenderLayout"),
					color(L["Deaths color"] or "Deaths color", "deathsColor", "RenderLayout"),
				}),

				group(L["Key Details"] or "Key Details", true, {
					font(L["Key font"] or "Key font", "keyFont", "RenderLayout"),
					range(L["Key font size"] or "Key font size", "keyFontSize", "RenderLayout"),
					fontFlags(L["Key font flags"] or "Key font flags", "keyFontFlags", "RenderLayout"),
					color(L["Key color"] or "Key color", "keyColor", "RenderLayout"),

					lineBreak(),

					font(L["Key details font"] or "Key details font", "keyDetailsFont", "RenderLayout"),
					range(L["Key details font size"] or "Key details font size", "keyDetailsFontSize", "RenderLayout"),
					fontFlags(L["Key details font flags"] or "Key details font flags", "keyDetailsFontFlags", "RenderLayout"),
					color(L["Key details color"] or "Key details color", "keyDetailsColor", "RenderLayout"),
				}),

				group(L["Bars"] or "Bars", true, {
					range(L["Bar width"] or "Bar width", "barWidth", "RenderLayout", { width = "full", min = 10, max = 600 }),
					range(L["Bar height"] or "Bar height", "barHeight", "RenderLayout", { width = "full", min = 4, max = 50 }),
					color(L["Bar background color"] or "Bar background color", "backdropTextureColor", "RenderLayout", { hasAlpha = true }),
					barTexture(L["Bar background texture"] or "Bar background texture", "backdropTexture", "RenderLayout", { width = "full" }),
				}),

				group(L["+1 Timer"] or "+1 Timer", true, {
					font(L["+1 Timer font"] or "+1 Timer font", "bar1Font", "RenderLayout"),
					range(L["+1 Timer font size"] or "+1 Timer font size", "bar1FontSize", "RenderLayout"),
					fontFlags(L["+1 Timer font flags"] or "+1 Timer font flags", "bar1FontFlags", "RenderLayout"),

					barTexture(L["+1 Timer bar texture"] or "+1 Timer bar texture", "bar1Texture", "RenderLayout", { width = "double" }),
					color(L["+1 Timer bar color"] or "+1 Timer bar color", "bar1TextureColor", "RenderLayout"),
				}),

				group(L["+2 Timer"] or "+2 Timer", true, {
					font(L["+2 Timer font"] or "+2 Timer font", "bar2Font", "RenderLayout"),
					range(L["+2 Timer font size"] or "+2 Timer font size", "bar2FontSize", "RenderLayout"),
					fontFlags(L["+2 Timer font flags"] or "+2 Timer font flags", "bar2FontFlags", "RenderLayout"),

					barTexture(L["+2 Timer bar texture"] or "+2 Timer bar texture", "bar2Texture", "RenderLayout", { width = "double" }),
					color(L["+2 Timer bar color"] or "+2 Timer bar color", "bar2TextureColor", "RenderLayout"),
				}),

				group(L["+3 Timer"] or "+3 Timer", true, {
					font(L["+3 Timer font"] or "+3 Timer font", "bar3Font", "RenderLayout"),
					range(L["+3 Timer font size"] or "+3 Timer font size", "bar3FontSize", "RenderLayout"),
					fontFlags(L["+3 Timer font flags"] or "+3 Timer font flags", "bar3FontFlags", "RenderLayout"),

					barTexture(L["+3 Timer bar texture"] or "+3 Timer bar texture", "bar3Texture", "RenderLayout", { width = "double" }),
					color(L["+3 Timer bar color"] or "+3 Timer bar color", "bar3TextureColor", "RenderLayout"),
				}),

				group(L["Forces"] or "Forces", true, {
					font(L["Forces font"] or "Forces font", "forcesFont", "RenderLayout"),
					range(L["Forces font size"] or "Forces font size", "forcesFontSize", "RenderLayout"),
					fontFlags(L["Forces font flags"] or "Forces font flags", "forcesFontFlags", "RenderLayout"),
					color(L["Forces color"] or "Forces color", "forcesColor", "RenderLayout"),
					color(L["Completed forces color"] or "Completed forces color", "completedForcesColor", "RenderLayout"),

					lineBreak(),

					barTexture(L["Forces bar texture"] or "Forces bar texture", "forcesTexture", "RenderLayout", { width = "double" }),
					color(L["Forces bar color"] or "Forces bar color", "forcesTextureColor", "RenderLayout"),

					lineBreak(),

					barTexture(L["Current pull bar texture"] or "Current pull bar texture", "forcesOverlayTexture", "RenderLayout", { width = "double" }),
					color(L["Current pull bar color"] or "Current pull bar color", "forcesOverlayTextureColor", "RenderLayout"),
				}),

				group(L["Objectives"] or "Objectives", true, {
					font(L["Objectives font"] or "Objectives font", "objectivesFont", "RenderLayout", { width = 3 / 2 }),
					fontFlags(L["Objectives font flags"] or "Objectives font flags", "objectivesFontFlags", "RenderLayout", { width = 3 / 2 }),
					range(L["Objectives font size"] or "Objectives font size", "objectivesFontSize", "RenderLayout", { width = 3 / 2 }),
					color(L["Objectives color"] or "Objectives color", "objectivesColor", "RenderLayout"),
					color(L["Completed objective color"] or "Completed objective color", "completedObjectivesColor", "RenderLayout"),
					color(L["New best objective split"] or "New best objective split", "splitFasterTimeColor", "RenderLayout", {
						desc = L["The color to use when you've set a new best objective clear time"] or "New best clear time color",
					}),
					color(L["Slower objective split"] or "Slower objective split", "splitSlowerTimeColor", "RenderLayout", {
						desc = L["The color to use for objective clear times slower than your best time"] or "Slower clear time color",
					}),
				}),
			}, { order = 4 }),
		},
	}

	local debugOptions = group("Debug", false, {
		{
			type = "range",
			name = L["Timer limit (Minutes)"] or "Timer limit (Minutes)",
			min = 1,
			max = 100,
			step = 1,
			get = function(_)
				return math.floor(((WarpDeplete.state and WarpDeplete.state.timeLimit) or 1800) / 60)
			end,
			set = function(_, value)
				if WarpDeplete.state then
					WarpDeplete.state.timeLimit = value * 60
				end
				if WarpDeplete.RenderTimer then
					WarpDeplete:RenderTimer()
				end
			end,
		},

		{
			type = "range",
			name = L["Timer current (Minutes)"] or "Timer current (Minutes)",
			min = 0,
			max = 100,
			step = 1,
			get = function(_)
				return math.floor(((WarpDeplete.state and WarpDeplete.state.timer) or 0) / 60)
			end,
			set = function(_, value)
				if WarpDeplete.state then
					WarpDeplete.state.timer = value * 60
				end
				if WarpDeplete.RenderTimer then
					WarpDeplete:RenderTimer()
				end
			end,
		},

		{
			type = "range",
			name = L["Forces total"] or "Forces total",
			min = 1,
			max = 500,
			step = 1,
			get = function(_)
				return (WarpDeplete.state and WarpDeplete.state.totalCount) or 100
			end,
			set = function(_, value)
				if WarpDeplete.SetForcesTotal then
					WarpDeplete:SetForcesTotal(value)
				end
			end,
		},

		{
			type = "range",
			name = L["Forces pull"] or "Forces pull",
			min = 1,
			max = 500,
			step = 1,
			get = function(_)
				return (WarpDeplete.state and WarpDeplete.state.pullCount) or 0
			end,
			set = function(_, value)
				if WarpDeplete.SetForcesPull then
					WarpDeplete:SetForcesPull(value)
				end
			end,
		},

		{
			type = "range",
			name = L["Forces current"] or "Forces current",
			min = 1,
			max = 500,
			step = 1,
			get = function(_)
				return (WarpDeplete.state and WarpDeplete.state.currentCount) or 0
			end,
			set = function(_, value)
				if WarpDeplete.SetForcesCurrent then
					WarpDeplete:SetForcesCurrent(value)
				end
			end,
		},

		{
			type = "toggle",
			name = L["Forces complete"] or "Forces complete",
			get = function(_)
				return (WarpDeplete.state and WarpDeplete.state.forcesCompleted) or false
			end,
			set = function(_, value)
				if WarpDeplete.state then
					WarpDeplete.state.forcesCompleted = value
					if value then
						WarpDeplete.state.forcesCompletionTime = 3000
					else
						WarpDeplete.state.forcesCompletionTime = nil
					end
				end
				if WarpDeplete.RenderForces then
					WarpDeplete:RenderForces()
				end
			end,
			width = 3 / 2,
		},
	})

	if LibStub and LibStub("AceDBOptions-3.0", true) and self.db then
		options.args.profile = LibStub("AceDBOptions-3.0"):GetOptionsTable(self.db)
		options.args.profile.order = 5
	end

	if self.db and self.db.global and self.db.global.DEBUG then
		options.args.debug = debugOptions
		options.args.debug.order = 6
	end

	local AceConfig = LibStub and LibStub("AceConfig-3.0", true)
	local AceConfigDialog = LibStub and LibStub("AceConfigDialog-3.0", true)

	if AceConfig then
		AceConfig:RegisterOptionsTable("WarpDeplete", options)
	end

	if AceConfigDialog then
		self.optionsFrame = AceConfigDialog:AddToBlizOptions("WarpDeplete", "WarpDeplete")
		self.optionsGeneralFrame = self.optionsFrame
		self.configDialog = AceConfigDialog
	end

	self.options = options
end

--- Re-applies active LibCustomGlow animation parameters when user alters line width, count, or frequency.
function WarpDeplete:UpdateGlowAppearance()
	if not self.state or not self.state.pullGlowActive then
		return
	end
	if self.HideGlow and self.ShowGlow then
		self:HideGlow()
		self:ShowGlow()
	end
end
