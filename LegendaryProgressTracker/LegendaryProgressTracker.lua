LPT = LibStub("AceAddon-3.0"):NewAddon("LPT", "AceConsole-3.0", "AceEvent-3.0")

DAY = 86400
WEEK = 604800
LEG_ILVL = 1000
LPT_EPOCH = 1502809200 --Epoch week is 08/15/2017 at weekly reset time
playerName = GetUnitName("player")
NEW_RAID_ID_SPLIT = 2060

function LPT:OnEnable()
	--self:RegisterEvent("PLAYER_LOGIN")
    self:RegisterEvent("CHAT_MSG_LOOT")
    self:RegisterEvent("QUEST_TURNED_IN")
	self:RegisterEvent("CHALLENGE_MODE_COMPLETED")
	self:RegisterEvent("ENCOUNTER_END")
	--self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
	--self:RegisterEvent("UNIT_SPELLCAST_SENT")
	--self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
	--self:RegisterEvent("BAG_UPDATE_DELAYED")
	self:RegisterEvent("ZONE_CHANGED_NEW_AREA")
	self:RegisterEvent("MAIL_SUCCESS")
	self:RegisterEvent("PLAYER_LOGOUT")
end


function LPT:GuidToID(guid, guidType)
	if not guid then return 1 end
	local _, _, _, _, itemid, mobid = strsplit("-", guid)
	if guidType == "mob" then
		return tonumber(mobid) or 1
	elseif guidType == "object" then
		return tonumber(itemid) or 1
	end
end

function LPT:SlashCommands(input)

	input = string.lower(input)

	local command,value,_ = strsplit(" ", input)
	if command == "" then
		LPT:Print("Type /lpt show to show current progress or /lpt info to toggle messages after each event")
	end
	if command == "print" or command == "show" then
		LPT:PrintEvents()
		--[[if lptWindowOpen == false or lptWindowOpen == nil then
			lptWindowOpen = true
			LPT:DisplayHistory()			
		end]]--
	end
	if command == "info" then
		if value == nil then
			printInfo =  not printInfo
		elseif value == "true" or value == "on" then
			printInfo = true
		elseif value == "false" or value == "off" then
			printInfo = false
		end
		if printInfo then
			self:Print("Informational prints on")
		else
			self:Print("Informational prints off")
		end
	end

	if command == "blp" then
		self:Print(LPT:GetBLP())
	end
	
	--[[if command == "save" then
		LPT:SaveHistory("ForcedSave")
		LPT:PrintEvents()
		LPT:ResetEvents()
	end]]--
		
end

function LPT:PLAYER_LOGIN()
	LPT:setIslandRares()
	LPT:setArgusRares()
end

function LPT:OnInitialize()
	self:RegisterEvent("PLAYER_LOGIN")
	LPT:Initalize()
	LPT:RegisterChatCommand('lpt', 'SlashCommands')
end

function LPT:ZONE_CHANGED_NEW_AREA()
	--if LPTargusRares[123689] ~= nil and LPTargusRares[123689]["killed"] == nil then
		--LPT:setArgusRares()
		--LPT:setIslandRares()
	--end
	LPT:RegisterEvents()
end
function LPT:BAG_UPDATE_DELAYED()
	if LPTrareFlag ~= nil then
		if LPTargusRares[LPTrareFlag["ID"]] ~= nil and IsQuestFlaggedCompleted(LPTargusRares[LPTrareFlag["ID"]]["questId"]) then
			LPT:ArgusRareCompleted(LPTrareFlag["ID"])
			LPTrareFlag = nil
		elseif LPTisleRares[LPTrareFlag["ID"]] ~= nil and IsQuestFlaggedCompleted(LPTisleRares[LPTrareFlag["ID"]]["questId"]) then
			LPT:IsleRareCompleted(LPTrareFlag["ID"])
			LPTrareFlag = nil
		elseif time() > LPTrareFlag["expiration"] then
			LPTrareFlag = nil
		end
	end
end

function LPT:MAIL_SUCCESS()
	suppressMail = time()
end

