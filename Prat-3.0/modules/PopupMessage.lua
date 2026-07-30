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


Prat:AddModuleToLoad(function() 

local PRAT_MODULE = Prat:RequestModuleName("PopupMessage")

if PRAT_MODULE == nil then 
    return 
end

-- create prat module
local module = Prat:NewModule(PRAT_MODULE, "LibSink-2.0")

local PL = module.PL

--[===[@debug@
PL:AddLocale(PRAT_MODULE, "enUS", {
    ["PopupMessage"] = true,
    ["Shows messages with your name in a popup."] = true,
    ["Set Separately"] = true,
    ["Toggle setting options separately for each chat window."] = true,
    ["show_name"] = "Show Popups",
    ["show_desc"] = "Show Popups for each window.",
    ["Show Popups"] = true,
    ["Show Popups for each window."] = true,
    ["show_perframename"] = "Show ChatFrame%d Popups",
    ["show_perframedesc"] = "Toggles showing popups on and off.",
    ["showall_name"] = "Show All Popups",
    ["showall_desc"] = "Show Popups for all chat windows.",
    ["Show All Popups"] = true,
    ["Show Popups for all chat windows."] = true,
    ["Add Nickname"] = true,
    ["Adds an alternate name to show in popups."] = true,
    ["Remove Nickname"] = true,
    ["Removes an alternate name to show in popups."] = true,
    ["Clear Nickname"] = true,
    ["Clears alternate name to show in popups."] = true,
    ["framealpha_name"] = "Popup Frame Alpha",
    ["framealpha_desc"] = "Set the alpha value of the popup frame when fully faded in.",
    ["Popup"] = true, 
    ["Shows messages in a popup window."] = true,
-- 	["Use SCT Message"] = true,
--	["Show the text as an SCT message instead of in its own frame"] = true,
})
--@end-debug@]===]

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L

L=
{
	["PopupMessage"] = {
		["Add Nickname"] = true,
		["Adds an alternate name to show in popups."] = true,
		["Clear Nickname"] = true,
		["Clears alternate name to show in popups."] = true,
		["framealpha_desc"] = "Set the alpha value of the popup frame when fully faded in.",
		["framealpha_name"] = "Popup Frame Alpha",
		["Popup"] = true,
		["PopupMessage"] = true,
		["Remove Nickname"] = true,
		["Removes an alternate name to show in popups."] = true,
		["Set Separately"] = true,
		["Show All Popups"] = true,
		["Show Popups"] = true,
		["Show Popups for all chat windows."] = true,
		["Show Popups for each window."] = true,
		["show_desc"] = "Show Popups for each window.",
		["show_name"] = "Show Popups",
		["show_perframedesc"] = "Toggles showing popups on and off.",
		["show_perframename"] = "Show ChatFrame%d Popups",
		["showall_desc"] = "Show Popups for all chat windows.",
		["showall_name"] = "Show All Popups",
		["Shows messages in a popup window."] = true,
		["Shows messages with your name in a popup."] = true,
		["Toggle setting options separately for each chat window."] = true,
	}
}
PL:AddLocale(PRAT_MODULE, "enUS", L)


L=
{
	["PopupMessage"] = {
		--[[Translation missing --]]
		--[[ ["Add Nickname"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Adds an alternate name to show in popups."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Clear Nickname"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Clears alternate name to show in popups."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["framealpha_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["framealpha_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Popup"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["PopupMessage"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Remove Nickname"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Removes an alternate name to show in popups."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Set Separately"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show All Popups"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Popups"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Popups for all chat windows."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Popups for each window."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_perframedesc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_perframename"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showall_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showall_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Shows messages in a popup window."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Shows messages with your name in a popup."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle setting options separately for each chat window."] = "",--]] 
	}
}
PL:AddLocale(PRAT_MODULE, "itIT", L)


L=
{
	["PopupMessage"] = {
		--[[Translation missing --]]
		--[[ ["Add Nickname"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Adds an alternate name to show in popups."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Clear Nickname"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Clears alternate name to show in popups."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["framealpha_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["framealpha_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Popup"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["PopupMessage"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Remove Nickname"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Removes an alternate name to show in popups."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Set Separately"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show All Popups"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Popups"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Popups for all chat windows."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Popups for each window."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_perframedesc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_perframename"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showall_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showall_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Shows messages in a popup window."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Shows messages with your name in a popup."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle setting options separately for each chat window."] = "",--]] 
	}
}
PL:AddLocale(PRAT_MODULE, "ptBR", L)

L=
{
	["PopupMessage"] = {
		["Add Nickname"] = "Ajouter un surnom",
		--[[Translation missing --]]
		--[[ ["Adds an alternate name to show in popups."] = "",--]] 
		["Clear Nickname"] = "Efface le surnom",
		--[[Translation missing --]]
		--[[ ["Clears alternate name to show in popups."] = "",--]] 
		["framealpha_desc"] = "RÃ©gler la transparence de la popup lorsqu'elle disparait.",
		["framealpha_name"] = "Transparence des popups",
		["Popup"] = true,
		["PopupMessage"] = "Message popup",
		["Remove Nickname"] = "Retirer un surnom",
		--[[Translation missing --]]
		--[[ ["Removes an alternate name to show in popups."] = "",--]] 
		["Set Separately"] = "Afficher sÃ©parÃ©ment",
		["Show All Popups"] = "Afficher toutes les popups",
		["Show Popups"] = "Afficher les popups",
		["Show Popups for all chat windows."] = "Afficher les popups pour toutes les fenÃªtres de discussion.",
		["Show Popups for each window."] = "Afficher les popups pour chaque fenÃªtre.",
		["show_desc"] = "Afficher les popups pour chaque fenÃªtre.",
		["show_name"] = "Afficher les popups",
		["show_perframedesc"] = "Active ou dÃ©sactive l'affichage des popups.",
		["show_perframename"] = "Afficher les popups de la fenÃªtre de discussion %d",
		["showall_desc"] = "Afficher les popups pour toutes les fenÃªtres de discussion.",
		["showall_name"] = "Afficher toutes les popups",
		["Shows messages in a popup window."] = "Afficher les messages dans une fenÃªtre popup.",
		["Shows messages with your name in a popup."] = "Afficher les messages avec votre nom dans une popup.",
		["Toggle setting options separately for each chat window."] = "Activer des prÃ©fÃ©rences diffÃ©rentes pour chaque fenÃªtre de discussion.",
	}
}
PL:AddLocale(PRAT_MODULE, "frFR",L)



L=
{
	["PopupMessage"] = {
		["Add Nickname"] = "Spitzname hinzufÃ¼gen",
		["Adds an alternate name to show in popups."] = "Einen anderen (alternierenden) Namen hinzufÃ¼gen, der in Popups angezeigt werden soll.",
		["Clear Nickname"] = "Spitznamen lÃ¶schen",
		["Clears alternate name to show in popups."] = "Einen anderen (alternierenden) Namen lÃ¶schen, der in Popups angezeigt werden soll.",
		["framealpha_desc"] = "Den Transparenzwert des Popup-Rahmens bei voller Darstellung einstellen.",
		["framealpha_name"] = "Transparenz der Popup-Rahmens",
		["Popup"] = true,
		["PopupMessage"] = true,
		["Remove Nickname"] = "Spitznamen entfernen",
		["Removes an alternate name to show in popups."] = "Einen anderen (alternierenden) Namen entfernen, der in Popups angezeigt werden soll.",
		["Set Separately"] = "Einzeln einstellen",
		["Show All Popups"] = "Alle Popups anzeigen",
		["Show Popups"] = "Popups anzeigen",
		["Show Popups for all chat windows."] = "Popups fÃ¼r alle Chatfenster anzeigen.",
		["Show Popups for each window."] = "Popups fÃ¼r jedes Fenster anzeigen.",
		["show_desc"] = "Popups fÃ¼r jedes Fenster anzeigen.",
		["show_name"] = "Popups anzeigen",
		["show_perframedesc"] = "Anzeige der Popups ein- und ausschalten.",
		["show_perframename"] = "Popups vom Chatfenster%d anzeigen",
		["showall_desc"] = "Popups fÃ¼r alle Chatfenster anzeigen.",
		["showall_name"] = "Alle Popups anzeigen",
		["Shows messages in a popup window."] = "Mitteilungen in einem Popup-Fenster anzeigen.",
		["Shows messages with your name in a popup."] = "Mitteilungen in einem Popup-Fenster mit deinem Namen anzeigen.",
		["Toggle setting options separately for each chat window."] = "Optionseinstellungen einzeln fÃ¼r jedes Chatfenster umschalten.",
	}
}
PL:AddLocale(PRAT_MODULE, "deDE", L)

L=
{
	["PopupMessage"] = {
		["Add Nickname"] = "ë³„ëª… ì¶”ê°€",
		["Adds an alternate name to show in popups."] = "íŒì—…ì— í‘œì‹œí•  ë³„ëª…ì„ ì¶”ê°€í•©ë‹ˆë‹¤.",
		["Clear Nickname"] = "ë³„ëª… ì „ì²´ ì‚­ì œ",
		["Clears alternate name to show in popups."] = "íŒì—…ì— í‘œì‹œí•  ë³„ëª…ì„ ì „ì²´ ì‚­ì œí•©ë‹ˆë‹¤.",
		["framealpha_desc"] = "ê°€ìž¥ ë°ì•„ì¡Œì„ ë•Œ íŒì—… ì°½ì˜ íˆ¬ëª…ë„ë¥¼ ì„¤ì •í•©ë‹ˆë‹¤.",
		["framealpha_name"] = "íŒì—… ì°½ íˆ¬ëª…ë„",
		["Popup"] = "íŒì—…",
		["PopupMessage"] = "íŒì—… ë©”ì‹œì§€",
		["Remove Nickname"] = "ë³„ëª… ì œê±°",
		["Removes an alternate name to show in popups."] = "íŒì—…ì— í‘œì‹œí•  ë³„ëª…ì„ ì œê±°í•©ë‹ˆë‹¤.",
		["Set Separately"] = "ê°œë³„ ì„¤ì •",
		["Show All Popups"] = "ëª¨ë“  íŒì—… í‘œì‹œ",
		["Show Popups"] = "íŒì—… í‘œì‹œ",
		["Show Popups for all chat windows."] = "ëª¨ë“  ëŒ€í™”ì°½ì— íŒì—…ì„ í‘œì‹œí•©ë‹ˆë‹¤.",
		["Show Popups for each window."] = "ê° ëŒ€í™”ì°½ ë³„ë¡œ íŒì—…ì„ í‘œì‹œí•©ë‹ˆë‹¤.",
		["show_desc"] = "ê° ì°½ ë³„ë¡œ íŒì—…ì„ í‘œì‹œí•©ë‹ˆë‹¤.",
		["show_name"] = "íŒì—… í‘œì‹œ",
		["show_perframedesc"] = "íŒì—… í‘œì‹œ ì—¬ë¶€ë¥¼ í† ê¸€í•©ë‹ˆë‹¤.",
		["show_perframename"] = "%dë²ˆ ëŒ€í™”ì°½ íŒì—… í‘œì‹œ",
		["showall_desc"] = "ëª¨ë“  ëŒ€í™”ì°½ì— íŒì—…ì„ í‘œì‹œí•©ë‹ˆë‹¤.",
		["showall_name"] = "ëª¨ë“  íŒì—… í‘œì‹œ",
		["Shows messages in a popup window."] = "íŒì—…ì°½ ì•ˆì— ë©”ì‹œì§€ë¥¼ í‘œì‹œí•©ë‹ˆë‹¤.",
		["Shows messages with your name in a popup."] = "íŒì—… ì°½ì— ë‹¹ì‹ ì˜ ì´ë¦„ê³¼ ë©”ì‹œì§€ë¥¼ ê°™ì´ í‘œì‹œí•©ë‹ˆë‹¤.",
		["Toggle setting options separately for each chat window."] = "ê° ëŒ€í™”ì°½ ë³„ë¡œ ì„¤ì • ì˜µì…˜ì„ ë„ê±°ë‚˜ ì¼­ë‹ˆë‹¤.",
	}
}
PL:AddLocale(PRAT_MODULE, "koKR",L)
L=
{
	["PopupMessage"] = {
		--[[Translation missing --]]
		--[[ ["Add Nickname"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Adds an alternate name to show in popups."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Clear Nickname"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Clears alternate name to show in popups."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["framealpha_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["framealpha_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Popup"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["PopupMessage"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Remove Nickname"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Removes an alternate name to show in popups."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Set Separately"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show All Popups"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Popups"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Popups for all chat windows."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Popups for each window."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_perframedesc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["show_perframename"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showall_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showall_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Shows messages in a popup window."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Shows messages with your name in a popup."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle setting options separately for each chat window."] = "",--]] 
	}
}
PL:AddLocale(PRAT_MODULE, "esMX",L)
L=
{
	["PopupMessage"] = {
		["Add Nickname"] = "Ð”Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ Ð½Ð¸Ðº",
		["Adds an alternate name to show in popups."] = "Ð”Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ Ð°Ð»ÑŒÑ‚ÐµÑ€Ð½Ð°Ñ‚Ð¸Ð²Ð½Ð¾Ðµ Ð¸Ð¼Ñ Ð´Ð»Ñ Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ Ð¿Ñ€Ð¸ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°Ð½Ð¸Ð¸.",
		["Clear Nickname"] = "ÐžÑ‡Ð¸ÑÑ‚Ð¸Ñ‚ÑŒ Ð½Ð¸ÐºÐ¸",
		["Clears alternate name to show in popups."] = "ÐžÑ‡Ð¸ÑÑ‚Ð¸Ñ‚ÑŒ Ð°Ð»ÑŒÑ‚ÐµÑ€Ð½Ð°Ñ‚Ð¸Ð²Ð½Ñ‹Ðµ Ð¸Ð¼ÐµÐ½Ð° Ð´Ð»Ñ Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ Ð¿Ñ€Ð¸ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°Ð½Ð¸Ð¸.",
		["framealpha_desc"] = "Ð£ÑÑ‚Ð°Ð½Ð¾Ð²ÐºÐ° Ð¿Ñ€Ð¾Ð·Ñ€Ð°Ñ‡Ð½Ð¾ÑÑ‚Ð¸ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°ÑŽÑ‰ÐµÐ³Ð¾ Ð¾ÐºÐ½Ð° Ð¿Ñ€Ð¸ Ð¿Ð¾Ð»Ð½Ð¾Ð¼ Ð·Ð°Ñ‚ÑƒÑ…Ð°Ð½Ð¸Ð¸.",
		["framealpha_name"] = "ÐŸÑ€Ð¾Ð·Ñ€Ð°Ñ‡Ð½Ð¾ÑÑ‚ÑŒ Ð¾ÐºÐ½Ð° Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°Ð½Ð¸Ñ",
		["Popup"] = "Ð’ÑÐ¿Ð»Ñ‹Ð²Ð°ÑŽÑ‰Ð¸Ð¹",
		["PopupMessage"] = "Ð’ÑÐ¿Ð»Ñ‹Ð²Ð°ÑŽÑ‰ÐµÐµ Ð¾ÐºÐ½Ð¾",
		["Remove Nickname"] = "Ð£Ð´Ð°Ð»Ð¸Ñ‚ÑŒ Ð½Ð¸Ðº",
		["Removes an alternate name to show in popups."] = "Ð£Ð´Ð°Ð»Ð¸Ñ‚ÑŒ Ð°Ð»ÑŒÑ‚ÐµÑ€Ð½Ð°Ñ‚Ð¸Ð²Ð½Ð¾Ðµ Ð¸Ð¼Ñ Ð´Ð»Ñ Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ Ð¿Ñ€Ð¸ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°Ð½Ð¸Ð¸.",
		["Set Separately"] = "Ð Ð°Ð·Ð´ÐµÐ»ÐµÐ½Ð¸Ðµ",
		["Show All Popups"] = "Ð’ÑÐµ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°ÑŽÑ‰Ð¸Ðµ",
		["Show Popups"] = "ÐŸÐ¾ÐºÐ°Ð·Ñ‹Ð²Ð°Ñ‚ÑŒ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°Ð½Ð¸Ñ",
		["Show Popups for all chat windows."] = "ÐŸÐ¾ÐºÐ°Ð·Ñ‹Ð²Ð°Ñ‚ÑŒ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°ÑŽÑ‰Ð¸Ðµ Ð¾ÐºÐ½Ð° Ð´Ð»Ñ Ð²ÑÐµÐ³Ð¾ Ñ‡Ð°Ñ‚Ð°.",
		["Show Popups for each window."] = "ÐŸÐ¾ÐºÐ°Ð·Ñ‹Ð²Ð°Ñ‚ÑŒ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°Ð½Ð¸Ñ Ð´Ð»Ñ Ð²ÑÐµÑ… Ð¾ÐºÐ¾Ð½.",
		["show_desc"] = "ÐžÑ‚Ð¾Ð±Ñ€Ð°Ð¶Ð°Ñ‚ÑŒ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð½Ð¸Ðµ Ð´Ð»Ñ Ð²ÑÐµÑ… Ð¾ÐºÐ¾Ð½ Ñ‡Ð°Ñ‚Ð°.",
		["show_name"] = "ÐŸÐ¾ÐºÐ°Ð·Ñ‹Ð²Ð°Ñ‚ÑŒ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°Ð½Ð¸Ðµ",
		["show_perframedesc"] = "Ð’ÐºÐ»/Ð’Ñ‹ÐºÐ» Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ðµ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°Ð½Ð¸Ñ.",
		["show_perframename"] = "ÐŸÐ¾ÐºÐ°Ð·Ð°Ñ‚ÑŒ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°Ð½Ð¸Ðµ Ð¾ÐºÐ½Ð° %d",
		["showall_desc"] = "ÐŸÐ¾ÐºÐ°Ð·Ñ‹Ð²Ð°Ñ‚ÑŒ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°ÑŽÑ‰Ð¸Ðµ Ð¾ÐºÐ½Ð° Ð´Ð»Ñ Ð²ÑÐµÐ³Ð¾ Ñ‡Ð°Ñ‚Ð°.",
		["showall_name"] = "Ð’ÑÐµ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°ÑŽÑ‰Ð¸Ðµ",
		["Shows messages in a popup window."] = "ÐŸÐ¾ÐºÐ°Ð·Ñ‹Ð²Ð°Ñ‚ÑŒ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ðµ Ð²Ð¾ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°ÑŽÑ‰ÐµÐ¼ Ð¾ÐºÐ½Ðµ.",
		["Shows messages with your name in a popup."] = "ÐŸÐ¾ÐºÐ°Ð·Ñ‹Ð²Ð°Ñ‚ÑŒ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ðµ Ñ Ð²Ð°ÑˆÐ¸Ð¼ Ð¸Ð¼ÐµÐ½ÐµÐ¼ Ð²Ð¾ Ð²ÑÐ¿Ð»Ñ‹Ð²Ð°ÑŽÑ‰ÐµÐ¼ Ð¾ÐºÐ½Ðµ.",
		["Toggle setting options separately for each chat window."] = "Ð’ÐºÐ»/Ð’Ñ‹ÐºÐ» Ð½Ð°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸ Ñ€Ð°Ð·Ð´ÐµÐ»ÐµÐ½Ð¸Ñ Ð´Ð»Ñ Ð²ÑÐµÑ… Ð¾ÐºÐ¾Ð½ Ñ‡Ð°Ñ‚Ð°.",
	}
}
PL:AddLocale(PRAT_MODULE, "ruRU",L)
L=
{
	["PopupMessage"] = {
		["Add Nickname"] = "æ·»åŠ æ˜µç§°",
		["Adds an alternate name to show in popups."] = "æ·»åŠ ä¸€ä¸ªæ˜¾ç¤ºåœ¨å¼¹å‡ºä¸­çš„æ›¿æ¢å",
		["Clear Nickname"] = "æ¸…é™¤æ˜µç§°",
		["Clears alternate name to show in popups."] = "å¼¹å‡ºæ˜¾ç¤ºæ¸…é™¤å€™è¡¥åç§°",
		["framealpha_desc"] = "è®¾ç½®å®Œå…¨æ¶ˆå¤±æ—¶å¼¹å‡ºæ¡†ä½“é€æ˜Žåº¦å€¼",
		["framealpha_name"] = "å¼¹å‡ºæ¡†ä½“é€æ˜Žåº¦",
		["Popup"] = "å¼¹å‡º",
		["PopupMessage"] = "å¼¹å‡ºä¿¡æ¯",
		["Remove Nickname"] = "ç§»é™¤æ˜µç§°",
		["Removes an alternate name to show in popups."] = "ç§»é™¤åœ¨å¼¹å‡ºé‡Œæ˜¾ç¤ºçš„å€™è¡¥åç§°",
		["Set Separately"] = "ä¸ªåˆ«è®¾ç½®",
		["Show All Popups"] = "æ˜¾ç¤ºæ‰€æœ‰å¼¹å‡º",
		["Show Popups"] = "æ˜¾ç¤ºå¼¹å‡º",
		["Show Popups for all chat windows."] = "ä¸ºæ‰€æœ‰èŠå¤©çª—åŽæ˜¾ç¤ºå¼¹å‡º",
		["Show Popups for each window."] = "ä¸ºæ¯ä¸ªçª—å£æ˜¾ç¤ºå¼¹å‡º",
		["show_desc"] = "åœ¨æ¯ä¸ªçª—å£æ˜¾ç¤ºå¼¹å‡º",
		["show_name"] = "æ˜¾ç¤ºå¼¹å‡º",
		["show_perframedesc"] = "å¼¹å‡ºå¼€å…³",
		["show_perframename"] = "æ˜¾ç¤ºèŠå¤©æ¡†ä½“%då¼¹å‡º",
		["showall_desc"] = "åœ¨æ‰€æœ‰èŠå¤©çª—å£æ˜¾ç¤ºå¼¹å‡º",
		["showall_name"] = "æ˜¾ç¤ºæ‰€æœ‰å¼¹å‡º",
		["Shows messages in a popup window."] = "åœ¨å¼¹å‡ºçª—å£æ˜¾ç¤ºä¿¡æ¯",
		["Shows messages with your name in a popup."] = "åœ¨å¼¹å‡ºä¸­æ˜¾ç¤ºå«æœ‰ä½ åå­—çš„ä¿¡æ¯",
		["Toggle setting options separately for each chat window."] = "åˆ†åˆ«ä¸ºæ¯ä¸ªèŠå¤©çª—å£è®¾ç½®é€‰é¡¹",
	}
}
PL:AddLocale(PRAT_MODULE, "zhCN",L)
L=
{
	["PopupMessage"] = {
		["Add Nickname"] = "AÃ±adir un Apodo",
		["Adds an alternate name to show in popups."] = "AÃ±ade un nombre alternativo para mostrar en las ventanas emergentes.",
		["Clear Nickname"] = "Limpiar Apodo",
		["Clears alternate name to show in popups."] = "Limpia el nombre alternativo a mostrar en las ventanas emergentes.",
		["framealpha_desc"] = "Establece el valor de transparencia del marco emergente al desaparecer completamente.",
		["framealpha_name"] = "Transparencia Marco Emergente",
		["Popup"] = "Emergente",
		["PopupMessage"] = "Mensaje Emergente",
		["Remove Nickname"] = "Eliminar Apodo",
		["Removes an alternate name to show in popups."] = "Quita un nombre alternativo para mostrar en las ventanas emergentes.",
		["Set Separately"] = "Establecer por Separado",
		["Show All Popups"] = "Mostrar Todas las Emergentes",
		["Show Popups"] = "Mostrar Emergentes",
		["Show Popups for all chat windows."] = "Mostrar Emergentes para todas las ventanas de chat.",
		["Show Popups for each window."] = "Mostrar Emergentes para cada ventana.",
		["show_desc"] = "Muestra Emergentes para cada ventana.",
		["show_name"] = "Mostar Emergentes",
		["show_perframedesc"] = "Alterna activaciÃ³n de mostrar ventanas emergentes.",
		["show_perframename"] = "Mostrar Marcos Emergentes de Chat %d",
		["showall_desc"] = "Mostrar Ventanas Emergentes para todas las ventanas de chat.",
		["showall_name"] = "Mostrar Todas las Emergentes",
		["Shows messages in a popup window."] = "Muestra mensajes en una ventana emergente.",
		["Shows messages with your name in a popup."] = "Muestra mensajes con tu nombre en una ventana emergente.",
		["Toggle setting options separately for each chat window."] = "Cambiar opciones de configuraciÃ³n por separado para cada ventana de chat.",
	}
}
PL:AddLocale(PRAT_MODULE, "esES",L)
L=
{
	["PopupMessage"] = {
		["Add Nickname"] = "æ–°å¢žæš±ç¨±",
		--[[Translation missing --]]
		--[[ ["Adds an alternate name to show in popups."] = "",--]] 
		["Clear Nickname"] = "æ¸…é™¤æš±ç¨±",
		--[[Translation missing --]]
		--[[ ["Clears alternate name to show in popups."] = "",--]] 
		["framealpha_desc"] = "è¨­å®šå½ˆå‡ºè¦–çª—å®Œå…¨æ·¡å…¥æ™‚çš„é€æ˜Žåº¦å€¼",
		["framealpha_name"] = "å½ˆå‡ºè¦–çª—é€æ˜Žåº¦",
		["Popup"] = "å½ˆå‡º",
		["PopupMessage"] = "å½ˆå‡ºè¨Šæ¯",
		["Remove Nickname"] = "ç§»é™¤æš±ç¨±",
		--[[Translation missing --]]
		--[[ ["Removes an alternate name to show in popups."] = "",--]] 
		["Set Separately"] = "å–®ç¨è¨­å®š",
		["Show All Popups"] = "é¡¯ç¤ºæ‰€æœ‰å½ˆå‡ºè¦–çª—",
		["Show Popups"] = "é¡¯ç¤ºå½ˆå‡ºè¦–çª—",
		["Show Popups for all chat windows."] = "é¡¯ç¤ºå½ˆå‡ºå…¨éƒ¨èŠå¤©è¦–çª—ã€‚",
		["Show Popups for each window."] = "é¡¯ç¤ºå½ˆå‡ºæ¯å€‹è¦–çª—ã€‚",
		["show_desc"] = "é¡¯ç¤ºå½ˆå‡ºæ¯å€‹è¦–çª—ã€‚",
		["show_name"] = "é¡¯ç¤ºå½ˆå‡º",
		["show_perframedesc"] = "æ›é¡¯ç¤ºå½ˆå‡ºé–‹å‹•å’Œé—œé–‰ã€‚",
		["show_perframename"] = "é¡¯ç¤º ChatFrame%d å½ˆå‡º",
		["showall_desc"] = "é¡¯ç¤ºå½ˆå‡ºå…¨éƒ¨èŠå¤©è¦–çª—ã€‚",
		["showall_name"] = "é¡¯ç¤ºå…¨éƒ¨å½ˆå‡º",
		["Shows messages in a popup window."] = "é¡¯ç¤ºåœ¨å½ˆå‡ºè¦–çª—è¨Šæ¯ã€‚",
		--[[Translation missing --]]
		--[[ ["Shows messages with your name in a popup."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle setting options separately for each chat window."] = "",--]] 
	}
}
PL:AddLocale(PRAT_MODULE, "zhTW",L)
end
--@end-non-debug@



--

--

--
----[[
--	Chinese Local : CWDG Translation Team æ˜ç¡å¢¨é±¼ (Thomas Mo)
--	CWDG site: http://Cwowaddon.com
--	$Rev: 80460 $
--]]
--

--

--

--


local EVENTS_EMOTES = {
  ["CHAT_MSG_BG_SYSTEM_ALLIANCE"] = true,
  ["CHAT_MSG_BG_SYSTEM_HORDE"] = true,
  ["CHAT_MSG_BG_SYSTEM_NEUTRAL"] = true,
  ["CHAT_MSG_EMOTE"] = true,
  ["CHAT_MSG_TEXT_EMOTE"] = true,
  ["CHAT_MSG_MONSTER_EMOTE"] = true,
  ["CHAT_MSG_MONSTER_SAY"] = true,
  ["CHAT_MSG_MONSTER_WHISPER"] = true,
  ["CHAT_MSG_MONSTER_YELL"] = true,
  ["CHAT_MSG_RAID_BOSS_EMOTE"] = true
};

local EVENTS_IGNORE = {
 ["CHAT_MSG_CHANNEL_NOTICE_USER"] = true,
 ["CHAT_MSG_SYSTEM"] = true,
}



Prat:SetModuleDefaults(module.name, {
	profile = {
	    on = false,
	    separate = true,
	    show = { ChatFrame1 = true },
	    framealpha = 1.0,
	    nickname = {},
		sinkoptions = { ["sink20OutputSink"] = "Popup" },
	}
} )

local pluginOptions =  { sink = {} }

Prat:SetModuleOptions(module, {
    name = PL["PopupMessage"],
    desc = PL["Shows messages with your name in a popup."],
    type = "group",
	plugins = pluginOptions,
    args = {
		helpheader = {
			name = "Settings",
			type = "header",
			order = 105,
		},
        show = {
            name = PL["Show Popups"],
            desc = PL["Show Popups for each window."],
	        type = "multiselect",
            order = 110,
			values = Prat.HookedFrameList,
			get = "GetSubValue",
			set = "SetSubValue"
        },
        addnick = {
            name = PL["Add Nickname"],
            desc = PL["Adds an alternate name to show in popups."],
            type = "input",
            order = 140,
            usage = "<string>",
            get = false,
			set = function(info, name) info.handler:AddNickname(name) end
        },
        removenick = {
            name = PL["Remove Nickname"],
            desc = PL["Removes an alternate name to show in popups."],
            type = "select",
            order = 150,
			get = function(info) return "" end,
			values = function(info) return info.handler.db.profile.nickname end,
            disabled = function(info) return #info.handler.db.profile.nickname == 0 end,
			set = function(info, value) info.handler:RemoveNickname(value) end
        },
        clearnick = {
            name = PL["Clear Nickname"],
            desc = PL["Clears alternate name to show in popups."],
			type = "execute",
            order = 160,
            disabled = function(info) return (#info.handler.db.profile.nickname == 0) end,
			func = "ClearNickname",
        },
    },
})

--[[------------------------------------------------
    Module Event Functions
------------------------------------------------]]--
Prat:SetModuleInit(module, 
	function(self)
    	self:RegisterSink(
    	    PL["Popup"], 
    	    PL["PopupMessage"], 
    	    PL["Shows messages in a popup window."],
    	    "Popup"
    	)		
		self:SetSinkStorage(self.db.profile.sinkoptions)
		
		pluginOptions.sink["output"] = self:GetSinkAce3OptionsDataTable()
		pluginOptions.sink["output"].inline = true
		
		self.db.profile.show = self.db.profile.show or {}
	end
)

function module:OnModuleEnable()
	Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE)      	    

    self.nickpat = {}
	for _, v in ipairs(self.db.profile.nickname) do
        self.nickpat[v] = Prat.GetNamePattern(v)
	end

    self.playerName = Prat.GetNamePattern(UnitName("player"))
end

--[[------------------------------------------------
	Core Functions
------------------------------------------------]]--
function module:GetDescription()
	return PL["Shows messages with your name in a popup."]
end
-- /dump module.moduleOptions.args.output.get():find("Default")
-- /script module.moduleOptions.args.output.set("PopupMessage")
-- /dump module.db.profile
-- /script module.db.profile.sink10OutputSink = nil
function module:Popup(source, text, r,g,b, ...)   
	if Prat_PopupFrame.anim then
		Prat_PopupFrame.anim:Stop()
	else
		Prat_PopupFrame.anim = Prat_PopupFrame:CreateAnimationGroup()
		Prat_PopupFrame.anim:SetScript("OnFinished", function() Prat_PopupFrameText:Hide() end)

		local fade1 = Prat_PopupFrame.anim:CreateAnimation("Alpha")
		fade1:SetDuration(1)
		fade1:SetToAlpha(module.db.profile.framealpha or 1)
		fade1:SetEndDelay(4)
		fade1:SetOrder(1)

		local fade2 = Prat_PopupFrame.anim:CreateAnimation("Alpha")
		fade2:SetDuration(5)
		fade2:SetToAlpha(0)
		fade2:SetOrder(2)
	end

	Prat_PopupFrameText:SetTextColor(r,g,b)
	Prat_PopupFrameText:SetText(text)

	local font, _, style = ChatFrame1:GetFont()
	local _, fontsize = GameFontNormal:GetFont()
	Prat_PopupFrameText:SetFont( font, fontsize, style )
	Prat_PopupFrameText:SetNonSpaceWrap(false)
	Prat_PopupFrame:SetWidth(math.min(math.max(64, Prat_PopupFrameText:GetStringWidth()+20), 520))
	Prat_PopupFrame:SetHeight(64)
	Prat_PopupFrame:SetBackdropBorderColor(r,g,b)

	Prat_PopupFrameText:ClearAllPoints()
	Prat_PopupFrameText:SetPoint("TOPLEFT", Prat_PopupFrame, "TOPLEFT", 10, 10)
	Prat_PopupFrameText:SetPoint("BOTTOMRIGHT", Prat_PopupFrame, "BOTTOMRIGHT", -10, -10)
	Prat_PopupFrameText:Show()

	Prat_PopupFrame:SetAlpha(0)
	Prat_PopupFrame:Show()
	Prat_PopupFrame.anim:Play()
end

local DEBUG 
--[===[@debug@ 
DEBUG = true
--@end-debug@]===]

function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
    if self.pouring then return end
    if Prat.EVENT_ID and 
       Prat.EVENT_ID == self.lastevent and 
       self.lasteventtype == event then 
       return 
    end
    
	if not (EVENTS_EMOTES[event] or EVENTS_IGNORE[event]) then
		if self.db.profile.showall or self.db.profile.show[frame:GetName()] then
			if DEBUG or not (message.ORG.PLAYER and self.playerName and message.ORG.PLAYER:match(self.playerName)) then
				self:CheckText(message.ORG.MESSAGE, message.OUTPUT, event, r, g, b)
			end
		end
	end
end

function module:AddNickname(name)
	for _, v in ipairs(self.db.profile.nickname) do
		if v:lower() == name:lower() then
			return
		end
	end
	tinsert(self.db.profile.nickname, name)

    self.nickpat[name] = Prat.GetNamePattern(name)
end

function module:RemoveNickname(idx)
    self.nickpat[self.db.profile.nickname[idx]] = nil
	tremove(self.db.profile.nickname, idx)
end

function module:ClearNickname()
    local n = self.db.profile.nickname
	while #n > 0 do
        self.nickpat[n[#n]] = nil
        n[#n] = nil
--		tremove(self.db.profile.nickname)
	end
end

local tmp_color = {}
local function safestr(s) return s or "" end
function module:CheckText(text, display_text, event, r, g, b)
--	local textL = safestr(text):lower()

    local show = false
    
    if text:match(self.playerName) then	
        show = true;
    else
    	for i, v in pairs(self.nickpat) do
            if v:len() > 0 and text:match(v) then
                show = true
            end
    	end
	end
	
	if show then 
        self.lasteventtype = event
        self.lastevent = Prat.EVENT_ID
        self.pouring = true
		self:Pour(display_text or text, r,g,b)
		Prat:PlaySound(856);
        self.pouring = nil
	end	
end




  return
end ) -- Prat:AddModuleToLoad
