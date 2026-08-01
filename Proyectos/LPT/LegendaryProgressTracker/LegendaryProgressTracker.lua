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

-- Escanea raros ya matados (quest flags) y los suma retroactivamente al contador
function LPT:ScanKilledRares()
	local isleCount = 0
	local argusCount = 0
	local brokenIslesCount = 0
	
	for npcId, data in pairs(LPTisleRares) do
		if IsQuestFlaggedCompleted(data["questId"]) then
			isleCount = isleCount + 1
		end
	end
	
	for npcId, data in pairs(LPTargusRares) do
		if IsQuestFlaggedCompleted(data["questId"]) then
			argusCount = argusCount + 1
		end
	end
	
	for npcId, data in pairs(LPTbrokenIslesRares) do
		if IsQuestFlaggedCompleted(data["questId"]) then
			brokenIslesCount = brokenIslesCount + 1
		end
	end
	
	-- Solo sumar la diferencia (por si ya tiene algo trackeado manualmente)
	local isleNew = math.max(0, isleCount - (lptEvents.islandRare or 0))
	local argusNew = math.max(0, argusCount - (lptEvents.argusRare or 0))
	local brokenIslesNew = math.max(0, brokenIslesCount - (lptEvents.brokenIslesRare or 0))
	
	lptEvents.islandRare = (lptEvents.islandRare or 0) + isleNew
	lptEvents.argusRare = (lptEvents.argusRare or 0) + argusNew
	lptEvents.brokenIslesRare = (lptEvents.brokenIslesRare or 0) + brokenIslesNew
	
	local totalNew = isleNew + argusNew + brokenIslesNew
	return totalNew, isleNew, argusNew, brokenIslesNew
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
			self:Print("Impresión de información activada")
		else
			self:Print("Impresión de información desactivada")
		end
	end

	if command == "lock" then
		lptUIConfig.locked = not lptUIConfig.locked
		if lptUIConfig.locked then
			self:Print("Rastreador visual bloqueado.")
		else
			self:Print("Rastreador visual desbloqueado. Puedes arrastrarlo.")
		end
		LPT:UpdateUI()
	end

	if command == "blp" then
		self:Print(LPT:GetBLP())
	end
	
	if command == "scan" then
		if historical.numLegs > 0 and value ~= "force" then
			self:Print("|cFFFF5555¡Atención!|r Ya has conseguido al menos un legendario.")
			self:Print("No es posible distinguir qué raros mataste antes o después de tu último legendario.")
			self:Print("Si quieres forzarlo de todas formas, usa: |cFF00FF00/lpt scan force|r")
		else
			local totalNew, isleNew, argusNew, brokenNew = LPT:ScanKilledRares()
			if totalNew > 0 then
				self:Print("|cFF00FF00Escaneo completado.|r Se han añadido " .. totalNew .. " raros a tu progreso:")
				if brokenNew > 0 then self:Print("  Islas Abruptas: +" .. brokenNew) end
				if isleNew > 0 then self:Print("  Costa Abrupta: +" .. isleNew) end
				if argusNew > 0 then self:Print("  Argus: +" .. argusNew) end
				self:Print("Nuevo BLP: " .. LPT:GetBLP() .. "%")
				if LPT.UpdateUI then LPT:UpdateUI() end
			else
				self:Print("No se encontraron raros nuevos para añadir. Tu progreso ya está al día.")
			end
		end
	end
	
	if command == "reset" then
		if lptEvents then
			lptBackup = {}
			for k,v in pairs(lptEvents) do
				lptBackup[k] = v
			end
		end
		LPT:ResetEvents()
		self:Print("Progreso reiniciado. Backup temporal guardado (usa /lpt restore o /lpt restore full).")
		LPT:UpdateUI()
	end
	
	if command == "restore" then
		if lptBackup then
			if value == "full" then
				lptEvents = {}
				for k,v in pairs(lptBackup) do
					lptEvents[k] = v
				end
				self:Print("Progreso restaurado completamente desde el backup.")
			else
				for k,v in pairs(lptBackup) do
					if type(v) == "number" then
						lptEvents[k] = (lptEvents[k] or 0) + v
					end
				end
				self:Print("El backup se ha sumado a tu progreso actual.")
			end
			LPT:UpdateUI()
		else
			self:Print("No hay ningún backup guardado en esta sesión.")
		end
	end
		
end