function LPT:PLAYER_LOGOUT()
	if lptHistory[playerName] == nil then
		lptHistory[playerName] = {}
	end
	lptEvents["blpValue"] = LPT:GetBLP()
	if lastLegInfo ~= nil then
		lptEvents["date"] = lastLegInfo["date"]
	else
		lptEvents["date"] = historical["installedDate"]
	end
	lptHistory[playerName]["Current"] = lptEvents
end

function LPT:VerifyInitalize()

	lptEvents.emissaryChest = 0
	lptEvents.weeklyChest = 0
	lptEvents.paragonChest = 0
	lptEvents.normalDungeon = 0
	lptEvents.heroicDungeon = 0
	lptEvents.mythicDungeon = 0
	lptEvents.mPlusDungeon = 0
	lptEvents.lfr = 0
	lptEvents.normalRaid = 0
	lptEvents.heroicRaid = 0
	lptEvents.mythicRaid = 0
	lptEvents.worldBoss = 0
	lptEvents.pvp = 0
	lptEvents.islandRare = 0
	lptEvents.islandChest = 0
	lptEvents.warSupplies = 0
	lptEvents.blingtron = 0
	lptEvents.argusChest = 0
	lptEvents.argusRare = 0
	lptEvents.oldRaid = 0
end

function LPT:GetWeek()
	return math.floor((time() - LPT_EPOCH) / WEEK) --Our "epoch" week is Aug 15th 2017
end
function LPT:SaveHistory(legName)

	if lastLegInfo == nil then
		lastLegInfo = {}
	end
	if historical == nil then
		historical = {}
	end
	
	historical.numLegs = historical.numLegs + 1
	
	
	for event,value in pairs(lptEvents) do
		lastLegInfo[event] = value
	end
	local timeToLeg = 0
	if lastLegInfo.date ~= nil then
		timeToLeg = tonumber(string.format("%.1f", (time() - lastLegInfo.date) / DAY))
	else
		timeToLeg = tonumber(string.format("%.1f", (time() - historical.installedDate) / DAY))
	end
	
	
	lastLegInfo.timeToLeg = timeToLeg
	
	lastLegInfo.date = time()
	lastLegInfo.blpValue = LPT:GetBLP()
	lastLegInfo.nameOfLeg = legName
	
	if lptHistory[playerName] == nil then
		lptHistory[playerName] = {}
	end
	lptHistory[playerName][legName] = lastLegInfo
	
end

function LPT:ResetEvents()
	--reset and initialize all counts to 0
	self:Print("Resetting event counts")
	lptEvents = {}
	lptEvents.emissaryChest = 0
	lptEvents.weeklyChest = 0
	lptEvents.paragonChest = 0
	lptEvents.normalDungeon = 0
	lptEvents.heroicDungeon = 0
	lptEvents.mythicDungeon = 0
	lptEvents.mPlusDungeon = 0
	lptEvents.lfr = 0
	lptEvents.normalRaid = 0
	lptEvents.heroicRaid = 0
	lptEvents.mythicRaid = 0
	lptEvents.worldBoss = 0
	lptEvents.pvp = 0
	lptEvents.islandRare = 0
	lptEvents.islandChest = 0
	lptEvents.warSupplies = 0
	lptEvents.blingtron = 0
	lptEvents.argusLesserChest = 0
	lptEvents.argusGreaterChest = 0
	lptEvents.lesserInvasion = 0
	lptEvents.greaterInvasion = 0
	lptEvents.argusRare = 0
	lptEvents.oldRaid = 0

end

