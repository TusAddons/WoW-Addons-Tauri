function LPT:PrintInfo(event, number)
	if printInfo then
		self:Print("Completed " .. event .. "! " .. number .. " total since last legendary")
	end
end

function LPT:EmissaryCompleted()
	lptEvents.emissaryChest = lptEvents.emissaryChest + 1
	LPT:PrintInfo("Emissary Cache", lptEvents.emissaryChest)
end

function LPT:ParagonCompleted()
	lptEvents.paragonChest = lptEvents.paragonChest + 1
	LPT:PrintInfo("Paragon Rep Cache", lptEvents.paragonChest)
end

function LPT:IsleRareCompleted(mobID)
	LPTisleRares[mobID]["killed"] = true
	lptEvents.islandRare = lptEvents.islandRare + 1
	LPT:PrintInfo("Broken Shore Rare", lptEvents.islandRare)
end

function LPT:ArgusRareCompleted(mobID)
	LPTargusRares[mobID]["killed"] = true
	lptEvents.argusRare = lptEvents.argusRare + 1
	LPT:PrintInfo("Argus Rare", lptEvents.argusRare)
end

function LPT:WarSupCompleted()
	lptEvents.warSupplies = lptEvents.warSupplies + 1
	LPT:PrintInfo("War Supply Turnin", lptEvents.warSupplies)
end

function LPT:IslandChestCompleted()
	lptEvents.islandChest = lptEvents.islandChest + 1
	LPT:PrintInfo("Veiled Chest", lptEvents.islandChest)
end

--[[function LPT:ArgusChestCompleted()
	lptEvents.argusChest = lptEvents.argusChest + 1
	LPT:PrintInfo("Argus Chest", lptEvents.argusChest)
end]]--
function LPT:ArgusLesserChestCompleted()
	lptEvents.argusLesserChest = lptEvents.argusLesserChest + 1
	LPT:PrintInfo("Argus Lesser Chest", lptEvents.argusLesserChest)
end

function LPT:ArgusGreaterChestCompleted()
	lptEvents.argusGreaterChest = lptEvents.argusGreaterChest + 1
	LPT:PrintInfo("Argus Greater Chest", lptEvents.argusGreaterChest)
end

function LPT:MythicPlusCompleted()
	lptEvents.mPlusDungeon = lptEvents.mPlusDungeon + 1
	LPT:PrintInfo("Mythic + Dungeon", lptEvents.mPlusDungeon)
end

function LPT:BossComplete(difficultyId)
	if difficultyId == 14 then
		lptEvents.normalRaid = lptEvents.normalRaid + 1
		LPT:PrintInfo("Normal Raid Boss", lptEvents.normalRaid)
	elseif difficultyId == 15 then
		lptEvents.heroicRaid = lptEvents.heroicRaid + 1
		LPT:PrintInfo("Heroic Raid Boss", lptEvents.heroicRaid)
	elseif difficultyId == 16 then
		lptEvents.mythicRaid = lptEvents.mythicRaid + 1
		LPT:PrintInfo("Mythic Boss", lptEvents.mythicRaid)
	elseif difficultyId == 17 then
		lptEvents.lfr = lptEvents.lfr + 1
		LPT:PrintInfo("LFR Boss", lptEvents.lfr)
	elseif difficultyId == 23 then
		lptEvents.mythicDungeon = lptEvents.mythicDungeon + 1
		LPT:PrintInfo("Mythic Dungeon Boss", lptEvents.mythicDungeon)
	elseif difficultyId == 2 then
		lptEvents.heroicDungeon = lptEvents.heroicDungeon + 1
		LPT:PrintInfo("Heroic Dungeon Boss", lptEvents.heroicDungeon)
	end
end

function LPT:BlingtronComplete()
	lptEvents.blingtron = lptEvents.blingtron + 1
	LPT:PrintInfo("Blingtron", lptEvents.blingtron)
end

function LPT:WorldBossCompleted()
	lptEvents.worldBoss = lptEvents.worldBoss + 1
	LPT:PrintInfo("World Boss", lptEvents.worldBoss)
end

function LPT:PVPComplete()
	lptEvents.pvp = lptEvents.pvp + 1
	LPT:PrintInfo("PvP Event", lptEvents.pvp)
end

function LPT:LesserInvasionCompleted()
	lptEvents.lesserInvasion = lptEvents.lesserInvasion + 1
	LPT:PrintInfo("Argus Lesser Invasion", lptEvents.lesserInvasion)
end

function LPT:GreaterInvasionCompleted()
	lptEvents.greaterInvasion = lptEvents.greaterInvasion + 1
	LPT:PrintInfo("Argus Greater Invasion", lptEvents.greaterInvasion)
end

function LPT:WeeklyChestComplete()
	lptEvents.weeklyChest = lptEvents.weeklyChest + 1
	LPT:PrintInfo("Mythic Plus Weekly Chest", lptEvents.weeklyChest)
end

function LPT:OldRaidComplete()
	lptEvents.oldRaid = lptEvents.oldRaid + 1
	LPT:PrintInfo("Old content raid boss", lptEvents.oldRaid)
end