function LPT:PLAYER_LOGIN()
	LPT:setIslandRares()
	LPT:setArgusRares()
	LPT:setBrokenIslesRares()
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
		elseif LPTbrokenIslesRares[LPTrareFlag["ID"]] ~= nil and IsQuestFlaggedCompleted(LPTbrokenIslesRares[LPTrareFlag["ID"]]["questId"]) then
			LPT:BrokenIslesRareCompleted(LPTrareFlag["ID"])
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
	lptEvents.brokenIslesRare = 0
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
	lptEvents.brokenIslesRare = 0
	lptEvents.oldRaid = 0

end

function LPT:GetEventsString()
	local s = ""
	if historical.numLegs == 0 then 
		s = s .. "Eventos desde la instalación del addon\n"
	else
		s = s .. "Eventos desde tu último legendario\n"
	end
	s = s .. "Cofres de Emisario: " .. lptEvents.emissaryChest .. "\n"
	s = s .. "Cofre Semanal (M+): " .. lptEvents.weeklyChest .. "\n"
	s = s .. "Cofres de Baluarte (Paragón): " .. lptEvents.paragonChest .. "\n"
	s = s .. "Cofres de Argus (Menor; Mayor): " .. lptEvents.argusLesserChest .. "; " .. lptEvents.argusGreaterChest .. "\n"
	s = s .. "Raros de Argus: " .. lptEvents.argusRare .. "\n"
	s = s .. "Raros de las Islas Abruptas: " .. lptEvents.brokenIslesRare .. "\n"
	s = s .. "Invasiones de Argus (Menor; Mayor): " .. lptEvents.lesserInvasion .. "; " .. lptEvents.greaterInvasion .. "\n"
	s = s .. "Jefes de Mazmorra Heroica: " .. lptEvents.heroicDungeon .. "\n"
	s = s .. "Raros de la Costa Abrupta: " .. lptEvents.islandRare .. "\n"
	s = s .. "Jefes de Mazmorra Mítica 0: " .. lptEvents.mythicDungeon .. "\n"
	s = s .. "Mazmorras Míticas+: " .. lptEvents.mPlusDungeon .. "\n"
	s = s .. "Jefes de Banda (Buscador; Normal; Heroico; Mítico; Antiguos): " .. lptEvents.lfr .. "; " .. lptEvents.normalRaid .. "; " .. lptEvents.heroicRaid .. "; " .. lptEvents.mythicRaid .. "; " .. lptEvents.oldRaid .. "\n"
	s = s .. "Jefes de Mundo: " .. lptEvents.worldBoss .. "\n"
	s = s .. "Eventos JcJ (PvP): " .. lptEvents.pvp .. "\n"
	s = s .. "Entregas de Suministros: " .. lptEvents.warSupplies .. "\n"
	s = s .. "Joyatrón 6000: " .. lptEvents.blingtron .. "\n"
	if historical.numLegs == 0 then 
		s = s .. "Días desde la instalación: " .. tonumber(string.format("%.1f", (time() - historical.installedDate) / DAY)) .. "\n"
	else
		s = s .. "Días desde el último legendario: " .. tonumber(string.format("%.1f", (time() - lastLegInfo.date) / DAY)) .. "\n"
	end
	s = s .. LPT:GetBLP() .. "% hacia el límite de Protección contra mala suerte"
	return s
end