function LPT:PrintEvents()
	if historical.numLegs == 0 then 
		self:Print("Reporting events since install")
	else
		self:Print("Reporting events since last legendary")
	end
	self:Print("Emissary Chests: " .. lptEvents.emissaryChest)
	self:Print("Weekly Chest: " .. lptEvents.weeklyChest)
	self:Print("Paragon Rep Chests: " .. lptEvents.paragonChest)
	self:Print("Argus Chests (Lesser; Greater): " .. lptEvents.argusLesserChest .. "; " .. lptEvents.argusGreaterChest)
	self:Print("Argus Rares: " .. lptEvents.argusRare)
	self:Print("Argus Invasions (Lesser; Greater): " .. lptEvents.lesserInvasion .. "; " .. lptEvents.greaterInvasion)
	--self:Print("Normal Mode Dungeons: " .. lptEvents.normalDungeon)
	self:Print("Heroic Dungeons: " .. lptEvents.heroicDungeon)
	self:Print("Broken Shore Rares: " .. lptEvents.islandRare)
	self:Print("Mythic 0 Dungeon Bosses: " .. lptEvents.mythicDungeon)
	self:Print("Mythic + Dungeons: " ..lptEvents.mPlusDungeon)
	self:Print("Raid bosses (LFR; Normal; Heroic; Mythic; Non Current Raid): " .. lptEvents.lfr .. "; " .. 
		lptEvents.normalRaid .. "; " .. lptEvents.heroicRaid .. "; " .. lptEvents.mythicRaid.. "; " .. lptEvents.oldRaid)
	self:Print("World Bosses: " .. lptEvents.worldBoss)
	self:Print("PvP events: " .. lptEvents.pvp)
	self:Print("War Supplies Caches: " .. lptEvents.warSupplies)
	self:Print("Blingtron 6000: " .. lptEvents.blingtron)
	if historical.numLegs == 0 then 
		self:Print("Time since install of addon " .. tonumber(string.format("%.1f", (time() - historical.installedDate) / DAY)) .. " days")
	else
		self:Print("Time since last legendary " .. tonumber(string.format("%.1f", (time() - lastLegInfo.date) / DAY)) .. " days")
	end
	self:Print(LPT:GetBLP() .. "% towards bad luck protection cap")

end

function LPT:ENCOUNTER_END(event, id, _, difficulty, _, killed)
	local mZero = 23
	if killed == 1 and bosses[difficulty] ~= nil and bosses[difficulty][id] then
		bosses[difficulty][id] = false
		if id > NEW_RAID_ID_SPLIT or difficulty == mZero then
			LPT:BossComplete(difficulty)
		elseif id < NEW_RAID_ID_SPLIT then
			LPT:OldRaidComplete()
		end
	elseif killed == 1 and difficulty == 2 and bosses[mZero][id] ~= nil then
		LPT:BossComplete(difficulty)
	end
end
function LPT:CHAT_MSG_LOOT(event, message, _, _, _, looter)
	if looter ~= GetUnitName("player") then
		--Loot isn't ours, exit method
		return
	end
	local _, _, item = string.find(message, '(|.+|r)')
	local name, link, quality, iLevel, reqLevel, class, subclass, maxStack, equipSlot, texture, vendorPrice = GetItemInfo(item)
	local craftedOrQuest = {
		["Celumbra, the Night's Dichotomy"] = true, 
		["The Sentinel's Eternal Refuge"] = true,
		["Vigilance Perch"] = true,
		["Rethu's Incessant Courage"] = true,
		["Insignia of the Grand Army"] = true,
		["Aman'Thul's Vision"] = true,
		["Purified Titan Essence"] = true
		}
		
	if quality == 5 and (iLevel == LEG_ILVL ) and craftedOrQuest[name] == nil then
		local boaLeg = {
			["Bone-Wrought Coffer of the Damned"] = true,
			["Demonslayer's Soul-Sealed Satchel"] = true,
			["Deepwood Ranger's Quiver"] = true,
			["Spell-Secured Pocket of Infinite Depths"] = true,
			["Hand-Carved Jade Puzzle Box"] = true,
			["Light-Bound Reliquary"] = true,
			["Coffer of Twin Faiths"] = true,
			["Hollow Skeleton Key"] = true,
			["Giant Elemental's Closed Stone Fist"] = true,
			["Pocket Keystone to Abandoned World"] = true,
			["Stalwart Champion's War Chest"] = true
		}
		--Break if we looted a BOA token from the mail
		if (suppressMail ~= nil and time() < suppressMail + 5) and boaLeg[name] == true then
			return
		end
		--Prevent opening BOA tokens from triggering
		if (legBoaOpen ~= nil and time() < (legBoaOpen + 7)) then
			return
		end
		
		self:Print("Congratulations on your legendary!!")
		if historical.numLegs == 0 then 
			self:Print("Time since install of addon " .. tonumber(string.format("%.1f", (time() - historical.installedDate) / DAY)) .. " days")
		else
			self:Print("Time since previous legendary " .. tonumber(string.format("%.1f", (time() - lastLegInfo.date) / DAY)) .. " days")
		end
		LPT:PrintEvents()
		LPT:SaveHistory(name)
		LPT:ResetEvents()
	elseif name == "Blingtron 6000 Gift Package" then
		LPT:BlingtronComplete()
	elseif name == "Champion's Strongbox" then
		LPT:PVPComplete()
	elseif name == "Mythic Keystone" then
		if LPT:CheckClassHall() then
			LPT:WeeklyChestComplete()
		end
	end
	

