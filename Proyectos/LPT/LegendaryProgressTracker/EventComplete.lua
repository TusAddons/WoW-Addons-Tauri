function LPT:PrintInfo(event, number)
	if printInfo then
		self:Print("¡" .. event .. " completado/a! " .. number .. " en total desde tu último legendario")
	end
	if LPT.UpdateUI then LPT:UpdateUI() end
end

function LPT:EmissaryCompleted()
	lptEvents.emissaryChest = lptEvents.emissaryChest + 1
	LPT:PrintInfo("Cofre de Emisario", lptEvents.emissaryChest)
end

function LPT:ParagonCompleted()
	lptEvents.paragonChest = lptEvents.paragonChest + 1
	LPT:PrintInfo("Cofre de Baluarte", lptEvents.paragonChest)
end

function LPT:IsleRareCompleted(mobID)
	LPTisleRares[mobID]["killed"] = true
	lptEvents.islandRare = lptEvents.islandRare + 1
	LPT:PrintInfo("Raro de la Costa Abrupta", lptEvents.islandRare)
end

function LPT:ArgusRareCompleted(mobID)
	LPTargusRares[mobID]["killed"] = true
	lptEvents.argusRare = lptEvents.argusRare + 1
	LPT:PrintInfo("Raro de Argus", lptEvents.argusRare)
end

function LPT:BrokenIslesRareCompleted(mobID)
	LPTbrokenIslesRares[mobID]["killed"] = true
	lptEvents.brokenIslesRare = lptEvents.brokenIslesRare + 1
	LPT:PrintInfo("Raro de las Islas Abruptas", lptEvents.brokenIslesRare)
end

function LPT:WarSupCompleted()
	lptEvents.warSupplies = lptEvents.warSupplies + 1
	LPT:PrintInfo("Entrega de Suministros", lptEvents.warSupplies)
end

function LPT:IslandChestCompleted()
	lptEvents.islandChest = lptEvents.islandChest + 1
	LPT:PrintInfo("Cofre Velado", lptEvents.islandChest)
end

--[[function LPT:ArgusChestCompleted()
	lptEvents.argusChest = lptEvents.argusChest + 1
	LPT:PrintInfo("Argus Chest", lptEvents.argusChest)
end]]--
function LPT:ArgusLesserChestCompleted()
	lptEvents.argusLesserChest = lptEvents.argusLesserChest + 1
	LPT:PrintInfo("Cofre Menor de Argus", lptEvents.argusLesserChest)
end

function LPT:ArgusGreaterChestCompleted()
	lptEvents.argusGreaterChest = lptEvents.argusGreaterChest + 1
	LPT:PrintInfo("Cofre Mayor de Argus", lptEvents.argusGreaterChest)
end

function LPT:MythicPlusCompleted()
	lptEvents.mPlusDungeon = lptEvents.mPlusDungeon + 1
	LPT:PrintInfo("Mazmorra Mítica+", lptEvents.mPlusDungeon)
end

function LPT:BossComplete(difficultyId)
	if difficultyId == 14 then
		lptEvents.normalRaid = lptEvents.normalRaid + 1
		LPT:PrintInfo("Jefe de Banda (Normal)", lptEvents.normalRaid)
	elseif difficultyId == 15 then
		lptEvents.heroicRaid = lptEvents.heroicRaid + 1
		LPT:PrintInfo("Jefe de Banda (Heroico)", lptEvents.heroicRaid)
	elseif difficultyId == 16 then
		lptEvents.mythicRaid = lptEvents.mythicRaid + 1
		LPT:PrintInfo("Jefe de Banda (Mítico)", lptEvents.mythicRaid)
	elseif difficultyId == 17 then
		lptEvents.lfr = lptEvents.lfr + 1
		LPT:PrintInfo("Jefe de Banda (Buscador)", lptEvents.lfr)
	elseif difficultyId == 23 then
		lptEvents.mythicDungeon = lptEvents.mythicDungeon + 1
		LPT:PrintInfo("Jefe de Mazmorra (Mítica)", lptEvents.mythicDungeon)
	elseif difficultyId == 2 then
		lptEvents.heroicDungeon = lptEvents.heroicDungeon + 1
		LPT:PrintInfo("Jefe de Mazmorra (Heroica)", lptEvents.heroicDungeon)
	end
end

function LPT:BlingtronComplete()
	lptEvents.blingtron = lptEvents.blingtron + 1
	LPT:PrintInfo("Joyatrón", lptEvents.blingtron)
end

function LPT:WorldBossCompleted()
	lptEvents.worldBoss = lptEvents.worldBoss + 1
	LPT:PrintInfo("Jefe de Mundo", lptEvents.worldBoss)
end

function LPT:PVPComplete()
	lptEvents.pvp = lptEvents.pvp + 1
	LPT:PrintInfo("Evento JcJ", lptEvents.pvp)
end

function LPT:LesserInvasionCompleted()
	lptEvents.lesserInvasion = lptEvents.lesserInvasion + 1
	LPT:PrintInfo("Invasión Menor de Argus", lptEvents.lesserInvasion)
end

function LPT:GreaterInvasionCompleted()
	lptEvents.greaterInvasion = lptEvents.greaterInvasion + 1
	LPT:PrintInfo("Invasión Mayor de Argus", lptEvents.greaterInvasion)
end

function LPT:WeeklyChestComplete()
	lptEvents.weeklyChest = lptEvents.weeklyChest + 1
	LPT:PrintInfo("Cofre Semanal Mítico+", lptEvents.weeklyChest)
end

function LPT:OldRaidComplete()
	lptEvents.oldRaid = lptEvents.oldRaid + 1
	LPT:PrintInfo("Jefe de Banda (Contenido Antiguo)", lptEvents.oldRaid)
end