function LPT:PrintEvents()
	local s = LPT:GetEventsString()
	for line in string.gmatch(s, "[^\n]+") do
		self:Print(line)
	end
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
		
	if quality == 5 and (iLevel >= 895) and craftedOrQuest[name] == nil then
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
		
		self:Print("¡Enhorabuena por tu legendario!")
		if historical.numLegs == 0 then 
			self:Print("Días desde la instalación del addon: " .. tonumber(string.format("%.1f", (time() - historical.installedDate) / DAY)))
		else
			self:Print("Días desde el legendario anterior: " .. tonumber(string.format("%.1f", (time() - lastLegInfo.date) / DAY)))
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
	if event == "UNIT_DIED" then
		local mobID = LPT:GuidToID(destGuid, "mob")
		
		if LPTisleRares[mobID] ~= nil and LPTisleRares[mobID]["killed"] == false then
			LPTrareFlag = {}
			LPTrareFlag["ID"] = mobID
			LPTrareFlag["expiration"] = time() + 180
		elseif LPTargusRares[mobID] ~= nil and LPTargusRares[mobID]["killed"] == false then
			LPTrareFlag = {}
			LPTrareFlag["ID"] = mobID
			LPTrareFlag["expiration"] = time() + 180
		elseif LPTbrokenIslesRares[mobID] ~= nil and LPTbrokenIslesRares[mobID]["killed"] == false then
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
		historical.raresScanned = false
	end
	
	-- Auto-scan de raros ya matados en primera instalación (sin legendarios)
	if historical.numLegs == 0 and historical.raresScanned ~= true then
		historical.raresScanned = true
		local totalNew = LPT:ScanKilledRares()
		if totalNew > 0 then
			LPT:Print("|cFF00FF00Auto-scan:|r Se han detectado " .. totalNew .. " raros ya eliminados y se han añadido a tu progreso.")
		end
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
	
	if lptEvents.brokenIslesRare == nil then
		lptEvents.brokenIslesRare = 0
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
	
	if lptUIConfig == nil then
		lptUIConfig = { x = 10, y = 200, locked = false }
	end

	LPT:RegisterEvents() 
	LPTchestOpen = {}
	LPT:CreateTrackerUI()
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
	-- Broken Isles zones where rares can drop legendaries
	local brokenIslesZones = {
		["Azsuna"] = true, ["Stormheim"] = true, ["Val'sharah"] = true,
		["Highmountain"] = true, ["Suramar"] = true, ["Helheim"] = true,
		["Thunder Totem"] = true,
	}
	if zoneName == "Krokuun" or zoneName == "Broken Shore" or zoneName == "Antoran Wastes" or zoneName == "Mac'Aree" or brokenIslesZones[zoneName] then
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
	local BLPCap = 250
	local percentages = {
	["mPlusDungeon"] = 2.5,
	["emissaryChest"] = 4,
	["normalRaid"] = 3,
	["argusLesserChest"] = 0.1,
	["worldBoss"] = 3,
	["lfr"] = 2,
	["heroicRaid"] = 4,
	["paragonChest"] = 4,
	["greaterInvasion"] = 4,
	["lesserInvasion"] = 1,
	["mythicRaid"] = 6,
	["argusRare"] = 0.2,
	["brokenIslesRare"] = 0.2,
	["blingtron"] = 0.2,
	["weeklyChest"] = 5,
	["heroicDungeon"] = 0.5,
	["mythicDungeon"] = 1,
	["pvp"] = 1,
	["islandRare"] = 0.2,
	["islandChest"] = 0.1,
	["oldRaid"] = 1.5
	}
	local currentTotal = 0
	for event,value in pairs(percentages) do
		currentTotal = currentTotal + lptEvents[event] * value
	end
	--return value is in percentage
	return tonumber(string.format("%.1f", (currentTotal / BLPCap * 100)))
end

function LPT:CreateTrackerUI()
	if LPT.UIFrame then return end

	local f = CreateFrame("Button", "LPTTrackerFrame", UIParent)
	f:SetSize(80, 24)
	f:SetPoint("BOTTOMLEFT", UIParent, "BOTTOMLEFT", lptUIConfig.x or 10, lptUIConfig.y or 200)
	f:SetMovable(true)
	f:EnableMouse(true)
	f:RegisterForDrag("LeftButton")

	local text = f:CreateFontString(nil, "OVERLAY", "GameFontNormal")
	text:SetPoint("CENTER", f, "CENTER", 0, 0)
	f.text = text

	f:SetScript("OnDragStart", function(self)
		if not lptUIConfig.locked then
			self:StartMoving()
		end
	end)
	f:SetScript("OnDragStop", function(self)
		self:StopMovingOrSizing()
		lptUIConfig.x = self:GetLeft()
		lptUIConfig.y = self:GetBottom()
	end)

	f:SetScript("OnEnter", function(self)
		GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
		GameTooltip:AddLine("Legendary Progress Tracker", 1, 1, 1)
		GameTooltip:AddLine(LPT:GetEventsString(), nil, nil, nil, true)
		if not lptUIConfig.locked then
			GameTooltip:AddLine("\n|cff00ff00Arrastra para mover. Escribe /lpt lock para bloquear.|r")
		end
		GameTooltip:Show()
	end)
	f:SetScript("OnLeave", function(self)
		GameTooltip:Hide()
	end)

	LPT.UIFrame = f
	LPT:UpdateUI()
end

function LPT:UpdateUI()
	if LPT.UIFrame then
		LPT.UIFrame.text:SetText("BLP: " .. LPT:GetBLP() .. "%")
	end
end