end

function LPT:CheckClassHall()	
	local _, zoneType = GetInstanceInfo()
	if zoneType == "none" then
		return true
	end
	
	return false
end

function LPT:CHALLENGE_MODE_COMPLETED()
	LPT:MythicPlusCompleted()
end

function LPT:COMBAT_LOG_EVENT_UNFILTERED(eventName, timeStamp, event, hideCaster, sourceGUID, sourceName, sourceFlags, argxx, destGuid, ...)
	if string.match(event,"UNIT_DIED") then
		local mobID = LPT:GuidToID(destGuid, "mob")
		
		if LPTisleRares[mobID] ~= nil and LPTisleRares[mobID]["killed"] == false then
			LPTrareFlag = {}
			LPTrareFlag["ID"] = mobID
			LPTrareFlag["expiration"] = time() + 180
		elseif LPTargusRares[mobID] ~= nil and LPTargusRares[mobID]["killed"] == false then
			LPTrareFlag = {}
			LPTrareFlag["ID"] = mobID
			LPTrareFlag["expiration"] = time() + 180
		end
	end	
end

function LPT:UNIT_SPELLCAST_SENT(eventName, player, action, _, sourceName, guid)

	if player == "player" and (action == "Opening" or action == "Open Augari Chest") then
		local greaterChests = {
			["Krokul Emergency Cache"] = true,
			["Lost Krokul Chest"] = true,
			["Chest of Ill-Gotten Gains"] = true,
			["Void-Tinged Chest"] = true,
			["Desperate Eredar's Cache"] = true,
			["Doomseeker's Treasure"] = true,
			["Ancient Legion War Cache"] = true,
			["Legion Treasure Hoard"] = true,
			["Augari-Runed Chest"] = true,
			["Augari Goods"] = true,
			["Precious Augari Keepsakes"] = true,
			["Legion Tower Chest"] = true,
			["Eredar Treasure Cache"] = true,
			["Student's Surprising Surplus"] = true,
			["Augari Secret Stash"] = true,
			["Shattered House Chest"] = true,
			["Forgotten Legion Supplies"] = true,
			["Fel-Bound Chest"] = true,
			["Timeworn Fel Chest"] = true,
			["Secret Augari Chest"] = true,
			["Long-Lost Augari Treasure"] = true,
			["Missing Augari Chest"] = true
		}

		if sourceName == "Eredar War Supplies" 
			or sourceName == "Legion War Supplies" 
			or sourceName == "Ancient Eredar Cache" 
			or sourceName == "Void-Seeped Cache" 
			then
			LPTchestOpen["time"] = time()
			LPTchestOpen["id"] = guid
			LPTchestOpen["type"] = "lesser"
		elseif greaterChests[sourceName] == true then
			LPTchestOpen["time"] = time()
			LPTchestOpen["id"] = guid
			LPTchestOpen["type"] = "greater"
		end
	end
	
	if player == "player" and (action == "Identify Legendary" or action == "Synthesize Legendary") then
		legBoaOpen = time()
	end
	
end

