-- WorldBossTracker: Config.lua
WorldBossTracker = WorldBossTracker or {}

-- UI behavior
WorldBossTracker.SHOW_BARS = true
WorldBossTracker.UI_UPDATE_INTERVAL = 1 -- seconds

local locale = GetLocale()
local function GetL(en, es)
    if locale == "esES" or locale == "esMX" then return es else return en end
end

-- Rares config (coords in 0–100 style; TomTom slash command will handle them)
WorldBossTracker.rares = {
    ["Doomroller"] = { id = 95056, respawn = 60 * 60, aliases = {"doom","dr"}, coords = {47, 52.5}, mapID = 534, locName = GetL("Doomroller", "Aplastadestino") },
    ["Vengeance"]  = { id = 95054, respawn = 60 * 60, aliases = {"veng","ven"}, coords = {32.5, 74},  mapID = 534, locName = GetL("Vengeance", "Venganza") },
    ["Terrorfist"] = { id = 95044, respawn = 60 * 60, aliases = {"terror","tf"}, coords = {13.5, 60}, mapID = 534, locName = GetL("Terrorfist", "Puñoterror") },
    ["Deathtalon"] = { id = 95053, respawn = 60 * 60,  aliases = {"talon","dt"}, coords = {23, 40.21},  mapID = 534, locName = GetL("Deathtalon", "Garramortal") },
}
WorldBossTracker.raresOrder = {"Doomroller", "Vengeance", "Terrorfist", "Deathtalon"}

