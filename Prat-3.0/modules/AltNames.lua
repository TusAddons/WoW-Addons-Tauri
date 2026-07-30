---------------------------------------------------------------------------------
--
-- Prat - A framework for World of Warcraft chat mods
--
-- Copyright (C) 2006-2018  Prat Development Team
--
-- This program is free software; you can redistribute it and/or
-- modify it under the terms of the GNU General Public License
-- as published by the Free Software Foundation; either version 2
-- of the License, or (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with this program; if not, write to:
--
-- Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor,
-- Boston, MA  02110-1301, USA.
--
--
-------------------------------------------------------------------------------

local Prat = Prat

Prat:AddModuleToLoad(function()

  local PRAT_MODULE = Prat:RequestModuleName("AltNames")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceEvent-3.0")

  local PL = module.PL

  --[===[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["Start"] = true,
    ["AltNames"] = true,
    ["module_desc"] = "Allows people's alt characters to be linked to their mains, which can then be displayed next to their names when found in chat messages (default=off).",
    ["quiet"] = "Be quiet",
    ["quiet_name"] = true,
    ["quiet_desc"] = "Whether to report to the chat frame or not.",
    ["mainpos_name"] = "Main name position",
    ["mainpos_desc"] = "Where to display a character's main name when on their alt.",
    ["Main name position"] = true,
    ["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = true,
    ["Where to display a character's main name when on their alt."] = true,
    ["Left"] = true,
    ["Right"] = true,
    ["Disabled"] = true,
    ["Find characters"] = true,
    ["Search the list of linked characters for matching main or alt names."] = true,
    ["<search term> (eg, /altnames find fin)"] = true,
    ["Link alt"] = true,
    ["Link someone's alt character with the name of their main."] = true,
    ["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = true,
    ["Delete alt"] = true,
    ["Delete a character's link to another character as their main."] = true,
    ["Be quiet"] = true,
    ["Whether to report to the chat frame or not."] = true,
    ["You have not yet linked any alts with their mains."] = true,
    ["no matches found"] = true,
    ["List all"] = true,
    ["List all links between alts and their main names."] = true,
    ["Imports data from LOKWhoIsWho, if present (drop your SavedVariables\LOKWhoIsWho.lua in the Prat directory to be able to use this)."] = true,
    ["LOKWhoIsWho import"] = true,
    ["Clear all"] = true,
    ["Clear all links between alts and main names."] = true,
    ["Colour"] = true,
    ["The colour of an alt's main name that will be displayed"] = true,
    ["Import from guild roster"] = true,
    ['Imports alt names from the guild roster by checking for members with the rank "alt" or "alts", or guild / officer notes like "<name>\'s alt"'] = true,
    ['Import from Guild Greet database'] = true,
    ['Imports alt names from a Guild Greet database, if present'] = true,
    ['Use class colour (from the PlayerNames module)'] = true,
    ["use class colour of main"] = true,
    ["use class colour of alt"] = true,
    ["don't use"] = true,
    ["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = true,
    ["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = true,
    ["Don't use data from the PlayerNames module at all"] = true,
    ["Import options"] = true,
    ["Various ways to import a main's alts from other addons"] = true,
    ["Don't overwrite existing links"] = true,
    ["Don't overwrite existing alt <-> main links when importing or adding new alts."] = true,
    [".*[Aa]lts?$"] = true,
    ["(.-)'s? [Aa]lt"] = "%f[%a\192-\255]([%a\192-\255]+)%f[^%a\128-\255]'s [Aa]lt",
    ["([^%s%p%d%c%z]+)'s alt"] = "%f[%a\192-\255]([%a\192-\255]+)%f[^%a\128-\255]'s [Aa]lt",
    ['ERROR: some function sent a blank message!'] = true,
    ["Alts:"] = true,
    ['Main:'] = true,
    ["No main name suPLied to link %s to"] = true,
    ['alt name exists: %s -> %s; not overwriting as set in preferences'] = true,
    ['warning: alt %s already linked to %s'] = true,
    ["linked alt %s => %s"] = true,
    ["character removed: %s"] = true,
    ['no characters called "%s" found; nothing deleted'] = true,
    ['%s total alts linked to mains'] = true,
    ['no alts or mains found matching "%s"'] = true,
    ["searched for: %s - total matches: %s"] = true,
    ['LOKWhoIsWho lua file not found, sorry.'] = true,
    ["LOKWhoIsWho data not found"] = true,
    ["%s alts imported from LOKWhoIsWho"] = true,
    ['No Guild Greet database found'] = true,
    ['You are not in a guild'] = true,
    ["guild member alts found and imported: %s"] = true,
    ["Fix alts"] = true,
    ["Fix corrupted entries in your list of alt names."] = true,
    ["Class colour"] = true,
    ["Use class colour (from the PlayerNames module)"] = true,
    ['Show main in tooltip'] = true,
    ["Display a player's main name in the tooltip"] = true,
    ['Show alts in tooltip'] = true,
    ["Display a player's alts in the tooltip"] = true,
    ["Found alt: %s => main: %s"] = true,
    ["alt"] = true,
    ["main"] = true,
    ["Alt"] = true,
    ["Main"] = true,
    ['no alts found for character '] = true,
    ['List alts'] = true,
    ['List alts for a given character'] = true,
    ['<main> (eg /altnames listalts Fin)'] = true,
    ['%d alts found for %s: %s'] = true,
    ['No arg string given to :addAlt()'] = true,
    ["Use LibAlts Data"] = true,
    ["Use the data available via the shared alt information library."] = true,
    ["autoguildalts_name"] = "Auto Import Guild Alts",
    ["autoguildalts_desc"] = "Automatically run the import from guild roster command silently",
  })
  --@end-debug@]===]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization

  --@non-debug@
do
      local L

  L=
{
	["AltNames"] = {
		["%d alts found for %s: %s"] = true,
		["%s alts imported from LOKWhoIsWho"] = true,
		["%s total alts linked to mains"] = true,
		["(.-)'s? [Aa]lt"] = "%f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]'s [Aa]lt",
		["([^%s%p%d%c%z]+)'s alt"] = "%f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]'s [Aa]lt",
		[".*[Aa]lts?$"] = true,
		["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = true,
		["<main> (eg /altnames listalts Fin)"] = true,
		["<search term> (eg, /altnames find fin)"] = true,
		["Alt"] = true,
		["alt"] = true,
		["alt name exists: %s -> %s; not overwriting as set in preferences"] = true,
		["AltNames"] = true,
		["Alts:"] = true,
		["autoguildalts_desc"] = "Automatically run the import from guild roster command silently",
		["autoguildalts_name"] = "Auto Import Guild Alts",
		["Be quiet"] = true,
		["character removed: %s"] = true,
		["Class colour"] = true,
		["Clear all"] = true,
		["Clear all links between alts and main names."] = true,
		["Colour"] = true,
		["Delete a character's link to another character as their main."] = true,
		["Delete alt"] = true,
		["Disabled"] = true,
		["Display a player's alts in the tooltip"] = true,
		["Display a player's main name in the tooltip"] = true,
		["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = true,
		["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = true,
		["Don't overwrite existing alt <-> main links when importing or adding new alts."] = true,
		["Don't overwrite existing links"] = true,
		["don't use"] = true,
		["Don't use data from the PlayerNames module at all"] = true,
		["ERROR: some function sent a blank message!"] = true,
		["Find characters"] = true,
		["Fix alts"] = true,
		["Fix corrupted entries in your list of alt names."] = true,
		["Found alt: %s => main: %s"] = true,
		["guild member alts found and imported: %s"] = true,
		["Import from Guild Greet database"] = true,
		["Import from guild roster"] = true,
		["Import options"] = true,
		["Imports alt names from a Guild Greet database, if present"] = true,
		["Imports alt names from the guild roster by checking for members with the rank \"alt\" or \"alts\", or guild / officer notes like \"<name>'s alt\""] = true,
		["Imports data from LOKWhoIsWho, if present (drop your SavedVariablesLOKWhoIsWho.lua in the Prat directory to be able to use this)."] = true,
		["Left"] = true,
		["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = true,
		["Link alt"] = true,
		["Link someone's alt character with the name of their main."] = true,
		["linked alt %s => %s"] = true,
		["List all"] = true,
		["List all links between alts and their main names."] = true,
		["List alts"] = true,
		["List alts for a given character"] = true,
		["LOKWhoIsWho data not found"] = true,
		["LOKWhoIsWho import"] = true,
		["LOKWhoIsWho lua file not found, sorry."] = true,
		["Main"] = true,
		["main"] = true,
		["Main name position"] = true,
		["Main:"] = true,
		["mainpos_desc"] = "Where to display a character's main name when on their alt.",
		["mainpos_name"] = "Main name position",
		["module_desc"] = "Allows people's alt characters to be linked to their mains, which can then be displayed next to their names when found in chat messages (default=off).",
		["no alts found for character "] = true,
		["no alts or mains found matching \"%s\""] = true,
		["No arg string given to :addAlt()"] = true,
		["no characters called \"%s\" found; nothing deleted"] = true,
		["No Guild Greet database found"] = true,
		["No main name supplied to link %s to"] = true,
		["no matches found"] = true,
		["quiet"] = "Be quiet",
		["quiet_desc"] = "Whether to report to the chat frame or not.",
		["quiet_name"] = true,
		["Right"] = true,
		["Search the list of linked characters for matching main or alt names."] = true,
		["searched for: %s - total matches: %s"] = true,
		["Show alts in tooltip"] = true,
		["Show main in tooltip"] = true,
		["Start"] = true,
		["The colour of an alt's main name that will be displayed"] = true,
		["Use class colour (from the PlayerNames module)"] = true,
		["use class colour of alt"] = true,
		["use class colour of main"] = true,
		["Use LibAlts Data"] = true,
		["Use the data available via the shared alt information library."] = true,
		["Various ways to import a main's alts from other addons"] = true,
		["warning: alt %s already linked to %s"] = true,
		["Where to display a character's main name when on their alt."] = true,
		["Whether to report to the chat frame or not."] = true,
		["You are not in a guild"] = true,
		["You have not yet linked any alts with their mains."] = true,
	}
}
    PL:AddLocale(PRAT_MODULE, "enUS",L)

  L=
{
	["AltNames"] = {
		--[[Translation missing --]]
		--[[ ["%d alts found for %s: %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["%s alts imported from LOKWhoIsWho"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["%s total alts linked to mains"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["(.-)'s? [Aa]lt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["([^%s%p%d%c%z]+)'s alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ [".*[Aa]lts?$"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["<main> (eg /altnames listalts Fin)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["<search term> (eg, /altnames find fin)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["alt name exists: %s -> %s; not overwriting as set in preferences"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["AltNames"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Alts:"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["autoguildalts_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["autoguildalts_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Be quiet"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["character removed: %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Class colour"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Clear all"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Clear all links between alts and main names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Colour"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Delete a character's link to another character as their main."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Delete alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Disabled"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Display a player's alts in the tooltip"] = "",--]] 
		["Display a player's main name in the tooltip"] = "Affiche le nom principale d'un joueur dans la tooltip",
		--[[Translation missing --]]
		--[[ ["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = "",--]] 
		["Don't overwrite existing alt <-> main links when importing or adding new alts."] = "Ne pas Ã©craser les liens principal <-> Alternatif lors d'un import ou d'un ajout de nouveaux personnages Alternatifs",
		["Don't overwrite existing links"] = "Ne pas Ã©craser les liens existant",
		--[[Translation missing --]]
		--[[ ["don't use"] = "",--]] 
		["Don't use data from the PlayerNames module at all"] = "Ne pas utiliser les donnÃ©e du module \"PlayerNames\" du tout",
		["ERROR: some function sent a blank message!"] = "ERREUR: une fonction a envoyÃ© un message blanc !",
		["Find characters"] = "Trouver des personnages",
		["Fix alts"] = "RÃ©parer les personnages secondaires",
		["Fix corrupted entries in your list of alt names."] = "RÃ©parer les entrÃ©es corrompues dans votre liste de noms alternatifs.",
		--[[Translation missing --]]
		--[[ ["Found alt: %s => main: %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["guild member alts found and imported: %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Import from Guild Greet database"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Import from guild roster"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Import options"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Imports alt names from a Guild Greet database, if present"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Imports alt names from the guild roster by checking for members with the rank \"alt\" or \"alts\", or guild / officer notes like \"<name>'s alt\""] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Imports data from LOKWhoIsWho, if present (drop your SavedVariablesLOKWhoIsWho.lua in the Prat directory to be able to use this)."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Left"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Link alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Link someone's alt character with the name of their main."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["linked alt %s => %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["List all"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["List all links between alts and their main names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["List alts"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["List alts for a given character"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["LOKWhoIsWho data not found"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["LOKWhoIsWho import"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["LOKWhoIsWho lua file not found, sorry."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Main"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["main"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Main name position"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Main:"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["mainpos_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["mainpos_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["no alts found for character "] = "",--]] 
		--[[Translation missing --]]
		--[[ ["no alts or mains found matching \"%s\""] = "",--]] 
		--[[Translation missing --]]
		--[[ ["No arg string given to :addAlt()"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["no characters called \"%s\" found; nothing deleted"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["No Guild Greet database found"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["No main name supplied to link %s to"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["no matches found"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["quiet"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["quiet_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["quiet_name"] = "",--]] 
		["Right"] = "Droite",
		--[[Translation missing --]]
		--[[ ["Search the list of linked characters for matching main or alt names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["searched for: %s - total matches: %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show alts in tooltip"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show main in tooltip"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Start"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["The colour of an alt's main name that will be displayed"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Use class colour (from the PlayerNames module)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["use class colour of alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["use class colour of main"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Use LibAlts Data"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Use the data available via the shared alt information library."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Various ways to import a main's alts from other addons"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["warning: alt %s already linked to %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Where to display a character's main name when on their alt."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Whether to report to the chat frame or not."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["You are not in a guild"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["You have not yet linked any alts with their mains."] = "",--]] 
	}
}
    PL:AddLocale(PRAT_MODULE, "frFR",L)

  L=
{
	["AltNames"] = {
		["%d alts found for %s: %s"] = "%d Alts gefunden fÃ¼r %s: %s",
		["%s alts imported from LOKWhoIsWho"] = "%s Alts importiert von LOKWhoIsWho",
		["%s total alts linked to mains"] = "Insgesamt %s Alts mit Haupt-Charakteren verknÃ¼pft",
		["(.-)'s? [Aa]lt"] = " %f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]s [Aa]lt",
		["([^%s%p%d%c%z]+)'s alt"] = "%f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]s [Aa]lt",
		[".*[Aa]lts?$"] = true,
		["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = "<Altname> (z.B. /altnames del FalscherAltname)",
		["<main> (eg /altnames listalts Fin)"] = "<main> (z.b. /altnames listalts Shylera)",
		["<search term> (eg, /altnames find fin)"] = "<Suchbegriff> (z.b. /altnames find Shy)",
		["Alt"] = true,
		["alt"] = "Alt",
		["alt name exists: %s -> %s; not overwriting as set in preferences"] = "Alt-Name vorhanden: %s -> %s; wir nicht Ã¼berschrieben, wie in der Auswahl eingestellt.",
		["AltNames"] = "AltName",
		["Alts:"] = true,
		["autoguildalts_desc"] = "Automatisch den Import von der Gildenliste im Hintergrund ausfÃ¼hren.",
		["autoguildalts_name"] = "Auto-Import der Gilden-Alts",
		["Be quiet"] = "Stumm schalten",
		["character removed: %s"] = "Charakter entfernt: %s",
		["Class colour"] = "Klassenfarbe",
		["Clear all"] = "Alle lÃ¶schen",
		["Clear all links between alts and main names."] = "Alle VerknÃ¼pfungen zwischen Alt- und Haupt-Charakternamen lÃ¶schen",
		["Colour"] = "Farbe",
		["Delete a character's link to another character as their main."] = "Die VerknÃ¼pfung eines Charakters zu einem anderen (Haupt-)Charakter lÃ¶schen.",
		["Delete alt"] = "Alts lÃ¶schen",
		["Disabled"] = "Inaktiv",
		["Display a player's alts in the tooltip"] = "Die Altnamen eines Spielers im Tooltip anzeigen.",
		["Display a player's main name in the tooltip"] = "Den Namen des Hauptcharakters eines Spielers im Tooltip anzeigen.",
		["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = "Namen der Hauptcharaktere in Klassenfarbe des Alts anzeigen (Daten werden vom Modul PlayerNames geliefert, falls aktiviert).",
		["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = "Namen der Hauptcharaktere in Klassenfarbe des Hauptcharakters anzeigen (Daten werden vom Modul PlayerNames geliefert, falls aktiviert).",
		["Don't overwrite existing alt <-> main links when importing or adding new alts."] = "Vorhandenen Alt nicht Ã¼berschreiben <-> VerknÃ¼pfungen zu Hauptcharakteren wÃ¤hrend des Imports oder des HinzufÃ¼gens von neuen Alts.",
		["Don't overwrite existing links"] = "Bestehende VerknÃ¼pfungen nicht Ã¼berschreiben",
		["don't use"] = "Nicht verwenden",
		["Don't use data from the PlayerNames module at all"] = "Daten vom Modul SpielerNamen nicht verwenden.",
		["ERROR: some function sent a blank message!"] = "ERROR: eine Funktion hat eine leere Nachricht hinterlassen.",
		["Find characters"] = "Charaktersuche",
		["Fix alts"] = "Alts reparieren",
		["Fix corrupted entries in your list of alt names."] = "Korrupte EintrÃ¤ge in deiner Liste der Alt-Namen reparieren.",
		["Found alt: %s => main: %s"] = "Alt gefunden: %s => Haupt: %s",
		["guild member alts found and imported: %s"] = "Alt-Chars eines Gildenmitglieds gefunden und importiert: %s",
		["Import from Guild Greet database"] = "Importiere von der Gilden-BegrÃ¼ÃŸungs-Datenbank",
		["Import from guild roster"] = "Importiere von Gildenliste",
		["Import options"] = "Import-Optionen",
		["Imports alt names from a Guild Greet database, if present"] = "Importiert Alt-Namen von einer Gilden-BegrÃ¼ÃŸungs-Datenbank, wenn vorhanden.",
		["Imports alt names from the guild roster by checking for members with the rank \"alt\" or \"alts\", or guild / officer notes like \"<name>'s alt\""] = "Importiert Alt-Namen von der Gildenliste, indem Mitglieder mit dem Rang \"alt\" oder \"alts\", oder Gilden- und Gildenoffiziersnotizen wie \"<name>s alt\" geprÃ¼ft werden.",
		["Imports data from LOKWhoIsWho, if present (drop your SavedVariablesLOKWhoIsWho.lua in the Prat directory to be able to use this)."] = "Importiert Daten von LOKWhoIsWho, wenn vorhanden (um diese Funktion verwenden zu kÃ¶nnen, kopiere deine Datei SavedVariablesLOKWhoIsWho.lua in den Prat-Ordner!).",
		["Left"] = "Links",
		["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = "VerknÃ¼pfe <alt-name> <hauptcharname> (z.B. /altnames link Fin Finjaderaltvonfin)",
		["Link alt"] = "Alt verknÃ¼pfen",
		["Link someone's alt character with the name of their main."] = "Jemandes Alt-Charakter mit dem Namen seines Hauptcharakters verknÃ¼pfen.",
		["linked alt %s => %s"] = "Altchar verknÃ¼pft %s => %s",
		["List all"] = "Alle auflisten",
		["List all links between alts and their main names."] = "Alle VerknÃ¼pfungen zwischen Alts und deren Hauptchar-Namen auflisten.",
		["List alts"] = "Alts auflisten",
		["List alts for a given character"] = "Alts eines bestimmten Charakters auflisten.",
		["LOKWhoIsWho data not found"] = "LOKWhoIsWho-Daten nicht gefunden",
		["LOKWhoIsWho import"] = "LOKWhoIsWho-Import",
		["LOKWhoIsWho lua file not found, sorry."] = "LOKWhoIsWho.lua-Datei nicht gefunden, entschuldige.",
		["Main"] = "Hauptchar",
		["main"] = "Hauptchar",
		["Main name position"] = "Position des Namens eines Hauptcharakters",
		["Main:"] = "Hauptchar:",
		["mainpos_desc"] = "Wo der Name eines Hauptchars dargestellt werden soll, wenn diese mit ihrem Alt-Char zocken.",
		["mainpos_name"] = "Hauptchar-Name Position",
		["module_desc"] = "Erlaubt das VerknÃ¼pfen von Alt-Chars mit deren Hauptchars, was dann neben deren Namen angezeigt werden kann, wenn sie in Chat-Mitteilungen erscheinen (standard = aus).",
		["no alts found for character "] = "Keine Alt-Chars fÃ¼r diesen Charakter gefunden.",
		["no alts or mains found matching \"%s\""] = "Keine Alt-Chars oder Hauptchars gefunden, die mit \"%s\" Ã¼bereinstimmen.",
		["No arg string given to :addAlt()"] = "Kein Parameter angegeben fÃ¼r: :addAlt()",
		["no characters called \"%s\" found; nothing deleted"] = "Keine Charaktere mit dem Namen \"%s\" gefunden; es wurde nichts gelÃ¶scht.",
		["No Guild Greet database found"] = "Keine Gilden-BegrÃ¼ÃŸungs-Datenbank gefunden.",
		["No main name supplied to link %s to"] = "Kein Hauptcharname geliefert, mit dem %s verknÃ¼pft werden kann.",
		["no matches found"] = "Keine Ãœbereinstimmungen gefunden.",
		["quiet"] = "Sei ruhig",
		["quiet_desc"] = "Ob Meldungen an den Chat-Rahmen gesendet werden oder nicht.",
		["quiet_name"] = true,
		["Right"] = "Rechts",
		["Search the list of linked characters for matching main or alt names."] = "Durchsuche die Liste der verknÃ¼pften Charaktere nach passenden Hauptchar- oder Altchar-Namen.",
		["searched for: %s - total matches: %s"] = "Gesucht nach: %s - gesamte Ãœbereinstimmungen: %s",
		["Show alts in tooltip"] = "Alts im Tooltip anzeigen",
		["Show main in tooltip"] = "Hauptchar im Tooltip anzeigen",
		["Start"] = "Starte",
		["The colour of an alt's main name that will be displayed"] = "Die Farbe des Hauptcharnamens eines Alts, der dargestellt wird.",
		["Use class colour (from the PlayerNames module)"] = "Klassenfarbe verwenden (vom Modul \"PlayerNames\") ",
		["use class colour of alt"] = "Klassenfarbe fÃ¼r Alt-Char verwenden.",
		["use class colour of main"] = "Klassenfarbe des Hauptchars verwenden",
		["Use LibAlts Data"] = "Daten von LibAlts benutzen",
		["Use the data available via the shared alt information library."] = "Verwende die vorhandenen Daten Ã¼ber die gemeinsam genutzte Alt-Informations-Sammlung.",
		["Various ways to import a main's alts from other addons"] = "Verschiedene MÃ¶glichkeiten, wie man die Alts eines Hauptchars von anderen AddOns importieren kann.",
		["warning: alt %s already linked to %s"] = "Warnung: Alt %s ist bereits mit %s verknÃ¼pft!",
		["Where to display a character's main name when on their alt."] = "Wo der Name eines Hauptcharakters angezeigt werden soll, wenn diese mit ihrem Alt-Char zocken.",
		["Whether to report to the chat frame or not."] = "Ob Meldungen im Chatfenster erscheinen oder nicht.",
		["You are not in a guild"] = "Du bist in keiner Gilde",
		["You have not yet linked any alts with their mains."] = "Bisher hast du keine Alt-Chars mit ihren Hauptchars verknÃ¼pft.",
	}
}
    PL:AddLocale(PRAT_MODULE, "deDE",L)

  L=
{
	["AltNames"] = {
		["%d alts found for %s: %s"] = "%2$sì˜ ë¶€ ìºë¦­í„° %1$dê°œ ì°¾ìŒ: %3$s",
		["%s alts imported from LOKWhoIsWho"] = "LOKWhoIsWhoì—ì„œ %s ë¶€ ìºë¦­í„°ë¥¼ ê°€ì ¸ì™”ìŠµë‹ˆë‹¤",
		["%s total alts linked to mains"] = "ì´ %sê°œì˜ ë¶€ ìºë¦­í„°ê°€ ì£¼ ìºë¦­í„°ì™€ ì—°ê²°ë˜ì—ˆìŠµë‹ˆë‹¤",
		["(.-)'s? [Aa]lt"] = "%f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]ì˜ ë¶€ìºë¦­í„°",
		["([^%s%p%d%c%z]+)'s alt"] = "%f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]ì˜ ë¶€ ìºë¦­í„°",
		[".*[Aa]lts?$"] = ".*ë¶€ìºë¦­í„°?$",
		["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = "<ë¶€ ìºë¦­í„° ì´ë¦„> (ì˜ˆ, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)",
		["<main> (eg /altnames listalts Fin)"] = "<ì£¼ ìºë¦­í„°> (ì˜ˆ /altnames listalts Fin)",
		["<search term> (eg, /altnames find fin)"] = "<ê²€ìƒ‰ êµ¬ë¬¸> (ì˜ˆ, /altnames find fin)",
		["Alt"] = "ë¶€ ìºë¦­í„°",
		["alt"] = "ë¶€ ìºë¦­í„°",
		["alt name exists: %s -> %s; not overwriting as set in preferences"] = "ë¶€ ìºë¦­í„° ì´ë¦„ ì¡´ìž¬: %s -> %s; ìš°ì„ ê¶Œ ì„¤ì •ìœ¼ë¡œ ë®ì–´ì“°ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤",
		["AltNames"] = "ë¶€ ìºë¦­í„° ì´ë¦„",
		["Alts:"] = "ë¶€ ìºë¦­í„°:",
		["autoguildalts_desc"] = "ìžë™ìœ¼ë¡œ ê¸¸ë“œ ëª…ë‹¨ì—ì„œ ê°€ì ¸ì˜¤ê¸° ëª…ë ¹ì„ ì‹¤í–‰í•©ë‹ˆë‹¤",
		["autoguildalts_name"] = "ìžë™ ê¸¸ë“œ ë¶€ ìºë¦­í„° ê°€ì ¸ì˜¤ê¸°",
		["Be quiet"] = "ì¡°ìš©í•˜ê²Œ",
		["character removed: %s"] = "ìºë¦­í„° ì œê±°ë¨: %s",
		["Class colour"] = "ì§ì—… ìƒ‰ìƒ",
		["Clear all"] = "ëª¨ë‘ ì§€ìš°ê¸°",
		["Clear all links between alts and main names."] = "ë¶€ ìºë¦­í„°ì™€ ì£¼ ìºë¦­í„° ì´ë¦„ ì‚¬ì´ì˜ ëª¨ë“  ì—°ê²°ì„ ì§€ì›ë‹ˆë‹¤.",
		["Colour"] = "ìƒ‰ìƒ",
		["Delete a character's link to another character as their main."] = "ì£¼ ìºë¦­í„°ë¡œ ì—°ê²°ëœ ë‹¤ë¥¸ ìºë¦­í„°ì™€ì˜ ì—°ê²°ì„ ì‚­ì œí•©ë‹ˆë‹¤.",
		["Delete alt"] = "ë¶€ ìºë¦­í„° ì‚­ì œ",
		["Disabled"] = "ë¹„í™œì„±",
		["Display a player's alts in the tooltip"] = "íˆ´íŒì— í”Œë ˆì´ì–´ì˜ ë¶€ ìºë¦­í„° í‘œì‹œí•˜ê¸°",
		["Display a player's main name in the tooltip"] = "íˆ´íŒì— í”Œë ˆì´ì–´ì˜ ì£¼ ìºë¦­í„° ì´ë¦„ í‘œì‹œí•˜ê¸°",
		["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = "ë¶€ ìºë¦­í„°ì˜ ì§ì—…ê³¼ ê°™ì€ ìƒ‰ìƒìœ¼ë¡œ ì£¼ ìºë¦­í„° ì´ë¦„ í‘œì‹œí•˜ê¸° (í”Œë ˆì´ì–´ ì´ë¦„ ëª¨ë“ˆì„ ì‚¬ìš© ì¤‘ì´ë©´ ëª¨ë“ˆì—ì„œ ë°ì´í„°ë¥¼ ê°€ì ¸ì˜µë‹ˆë‹¤)",
		["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = "ì£¼ ìºë¦­í„°ì˜ ì§ì—…ê³¼ ê°™ì€ ìƒ‰ìƒìœ¼ë¡œ ì£¼ ìºë¦­í„° ì´ë¦„ í‘œì‹œí•˜ê¸° (í”Œë ˆì´ì–´ ì´ë¦„ ëª¨ë“ˆì„ ì‚¬ìš© ì¤‘ì´ë©´ ëª¨ë“ˆì—ì„œ ë°ì´í„°ë¥¼ ê°€ì ¸ì˜µë‹ˆë‹¤)",
		["Don't overwrite existing alt <-> main links when importing or adding new alts."] = "ìƒˆë¡œìš´ ë¶€ ìºë¦­í„°ë¥¼ ì¶”ê°€í•˜ê±°ë‚˜ ê°€ì ¸ì˜¬ ë•Œ ì €ìž¥ëœ ë¶€ ìºë¦­í„° <-> ì£¼ ìºë¦­í„° ê°„ ì—°ê²°ì„ ë®ì–´ì“°ì§€ ì•ŠìŠµë‹ˆë‹¤.",
		["Don't overwrite existing links"] = "ì €ìž¥ëœ ì—°ê²°ì„ ë®ì–´ì“°ì§€ ì•Šê¸°",
		["don't use"] = "ì‚¬ìš©í•˜ì§€ ì•ŠìŒ",
		["Don't use data from the PlayerNames module at all"] = "í”Œë ˆì´ì–´ ì´ë¦„ ëª¨ë“ˆì˜ ë°ì´í„° ì‚¬ìš©í•˜ì§€ ì•Šê¸°",
		["ERROR: some function sent a blank message!"] = "ì˜¤ë¥˜: ëª‡ëª‡ í•¨ìˆ˜ê°€ ë¹ˆ ë©”ì‹œì§€ë¥¼ ë³´ëƒˆìŠµë‹ˆë‹¤!",
		["Find characters"] = "ìºë¦­í„° ì°¾ê¸°",
		["Fix alts"] = "ë¶€ ìºë¦­í„° ê³ ì¹˜ê¸°",
		["Fix corrupted entries in your list of alt names."] = "ë‹¹ì‹ ì˜ ë¶€ ìºë¦­í„° ì´ë¦„ ëª©ë¡ì—ì„œ ìž˜ëª»ëœ ëª©ë¡ì„ ìˆ˜ì •í•©ë‹ˆë‹¤.",
		["Found alt: %s => main: %s"] = "ë¶€ ìºë¦­í„° ë°œê²¬: %s => ì£¼ ìºë¦­í„°: %s",
		["guild member alts found and imported: %s"] = "ê¸¸ë“œì›ì˜ ë¶€ ìºë¦­í„°ë¥¼ ë°œê²¬í•˜ê³  ê°€ì ¸ì˜´: %s",
		["Import from Guild Greet database"] = "ê¸¸ë“œ ìª½ì§€ ë°ì´í„°ë² ì´ìŠ¤ì—ì„œ ê°€ì ¸ì˜¤ê¸°",
		["Import from guild roster"] = "ê¸¸ë“œ ëª…ë‹¨ì—ì„œ ê°€ì ¸ì˜¤ê¸°",
		["Import options"] = "ì˜µì…˜ ê°€ì ¸ì˜¤ê¸°",
		["Imports alt names from a Guild Greet database, if present"] = "ê¸¸ë“œ ìª½ì§€ ë°ì´í„°ë² ì´ìŠ¤ì—ì„œ ë¶€ ìºë¦­í„° ì´ë¦„ì´ ìžˆìœ¼ë©´ ê°€ì ¸ì˜µë‹ˆë‹¤",
		["Imports alt names from the guild roster by checking for members with the rank \"alt\" or \"alts\", or guild / officer notes like \"<name>'s alt\""] = "\"ë¶€ìº\"ë‚˜ \"ë¶€ìºë¦­í„°\" ë“±ê¸‰, ë˜ëŠ” \"<ì´ë¦„>ì˜ ë¶€ìº\"ê°™ì€ ê¸¸ë“œ / ê´€ë¦¬ìž ìª½ì§€ë¥¼ í™•ì¸í•˜ì—¬ ê¸¸ë“œ ëª…ë‹¨ì—ì„œ ë¶€ ìºë¦­í„° ì´ë¦„ì„ ê°€ì ¸ì˜µë‹ˆë‹¤",
		["Imports data from LOKWhoIsWho, if present (drop your SavedVariablesLOKWhoIsWho.lua in the Prat directory to be able to use this)."] = "ì¡´ìž¬í•œë‹¤ë©´ LOKWhoIsWhoì—ì„œ ë°ì´í„°ë¥¼ ê°€ì ¸ì˜µë‹ˆë‹¤ (SavedVariablesLOKWhoIsWho.lua íŒŒì¼ì„ Prat ë””ë ‰í† ë¦¬ì— ë³µì‚¬í•´ì•¼ ì‚¬ìš© ê°€ëŠ¥í•¨).",
		["Left"] = "ì™¼ìª½",
		["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = "link <ë¶€ ìºë¦­í„° ì´ë¦„> <ì£¼ ìºë¦­í„° ì´ë¦„> (ì˜ˆ, /altnames link Fin Finjathealtoffin)",
		["Link alt"] = "ë¶€ ìºë¦­í„° ì—°ê²°í•˜ê¸°",
		["Link someone's alt character with the name of their main."] = "ëˆ„êµ°ê°€ì˜ ë¶€ ìºë¦­í„°ë¥¼ ê·¸ì˜ ì£¼ ìºë¦­í„° ì´ë¦„ê³¼ ì—°ê²°ì‹œí‚µë‹ˆë‹¤.",
		["linked alt %s => %s"] = "ë¶€ ìºë¦­í„° ì—°ê²°ë¨ %s => %s",
		["List all"] = "ëª¨ë“  ëª©ë¡",
		["List all links between alts and their main names."] = "ë¶€ ìºë¦­í„°ì™€ ì£¼ ìºë¦­í„° ì´ë¦„ ì‚¬ì´ì˜ ëª¨ë“  ì—°ê²° ëª©ë¡ìž…ë‹ˆë‹¤.",
		["List alts"] = "ë¶€ ìºë¦­í„° ëª©ë¡",
		["List alts for a given character"] = "ì£¼ì–´ì§„ ìºë¦­í„°ì˜ ë¶€ ìºë¦­í„° ëª©ë¡",
		["LOKWhoIsWho data not found"] = "LOKWhoIsWho ë°ì´í„° ì°¾ì„ ìˆ˜ ì—†ìŒ",
		["LOKWhoIsWho import"] = "LOKWhoIsWho ê°€ì ¸ì˜¤ê¸°",
		["LOKWhoIsWho lua file not found, sorry."] = "LOKWhoIsWho lua íŒŒì¼ ì°¾ì„ ìˆ˜ ì—†ìŒ.",
		["Main"] = "ì£¼ ìºë¦­í„°",
		["main"] = "ì£¼ ìºë¦­í„°",
		["Main name position"] = "ì£¼ ìºë¦­í„° ì´ë¦„ ìœ„ì¹˜",
		["Main:"] = "ì£¼ ìºë¦­í„°:",
		["mainpos_desc"] = "ë¶€ ìºë¦­í„°ì— ì ‘ì† ì¤‘ì¼ ë•Œ ì£¼ ìºë¦­í„°ì˜ ì´ë¦„ì„ í‘œì‹œí•  ê³³",
		["mainpos_name"] = "ì£¼ ìºë¦­í„° ì´ë¦„ ìœ„ì¹˜",
		["module_desc"] = "ì‚¬ëžŒë“¤ì˜ ë¶€ ìºë¦­í„°ë¥¼ ê·¸ë“¤ì˜ ì£¼ ìºë¦­í„°ì™€ ì—°ê²°í•©ë‹ˆë‹¤, ëŒ€í™” ë©”ì‹œì§€ì—ì„œ ë°œê²¬ëì„ ë•Œ ê·¸ë“¤ì˜ ì´ë¦„ ë‹¤ìŒì— í‘œì‹œë˜ê²Œ í•  ìˆ˜ ìžˆìŠµë‹ˆë‹¤ (ê¸°ë³¸ê°’=ë”).",
		["no alts found for character "] = "ìºë¦­í„°ì˜ ë¶€ ìºë¦­í„° ì°¾ì„ ìˆ˜ ì—†ìŒ",
		["no alts or mains found matching \"%s\""] = "\"%s\"|1ê³¼;ì™€; ì¼ì¹˜í•˜ëŠ” ë¶€ ìºë¦­í„°ë‚˜ ì£¼ ìºë¦­í„°ë¥¼ ì°¾ì„ ìˆ˜ ì—†ìŒ",
		["No arg string given to :addAlt()"] = ":addAlt()ì— ë³€ìˆ˜ êµ¬ë¬¸ì´ ì£¼ì–´ì§€ì§€ ì•Šì•˜ìŠµë‹ˆë‹¤",
		["no characters called \"%s\" found; nothing deleted"] = "ìš”ì²­í•œ \"%s\" ìºë¦­í„° ì°¾ì„ ìˆ˜ ì—†ìŒ; ì‚­ì œí•˜ì§€ ëª»í•¨",
		["No Guild Greet database found"] = "ê¸¸ë“œ ìª½ì§€ ë°ì´í„°ë² ì´ìŠ¤ ì°¾ì„ ìˆ˜ ì—†ìŒ",
		["No main name supplied to link %s to"] = "%s|1ê³¼;ì™€; ì—°ê²°í•  ì£¼ ìºë¦­í„° ì´ë¦„ ì œê³µë˜ì§€ ì•ŠìŒ",
		["no matches found"] = "ì¼ì¹˜ í•˜ëŠ” ê²ƒ ì—†ìŒ",
		["quiet"] = "ì¡°ìš©í•˜ê²Œ",
		["quiet_desc"] = "ëŒ€í™”ì°½ì— ë³´ê³ í•  ì§€ ì•ˆí•  ì§€ ì„¤ì •í•©ë‹ˆë‹¤.",
		["quiet_name"] = true,
		["Right"] = "ì˜¤ë¥¸ìª½",
		["Search the list of linked characters for matching main or alt names."] = "ì£¼ ìºë¦­í„°ë‚˜ ë¶€ ìºë¦­í„° ì´ë¦„ì´ ì¼ì¹˜í•˜ëŠ” ì—°ê²°ëœ ìºë¦­í„°ì˜ ëª©ë¡ì„ ê²€ìƒ‰í•©ë‹ˆë‹¤.",
		["searched for: %s - total matches: %s"] = "ê²€ìƒ‰: %s - ì´ ì¼ì¹˜: %s",
		["Show alts in tooltip"] = "íˆ´íŒì— ë¶€ ìºë¦­í„° í‘œì‹œ",
		["Show main in tooltip"] = "íˆ´íŒì— ì£¼ ìºë¦­í„° í‘œì‹œ",
		["Start"] = "ì‹œìž‘",
		["The colour of an alt's main name that will be displayed"] = "í‘œì‹œí•  ì£¼ ìºë¦­í„° ì´ë¦„ì˜ ìƒ‰ìƒ",
		["Use class colour (from the PlayerNames module)"] = "ì§ì—… ìƒ‰ìƒ ì‚¬ìš© (í”Œë ˆì´ì–´ ì´ë¦„ ëª¨ë“ˆë¡œë¶€í„°)",
		["use class colour of alt"] = "ë¶€ ìºë¦­í„°ì˜ ì§ì—… ìƒ‰ìƒ ì‚¬ìš©",
		["use class colour of main"] = "ì£¼ ìºë¦­í„°ì˜ ì§ì—… ìƒ‰ìƒ ì‚¬ìš©",
		["Use LibAlts Data"] = "LibAlts ë°ì´í„° ì‚¬ìš©",
		["Use the data available via the shared alt information library."] = "ê³µìœ ëœ ë¶€ ìºë¦­í„° ì •ë³´ ë¼ì´ë¸ŒëŸ¬ë¦¬ë¥¼ í†µí•´ ì´ìš© ê°€ëŠ¥í•œ ë°ì´í„°ë¥¼ ì‚¬ìš©í•©ë‹ˆë‹¤.",
		["Various ways to import a main's alts from other addons"] = "ë‹¤ë¥¸ ì• ë“œì˜¨ì—ì„œ ì£¼ ìºë¦­í„°ì˜ ë¶€ ìºë¦­í„°ë“¤ì„ ê°€ì ¸ì˜¬ ë‹¤ì–‘í•œ ë°©ë²•ë“¤",
		["warning: alt %s already linked to %s"] = "ê²½ê³ : ë¶€ ìºë¦­í„° %s|1ì€;ëŠ”; ì´ë¯¸ %s|1ê³¼;ì™€; ì—°ê²°ë¨",
		["Where to display a character's main name when on their alt."] = "ë¶€ ìºë¦­í„°ì— ì ‘ì† ì¤‘ì¼ ë•Œ ì£¼ ìºë¦­í„°ì˜ ì´ë¦„ì„ í‘œì‹œí•  ê³³",
		["Whether to report to the chat frame or not."] = "ëŒ€í™”ì°½ì— ë³´ê³  ì—¬ë¶€",
		["You are not in a guild"] = "ë‹¹ì‹ ì€ ê¸¸ë“œì— ì†í•´ ìžˆì§€ ì•ŠìŠµë‹ˆë‹¤",
		["You have not yet linked any alts with their mains."] = "ì•„ì§ ì£¼ ìºë¦­í„°ì— ì—°ê²°í•œ ë¶€ ìºë¦­í„°ê°€ ì—†ìŠµë‹ˆë‹¤.",
	}
}
    PL:AddLocale(PRAT_MODULE, "koKR",L)

  L=
{
	["AltNames"] = {
		--[[Translation missing --]]
		--[[ ["%d alts found for %s: %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["%s alts imported from LOKWhoIsWho"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["%s total alts linked to mains"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["(.-)'s? [Aa]lt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["([^%s%p%d%c%z]+)'s alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ [".*[Aa]lts?$"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["<main> (eg /altnames listalts Fin)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["<search term> (eg, /altnames find fin)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["alt name exists: %s -> %s; not overwriting as set in preferences"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["AltNames"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Alts:"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["autoguildalts_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["autoguildalts_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Be quiet"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["character removed: %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Class colour"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Clear all"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Clear all links between alts and main names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Colour"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Delete a character's link to another character as their main."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Delete alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Disabled"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Display a player's alts in the tooltip"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Display a player's main name in the tooltip"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Don't overwrite existing alt <-> main links when importing or adding new alts."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Don't overwrite existing links"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["don't use"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Don't use data from the PlayerNames module at all"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["ERROR: some function sent a blank message!"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Find characters"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Fix alts"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Fix corrupted entries in your list of alt names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Found alt: %s => main: %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["guild member alts found and imported: %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Import from Guild Greet database"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Import from guild roster"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Import options"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Imports alt names from a Guild Greet database, if present"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Imports alt names from the guild roster by checking for members with the rank \"alt\" or \"alts\", or guild / officer notes like \"<name>'s alt\""] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Imports data from LOKWhoIsWho, if present (drop your SavedVariablesLOKWhoIsWho.lua in the Prat directory to be able to use this)."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Left"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Link alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Link someone's alt character with the name of their main."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["linked alt %s => %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["List all"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["List all links between alts and their main names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["List alts"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["List alts for a given character"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["LOKWhoIsWho data not found"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["LOKWhoIsWho import"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["LOKWhoIsWho lua file not found, sorry."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Main"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["main"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Main name position"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Main:"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["mainpos_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["mainpos_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["no alts found for character "] = "",--]] 
		--[[Translation missing --]]
		--[[ ["no alts or mains found matching \"%s\""] = "",--]] 
		--[[Translation missing --]]
		--[[ ["No arg string given to :addAlt()"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["no characters called \"%s\" found; nothing deleted"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["No Guild Greet database found"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["No main name supplied to link %s to"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["no matches found"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["quiet"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["quiet_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["quiet_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Right"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Search the list of linked characters for matching main or alt names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["searched for: %s - total matches: %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show alts in tooltip"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show main in tooltip"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Start"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["The colour of an alt's main name that will be displayed"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Use class colour (from the PlayerNames module)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["use class colour of alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["use class colour of main"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Use LibAlts Data"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Use the data available via the shared alt information library."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Various ways to import a main's alts from other addons"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["warning: alt %s already linked to %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Where to display a character's main name when on their alt."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Whether to report to the chat frame or not."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["You are not in a guild"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["You have not yet linked any alts with their mains."] = "",--]] 
	}
}
    PL:AddLocale(PRAT_MODULE, "esMX",L)

  L=
{
	["AltNames"] = {
		["%d alts found for %s: %s"] = "%d Ð°Ð»ÑŒÑ‚Ð¾Ð² Ð½Ð°Ð¹Ð´ÐµÐ½Ð¾ Ð´Ð»Ñ %s: %s",
		["%s alts imported from LOKWhoIsWho"] = "Ð˜Ð¼Ð¿Ð¾Ñ€Ñ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¾ Ð°Ð»ÑŒÑ‚Ð¾Ð² Ð¸Ð· LOKWhoIsWho: %s",
		["%s total alts linked to mains"] = "Ð²ÑÐµÐ³Ð¾ Ð°Ð»ÑŒÑ‚Ð¾Ð² ÑÐ²ÑÐ·Ð°Ð½Ð¾ Ñ Ð¾ÑÐ½Ð¾Ð²Ð½Ñ‹Ð¼ %s",
		["(.-)'s? [Aa]lt"] = "%f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]'s [ÐÐ°]Ð»ÑŒÑ‚",
		["([^%s%p%d%c%z]+)'s alt"] = "[ÐÐ°]Ð»ÑŒÑ‚ %f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]",
		[".*[Aa]lts?$"] = ".*[ÐÐ°]Ð»ÑŒÑ‚Ñ‹?$",
		["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = "<Ð¸Ð¼Ñ Ð°Ð»ÑŒÑ‚Ð°> (Ðº Ð¿Ñ€Ð¸Ð¼ÐµÑ€Ñƒ, /altnames del Ð—Ð°Ð³Ð·Ð°Ð³)",
		["<main> (eg /altnames listalts Fin)"] = "<Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð¹> (Ðº Ð¿Ñ€Ð¸Ð¼ÐµÑ€Ñƒ: /altnames listalts Ð—Ð°Ð³Ð·Ð°Ð³)",
		["<search term> (eg, /altnames find fin)"] = "<ÑÐ»ÐµÐ¼ÐµÐ½Ñ‚ Ð¿Ð¾Ð¸ÑÐºÐ°> (Ðº Ð¿Ñ€Ð¸Ð¼ÐµÑ€Ñƒ, /altnames find Ð—Ð°Ð³Ð·Ð°Ð³)",
		["Alt"] = "ÐÐ»ÑŒÑ‚",
		["alt"] = "Ð°Ð»ÑŒÑ‚",
		["alt name exists: %s -> %s; not overwriting as set in preferences"] = "Ð¸Ð¼Ñ Ð°Ð»ÑŒÑ‚Ð° ÑƒÐ¶Ðµ ÑÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÐµÑ‚: %s -> %s; Ð¿ÐµÑ€ÐµÐ·Ð°Ð¿Ð¸ÑÑŒ Ð·Ð°Ð¿Ñ€ÐµÑ‰ÐµÐ½Ð° Ð½Ð°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ°Ð¼Ð¸",
		["AltNames"] = "Ð˜Ð¼Ñ Ð°Ð»ÑŒÑ‚Ð¾Ð²",
		["Alts:"] = "ÐÐ»ÑŒÑ‚Ñ‹:",
		["autoguildalts_desc"] = "ÐÐ²Ñ‚Ð¾Ð¼Ð°Ñ‚Ð¸Ñ‡ÐµÑÐºÐ¸ Ð¸ Ð±ÐµÐ· Ð¾Ñ‚Ñ‡ÐµÑ‚Ð° Ð²Ñ‹Ð¿Ð¾Ð»Ð½ÑÑ‚ÑŒ ÐºÐ¾Ð¼Ð°Ð½Ð´Ñƒ Ð¸Ð¼Ð¿Ð¾Ñ€Ñ‚Ð° Ð¸Ð· ÑÐ¿Ð¸ÑÐºÐ° Ð³Ð¸Ð»ÑŒÐ´Ð¸Ð¸",
		["autoguildalts_name"] = "ÐÐ²Ñ‚Ð¾-Ð¸Ð¼Ð¿Ð¾Ñ€Ñ‚ Ð°Ð»ÑŒÑ‚Ð¾Ð² Ð³Ð¸Ð»ÑŒÐ´Ð¸Ð¸",
		["Be quiet"] = "ÐœÐ¾Ð»Ñ‡Ð¸",
		["character removed: %s"] = "Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶ ÑƒÐ´Ð°Ð»Ñ‘Ð½: %s",
		["Class colour"] = "ÐžÐºÑ€Ð°ÑÐºÐ° Ð¿Ð¾ ÐºÐ»Ð°ÑÑÑƒ",
		["Clear all"] = "ÐžÑ‡Ð¸ÑÑ‚Ð¸Ñ‚ÑŒ Ð²ÑÐµ",
		["Clear all links between alts and main names."] = "ÐžÑ‡Ð¸ÑÑ‚Ð¸Ñ‚ÑŒ Ð²ÑÐµ ÑÑÑ‹Ð»ÐºÐ¸ Ð¼ÐµÐ¶Ð´Ñƒ Ð°Ð»ÑŒÑ‚Ð°Ð¼Ð¸ Ð¸ Ð¾ÑÐ½Ð¾Ð²Ð½Ñ‹Ð¼Ð¸ Ð¸Ð¼ÐµÐ½Ð°Ð¼Ð¸.",
		["Colour"] = "Ð¦Ð²ÐµÑ‚",
		["Delete a character's link to another character as their main."] = "Ð£Ð´Ð°Ð»Ð¸Ñ‚ÑŒ ÑÑÑ‹Ð»ÐºÑƒ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶Ð° Ð½Ð° Ð´Ñ€ÑƒÐ³Ð¾Ð³Ð¾ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶Ð° ÐµÑÐ»Ð¸ Ð¾Ð½ Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð¹.",
		["Delete alt"] = "Ð£Ð´Ð°Ð»Ð¸Ñ‚ÑŒ Ð°Ð»ÑŒÑ‚Ð°",
		["Disabled"] = "ÐžÑ‚ÐºÐ»ÑŽÑ‡ÐµÐ½Ð¾",
		["Display a player's alts in the tooltip"] = "ÐžÑ‚Ð¾Ð±Ñ€Ð°Ð¶Ð°Ñ‚ÑŒ Ð°Ð»ÑŒÑ‚Ð¾Ð² Ð¸Ð³Ñ€Ð¾ÐºÐ° Ð² Ð¿Ð¾Ð´ÑÐºÐ°Ð·ÐºÐµ",
		["Display a player's main name in the tooltip"] = "ÐžÑ‚Ð¾Ð±Ñ€Ð°Ð¶Ð°Ñ‚ÑŒ Ð¾ÑÐ½Ð¾Ð²Ð½Ñ‹Ñ… Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶ÐµÐ¹ Ð¸Ð³Ñ€Ð¾ÐºÐ° Ð² Ð¿Ð¾Ð´ÑÐºÐ°Ð·ÐºÐµ",
		["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = "ÐžÑ‚Ð¾Ð±Ñ€Ð°Ð¶Ð°Ñ‚ÑŒ Ð¸Ð¼ÐµÐ½Ð° Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð³Ð¾ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶Ð° Ð¿Ð¾ ÐºÐ»Ð°ÑÑÑƒ Ð°Ð»ÑŒÑ‚Ð° (Ð´Ð°Ð½Ð½Ñ‹Ðµ Ð±ÐµÑ€ÑƒÑ‚ÑÑ Ð¸Ð· Ð¼Ð¾Ð´ÑƒÐ»Ñ PlayerNames, ÐµÑÐ»Ð¸ Ð¾Ð½ Ð²ÐºÐ»ÑŽÑ‡ÐµÐ½)",
		["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = "ÐžÑ‚Ð¾Ð±Ñ€Ð°Ð¶Ð°Ñ‚ÑŒ Ð¸Ð¼ÐµÐ½Ð° Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð³Ð¾ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶Ð° Ð¿Ð¾ ÐµÐ³Ð¾ Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð¼Ñƒ ÐºÐ»Ð°ÑÑÑƒ (Ð´Ð°Ð½Ð½Ñ‹Ðµ Ð±ÐµÑ€ÑƒÑ‚ÑÑ Ð¸Ð· Ð¼Ð¾Ð´ÑƒÐ»Ñ PlayerNames, ÐµÑÐ»Ð¸ Ð¾Ð½ Ð²ÐºÐ»ÑŽÑ‡ÐµÐ½)",
		["Don't overwrite existing alt <-> main links when importing or adding new alts."] = "ÐÐµ Ð¿ÐµÑ€ÐµÐ·Ð°Ð¿Ð¸ÑÑ‹Ð²Ð°Ñ‚ÑŒ ÑÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÑŽÑ‰Ð¸Ð¸ ÑÐ²ÑÐ·ÐºÐ¸ Ð°Ð»ÑŒÑ‚Ð¾Ð² <-> Ð¾ÑÐ½Ð¾Ð²Ð½Ñ‹Ñ… Ð¿Ñ€Ð¸ Ð¸Ð¼Ð¿Ð¾Ñ€Ñ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ð¸ Ð¸Ð»Ð¸ Ð´Ð¾Ð±Ð°Ð²Ð»ÐµÐ½Ð¸Ð¸ Ð½Ð¾Ð²Ð¾Ð³Ð¾.",
		["Don't overwrite existing links"] = "ÐÐµ Ð¿ÐµÑ€ÐµÐ·Ð°Ð¿Ð¸ÑÑ‹Ð²Ð°Ñ‚ÑŒ ÑÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÑŽÑ‰Ð¸Ðµ ÑÐ²ÑÐ·ÐºÐ¸",
		["don't use"] = "Ð½Ðµ Ð¾ÐºÑ€Ð°ÑˆÐ¸Ð²Ð°Ñ‚ÑŒ",
		["Don't use data from the PlayerNames module at all"] = "ÐÐµ Ð¸ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÑŒ Ð´Ð»Ñ Ð²ÑÐµÑ… Ð´Ð°Ð½Ð½Ñ‹Ðµ Ð¸Ð· Ð¼Ð¾Ð´ÑƒÐ»Ñ PlayerNames",
		["ERROR: some function sent a blank message!"] = "ÐžÐ¨Ð˜Ð‘ÐšÐ: Ð¾Ð´Ð½Ð° Ð¸Ð· Ñ„ÑƒÐ½ÐºÑ†Ð¸Ð¹ Ð¿Ð¾ÑÐ»Ð°Ð»Ð° Ð¿ÑƒÑÑ‚Ð¾Ðµ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ðµ!",
		["Find characters"] = "ÐÐ°Ð¹Ñ‚Ð¸ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶Ð¸",
		["Fix alts"] = "Ð˜ÑÐ¿Ñ€Ð°Ð²Ð¸Ñ‚ÑŒ Ð°Ð»ÑŒÑ‚Ð¾Ð²",
		["Fix corrupted entries in your list of alt names."] = "Ð˜ÑÐ¿Ñ€Ð°Ð²Ð¸Ñ‚ÑŒ Ð½ÐµÐ¿Ñ€Ð°Ð²ÐµÐ»ÑŒÐ½Ñ‹Ðµ Ð·Ð°Ð¿Ð¸ÑÐ¸ Ð² Ð²Ð°ÑˆÐµÐ¼ ÑÐ¿Ð¸ÑÐºÐµ Ð¸Ð¼ÐµÐ½ Ð°Ð»ÑŒÑ‚Ð¾Ð².",
		["Found alt: %s => main: %s"] = "ÐÐ»ÑŒÑ‚ Ð½Ð°Ð¹Ð´ÐµÐ½: %s => Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð¹: %s",
		["guild member alts found and imported: %s"] = "%s: Ð½Ð°Ð¹Ð´ÐµÐ½Ð¾ Ð°Ð»ÑŒÑ‚Ð¾Ð² ÑƒÑ‡Ð°ÑÑ‚Ð½Ð¸ÐºÐ¾Ð² Ð³Ð¸Ð»ÑŒÐ´Ð¸Ð¸ Ð¸ Ð¸Ð¼Ð¿Ð¾Ñ€Ñ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð½Ð¾",
		["Import from Guild Greet database"] = "Ð˜Ð¼Ð¿Ð¾Ñ€Ñ‚ Ð±Ð°Ð·Ñ‹ Ð´Ð°Ð½Ð½Ñ‹Ñ… Guild Greet",
		["Import from guild roster"] = "Ð˜Ð¼Ð¿Ð¾Ñ€Ñ‚ Ð¸Ð· ÑÐ¿Ð¸ÑÐºÐ° Ð³Ð¸Ð»ÑŒÐ´Ð¸Ð¸",
		["Import options"] = "ÐÐ°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸ Ð¸Ð¼Ð¿Ð¾Ñ€Ñ‚Ð°",
		["Imports alt names from a Guild Greet database, if present"] = "Ð˜Ð¼Ð¿Ð¾Ñ€Ñ‚ Ð°Ð»ÑŒÑ‚Ð¾Ð² Ð¸Ð· Ð±Ð°Ð·Ñ‹ Ð´Ð°Ð½Ð½Ñ‹Ñ… Guild Greet, ÐµÑÐ»Ð¸ ÐµÑÑ‚ÑŒ",
		["Imports alt names from the guild roster by checking for members with the rank \"alt\" or \"alts\", or guild / officer notes like \"<name>'s alt\""] = "Ð˜Ð¼Ð¿Ð¾Ñ€Ñ‚ Ð¸Ð¼ÐµÐ½ Ð°Ð»ÑŒÑ‚Ð¾Ð² Ð¸Ð· ÑÐ¿Ð¸ÑÐºÐ° Ð³Ð¸Ð»ÑŒÐ´Ð¸Ð¸ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÑÑ ÑƒÑ‡Ð°ÑÑ‚Ð½Ð¸ÐºÐ° Ð¿Ð¾ Ð·Ð²Ð°Ð½Ð¸ÑŽ \"alt\" Ð¸Ð»Ð¸ \"alts\", Ð¸Ð»Ð¸ Ð¾Ð±Ñ‰Ð¸Ðµ / Ð¾Ñ„Ð¸Ñ†ÐµÑ€ÑÐºÐ¸Ðµ Ð·Ð°Ð¼ÐµÑ‚ÐºÐ¸ Ñ‚Ð¸Ð¿Ð¾ \"<name> alt\"",
		["Imports data from LOKWhoIsWho, if present (drop your SavedVariablesLOKWhoIsWho.lua in the Prat directory to be able to use this)."] = "Ð˜Ð¼Ð¿Ð¾Ñ€Ñ‚Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ Ð´Ð°Ð½Ð½Ñ‹Ðµ Ð¸Ð· LOKWhoIsWho, ÐµÑÐ»Ð¸ ÐµÑÑ‚ÑŒ (Ð¿ÐµÑ€ÐµÐºÐ¸Ð½ÑŒÑ‚Ðµ Ð²Ð°Ñˆ SavedVariables/LOKWhoIsWho.lua Ð² Ð¿Ð°Ð¿ÐºÑƒ PratÐ° Ð´Ð»Ñ Ð¸ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ð½Ð¸Ñ).",
		["Left"] = "Ð¡Ð»ÐµÐ²Ð°",
		["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = "link <Ð¸Ð¼Ñ Ð°Ð»ÑŒÑ‚Ð°> <Ð¸Ð¼Ñ Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð³Ð¾> (Ð¿Ñ€Ð¸Ð¼ÐµÑ€, /altnames link Ð—Ð°Ð³Ð·Ð°Ð³ Ð—Ð°Ð³Ð·Ð°Ð³Ð¾Ð²Ð¸Ñ‡ÑŽÑ)",
		["Link alt"] = "Ð¡Ð²ÑÐ·Ð°Ñ‚ÑŒ Ð°Ð»ÑŒÑ‚Ð°",
		["Link someone's alt character with the name of their main."] = "Ð¡Ð²ÑÐ·Ð°Ñ‚ÑŒ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»Ñ‘Ð½Ð½Ð¾Ð³Ð¾ Ð°Ð»ÑŒÑ‚Ð° Ñ Ð¸Ð¼ÐµÐ½ÐµÐ¼ ÐµÐ³Ð¾ Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð³Ð¾ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶Ð°.",
		["linked alt %s => %s"] = "Ð°Ð»ÑŒÑ‚ %s ÑÐ²ÑÐ·Ð°Ð½ Ñ => %s",
		["List all"] = "Ð’ÐµÑÑŒ ÑÐ¿Ð¸ÑÐ¾Ðº",
		["List all links between alts and their main names."] = "Ð’ÐµÑÑŒ ÑÐ¿Ð¸ÑÐ¾Ðº ÑÑÑ‹Ð»Ð¾Ðº Ð¼ÐµÐ¶Ð´Ñƒ Ð°Ð»ÑŒÑ‚Ð°Ð¼Ð¸ Ð¸ Ð¾ÑÐ½Ð¾Ð²Ð½Ñ‹Ð¼Ð¸ Ð¸Ð¼ÐµÐ½Ð°Ð¼Ð¸.",
		["List alts"] = "Ð¡Ð¿Ð¸ÑÐ¾Ðº Ð°Ð»ÑŒÑ‚Ð¾Ð²",
		["List alts for a given character"] = "Ð¡Ð¿Ð¸ÑÐ¾Ðº Ð°Ð»ÑŒÑ‚Ð¾Ð² Ð´Ð»Ñ Ð·Ð°Ð´Ð°Ð½Ð½Ñ‹Ñ… Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶ÐµÐ¹",
		["LOKWhoIsWho data not found"] = "Ð”Ð°Ð½Ð½Ñ‹Ðµ LOKWhoIsWho Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½Ñ‹",
		["LOKWhoIsWho import"] = "Ð˜Ð¼Ð¿Ð¾Ñ€Ñ‚ Ð¸Ð· LOKWhoIsWho",
		["LOKWhoIsWho lua file not found, sorry."] = "Lua Ñ„Ð°Ð¹Ð» LOKWhoIsWho Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½, Ð¸Ð·Ð²ÐµÐ½Ð¸Ñ‚Ðµ.",
		["Main"] = "ÐžÑÐ½Ð¾Ð²Ð½Ð¾Ð¹",
		["main"] = "Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð¹",
		["Main name position"] = "ÐŸÐ¾Ð·Ð¸Ñ†Ð¸Ñ Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð³Ð¾ Ð¸Ð¼ÐµÐ½Ð¸",
		["Main:"] = "ÐžÑÐ½Ð¾Ð²Ð½Ð¾Ð¹:",
		["mainpos_desc"] = "Ð“Ð´Ðµ Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶Ð°Ñ‚ÑŒ Ð¸Ð¼Ñ Ð³Ð»Ð°Ð²Ð½Ð¾Ð³Ð¾ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶Ð° ÐµÑÐ»Ð¸ Ð¾Ð½ Ð½Ð° Ð°Ð»ÑŒÑ‚Ðµ.",
		["mainpos_name"] = "ÐŸÐ¾Ð·Ð¸Ñ†Ð¸Ñ Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð³Ð¾ Ð¸Ð¼ÐµÐ½Ð¸",
		["module_desc"] = "ÐŸÐ¾Ð·Ð²Ð¾Ð»ÑÐµÑ‚ Ð¿Ñ€Ð¸Ð²ÑÐ·Ñ‹Ð²Ð°Ñ‚ÑŒ Ð¸Ð¼ÐµÐ½Ð° Ð°Ð»ÑŒÑ‚Ð¾Ð² Ðº Ð¸Ð¼ÐµÐ½Ð°Ð¼ Ð¾ÑÐ½Ð¾Ð²Ð½Ñ‹Ñ… Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶ÐµÐ¹, Ð° Ð¿Ð¾Ñ‚Ð¾Ð¼ Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶Ð°Ñ‚ÑŒ Ð¸Ñ… Ñ€ÑÐ´Ð¾Ð¼ Ð² ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸ÑÑ… Ð² Ñ‡Ð°Ñ‚Ðµ (Ð¿Ð¾ ÑƒÐ¼Ð¾Ð»Ñ‡Ð°Ð½Ð¸ÑŽ=Ð²Ñ‹ÐºÐ»ÑŽÑ‡ÐµÐ½Ð¾).",
		["no alts found for character "] = "Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½Ð¾ Ð°Ð»ÑŒÑ‚Ð¾Ð² Ð´Ð»Ñ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶Ð°",
		["no alts or mains found matching \"%s\""] = "ÑÐ¾Ð²Ð¿Ð°Ð²ÑˆÐ¸Ñ… Ð°Ð»ÑŒÑ‚Ð¾Ð² Ð¸Ð»Ð¸ Ð¾ÑÐ½Ð¾Ð²Ð½Ñ‹Ñ… \"%s\"",
		["No arg string given to :addAlt()"] = "ÐÐµ Ð·Ð°Ð´Ð°Ð½Ð¾ Ð·Ð½Ð°Ñ‡ÐµÐ½Ð¸Ðµ ÑÑ‚Ñ€Ð¾ÐºÐ¸ Ð´Ð»Ñ: :addAlt()",
		["no characters called \"%s\" found; nothing deleted"] = "Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶ Ð¿Ð¾ Ð¸Ð¼ÐµÐ½Ð¸ \"%s\"; Ð½ÐµÑ‡ÐµÐ³Ð¾ ÑƒÐ´Ð°Ð»ÑÑ‚ÑŒ",
		["No Guild Greet database found"] = "Ð‘Ð°Ð·Ð° Ð´Ð°Ð½Ð½Ñ‹Ñ… Guild Greet Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½Ð°",
		["No main name supplied to link %s to"] = "ÐÐµ Ð¿Ñ€ÐµÐ´Ð¾ÑÑ‚Ð°Ð²Ð»ÐµÐ½Ð¾ Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ðµ Ð¸Ð¼Ñ Ð´Ð»Ñ ÑÐ²ÑÐ·ÐºÐ¸ %s Ðº",
		["no matches found"] = "ÑÐ¾Ð²Ð¿Ð°Ð´ÐµÐ½Ð¸Ð¹ Ð½Ðµ Ð½Ð°Ð¹Ð´ÐµÐ½Ð¾",
		["quiet"] = "Ñ‚Ð¸Ñ…Ð¸Ð¹",
		["quiet_desc"] = "ÐžÑ‚Ñ‡Ð¸Ñ‚Ñ‹Ð²Ð°Ñ‚ÑŒÑÑ Ð¾ Ð´ÐµÐ¹ÑÑ‚Ð²Ð¸ÑÑ… Ð² Ñ‡Ð°Ñ‚ Ð¸Ð»Ð¸ Ð½ÐµÑ‚.",
		["quiet_name"] = true,
		["Right"] = "Ð¡Ð¿Ñ€Ð°Ð²Ð°",
		["Search the list of linked characters for matching main or alt names."] = "ÐŸÐ¾Ð¸ÑÐº Ð² ÑÐ¿Ð¸ÑÐºÐµ ÑÐ²ÑÐ·Ð°Ð½Ð½Ñ‹Ñ… Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶ÐµÐ¹.",
		["searched for: %s - total matches: %s"] = "Ð¿Ð¾Ð¸ÑÐº Ð´Ð»Ñ: %s - Ð²ÑÐµÐ³Ð¾ ÑÐ¾Ð²Ð¿Ð¾Ð´ÐµÐ½Ð¸Ð¹: %s",
		["Show alts in tooltip"] = "ÐÐ»ÑŒÑ‚Ñ‹ Ð² Ð¿Ð¾Ð´ÑÐºÐ°Ð·ÐºÐµ",
		["Show main in tooltip"] = "ÐžÑÐ½Ð¾Ð²Ð½Ñ‹Ðµ Ð² Ð¿Ð¾Ð´ÑÐºÐ°Ð·ÐºÐµ",
		["Start"] = "ÐÐ°Ñ‡Ð°Ñ‚ÑŒ",
		["The colour of an alt's main name that will be displayed"] = "ÐžÑ‚Ð¾Ð±Ñ€Ð°Ð¶Ð°Ñ‚ÑŒ Ñ†Ð²ÐµÑ‚ Ð¸Ð¼ÐµÐ½Ð¸ Ð°Ð»ÑŒÑ‚Ð° Ð¿Ð¾ Ð¾ÑÐ½Ð¾Ð²Ð½Ð¾Ð¼Ñƒ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶Ñƒ",
		["Use class colour (from the PlayerNames module)"] = "Ð˜ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÑŒ Ð¾ÐºÑ€Ð°ÑÐºÑƒ Ð¿Ð¾ Ñ†Ð²ÐµÑ‚Ñƒ ÐºÐ»Ð°ÑÑÐ° (Ð¸Ð· Ð¼Ð¾Ð´ÑƒÐ»Ñ PlayerNames)",
		["use class colour of alt"] = "Ñ†Ð²ÐµÑ‚Ð° ÐºÐ»Ð°ÑÑÐ° Ð´Ð»Ñ Ð°Ð»ÑŒÑ‚Ð¾Ð²",
		["use class colour of main"] = "Ñ†Ð²ÐµÑ‚Ð° ÐºÐ»Ð°ÑÑÐ° Ð´Ð»Ñ Ð¾ÑÐ½Ð¾Ð²Ð½Ñ‹Ñ…",
		["Use LibAlts Data"] = "Ð˜ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÑŒ LibAlts",
		["Use the data available via the shared alt information library."] = "Ð˜ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÑŒ Ð´Ð°Ð½Ð½Ñ‹Ðµ Ð¿Ð¾ÑÑ€ÐµÐ´ÑÑ‚Ð²Ð¾Ð¼ ÑÐ¾Ð²Ð¼ÐµÑÑ‚Ð½Ð¾ Ð¸ÑÐ¿Ð¾Ð»ÑŒÐ·ÑƒÐµÐ¼Ð¾Ð¹ Ð±Ð¸Ð±Ð»Ð¸Ð¾Ñ‚ÐµÐºÐ¸ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸Ð¸ Ð¾Ð± Ð°Ð»ÑŒÑ‚Ð°Ñ….",
		["Various ways to import a main's alts from other addons"] = "Ð Ð°Ð·Ð»Ð¸Ñ‡Ð½Ñ‹Ðµ Ð²Ð°Ñ€Ð¸Ð°Ð½Ñ‚Ñ‹ Ð¸Ð¼Ð¿Ð¾Ñ€Ñ‚Ð° Ð°Ð»ÑŒÑ‚Ð¾Ð² Ð¾ÑÐ½Ð¾Ð²Ð½Ñ‹Ñ… Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶ÐµÐ¹ Ð¸Ð· Ð´Ñ€ÑƒÐ³Ð¸Ñ… Ð°Ð´Ð´Ð¾Ð½Ð¾Ð²",
		["warning: alt %s already linked to %s"] = "Ð²Ð½Ð¸Ð¼Ð°Ð½Ð¸Ðµ: Ð°Ð»ÑŒÑ‚ %s ÑƒÐ¶Ðµ ÑÐ²ÑÐ·Ð°Ð½ Ñ %s",
		["Where to display a character's main name when on their alt."] = "Ð“Ð´Ðµ Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶Ð°Ñ‚ÑŒ Ð¸Ð¼Ñ Ð³Ð»Ð°Ð²Ð½Ð¾Ð³Ð¾ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶Ð° ÐµÑÐ»Ð¸ Ð¾Ð½ Ð½Ð° Ð°Ð»ÑŒÑ‚Ðµ.",
		["Whether to report to the chat frame or not."] = "Ð¡Ð¾Ð¾Ð±Ñ‰Ð°Ñ‚ÑŒ Ð² Ñ‡Ð°Ñ‚ Ð¸Ð»Ð¸ Ð½ÐµÑ‚.",
		["You are not in a guild"] = "Ð’Ñ‹ Ð½Ðµ ÑÐ¾ÑÑ‚Ð¾Ð¸Ñ‚ÐµÐ² Ð³Ð¸Ð»ÑŒÐ´Ð¸Ð¸",
		["You have not yet linked any alts with their mains."] = "Ð’Ñ‹ ÐµÑ‰Ðµ Ð½Ðµ ÑÐ²ÑÐ·Ð°Ð»Ð¸ Ð½Ðµ Ð¾Ð´Ð½Ð¾Ð³Ð¾ Ð°Ð»ÑŒÑ‚Ð° Ñ Ð¸Ñ… Ð¾ÑÐ½Ð¾Ð²Ð½Ñ‹Ð¼Ð¸.",
	}
}
    PL:AddLocale(PRAT_MODULE, "ruRU",L)

  L=
{
	["AltNames"] = {
		["%d alts found for %s: %s"] = "%d é©¬ç”²æ‰¾åˆ° %s: %s",
		["%s alts imported from LOKWhoIsWho"] = "%sé©¬ç”²ä»ŽLOKWhoIsWhoå¯¼å…¥",
		["%s total alts linked to mains"] = "%så…¨éƒ¨é©¬ç”²è”ç»“åˆ°æœ¬å°Š",
		["(.-)'s? [Aa]lt"] = true,
		["([^%s%p%d%c%z]+)'s alt"] = true,
		[".*[Aa]lts?$"] = true,
		["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = "<é©¬ç”²åç§°> (ä¾‹, /altnames del æŸä¸ªä½ ä»¥ä¸ºæ˜¯ä½†ä¸æ˜¯çš„æŸäººåˆ†èº«)",
		["<main> (eg /altnames listalts Fin)"] = "<æœ¬å°Š> (ä¾‹ /altnames listalts é¡¶å°–æˆ˜å£«)",
		["<search term> (eg, /altnames find fin)"] = "<æœç´¢æ¡ä»¶>(ä¾‹, /altnames find é¡¶å°–æˆ˜å£«)",
		["Alt"] = "é©¬ç”²",
		["alt"] = "é©¬ç”²",
		["alt name exists: %s -> %s; not overwriting as set in preferences"] = "é©¬ç”²åç§°å­˜åœ¨: %s -> %s;æ²¡æœ‰è¦†ç›–å‚æ•°è®¾ç½®",
		["AltNames"] = "é©¬ç”²åç§°",
		["Alts:"] = "é©¬ç”²:",
		["autoguildalts_desc"] = [=[åŽå°è‡ªåŠ¨ä»Žå…¬ä¼šä¿¡æ¯ä¸­å¯¼å…¥
]=],
		["autoguildalts_name"] = "è‡ªåŠ¨å¯¼å…¥å…¬ä¼šå",
		["Be quiet"] = "ç¦è¨€",
		["character removed: %s"] = "åˆ é™¤è§’è‰²: %s",
		["Class colour"] = "èŒä¸šé¢œè‰²",
		["Clear all"] = "å…¨éƒ¨æ¸…é™¤",
		["Clear all links between alts and main names."] = "æ¸…é™¤æ‰€æœ‰é©¬ç”²ä¸Žæœ¬å°Šåç§°é—´çš„è”ç»“",
		["Colour"] = "é¢œè‰²",
		["Delete a character's link to another character as their main."] = "åˆ é™¤ä¸€ä¸ªè§’è‰²ä½œä¸ºå¦ä¸€ä¸ªè§’è‰²æœ¬å°Šçš„è”ç»“",
		["Delete alt"] = "åˆ é™¤é©¬ç”²",
		["Disabled"] = "ç¦ç”¨",
		["Display a player's alts in the tooltip"] = "åœ¨æç¤ºé‡Œæ˜¾ç¤ºçŽ©å®¶çš„é©¬ç”²åç§°",
		["Display a player's main name in the tooltip"] = "åœ¨æç¤ºé‡Œæ˜¾ç¤ºçŽ©å®¶çš„æœ¬å°Šåç§°",
		["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = "ç”¨å’Œé©¬ç”²èŒä¸šç›¸åŒçš„é¢œè‰²æ˜¾ç¤ºæœ¬å°Šåç§°(å¦‚æžœçŽ©å®¶åç§°æ¨¡å—å¯ç”¨,ä»Žä¸­é‡‡é›†æ•°æ®)",
		["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = "ç”¨å’Œæœ¬å°ŠèŒä¸šç›¸åŒçš„é¢œè‰²æ˜¾ç¤ºæœ¬å°Šåç§°(å¦‚æžœçŽ©å®¶åç§°æ¨¡å—å¯ç”¨,ä»Žä¸­é‡‡é›†æ•°æ®)",
		["Don't overwrite existing alt <-> main links when importing or adding new alts."] = "ä¸è¦åœ¨å¯¼å…¥æˆ–æ·»åŠ æ–°é©¬ç”²æ—¶è¦†ç›–å·²æœ‰çš„é©¬ç”² <-> æœ¬å°Š",
		["Don't overwrite existing links"] = "ä¸è¦è¦†ç›–å·²æœ‰è”ç»“",
		["don't use"] = "ä¸ä½¿ç”¨",
		["Don't use data from the PlayerNames module at all"] = "ä¸è¦ä»ŽçŽ©å®¶åç§°æ¨¡å—ä½¿ç”¨æ•°æ®",
		["ERROR: some function sent a blank message!"] = "é”™è¯¯:ä¸€äº›å‚æ•°å‘é€äº†ä¸€æ¡ç©ºç™½ä¿¡æ¯!",
		["Find characters"] = "å‘çŽ°è§’è‰²",
		["Fix alts"] = "ä¿®å¤é©¬ç”²",
		["Fix corrupted entries in your list of alt names."] = "åœ¨ä½ çš„é©¬ç”²åç§°åˆ—è¡¨é‡Œä¿®å¤æŸåçš„æ¡ç›®",
		["Found alt: %s => main: %s"] = "å‘çŽ°é©¬ç”²: %s => æœ¬å°Š: %s",
		["guild member alts found and imported: %s"] = "å…¬ä¼šæˆå‘˜é©¬ç”²å‘çŽ°å¹¶å¯¼å…¥: %s",
		["Import from Guild Greet database"] = "ä»Žå…¬ä¼šæ¬¢è¿Žæ•°æ®åº“å¯¼å…¥",
		["Import from guild roster"] = "ä»Žå·¥ä¼šåå•å¯¼å…¥",
		["Import options"] = "å¯¼å…¥é€‰é¡¹",
		["Imports alt names from a Guild Greet database, if present"] = "å¯¼å…¥é©¬ç”²åç§°ä»Žå…¬ä¼šæ¬¢è¿Žæ•°æ®åº“,å¦‚æžœå¯ä»¥",
		["Imports alt names from the guild roster by checking for members with the rank \"alt\" or \"alts\", or guild / officer notes like \"<name>'s alt\""] = "å¯¼å…¥é©¬ç”²åç§°ä»Žå…¬ä¼šåå•ä¸­æ£€æŸ¥åˆ°çš„æˆå‘˜å¤´è¡”ä¸ºâ€œé©¬ç”²â€æˆ–â€œé©¬ç”²ä»¬â€çš„,æˆ–è€…å…¬ä¼šå®˜å‘˜å¤‡æ³¨ä¸º\"<æŸæŸ>çš„é©¬ç”²\"",
		["Imports data from LOKWhoIsWho, if present (drop your SavedVariablesLOKWhoIsWho.lua in the Prat directory to be able to use this)."] = "ä»ŽLOKWhoIsWhoå¯¼å…¥æ•°æ®,å¦‚æžœå¯ä»¥(ä½ çš„Pratç›®å½•ä¸¢å¤±SavedVariablesLOKWhoIsWho.luaå¯ä»¥ä½¿ç”¨è¿™ä¸ª).",
		["Left"] = "å·¦è¾¹",
		["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = "è”ç»“ <é©¬ç”²åç§°> <æœ¬å°Šåç§°>(ä¾‹,/altnames link é¡¶å°–æˆ˜å£« è‹å¤©å“¥)",
		["Link alt"] = "è”ç»“é©¬ç”²",
		["Link someone's alt character with the name of their main."] = "è”ç»“æŸäººçš„é©¬ç”²è§’è‰²ä¸Žä»–ä»¬çš„æœ¬å°Šåç§°",
		["linked alt %s => %s"] = "è”ç»“çš„é©¬ç”² %s => %s",
		["List all"] = "å…¨éƒ¨åˆ—å‡º",
		["List all links between alts and their main names."] = "åˆ—å‡ºæ‰€æœ‰é©¬ç”²ä¸Žä»–ä»¬çš„æœ¬å°Šåç§°é—´çš„è”ç»“",
		["List alts"] = "åˆ—å‡ºé©¬ç”²",
		["List alts for a given character"] = "åˆ—å‡ºç‰¹å®šè§’è‰²çš„é©¬ç”²",
		["LOKWhoIsWho data not found"] = "æœªå‘çŽ°LOKWhoIsWhoæ•°æ®",
		["LOKWhoIsWho import"] = "LOKWhoIsWhoå¯¼å…¥",
		["LOKWhoIsWho lua file not found, sorry."] = "æœªå‘çŽ°LOKWhoIsWhoæƒé™æ–‡ä»¶,æ¯æ€’",
		["Main"] = "æœ¬å°Š",
		["main"] = "æœ¬å°Š",
		["Main name position"] = "æœ¬å°Šåç§°ä½ç½®",
		["Main:"] = "æœ¬å°Š:",
		["mainpos_desc"] = "å½“è§’è‰²åœ¨é©¬ç”²ä¸Šæ—¶æœ¬å°Šåç§°çš„æ˜¾ç¤ºä½ç½®",
		["mainpos_name"] = "æœ¬å°Šåç§°ä½ç½®",
		["module_desc"] = "æŠŠæŸäººçš„é©¬ç”²è§’è‰²è”ç»“åˆ°ä»–ä»¬çš„æœ¬å°Š,åœ¨èŠå¤©ä¿¡æ¯ä¸­çš„åå­—æ—è¾¹æ˜¾ç¤º(é»˜è®¤=å…³é—­).",
		["no alts found for character "] = "æœªå‘çŽ°è§’è‰²é©¬ç”²",
		["no alts or mains found matching \"%s\""] = "æœªå‘çŽ°åŒ¹é…\"%s\"é©¬ç”²æˆ–æœ¬å°Š",
		["No arg string given to :addAlt()"] = "æ— å­—ç¬¦ä¸²å‚æ•°åˆ°:addAlt()",
		["no characters called \"%s\" found; nothing deleted"] = "æœªå‘çŽ°ç§°ä½œ\"%s\"è§’è‰²;æ— åˆ é™¤",
		["No Guild Greet database found"] = "æœªå‘çŽ°å…¬ä¼šæ¬¢è¿Žæ•°æ®åº“",
		["No main name supplied to link %s to"] = "æ²¡æœ‰æœ¬å°Šåç§°ä»¥ä¾›è”ç»“%s",
		["no matches found"] = "æ— åŒ¹é…å‘çŽ°",
		["quiet"] = "å®‰é™",
		["quiet_desc"] = "æ˜¯å¦åœ¨èŠå¤©æ¡†æŠ¥å‘Š",
		["quiet_name"] = "æ— å£°_åå­—",
		["Right"] = "å³è¾¹",
		["Search the list of linked characters for matching main or alt names."] = "æœç´¢å·²è”ç»“çš„è§’è‰²åˆ—è¡¨åŒ¹é…æœ¬å°Šæˆ–é©¬ç”²åç§°",
		["searched for: %s - total matches: %s"] = "æœç´¢: %s - å®Œå…¨åŒ¹é…: %s",
		["Show alts in tooltip"] = "åœ¨æç¤ºé‡Œæ˜¾ç¤ºé©¬ç”²",
		["Show main in tooltip"] = "åœ¨æç¤ºé‡Œæ˜¾ç¤ºæœ¬å°Š",
		["Start"] = "èµ·å§‹",
		["The colour of an alt's main name that will be displayed"] = "é©¬ç”²çš„æœ¬å°Šåç§°å°†æ˜¾ç¤ºçš„é¢œè‰²",
		["Use class colour (from the PlayerNames module)"] = "ä½¿ç”¨èŒä¸šé¢œè‰²(ä»ŽçŽ©å®¶åç§°æ¨¡å—)",
		["use class colour of alt"] = "é©¬ç”²èŒä¸šçš„é¢œè‰²",
		["use class colour of main"] = "æœ¬å°ŠèŒä¸šçš„é¢œè‰²",
		["Use LibAlts Data"] = "ä½¿ç”¨LibAltsæ•°æ®",
		["Use the data available via the shared alt information library."] = "ä½¿æ•°æ®å¯é€šè¿‡å…±äº«çš„é©¬ç”²ä¿¡æ¯åº“",
		["Various ways to import a main's alts from other addons"] = "ç”¨å„ç§é€”å¾„ä»Žå…¶ä»–æ’ä»¶å¯¼å…¥æœ¬å°Šçš„é©¬ç”²",
		["warning: alt %s already linked to %s"] = "æ³¨æ„:é©¬ç”²%så·²è”ç»“åˆ°%s",
		["Where to display a character's main name when on their alt."] = "å½“è§’è‰²åœ¨é©¬ç”²ä¸Šæ—¶æœ¬å°Šåç§°æ˜¾ç¤ºä½•å¤„",
		["Whether to report to the chat frame or not."] = "æ˜¯å¦æŠ¥å‘Šåœ¨èŠå¤©æ¡†",
		["You are not in a guild"] = "ä½ ä¸åœ¨ä¸€ä¸ªå…¬ä¼šé‡Œ",
		["You have not yet linked any alts with their mains."] = "å°šæœªæœ‰ä»»ä½•é©¬ç”²è”ç»“åˆ°ä»–ä»¬çš„æœ¬å°Š",
	}
}
    PL:AddLocale(PRAT_MODULE, "zhCN",L)

  L=
{
	["AltNames"] = {
		["%d alts found for %s: %s"] = "%d alternativos encontrados para %s: %s",
		["%s alts imported from LOKWhoIsWho"] = "%s alternativos importados desde LOKWhoIsWho",
		["%s total alts linked to mains"] = "alternativos total %s vinculados a principales",
		["(.-)'s? [Aa]lt"] = "%f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]'s [Aa]lt",
		["([^%s%p%d%c%z]+)'s alt"] = "%f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]'s [Aa]lt",
		[".*[Aa]lts?$"] = true,
		["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = "<nombre alt> (ej, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)",
		["<main> (eg /altnames listalts Fin)"] = "<principal> (ej /altnames listalts Fin)",
		["<search term> (eg, /altnames find fin)"] = "<tÃ©rmino bÃºsqueda> (ej, /altnames find fin)",
		["Alt"] = true,
		["alt"] = true,
		["alt name exists: %s -> %s; not overwriting as set in preferences"] = "existe el nombre alternativo: %s -> %s; sin sobrescribir como estÃ¡ establecido en las preferencias",
		["AltNames"] = "AltNombres",
		["Alts:"] = true,
		--[[Translation missing --]]
		--[[ ["autoguildalts_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["autoguildalts_name"] = "",--]] 
		["Be quiet"] = "Silencio",
		["character removed: %s"] = "Personaje eliminado: %s",
		["Class colour"] = "Color Clase",
		["Clear all"] = "Limpiar todo",
		["Clear all links between alts and main names."] = "Borrar todos los enlaces entre nombres alternativos y principales.",
		["Colour"] = "Color",
		--[[Translation missing --]]
		--[[ ["Delete a character's link to another character as their main."] = "",--]] 
		["Delete alt"] = "Eliminar alternativo",
		["Disabled"] = "Desactivado",
		["Display a player's alts in the tooltip"] = "Mostrar los alters de los jugadores en el tooltip",
		["Display a player's main name in the tooltip"] = "Mostrar el nombre del main del jugador en el tooltip",
		["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = "Mostrar nombres de personajes principales (mains) en el mismo color que la clase del alter (obteniendo los datos del mÃ³dulo PlayerNames si estÃ¡ habilitado)",
		["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = "Mostrar nombres principales en el mismo color que el de su clase principal (tomando los datos del mÃ³dulo PlayerNames si estÃ¡ habilitado)",
		["Don't overwrite existing alt <-> main links when importing or adding new alts."] = "No sobreescribir enlaces alternativo <-> principal existentes al importar o aÃ±adir nuevos alternativos.",
		["Don't overwrite existing links"] = "No sobreescribir enlaces existentes",
		["don't use"] = "No utilizar",
		["Don't use data from the PlayerNames module at all"] = "No utilizar datos del mÃ³dulo PlayerNames en absoluto",
		["ERROR: some function sent a blank message!"] = "ERROR: alguna funciÃ³n enviÃ³ un mensaje en blanco!",
		["Find characters"] = "Encontrar caracteres",
		["Fix alts"] = "Arreglar alternativos",
		["Fix corrupted entries in your list of alt names."] = "Arreglar entradas corruptas en su lista de nombres alternativos.",
		["Found alt: %s => main: %s"] = "Alternativo encontrado: %s => principal: %s",
		["guild member alts found and imported: %s"] = "Miembros de hermandad alternativos encontrados e importados: %s",
		--[[Translation missing --]]
		--[[ ["Import from Guild Greet database"] = "",--]] 
		["Import from guild roster"] = "Importar desde la lista de la hermandad",
		["Import options"] = "Opciones de ImportaciÃ³n",
		--[[Translation missing --]]
		--[[ ["Imports alt names from a Guild Greet database, if present"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Imports alt names from the guild roster by checking for members with the rank \"alt\" or \"alts\", or guild / officer notes like \"<name>'s alt\""] = "",--]] 
		["Imports data from LOKWhoIsWho, if present (drop your SavedVariablesLOKWhoIsWho.lua in the Prat directory to be able to use this)."] = "Importa datos de LOKWhoIsWho, si estÃ¡ presente (colocar su SavedVariablesLOKWhoIsWho.lua en el directorio Prat para poder usar este).",
		["Left"] = "Izquierda",
		["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = "enlace <nombre alt> <nombre principal> (ej, /nombrealt enlace Fin Finjathealtoffin)",
		--[[Translation missing --]]
		--[[ ["Link alt"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Link someone's alt character with the name of their main."] = "",--]] 
		["linked alt %s => %s"] = "alternativo enlazado %s => %s",
		["List all"] = "Listar todo",
		["List all links between alts and their main names."] = "Lista todos los enlaces entre alternativos y sus nombres principales.",
		["List alts"] = "Lista alternativos",
		["List alts for a given character"] = "Lista alternativos para un personaje dado",
		["LOKWhoIsWho data not found"] = "LOKWhoIsWho datos no encontrados",
		["LOKWhoIsWho import"] = "importar LOKWhoIsWho",
		["LOKWhoIsWho lua file not found, sorry."] = "LOKWhoIsWho archivo lua no encontrado, lo siento.",
		["Main"] = "Principal",
		["main"] = "principal",
		["Main name position"] = "PosiciÃ³n del nombre principal",
		["Main:"] = "Principal:",
		["mainpos_desc"] = "Donde mostrar nombre principal de un personaje cuando es su alternativa.",
		["mainpos_name"] = "PosiciÃ³n del nombre principal",
		--[[Translation missing --]]
		--[[ ["module_desc"] = "",--]] 
		["no alts found for character "] = "sin alternativos encontrados para el personaje",
		["no alts or mains found matching \"%s\""] = "sin alternativos o principales coincidentes con \"%s\" encontrados",
		["No arg string given to :addAlt()"] = "Sin cadena de argumento dado a: addAlt()",
		["no characters called \"%s\" found; nothing deleted"] = "no se han encontrado personajes llamados \"%s\"; nada eliminado",
		--[[Translation missing --]]
		--[[ ["No Guild Greet database found"] = "",--]] 
		["No main name supplied to link %s to"] = "Sin nombre principal proporcionado para el enlace %s",
		["no matches found"] = "Ninguna coincidencia encontrada",
		["quiet"] = "Silencioso",
		["quiet_desc"] = "Si desea informar al marco de chat o no.",
		--[[Translation missing --]]
		--[[ ["quiet_name"] = "",--]] 
		["Right"] = "Derecha",
		--[[Translation missing --]]
		--[[ ["Search the list of linked characters for matching main or alt names."] = "",--]] 
		["searched for: %s - total matches: %s"] = "buscado: %s - total de coincidencias: %s",
		["Show alts in tooltip"] = "Muestra alternativos en ayuda contextual",
		["Show main in tooltip"] = "Mostrar principal en ayuda contextual",
		["Start"] = "Inicio",
		--[[Translation missing --]]
		--[[ ["The colour of an alt's main name that will be displayed"] = "",--]] 
		["Use class colour (from the PlayerNames module)"] = "Utilizar el color de clase (desde el mÃ³dulo de NombresJugador)",
		["use class colour of alt"] = "utilizar color de clase de alt",
		["use class colour of main"] = "utilizar el color de la clase principal",
		["Use LibAlts Data"] = "Utiilizar Datos de LibAlts",
		["Use the data available via the shared alt information library."] = "Utilice los datos disponibles a travÃ©s de la biblioteca compartida de informaciÃ³n alternativa.",
		--[[Translation missing --]]
		--[[ ["Various ways to import a main's alts from other addons"] = "",--]] 
		["warning: alt %s already linked to %s"] = "advertencia: alt %s ya vinculado a %s",
		--[[Translation missing --]]
		--[[ ["Where to display a character's main name when on their alt."] = "",--]] 
		["Whether to report to the chat frame or not."] = "Si se debe reportar al marco de chat o no.",
		["You are not in a guild"] = "No estÃ¡ en una hermandad",
		["You have not yet linked any alts with their mains."] = "AÃºn no ha vinculado algÃºn alternativo con su principal.",
	}
}
    PL:AddLocale(PRAT_MODULE, "esES",L)

  L=
{
	["AltNames"] = {
		["%d alts found for %s: %s"] = "%d åˆ†èº«æ‰¾åˆ°æ–¼ %s: %s",
		["%s alts imported from LOKWhoIsWho"] = "%s åˆ†èº«åŒ¯å…¥ä¾†è‡ª LOKWhoIsWho",
		["%s total alts linked to mains"] = "%s ç¸½åˆ†èº«é€£çµæœ¬å°Š",
		["(.-)'s? [Aa]lt"] = "%f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]'s [Aa]lt",
		["([^%s%p%d%c%z]+)'s alt"] = "%f[%a\\192-\\255]([%a\\192-\\255]+)%f[^%a\\128-\\255]'s [Aa]lt",
		[".*[Aa]lts?$"] = true,
		["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"] = "<alt name> (ä¾‹å¦‚, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)",
		["<main> (eg /altnames listalts Fin)"] = "<main> (ä¾‹å¦‚ /altnames listalts Fin)",
		["<search term> (eg, /altnames find fin)"] = "<search term> (ä¾‹å¦‚, /altnames find fin)",
		["Alt"] = "åˆ†èº«",
		["alt"] = "åˆ†èº«",
		--[[Translation missing --]]
		--[[ ["alt name exists: %s -> %s; not overwriting as set in preferences"] = "",--]] 
		["AltNames"] = "åˆ†èº«åå­—",
		["Alts:"] = "åˆ†èº«:",
		--[[Translation missing --]]
		--[[ ["autoguildalts_desc"] = "",--]] 
		["autoguildalts_name"] = "è‡ªå‹•åŒ¯å…¥å…¬æœƒåˆ†èº«",
		["Be quiet"] = "å®‰éœ",
		["character removed: %s"] = "å·²ç§»é™¤è§’è‰²ï¼š%s",
		["Class colour"] = "è·æ¥­è‰²å½©",
		["Clear all"] = "æ¸…é™¤æ‰€æœ‰",
		--[[Translation missing --]]
		--[[ ["Clear all links between alts and main names."] = "",--]] 
		["Colour"] = "é¡è‰²",
		--[[Translation missing --]]
		--[[ ["Delete a character's link to another character as their main."] = "",--]] 
		["Delete alt"] = "åˆªé™¤åˆ¥ç¨±",
		["Disabled"] = "åœç”¨",
		["Display a player's alts in the tooltip"] = "é¡¯ç¤ºåœ¨æç¤ºçŽ©å®¶çš„åˆ†èº«",
		["Display a player's main name in the tooltip"] = "é¡¯ç¤ºåœ¨æç¤ºçŽ©å®¶çš„æœ¬å°Šåç¨±",
		--[[Translation missing --]]
		--[[ ["Display main names in the same colour as that of the alt's class (taking the data from the PlayerNames module if it is enabled)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Display main names in the same colour as that of the main's class (taking the data from the PlayerNames module if it is enabled)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Don't overwrite existing alt <-> main links when importing or adding new alts."] = "",--]] 
		["Don't overwrite existing links"] = "ä¸è¦è¦†è“‹ç¾å­˜çš„é€£æŽ¥",
		["don't use"] = "ä¸è¦ä½¿ç”¨",
		--[[Translation missing --]]
		--[[ ["Don't use data from the PlayerNames module at all"] = "",--]] 
		["ERROR: some function sent a blank message!"] = "éŒ¯èª¤ï¼šæŸäº›åŠŸèƒ½å‚³é€ç©ºç™½è¨Šæ¯ï¼",
		["Find characters"] = "æœå°‹è§’è‰²",
		["Fix alts"] = "ä¿®æ­£åˆ¥ç¨±",
		["Fix corrupted entries in your list of alt names."] = "ä¿®æ­£åˆ—è¡¨ä¸­åˆ¥ç¨±ææ¯€çš„é …ç›®",
		["Found alt: %s => main: %s"] = "æœå°‹åˆ¥ç¨±ï¼š%s => ä¸»è¦åç¨±ï¼š%s",
		["guild member alts found and imported: %s"] = "å…¬æœƒæˆå“¡åˆ¥ç¨±æœå°‹ä»¥åŠåŒ¯å…¥ï¼š%s",
		["Import from Guild Greet database"] = "åŒ¯å…¥ä¾†è‡ªå…¬æœƒå•å€™è³‡æ–™åº«",
		["Import from guild roster"] = "åŒ¯å…¥å…¬æœƒåå†Š",
		["Import options"] = "åŒ¯å…¥é¸é …è¨­å®š",
		--[[Translation missing --]]
		--[[ ["Imports alt names from a Guild Greet database, if present"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Imports alt names from the guild roster by checking for members with the rank \"alt\" or \"alts\", or guild / officer notes like \"<name>'s alt\""] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Imports data from LOKWhoIsWho, if present (drop your SavedVariablesLOKWhoIsWho.lua in the Prat directory to be able to use this)."] = "",--]] 
		["Left"] = "å·¦æ–¹",
		["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"] = "link <alt name> <main name> (ä¾‹å¦‚, /altnames link Fin Finjathealtoffin)",
		["Link alt"] = "é€£çµåˆ†èº«",
		--[[Translation missing --]]
		--[[ ["Link someone's alt character with the name of their main."] = "",--]] 
		["linked alt %s => %s"] = "é€£çµåˆ†èº« %s=> %s",
		["List all"] = "åˆ—å‡ºæ‰€æœ‰",
		--[[Translation missing --]]
		--[[ ["List all links between alts and their main names."] = "",--]] 
		["List alts"] = "åˆ—å‡ºåˆ¥ç¨±",
		--[[Translation missing --]]
		--[[ ["List alts for a given character"] = "",--]] 
		["LOKWhoIsWho data not found"] = "LOKWhoIsWho è³‡æ–™æ‰¾ä¸åˆ°",
		["LOKWhoIsWho import"] = "LOKWhoIsWho åŒ¯å…¥",
		["LOKWhoIsWho lua file not found, sorry."] = " LOKWhoIsWho lua æª”æ¡ˆæ‰¾ä¸åˆ°, æŠ±æ­‰ã€‚ ",
		["Main"] = "ä¸»è¦",
		["main"] = "ä¸»è¦",
		["Main name position"] = "ä¸»è¦åç¨±ä½ç½®",
		["Main:"] = "ä¸»è¦ï¼š",
		--[[Translation missing --]]
		--[[ ["mainpos_desc"] = "",--]] 
		["mainpos_name"] = "ä¸»è¦åç¨±ä½ç½®",
		--[[Translation missing --]]
		--[[ ["module_desc"] = "",--]] 
		["no alts found for character "] = "æœªç™¼ç¾æ­¤è§’è‰²åˆ†èº«",
		["no alts or mains found matching \"%s\""] = "æ‰¾ä¸åˆ°åˆ†èº«æˆ–æœ¬å°Šç¬¦åˆ\"%s\"",
		--[[Translation missing --]]
		--[[ ["No arg string given to :addAlt()"] = "",--]] 
		["no characters called \"%s\" found; nothing deleted"] = "æ‰¾ä¸åˆ°è§’è‰²\"%s\"; æ²’æœ‰åˆªé™¤",
		["No Guild Greet database found"] = "æ‰¾ä¸åˆ°å…¬æœƒå•å€™è³‡æ–™åº«",
		--[[Translation missing --]]
		--[[ ["No main name supplied to link %s to"] = "",--]] 
		["no matches found"] = "æ‰¾ä¸åˆ°ç¬¦åˆ",
		["quiet"] = "å®‰éœ",
		["quiet_desc"] = "æ˜¯å¦å›žå ±è‡³èŠå¤©è¦–çª—ã€‚",
		["quiet_name"] = true,
		["Right"] = "å³",
		--[[Translation missing --]]
		--[[ ["Search the list of linked characters for matching main or alt names."] = "",--]] 
		["searched for: %s - total matches: %s"] = "æœç´¢æ–¼: %s - ç¸½ç¬¦åˆ: %s",
		["Show alts in tooltip"] = "é¡¯ç¤ºåœ¨æç¤ºåˆ†èº«",
		["Show main in tooltip"] = "é¡¯ç¤ºæç¤ºä¸»è¦",
		["Start"] = "é–‹å§‹",
		--[[Translation missing --]]
		--[[ ["The colour of an alt's main name that will be displayed"] = "",--]] 
		["Use class colour (from the PlayerNames module)"] = "ä½¿ç”¨è·æ¥­è‰²å½©ï¼ˆä¾†è‡ªçŽ©å®¶åç¨±æ¨¡çµ„ï¼‰",
		["use class colour of alt"] = "ä½¿ç”¨è·æ¥­è‰²å½©æ–¼çŽ©å®¶æ¬¡è¦äººç‰©",
		["use class colour of main"] = "ä½¿ç”¨è·æ¥­è‰²å½©æ–¼çŽ©å®¶ä¸»è¦äººç‰©",
		["Use LibAlts Data"] = "ä½¿ç”¨ LibAlts è³‡æ–™",
		--[[Translation missing --]]
		--[[ ["Use the data available via the shared alt information library."] = "",--]] 
		["Various ways to import a main's alts from other addons"] = "ç”±å…¶ä»–æ’ä»¶ä»¥å„ç¨®æ–¹æ³•åŒ¯å…¥éžä¸»è¦äººç‰©ã€‚",
		["warning: alt %s already linked to %s"] = "è­¦å‘Š: åˆ†èº« %s å·²ç¶“é€£çµè‡³ %s",
		["Where to display a character's main name when on their alt."] = "ç”¨ä»¥é¡¯ç¤ºäººç‰©ä¸»è¦åç¨±æ–¼å…¶å…¶ä»–è§’è‰²åç¨±ã€‚",
		["Whether to report to the chat frame or not."] = "æ˜¯å¦å›žå ±è‡³èŠå¤©æ¡†æž¶è£¡ã€‚",
		["You are not in a guild"] = "ä½ ä¸¦æ²’æœ‰åŠ å…¥ä»»ä½•å…¬æœƒ",
		--[[Translation missing --]]
		--[[ ["You have not yet linked any alts with their mains."] = "",--]] 
	}
}
    PL:AddLocale(PRAT_MODULE, "zhTW",L)
  end
  --@end-non-debug@



  local altregistry

  module.Alts = {}

  Prat:SetModuleDefaults(module.name, {
    profile = {
      on = false,
      quiet = false,
      pncol = 'no',
      altidx = {},
      mainpos = 'RIGHT',
      colour = {},
      maincolour = '97ff4c', -- fairly light bright green
      altcolour = 'ff6df2', -- fairly bright light purpley pinkish
      noclobber = false,
      tooltip_showmain = false,
      tooltip_showalts = false,
      usealtlib = true,
      autoguildalts = false,
    },
    realm = {
      alts = {},
    }
  })


  Prat:SetModuleInit(module,
    function(self)
      altregistry = LibStub("LibAlts-1.0")

      if self.db.profile.alts then
        local alts = self.db.profile.alts
        self.db.profile.alts = nil
        for k, v in pairs(alts) do
          self.db.realm.alts[k] = self.db.realm.alts[k] or v
        end
      end

      -- Load shared Alts data
      for alt, main in pairs(self.db.realm.alts) do

        altregistry:SetAlt(main, alt, "Prat")
      end



      -- define a popup to get the main name
      StaticPopupDialogs['MENUITEM_LINKALT'] = {
        -- text		= "Who would you like to set as the main character of %s?",
        text = 'Mainname',
        button1 = ACCEPT,
        button2 = CANCEL,
        hasEditBox = 1,
        maxLetters = 24,
        exclusive = 0,

        preferredIndex = 3,

        OnAccept = function(this, altname)
          local mainname = this.editBox:GetText()

          altname = altname or 'xxx'

          module:addAlt(string.format('%s %s', altname, mainname))
        end,
        OnShow = function(this)
          this.editBox:SetFocus();
        end,
        OnHide = function(this)
          if (this.editBox:IsShown()) then
            this.editBox:SetFocus();
          end
          _G[this:GetName() .. "EditBox"]:SetText("");
        end,
        EditBoxOnEnterPressed = function(this, altname)
          local parent = this:GetParent()
          local editBox = parent.editBox
          local mainname = editBox:GetText()

          altname = altname or 'xxx'

          module:addAlt(string.format('%s %s', altname, mainname))

          parent:Hide()
        end,
        EditBoxOnEscapePressed = function(this)

          this:GetParent():Hide();
        end,
        timeout = 0,
        whileDead = 1,
        hideOnEscape = 1
      }
      return
    end)


  Prat:SetModuleOptions(module, {
    name = PL["AltNames"],
    desc = PL["module_desc"],
    type = "group",
    args = {
      find = {
        name = PL["Find characters"],
        desc = PL["Search the list of linked characters for matching main or alt names."],
        type = "input",
        usage = PL["<search term> (eg, /altnames find fin)"],
        order = 110,
        set = function(info, q) info.handler:findChars(q) end,
        get = false,
      },
      listalts = {
        name = PL['List alts'],
        desc = PL['List alts for a given character'],
        type = 'input',
        usage = PL['<main> (eg /altnames listalts Fin)'],
        order = 115,
        set = function(info, m) info.handler:listAlts(m) end,
        get = false,
      },
      link = {
        name = PL["Link alt"],
        desc = PL["Link someone's alt character with the name of their main."],
        type = "input",
        order = 120,
        usage = PL["link <alt name> <main name> (eg, /altnames link Fin Finjathealtoffin)"],
        -- pass	= true,
        -- set	= function(argname, argstr) self:addAlt(argstr) end,
        set = function(info, argstr) info.handler:addAlt(argstr) end,
        get = false,
        --				alias	= { 'new', 'add' },
      },
      del = {
        name = PL["Delete alt"],
        desc = PL["Delete a character's link to another character as their main."],
        type = "input",
        usage = PL["<alt name> (eg, /altnames del Personyouthoughtwassomeonesaltbutreallyisnt)"],
        order = 130,
        set = function(info, altname) info.handler:delAlt(altname) end,
        get = false,
        confirm = true,
        --				alias	= { 'remove', 'unlink' },
      },
      quiet = {
        name = PL["Be quiet"],
        desc = PL["Whether to report to the chat frame or not."],
        type = "toggle",
        order = 191, -- 19x = options
      },
      listall = {
        name = PL["List all"],
        desc = PL["List all links between alts and their main names."],
        type = "execute",
        func = "listAll",
        --				alias	= { 'list', 'all' },
      },
      clearall = {
        name = PL["Clear all"],
        desc = PL["Clear all links between alts and main names."],
        type = "execute",
        func = "clearAllAlts",
        confirm = true,
      },
      fixalts = {
        name = PL["Fix alts"],
        desc = PL["Fix corrupted entries in your list of alt names."],
        type = "execute",
        func = "fixAlts",
      },
      colour = {
        name = PL["Colour"],
        get = function(info) return info.handler:getColour() end,
        set = function(info, nr, ng, nb, na) info.handler.db.profile.colour = { r = nr, g = ng, b = nb, a = na } end,
        desc = PL["The colour of an alt's main name that will be displayed"],
        type = "color",
        order = 60,
        disabled = function(info) return info.handler.db.profile.pncol ~= 'no' end
      },
      pncol = {
        name = PL["Class colour"],
        desc = PL["Use class colour (from the PlayerNames module)"],
        type = "select",
        get = function(info) return info.handler.db.profile.pncol end,
        set = function(info, v) info.handler.db.profile.pncol = v end,
        order = 55,
        values = {
          ['main'] = PL["use class colour of main"],
          ['alt'] = PL["use class colour of alt"],
          ['no'] = PL["don't use"],
        },
      },
      mainpos = {
        name = PL["Main name position"],
        desc = PL["Where to display a character's main name when on their alt."],
        type = "select",
        order = 50,
        get = function(info) return info.handler.db.profile.mainpos end,
        set = function(info, v) info.handler:setMainPos(v) end,
        values = {
          ["LEFT"] = PL["Left"],
          ["RIGHT"] = PL["Right"],
          ["START"] = PL["Start"],
        },
      },
      tooltip_showmain = {
        name = PL['Show main in tooltip'],
        desc = PL["Display a player's main name in the tooltip"],
        type = 'toggle',
        order = 150,
        get = function(info) return info.handler.db.profile.tooltip_showmain end,
        set = function(info)
          info.handler.db.profile.tooltip_showmain = not info.handler.db.profile.tooltip_showmain
          info.handler.altertooltip = info.handler.db.profile.tooltip_showalts or info.handler.db.profile
                                      .tooltip_showmain

          info.handler:HookTooltip()
        end,
      },
      tooltip_showalts = {
        name = PL['Show alts in tooltip'],
        desc = PL["Display a player's alts in the tooltip"],
        type = 'toggle',
        order = 150,
        get = function(info) return info.handler.db.profile.tooltip_showalts end,
        set = function(info)
          info.handler.db.profile.tooltip_showalts = not info.handler.db.profile.tooltip_showalts
          info.handler.altertooltip = info.handler.db.profile.tooltip_showalts or info.handler.db.profile
                                      .tooltip_showmain

          info.handler:HookTooltip()
        end,
      },
      noclobber = {
        name = PL["Don't overwrite existing links"],
        desc = PL["Don't overwrite existing alt <-> main links when importing or adding new alts."],
        type = "toggle",
        order = 192, -- 19x = options
      },

      --			blankheader = {
      --				order	= 499,
      --				type	= 'header',
      --				},

      --[[ IMPORT OPTIONS ]] --
      importheader = {
        name = PL["Import options"],
        desc = PL["Various ways to import a main's alts from other addons"],
        type = 'header',
        order = 500,
      },

      -- imports: LOKWhoIsWho - SavedVariables
      importfromlok = {
        name = PL["LOKWhoIsWho import"],
        desc = PL["Imports data from LOKWhoIsWho, if present (drop your SavedVariables\LOKWhoIsWho.lua in the Prat directory to be able to use this)."],
        type = "execute",
        func = "importFromLOK",
        confirm = true,
        order = 560,
      },

      -- imports: guild roster - officer notes, public notes, ranks
      guildimport = {
        name = PL["Import from guild roster"],
        desc = PL['Imports alt names from the guild roster by checking for members with the rank "alt" or "alts", or guild / officer notes like "<name>\'s alt"'],
        type = "execute",
        func = "importGuildAlts",
        confirm = true,
        order = 520,
      },

      -- imports: guild greet - SavedVariables
      ggimport = {
        name = PL['Import from Guild Greet database'],
        desc = PL['Imports alt names from a Guild Greet database, if present'],
        type = 'execute',
        func = "importGGAlts",
        confirm = true,
        order = 550,
      },
      usealtlib = {
        name = PL["Use LibAlts Data"],
        desc = PL["Use the data available via the shared alt information library."],
        type = "toggle",
        order = 540,
      },
      autoguildalts = {
        name = PL["autoguildalts_name"],
        desc = PL["autoguildalts_desc"],
        type = "toggle",
        order = 540,
      },
    }
  })

  --	if Prat:IsModuleActive("PlayerNames") then
  --		self.moduleOptions['args']['pncol'] = {
  --			name	= PL["Class colour"],
  --			desc	= PL["Use class colour (from the PlayerNames module)"],
  --			type	= "text",
  --			get     =  function() return self.db.profile.pncol end,
  --			set	= function(v) self.db.profile.pncol = v end,
  --			order	= 150,
  --			validate = {
  --				['main']	= PL["use class colour of main"],
  --				['alt']		= PL["use class colour of alt"],
  --				['no']		= PL["don't use"],
  --				},
  --			validateDesc = {
  --				['main']	= PL["Display main names in the same colour as that of the main's class (taking the data from
  -- -- the PlayerNames module if it is enabled)"],
  --				['alt']		= PL["Display main names in the same colour as that of the alt's class (taking the data from
  -- -- the PlayerNames module if it is enabled)"],
  --				['no']		= PL["Don't use data from the PlayerNames module at all"],
  --				},
  --			}
  --	end
  --)


  --[[------------------------------------------------
      Module Event Functions
  ------------------------------------------------]] --

  function module:OnModuleEnable()
    -- much code ripped off from the PlayerMenu code - thanks, and sorry!

    -- things to do when the module is enabled
    for altname, mainname in pairs(self.db.realm.alts) do
      self.Alts[altname] = mainname
    end

    -- PlayerNames colour
    local pncol = self.db.profile.pncol

    if pncol == 'no' then
      pncol = false
      self.db.profile.pncol = false
    end

    self.db.profile.pncol = self.db.profile.pncol or false

    -- for caching a main's list of alts
    self.Altlists = {}

    -- just register one area which can be used for anything
    -- (and only actually has one use at the moment)
    self.ALTNAMES = ""

    -- set position that main names are displayed in chat messages
    self:setMainPos(self.db.profile.mainpos)

    -- register events
    Prat.RegisterChatEvent(self, "Prat_PreAddMessage")

    -- hook functions
    self.altertooltip = self.db.profile.tooltip_showmain or self.db.profile.tooltip_showalts

    self:HookTooltip()

    -- hack 'n' slash
    local slashcmds = {
      '/altnames',
      '/alts',
      '/alt',
    }

    --Prat:RegisterChatCommand(slashcmds, self.moduleOptions, string.upper("AltNames"))

    --self:SecureHook("UnitPopup_OnClick")
    --self:SecureHook("UnitPopup_ShowMenu")

    Prat:RegisterDropdownButton("LINK_ALT")

    -- add the bits to the context menus
    UnitPopupButtons['LINK_ALT'] = { text = "Set Main", dist = 0, func = function() module:UnitPopup_LinkAltOnClick() end, arg1 = "", arg2 = "" }

    if not self.menusAdded then
--      tinsert(UnitPopupMenus['PARTY'], #UnitPopupMenus['PARTY'] - 1, 'LINK_ALT')
--      tinsert(UnitPopupMenus['FRIEND'], #UnitPopupMenus['FRIEND'] - 1, 'LINK_ALT')
--      tinsert(UnitPopupMenus['SELF'], #UnitPopupMenus['SELF'] - 1, 'LINK_ALT')
--      tinsert(UnitPopupMenus['PLAYER'], #UnitPopupMenus['PLAYER'] - 1, 'LINK_ALT')
      -- tinsert(UnitPopupMenus['TARGET'], getn(UnitPopupMenus['TARGET'])-1, 'LINK_ALT')

      self.menusAdded = true
    end

    if self.db.profile.autoguildalts then
      self:AutoImportGuildAlts(true)
    end

    altregistry.RegisterCallback(self, "LibAlts_SetAlt", function(event, main, alt, source) self:addAlt(alt .. " " .. main, true) end)
    altregistry.RegisterCallback(self, "LibAlts_RemoveAlt", function(event, main, alt, sources) self:delAlt(alt, true) end)
  end

  function module:AutoImportGuildAlts(b)
    if b then
      self:RegisterEvent("GUILD_ROSTER_UPDATE", function() module:importGuildAlts(nil, true) end)
      GuildRoster()
    else
      self:UnregisterEvent("GUILD_ROSTER_UPDATE")
    end
  end

  function module:OnValueChanged(info, b)
    local field = info[#info]
    if field == "autoguildalts" then
      self:AutoImportGuildAlts(b)
    end
  end

  local function NOP() return end

  function module:HookTooltip()
    if self.altertooltip then
      self:SecureHookScript(GameTooltip, 'OnTooltipSetUnit')
      self:SecureHookScript(GameTooltip, 'OnTooltipCleared')

      module.HookTooltip = NOP
    end
  end

  --function module:UnitPopup_ShowMenu(dropdownMenu, which, unit, name, userData, ...)
  --	for i=1, UIDROPDOWNMENU_MAXBUTTONS do
  --		button = _G["DropDownList"..UIDROPDOWNMENU_MENU_LEVEPL.."Button"..i];
  --
  --		-- Patch our handler function back in
  --		if  button.value == "LINK_ALT" then
  --		    button.func = UnitPopupButtons["LINK_ALT"].func
  --		end
  --	end
  --end

  function module:UnitPopup_LinkAltOnClick()
    local dropdownFrame = UIDROPDOWNMENU_INIT_MENU

    --if (button == 'LINK_ALT') then
    local altname = dropdownFrame.name
    local dialog = StaticPopup_Show('MENUITEM_LINKALT', altname)

    if dialog then
      local altname = dropdownFrame.name
      dialog.data = altname
    end
    --end
  end



  -- things to do when the module is disabled
  function module:OnModuleDisable()
    -- unregister events
    Prat.UnregisterAllChatEvents(self)

    altregistry.UnregisterAllCallbacks(self)
  end


  --[[------------------------------------------------
      Core Functions
  ------------------------------------------------]] --


  function module:print(msg, printanyway)
    -- make sure we've got a message
    if msg == nil then
      printanyway = true
      msg = PL['ERROR: some function sent a blank message!']
    end

    local verbose = (not self.db.profile.quiet)

    if (not self.silent) and (verbose or printanyway) then
      msg = string.format('|cffffd100' .. PL['AltNames'] .. ':|r %s', msg)
      DEFAULT_CHAT_FRAME:AddMessage(msg)
    end
  end

  --[[ colo*u*ring and formatting ]] --

  local clrname = function(name, colour)
    return '|cff' .. (colour or 'ffffff') .. (name or "") .. '|r'
  end

  local clrmain = function(mainname, maincolour)
    mainname = mainname or ""
    maincolour = maincolour or module.db.profile.maincolour or '8080ff'

    -- 1, 0.9, 0, 0.5, 0.5, 1

    return clrname(mainname, maincolour)
  end

  local clralt = function(altname, altcolour)
    altname = altname or ""
    altcolour = altcolour or module.db.profile.altcolour or 'ff8080'

    -- 1, 0.7, 0, 1, 0.5, 0.5

    return clrname(altname, altcolour)
  end

  local clralts = function(alts, altcolour)
    if not alts or (type(alts) ~= 'table') or (#alts == 0) then return false end

    for mainname, altname in pairs(alts) do
      alts[mainname] = clralt(module:formatCharName(altname))
    end

    return alts
  end

  function module:formatCharName(name)
    -- format character names as having uppercase first letter followed by all lowercase

    if name == nil then
      return ""
    end

    name = name:gsub('[%%%[%]":|%s]', '')
    name = name:gsub("'", '')

    name = name:lower()
    name = name:gsub(Prat.MULTIBYTE_FIRST_CHAR,string.upper,1)

    return name
  end

  --[[ alt <-> main link management ]] --


  function module:addAlt(argstr, eventGenerated)
    local mainname

    local altname = ""
    local args = {}

    -- check we've been passed somethin
    if (argstr == nil) or (argstr == "") then
      self:print(PL['No arg string given to :addAlt()'])
      return false
    end

    -- extract the alt's name and the main name to link to
    for k, v in argstr:gmatch('(%S+)%s+(%S+)') do
      altname, mainname = k, v
    end

    -- check we've got a main name to link to
    if altname and not mainname then
      altname = argstr
      self:print(string.format(PL["No main name suPLied to link %s to"], clralt(altname)), true)
      return false
    end

    -- clean up character names
    mainname = self:formatCharName(mainname)
    altname = self:formatCharName(altname)

    -- check if alt has already been linked to a main
    local oldmain = ""
    local noclobber = self.db.profile.noclobber

    if self.Alts[altname] then
      oldmain = self.Alts[altname]

      if oldmain == mainname then
        self:print(string.format(PL['warning: alt %s already linked to %s'], clralt(altname), clrmain(mainname)))
        return false
      end

      if noclobber then
        self:print(string.format(PL['alt name exists: %s -> %s; not overwriting as set in preferences'],
          clralt(altname), clrmain(oldmain)))
        return false
      end

      self:print(string.format(PL['warning: alt %s already linked to %s'], clralt(altname), clrmain(oldmain)))
    end

    -- add alt to list of alts -> mains
    self.Alts[altname] = mainname
    self.db.realm.alts[altname] = mainname

    -- make sure this character's list of alts is rebuilt next time it's needed
    if self.Altlists[mainname] then self.Altlists[mainname] = nil end

    -- publish this info globablly
    if not eventGenerated then
      altregistry:SetAlt(mainname, altname, "Prat")
    end

    self:print(string.format(PL["linked alt %s => %s"], clralt(altname), clrmain(mainname)))
  end

  function module:delAlt(altname, eventGenerated)
    local suPLiedaltname = altname

    altname = self:formatCharName(altname)

    if self.Alts[altname] then
      local mainname = self.Alts[altname]
      self.Alts[altname] = nil
      self.db.realm.alts[altname] = nil

      self:print(string.format(PL["character removed: %s"], clralt(suPLiedaltname)))

      -- make sure this character's list of alts is rebuilt next time it's needed
      if self.Altlists[mainname] then self.Altlists[mainname] = nil end

      if not eventGenerated then
        altregistry:DeleteAlt(mainname, altname, "Prat")
      end

      return true
    end

    self:print(string.format(PL['no characters called "%s" found; nothing deleted'], clralt(suPLiedaltname)))
  end

  function module:listAll()
    if not self.db.realm.alts and self.Alts then
      self:print(PL["You have not yet linked any alts with their mains."], true)
      return false
    end

    local altcount = 0

    for altname, mainname in pairs(self.Alts) do
      altcount = altcount + 1
      self:print(string.format("alt: %s => main: %s", clralt(altname), clrmain(mainname)))
    end

    self:print(string.format(PL['%s total alts linked to mains'], altcount))
  end

  function module:findChars(q)
    local numfound

    local matchhighlight

    if not self.Alts then
      self:print(PL["You have not yet linked any alts with their mains."], true)
      return false
    else
      local matches = {}
      local numfound = 0

      for altname, mainname in pairs(self.Alts) do
        local a = string.lower(altname)
        local m = string.lower(mainname)
        local pat = string.lower(q)

        -- self:print(string.format("matching against: altname:'%s', mainname:'%s', pat:'%s'", a, m, pat))

        if (a == pat) or (m == pat) or (a:find(pat)) or (m:find(pat)) then
          matches[altname] = mainname
          numfound = numfound + 1
        end
      end

      if numfound == 0 then
        self:print(string.format(PL['no alts or mains found matching "%s"'], '|cffffb200' .. q .. '|r'), true)
      else
        for altname, mainname in pairs(matches) do
          self:print(string.format(PL["Found alt: %s => main: %s"], clralt(altname), clrmain(mainname)))
        end

        self:print(string.format(PL["searched for: %s - total matches: %s"], q, numfound))
      end

      return numfound
    end
  end


  function module:fixAlts()
    local fixedalts = {}

    for altname, mainname in pairs(self.db.realm.alts) do
      altname = self:formatCharName(altname)
      mainname = self:formatCharName(mainname)

      fixedalts[altname] = mainname
    end

    self.Alts = fixedalts
    self.db.realm.alts = fixedalts
  end


  function module:clearAllAlts()
    self.Alts = {}
    self.db.realm.alts = {}
    self.Altlists = {}
  end


  local CLR = Prat.CLR

  function module:setMainPos(pos)
    -- which item to go after, depending on our position
    local msgitems = {
      RIGHT = 'Pp',
      LEFT = 'Ff',
      START = nil,
    }

    pos = pos or 'RIGHT'

    Prat.RegisterMessageItem('ALTNAMES', msgitems[pos])

    if pos == 'RIGHT' then
      self.padfmt = ' ' .. CLR:Colorize("ffffff", "(") .. "%s" .. CLR:Colorize("ffffff", ")")
    else
      self.padfmt = CLR:Colorize("ffffff", "(") .. "%s" .. CLR:Colorize("ffffff", ")") .. ' '
    end

    self.db.profile.mainpos = pos
  end

  local function isAlt(name)
    local alt = module.Alts[name]
    if alt then return alt end

    if altregistry and altregistry:IsAlt(name) then
      return altregistry:GetMain(name)
    end

    return
  end

  local playernames
  function module:Prat_PreAddMessage(e, message, frame, event)
    local hexcolour = CLR.NONE

    local mainname = message.PLAYERLINK

    if self.db.profile.on and isAlt(mainname) then
      local pres = message.PRESENCE_ID or 0

      local altname = isAlt(mainname)
      local padfmt = self.padfmt or ' (%s)'


      if self.db.profile.colour then
        if self.db.profile.pncol ~= 'no' then
          local charname
          local coltype = self.db.profile.pncol

          if coltype == "alt" then
            charname = mainname
          elseif coltype == "main" then
            charname = altname
          else
            charname = nil
            self.db.profile.pncol = 'no'
          end

          playernames = playernames or Prat.Addon:GetModule("PlayerNames")
          if charname then
            local class, level, subgroup = playernames:GetData(charname)
            if class then
              hexcolour = playernames:GetClassColor(class)
            end
          end
        else
          hexcolour = CLR:GetHexColor(self.db.profile.colour)
        end

        hexcolour = hexcolour or CLR:GetHexColor(self.db.profile.colour)
      end

      self.ALTNAMES = string.format(padfmt, CLR:Colorize(hexcolour, altname:gsub(Prat.MULTIBYTE_FIRST_CHAR, string.upper, 1)))

      message.ALTNAMES = self.ALTNAMES
    end
  end

  function module:getColour(r, g, b, a)
    local col = self.db.profile.colour
    if not col then return false end
    return col.r, col.g, col.b, nil
  end

  function module:importFromLOK()
    if not LOKWhoIsWho_Config then
      self:print(PL['LOKWhoIsWho lua file not found, sorry.'])
      return false
    end

    local server = GetRealmName()
    local lokalts = LOKWhoIsWho_Config[server]['players']

    if lokalts == nil then
      self:print(PL["LOKWhoIsWho data not found"])
      return false
    end

    local numimported = 0

    for altname, mainname in pairs(lokalts) do
      self:addAlt(string.format("%s %s", altname, mainname))
      numimported = numimported + 1
    end

    self:print(string.format(PL["%s alts imported from LOKWhoIsWho"], numimported))
  end

  function module:importGGAlts()
    --[[
     imports guilds from a Guild Greet database, if present
   ]]
    if not GLDG_Data then
      self:print(PL['No Guild Greet database found'])
      return
    end

    local servername = GetRealmName()
    local mainname, altname

    for k, v in pairs(GLDG_Data) do
      if string.match(k, servername .. ' - %S+') then
        local name, player

        for name, player in pairs(v) do
          -- not sure whether this would be useful:
          -- if player['alt'] and player['alt'] ~= "" and not player['own'] then
          if player['alt'] and player['alt'] ~= "" then
            mainname = player['alt']
            altname = name

            self:addAlt(string.format('%s %s', altname, mainname))
          end
        end
      end
    end
  end

  function module:importGuildAlts(altrank, silently)
    if altrank == "" then altrank = nil end

    local totalmembers
    self.silent = silently

    totalmembers = GetNumGuildMembers(true)

    if totalmembers == 0 then
      self:print(PL['You are not in a guild'])
      return
    end


    -- build a list of guild members to check guild notes against later
    local guildMembers = {}

    for x = 1, totalmembers do
      local name, rank, rankIndex, level, class, zone, publicnote, officernote, online, status = GetGuildRosterInfo(x)
      if name then guildMembers[string.lower(name)] = name end
    end


    -- loop through members and check stuff for later
    local mainname
    local altname
    local numfound = 0

    for x = 1, totalmembers do
      altname = nil
      mainname = nil

      local name, rank, rankIndex, level, class, zone, publicnote, officernote, online, status = GetGuildRosterInfo(x)

      -- yeah I know the vars should be pre-lc'ed and it's not as efficient as it could be below
      -- ... feel free to clean it up

      -- untested (is there a more convenient trim function available?):
      --[[
     officernote = gsub("^%s*", "", officernote)
     publicnote = gsub("^%s*", "", publicnote)
     ]]

      officernote = officernote or ""
      publicnote = publicnote or ""
      rank = rank or ""
      officernote = (officernote):match(PL["(.-)'s? [Aa]lt"]) or officernote or ""
      publicnote = (publicnote):match(PL["(.-)'s? [Aa]lt"]) or publicnote or ""

      local cleanpubnote = publicnote:match(Prat.AnyNamePattern)
      local cleanoffnote = officernote:match(Prat.AnyNamePattern)

      -- check for guild members with rank "alt" or "alts" or "officer alt"
      if (rank:match(PL[".*[Aa]lts?$"]) or (altrank and rank == altrank)) and (cleanpubnote and
                                                                              guildMembers[cleanpubnote:lower()]) then
        -- self:print(string.format('found mainname name for member %s', name))
        mainname = cleanpubnote
        -- check whether guild note is an exact match of a member's name
      elseif cleanpubnote and guildMembers[cleanpubnote:lower()] then
        mainname = cleanpubnote
      elseif cleanoffnote and guildMembers[cleanoffnote:lower()] then
        mainname = cleanoffnote
      elseif officernote:find(PL["([^%s%p%d%c%z]+)'s alt"]) or publicnote:find(PL["([^%s%p%d%c%z]+)'s alt"]) then
        local TempName = officernote:match(PL["([^%s%p%d%c%z]+)'s alt"]) or publicnote:match(PL["([^%s%p%d%c%z]+)'s alt"])
        if TempName and guildMembers[string.lower(TempName)] then
          mainname = TempName
        end
      end

      -- set alt name if we've found their main name
      if mainname and mainname ~= "" then

        if mainname:lower() ~= name:lower() then
          numfound = numfound + 1
          altname = name
          self:addAlt(string.format('%s %s', altname, mainname))
        end
      end
    end

    self:print(string.format(PL["guild member alts found and imported: %s"], numfound))
    self.silent = nil
  end


  -- function for showing a list of alt names in the tooltip
  function module:getAlts(mainname)
    if self.db.profile.usealtlib then
      local alts = { altregistry:GetAlts(mainname) }
      if #alts > 0 then
        return alts
      end

      return false
    end

    -- self.Alts = self.db.profile.altnames

    -- check valid mainname is being passed and that we actually have a list of alts
    if not (mainname and self.Alts) then return false end

    -- format the character name
    mainname = self:formatCharName(mainname)

    -- check mainname wasn't just made of invalid characters
    if mainname == "" then return false end

    -- check we've not already built the list of alts for this character
    if self.Altlists[mainname] then return self.Altlists[mainname] end

    local alts = {}
    local allalts = self.Alts

    -- loop through list of alts and build alts table for given mainname
    for alt, tmpmainname in pairs(allalts) do
      if mainname == tmpmainname then
        alts[#alts+1] = alt
      end
    end

    -- check there we've actually found some alts
    if #alts == 0 then return false end

    -- cache this list of alts
    self.Altlists[mainname] = alts

    return alts
  end


  -- function for showing main names in the tooltip
  function module:getMain(altname)
    if self.db.profile.usealtlib then
      local main = altregistry:GetMain(altname)
      if main then
        return self:formatCharName(main)
      end

      return false
    end

    -- self.Alts = self.db.profile.altnames

    -- check for valid alt name being passed and that we actually have a list of alts
    if not altname and self.Alts then return false end

    -- format the character name
    altname = self:formatCharName(altname)

    -- check the alt name wasn't just made of invalid character
    if altname == "" then return false end

    -- check a main exists for the given alt name
    if not self.Alts[altname] then return false end

    return self.Alts[altname]
  end



  function module:nicejoin(t, glue, gluebeforelast)
    -- check we've got a table
    if type(t) ~= 'table' then return false end

    local list = {}
    local index = 1

    -- create a copy of the table with a numerical and no nested tables
    for i, v in pairs(t) do
      local vtype = type(v)
      local item = self:formatCharName(v)

      if vtype ~= 'string' then
        item = vtype
      end

      list[index] = item or vtype
      index = index + 1
    end

    -- make sure we have some items to join
    if #list == 0 then
      return ""
    end

    -- trying to join one item = that item
    if #list == 1 then
      return list[1]
    end

    -- defaults with which we will want wo woin no that's not going to work
    -- defaults
    glue = glue or ', '
    gluebeforelast = gluebeforelast or ', and '

    -- pop the last value off
    local last = table.remove(list) or "" -- shouldn't need the ' or ""'?

    -- standard way of joining a list of items together
    local str = table.concat(list, glue)

    -- return the previous list, but add the last value nicely
    return str .. gluebeforelast .. last
  end


  -- displays all alts for a given character as a list rather than seperate matches
  function module:listAlts(mainname)
    if not mainname then return false end

    mainname = self:formatCharName(mainname)

    if mainname == "" then return false end

    local alts

    alts = self:getAlts(mainname)

    if not alts or (#alts == 0) then
      self:print(PL['no alts found for character '] .. mainname)
      return
    else
      self:print(string.format(PL['%d alts found for %s: %s'], #alts, clrmain(mainname), clralt(self:nicejoin(alts))))
      return #alts
    end
  end


  -- hooked function to show mains and alts if set in preferences
  function module:OnTooltipSetUnit()
    --[[
   check:

    . the user wants information about alts or mains on the tooltip
    . there's a tooltip to alter
    .  we haven't already added anything to the tooltip

   ]]
    if self.altertooltip and GameTooltip and not self.showingtooltip then
      -- create lines table for extra information that might be added
      local lines = {}

      -- check who / what the tooltip's being displayed for
      local charname, unitid = GameTooltip:GetUnit()

      -- check to see if it's a character
      if UnitIsPlayer(unitid) then
        local mainname, alts, tooltipaltered

        -- check if the user wants the mainame name shown on alts' tooltips
        if self.db.profile.tooltip_showmain then
          local mainame = self:getMain(charname)

          if mainname then
            -- add the character's main name to the tooltip
            GameTooltip:AddDoubleLine(PL['Main:'] .. ' ', clrmain(mainname), 1, 0.9, 0, 0.5, 0.5, 1)
            tooltipaltered = true
          end
        end

        local width = GameTooltip:GetWidth()
        -- check if the user wants a list of alts shown on mains' tooltips
        if self.db.profile.tooltip_showalts then
          local alts = self:getAlts(charname) or self:getAlts(mainame)

          if alts then
            -- build the string listing alts
            --					local altstr = self:nicejoin(alts)

            -- add the list of alts to the tooltip
            GameTooltip:AddLine("|cffffc080" .. PL['Alts:'] .. "|r " .. clralt(self:nicejoin(alts)), 1, 0.5, 0.5, 1)
            tooltipaltered = true
          end
        end

        if tooltipaltered then
          GameTooltip:SetWidth(width)
          GameTooltip:Show()
        end

        -- make sure we don't add another tooltip
        self.showingtooltip = true
      end
    end
  end

  -- got to reset the flag so we know when to readd the lines
  function module:OnTooltipCleared()
    self.showingtooltip = false
  end


  return
end) -- Prat:AddModuleToLoad