function LPT:UNIT_SPELLCAST_SUCCEEDED(eventName, player, action, _, guid)
	if player ~= "player" or action ~= "Opening" then
		return
	end
	
	if LPTchestOpen ~= nil and LPTchestOpen["id"] == guid and time() - LPTchestOpen["time"] >= 1 then
		if LPTchestOpen["type"] == "lesser" then
			LPT:ArgusLesserChestCompleted()
		elseif LPTchestOpen["type"] == "greater" then
			LPT:ArgusGreaterChestCompleted()
		end
	end

end


function LPT:QUEST_TURNED_IN(timestamp, questId, arg3, arg4)
	if questId == 42421 --Nightfallen
		or questId == 42233 --Highmountain
		or questId == 42234 --Valarjar
		or questId == 42420 --Court of farondis
		or questId == 42422 --Wardens
		or questId == 42170 --Dreamweavers
		or questId == 43179 --Kirin tor
		or questId == 48641 --Legionfall
		or questId == 48639 --Army of the Light
		or questId == 48642 --Argussian Reach
		then
		LPT:EmissaryCompleted()
	elseif questId == 46748 --Nightfallen Paragon
		or questId == 46743 --Highmountain Paragon
		or questId == 46746 --Valarjar Paragon
		or questId == 46745 --Court Paragon
		or questId == 46747 --Dreamweavers Paragon
		or questId == 46749 --Wardens Paragon
		or questId == 46777 --Legionfall Paragon
		or questId == 48977 --Army of the Light Paragon
		or questId == 48976 --Argussian Reach
		then
		LPT:ParagonCompleted()
	elseif questId == 43512 --Ana-Mouz
		or questId == 47061 --Apocron
		or questId == 46947 --Brutallus
		or questId == 43193 --Calamir
		or questId == 43448 --Drugon
		or questId == 43985 --Flotsam
		or questId == 42819 --Humongris
		or questId == 43192 --Levantus
		or questId == 46948 --Malificus
		or questId == 43513 --Na'zak
		or questId == 42270 --Nithogg
		or questId == 42779 --Shar'thos
		or questId == 46945 --Si'vash
		or questId == 42269 --Soultakers
		or questId == 44287 --Jim
		then
		LPT:WorldBossCompleted()
	elseif questId == 49098 --Invasion Point Cen'gar
		or questId == 49097 --Invasion Point Sangua
		or questId == 49099 --Invasion Point Bonich
		or questId == 49096 --Invasion Point Naigtal
		or questId == 49091 --Invasion Point Val
		or questId == 48982 --Invasion Point Aurinor
		then
		LPT:LesserInvasionCompleted()

	end
	
end

function LPT:Initalize()

	if lptEvents == nil then
    	LPT:ResetEvents()
    end
	
	if bosses == nil then
		LPT:initializeBoss()
	end
	
	if printInfo == nil then
		printInfo = true
	end
	
	if historical == nil then
		historical = {}
		historical.numLegs = 0
		historical.installedDate = time()
		historical.weekNum = LPT:GetWeek() 
	end
	
	if historical.weekNum == nil or historical.weekNum < LPT:GetWeek() then
		historical.weekNum = LPT:GetWeek()
		LPT:initializeBoss()
	end
	
	if lptEvents.blingtron == nil then
		lptEvents.blingtron = 0
	end
	
	if lptEvents.pvp == nil then
		lptEvents.pvp = 0
	end

	if lptEvents.argusGreaterChest == nil then
		lptEvents.argusGreaterChest = 0
	end
	
	if lptEvents.argusLesserChest == nil then
		lptEvents.argusLesserChest = 0
	end

	if lptEvents.argusChest ~= nil then
		lptEvents.argusLesserChest = lptEvents.argusLesserChest + lptEvents.argusChest
		lptEvents.argusChest = nil
	end
	
	if lptEvents.argusRare == nil then
		lptEvents.argusRare = 0
	end
	
	if lptEvents.lesserInvasion == nil then
		lptEvents.lesserInvasion = 0
	end
	
	if lptEvents.greaterInvasion == nil then
		lptEvents.greaterInvasion = 0
	end
	
	if lptHistory == nil then
		lptHistory = {}
	end
	local charName = GetUnitName("player")
	
	if lptHistory[charName] == nil and lastLegInfo ~= nil then
		local legCount = historical["numLegs"]
		lptHistory[charName] = {}
		lptHistory[charName][tostring(legCount)] = lastLegInfo
	end
	
	if lptEvents["oldRaid"] == nil then
		lptEvents["oldRaid"] = 0
	end
	
	LPT:RegisterEvents() 
	LPTchestOpen = {}
	
end

function LPT:BOSS_KILL(...)
	local zoneName = GetZoneText()
	if string.match(zoneName, "Greater Invasion") then
		if bosses["lastGreaterInvasion"] == nil or bosses["lastGreaterInvasion"] < LPT:GetWeek() then
			bosses["lastGreaterInvasion"] = LPT:GetWeek()
			LPT:GreaterInvasionCompleted()
		end
	end
end

function LPT:SHOW_LOOT_TOAST(eventName, lootType, ...)
	local zoneName = GetZoneText()
	if string.match(zoneName, "Greater Invasion") and lootType == "currency" then
		if bosses["lastGreaterInvasion"] == nil or bosses["lastGreaterInvasion"] < LPT:GetWeek() then
			bosses["lastGreaterInvasion"] = LPT:GetWeek()
			LPT:GreaterInvasionCompleted()
		end
	end
end

function LPT:RegisterEvents() 
	local zoneName = GetZoneText()
	if zoneName == "Krokuun" or zoneName == "Broken Shore" or zoneName == "Antoran Wastes" or zoneName == "Mac'Aree" then
		self:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		self:RegisterEvent("UNIT_SPELLCAST_SENT")
		self:RegisterEvent("UNIT_SPELLCAST_SUCCEEDED")
		self:RegisterEvent("BAG_UPDATE_DELAYED")
		self:UnregisterEvent("SHOW_LOOT_TOAST")
	elseif string.match(zoneName, "Greater Invasion") then
		--self:RegisterEvent("BOSS_KILL")
		self:RegisterEvent("SHOW_LOOT_TOAST")
	else
		--self:UnregisterEvent("BOSS_KILL")
		self:UnregisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
		--self:UnregisterEvent("UNIT_SPELLCAST_SENT")
		self:UnregisterEvent("UNIT_SPELLCAST_SUCCEEDED")
		self:UnregisterEvent("BAG_UPDATE_DELAYED")
		self:UnregisterEvent("SHOW_LOOT_TOAST")
	end
	
	if zoneName == "Antorus, the Burning Throne" then
		--fix for using boa tokens outside of a few select zones while keeping minimal addon footprint in Antorus.
		--clicking a boa token inside of Antorus will still register and reset LPT
		self:UnregisterEvent("UNIT_SPELLCAST_SENT")
	else
		self:RegisterEvent("UNIT_SPELLCAST_SENT")
	end
end

function LPT:GetBLP()
	local BLPCap = 622
	local percentages = {
	["mPlusDungeon"] = 10,
	["emissaryChest"] = 19,
	["normalRaid"] = 6,
	["argusLesserChest"] = 0.04,
	["worldBoss"] = 5,
	["lfr"] = 4,
	["heroicRaid"] = 1,
	["paragonChest"] = 2,
	["greaterInvasion"] = 1,
	["lesserInvasion"] = 6,
	["mythicRaid"] = 1,
	["argusRare"] = 0.04,
	["blingtron"] = 0.2,
	["weeklyChest"] = 5,
	["heroicDungeon"] = 0.2,
	["mythicDungeon"] = 0.4,
	["pvp"] = 4,
	["islandRare"] = 0.05,
	["islandChest"] = 0.05,
	["oldRaid"] = 0.35
	}
	local currentTotal = 0
	for event,value in pairs(percentages) do
		currentTotal = currentTotal + lptEvents[event] * value
	end
	--return value is in percentage
	return tonumber(string.format("%.1f", (currentTotal / BLPCap * 100)))
end