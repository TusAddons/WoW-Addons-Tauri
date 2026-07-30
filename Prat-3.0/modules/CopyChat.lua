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


local PRAT_MODULE = Prat:RequestModuleName("CopyChat")

if PRAT_MODULE == nil then 
    return 
end

local MAX_SCRAPE_TIME = 5 -- seconds

local module = Prat:NewModule(PRAT_MODULE, "AceHook-3.0", "AceTimer-3.0")

local PL = module.PL

--[===[@debug@
PL:AddLocale(PRAT_MODULE, "enUS", {
    ["CopyChat"] = true,
    ["Copy text from the active chat window."] = true,
    ["Copy Text"] = true,
    ["Copy To Editbox"] = true,
    ["Copy all of the text in the selected chat frame into an edit box"] = true,
    ["showbutton_name"] = "Copy Button",
    ["showbutton_desc"] = "Show a button on the chatframe",
    buttonpos_name = "Button Location",
    buttonpos_desc = "Where on the chatframe to show the copy button",
    ["ChatFrame"] = true,
    [" Text"] = true,
    ["Message From : %s"] = true,
    ["Copy Text Format"] = true,
    ["Should the copied text be plain, or formatted so you can see the colors."] = true,
    ["Plain"] = true,
    ["HTML"] = true,
    ["BBCode"] = true,
    ["Wowace.com Forums"] = true,
    TOPLEFT  =    "Top, Left",
    TOPRIGHT =    "Top, Right",
    BOTTOMRIGHT = "Bottom, Right",
    BOTTOMLEFT =  "Bottom, Left",
})
--@end-debug@]===]

-- These Localizations are auto-generated. To help with localization
-- please go to http://www.wowace.com/projects/prat-3-0/localization/


  --@non-debug@
do
    local L

L=
{
	["CopyChat"] = {
		[" Text"] = true,
		["BBCode"] = true,
		["BOTTOMLEFT"] = "Bottom, Left",
		["BOTTOMRIGHT"] = "Bottom, Right",
		["buttonpos_desc"] = "Where on the chatframe to show the copy button",
		["buttonpos_name"] = "Button Location",
		["ChatFrame"] = true,
		["Copy all of the text in the selected chat frame into an edit box"] = true,
		["Copy Text"] = true,
		["Copy Text Format"] = true,
		["Copy text from the active chat window."] = true,
		["Copy To Editbox"] = true,
		["CopyChat"] = true,
		["HTML"] = true,
		["Message From : %s"] = true,
		["Plain"] = true,
		["Should the copied text be plain, or formatted so you can see the colors."] = true,
		["showbutton_desc"] = "Show a button on the chatframe",
		["showbutton_name"] = "Copy Button",
		["TOPLEFT"] = "Top, Left",
		["TOPRIGHT"] = "Top, Right",
		["Wowace.com Forums"] = true,
	}
}
PL:AddLocale(PRAT_MODULE, "enUS", L)


L=
{
	["CopyChat"] = {
		--[[Translation missing --]]
		--[[ [" Text"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["BBCode"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["BOTTOMLEFT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["BOTTOMRIGHT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["buttonpos_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["buttonpos_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["ChatFrame"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy all of the text in the selected chat frame into an edit box"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy Text"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy Text Format"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy text from the active chat window."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy To Editbox"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["CopyChat"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["HTML"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Message From : %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Plain"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Should the copied text be plain, or formatted so you can see the colors."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showbutton_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showbutton_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["TOPLEFT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["TOPRIGHT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Wowace.com Forums"] = "",--]] 
	}
}
PL:AddLocale(PRAT_MODULE, "itIT", L)


L=
{
	["CopyChat"] = {
		--[[Translation missing --]]
		--[[ [" Text"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["BBCode"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["BOTTOMLEFT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["BOTTOMRIGHT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["buttonpos_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["buttonpos_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["ChatFrame"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy all of the text in the selected chat frame into an edit box"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy Text"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy Text Format"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy text from the active chat window."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy To Editbox"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["CopyChat"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["HTML"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Message From : %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Plain"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Should the copied text be plain, or formatted so you can see the colors."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showbutton_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showbutton_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["TOPLEFT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["TOPRIGHT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Wowace.com Forums"] = "",--]] 
	}
}
PL:AddLocale(PRAT_MODULE, "ptBR", L)

L=
{
	["CopyChat"] = {
		[" Text"] = "Texte",
		["BBCode"] = true,
		--[[Translation missing --]]
		--[[ ["BOTTOMLEFT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["BOTTOMRIGHT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["buttonpos_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["buttonpos_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["ChatFrame"] = "",--]] 
		["Copy all of the text in the selected chat frame into an edit box"] = "Copier tout le texte de la fenÃªtre de discussion sÃ©lectionnÃ©e dans une boÃ®te d'Ã©dition.",
		["Copy Text"] = "Copier le texte",
		["Copy Text Format"] = "Format du texte copiÃ©",
		["Copy text from the active chat window."] = "Copier le texte Ã  partir de la fenÃªtre de discussion active.",
		--[[Translation missing --]]
		--[[ ["Copy To Editbox"] = "",--]] 
		["CopyChat"] = "Copier",
		["HTML"] = true,
		["Message From : %s"] = "Message de : %s",
		["Plain"] = "Texte seul",
		["Should the copied text be plain, or formatted so you can see the colors."] = "Le texte copiÃ© doit-il Ãªtre seul, ou formatÃ© de tel maniÃ¨re Ã  voir les couleurs.",
		["showbutton_desc"] = "Montrer un bouton sur la fenÃªtre de discussion.",
		["showbutton_name"] = "Bouton de copie",
		--[[Translation missing --]]
		--[[ ["TOPLEFT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["TOPRIGHT"] = "",--]] 
		["Wowace.com Forums"] = "Forums wowace.com",
	}
}
PL:AddLocale(PRAT_MODULE, "frFR",L)



L=
{
	["CopyChat"] = {
		[" Text"] = "Text",
		["BBCode"] = true,
		["BOTTOMLEFT"] = "Unten, links",
		["BOTTOMRIGHT"] = "Unten, rechts",
		["buttonpos_desc"] = "Wo im Chatfenster die Kopier-SchaltflÃ¤che angezeigt werden soll.",
		["buttonpos_name"] = "SchaltflÃ¤chenposition",
		["ChatFrame"] = "Chatfenster",
		["Copy all of the text in the selected chat frame into an edit box"] = "Den gesamten Text des ausgewÃ¤hlten Chatfensters in ein Eingabefeld kopieren",
		["Copy Text"] = "Text kopieren",
		["Copy Text Format"] = "Textformat kopieren",
		["Copy text from the active chat window."] = "Text im aktiven Chatfenster kopieren.",
		["Copy To Editbox"] = "In das Eingabefenster kopieren",
		["CopyChat"] = true,
		["HTML"] = true,
		["Message From : %s"] = "Mitteilung von: %s",
		["Plain"] = "Einfach",
		["Should the copied text be plain, or formatted so you can see the colors."] = "Soll der kopierte Text einfach oder formattiert mit farbiger Darstellung kopiert werden?",
		["showbutton_desc"] = "SchaltflÃ¤che im Chat-Rahmen anzeigen",
		["showbutton_name"] = "SchaltflÃ¤che Kopieren",
		["TOPLEFT"] = "Oben, links",
		["TOPRIGHT"] = "Oben, rechts",
		["Wowace.com Forums"] = "Wowace.com Foren",
	}
}
PL:AddLocale(PRAT_MODULE, "deDE", L)

L=
{
	["CopyChat"] = {
		[" Text"] = "Â í…ìŠ¤íŠ¸",
		["BBCode"] = true,
		["BOTTOMLEFT"] = "í•˜ë‹¨, ì¢Œì¸¡",
		["BOTTOMRIGHT"] = "í•˜ë‹¨, ìš°ì¸¡",
		["buttonpos_desc"] = "ë³µì‚¬ ë²„íŠ¼ì„ í‘œì‹œí•  ëŒ€í™”ì°½ì˜ ìœ„ì¹˜",
		["buttonpos_name"] = "ë²„íŠ¼ ìœ„ì¹˜",
		["ChatFrame"] = "ëŒ€í™”ì°½",
		["Copy all of the text in the selected chat frame into an edit box"] = "ì„ íƒëœ ëŒ€í™”ì°½ì˜ ëª¨ë“  ë‚´ìš©ì„ ëŒ€í™” ìž…ë ¥ì°½ìœ¼ë¡œ ë³µì‚¬í•©ë‹ˆë‹¤",
		["Copy Text"] = "í…ìŠ¤íŠ¸ ë³µì‚¬",
		["Copy Text Format"] = "ë³µì‚¬ ë‚´ìš© ì„œì‹",
		["Copy text from the active chat window."] = "í™œì„± ëŒ€í™”ì°½ì—ì„œ ë‚´ìš©ì„ ë³µì‚¬í•©ë‹ˆë‹¤.",
		["Copy To Editbox"] = "ëŒ€í™” ìž…ë ¥ì°½ì— ë³µì‚¬",
		["CopyChat"] = "ëŒ€í™” ë³µì‚¬ [CopyChat]",
		["HTML"] = true,
		["Message From : %s"] = "%s|1ìœ¼ë¡œ;ë¡œ;ë¶€í„° ë©”ì‹œì§€",
		["Plain"] = "ë³´í†µ",
		["Should the copied text be plain, or formatted so you can see the colors."] = "ë³µì‚¬ëœ ë‚´ìš©ì„ ë³´í†µìœ¼ë¡œ í‘œì‹œí•˜ê±°ë‚˜, ë˜ëŠ” ìƒ‰ìƒì„ ë³´ê¸° ìœ„í•´ í˜•ì‹í™” í•©ë‹ˆë‹¤.",
		["showbutton_desc"] = "ëŒ€í™”ì°½ì— ë²„íŠ¼ í‘œì‹œ",
		["showbutton_name"] = "ë³µì‚¬ ë²„íŠ¼",
		["TOPLEFT"] = "ìƒë‹¨, ì¢Œì¸¡",
		["TOPRIGHT"] = "ìƒë‹¨, ìš°ì¸¡",
		["Wowace.com Forums"] = "Wowace.com í¬ëŸ¼",
	}
}
PL:AddLocale(PRAT_MODULE, "koKR",L)
L=
{
	["CopyChat"] = {
		--[[Translation missing --]]
		--[[ [" Text"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["BBCode"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["BOTTOMLEFT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["BOTTOMRIGHT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["buttonpos_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["buttonpos_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["ChatFrame"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy all of the text in the selected chat frame into an edit box"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy Text"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy Text Format"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy text from the active chat window."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Copy To Editbox"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["CopyChat"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["HTML"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Message From : %s"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Plain"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Should the copied text be plain, or formatted so you can see the colors."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showbutton_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["showbutton_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["TOPLEFT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["TOPRIGHT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Wowace.com Forums"] = "",--]] 
	}
}
PL:AddLocale(PRAT_MODULE, "esMX",L)
L=
{
	["CopyChat"] = {
		[" Text"] = " Ð¢ÐµÐºÑÑ‚",
		["BBCode"] = true,
		["BOTTOMLEFT"] = "Ð¡Ð½Ð¸Ð·Ñƒ, Ð¡Ð»ÐµÐ²Ð°",
		["BOTTOMRIGHT"] = "Ð¡Ð½Ð¸Ð·Ñƒ, Ð¡Ð¿Ñ€Ð°Ð²Ð°",
		["buttonpos_desc"] = "Ð“Ð´Ðµ Ð² Ð¾ÐºÐ½Ðµ Ñ‡Ð°Ñ‚Ð° Ð¿Ð¾ÐºÐ°Ð·Ñ‹Ð²Ð°Ñ‚ÑŒ ÐºÐ½Ð¾Ð¿ÐºÑƒ ÐºÐ¾Ð¿Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ñ",
		["buttonpos_name"] = "ÐŸÐ¾Ð»Ð¾Ð¶ÐµÐ½Ð¸Ðµ ÐºÐ½Ð¾Ð¿ÐºÐ¸",
		["ChatFrame"] = "ÐžÐºÐ½Ð¾ Ñ‡Ð°Ñ‚Ð°",
		["Copy all of the text in the selected chat frame into an edit box"] = "ÐšÐ¾Ð¿Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ Ð²ÐµÑÑŒ Ñ‚ÐµÐºÑÑ‚ Ð¸Ð· Ð²Ñ‹Ð±Ñ€Ð°Ð½Ð½Ð¾Ð³Ð¾ Ð¾ÐºÐ½Ð° Ñ‡Ð°Ñ‚Ð° Ð² Ð¿Ð¾Ð»Ðµ Ð²Ð²Ð¾Ð´Ð°.",
		["Copy Text"] = "ÐšÐ¾Ð¿Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ Ñ‚ÐµÐºÑÑ‚",
		["Copy Text Format"] = "Ð¤Ð¾Ñ€Ð¼Ð°Ñ‚ ÐºÐ¾Ð¿Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ñ Ñ‚ÐµÐºÑÑ‚Ð°",
		["Copy text from the active chat window."] = "ÐšÐ¾Ð¿Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ Ñ‚ÐµÐºÑÑ‚ Ð¸Ð· Ð°ÐºÑ‚Ð¸Ð²Ð½Ð¾Ð³Ð¾ Ð¾ÐºÐ½Ð° Ñ‡Ð°Ñ‚Ð°.",
		["Copy To Editbox"] = "ÐšÐ¾Ð¿Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ Ñ‡Ð°Ñ‚",
		["CopyChat"] = "ÐšÐ¾Ð¿Ð¸Ñ Ð§Ð°Ñ‚Ð°",
		["HTML"] = true,
		["Message From : %s"] = "Ð¡Ð¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ðµ Ð¾Ñ‚ : %s",
		["Plain"] = "ÐžÐ±Ñ‹Ñ‡Ð½Ñ‹Ð¹ Ñ‚ÐµÐºÑÑ‚",
		["Should the copied text be plain, or formatted so you can see the colors."] = "ÐšÐ¾Ð¿Ð¸Ñ€Ð¾Ð²Ð°Ñ‚ÑŒ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸ÑŽ ÐºÐ°Ðº Ð¾Ð±Ñ‹Ñ‡Ð½Ñ‹Ð¹ Ñ‚ÐµÐºÑÑ‚ Ð¸Ð»Ð¸ Ð¶Ðµ Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð½Ñ‹Ð¹, Ñ ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½Ð¸ÐµÐ¼ Ñ†Ð²ÐµÑ‚Ð¾Ð² Ð¸ Ñ‚.Ð¿.",
		["showbutton_desc"] = "ÐŸÐ¾ÐºÐ°Ð·Ñ‹Ð²Ð°Ñ‚ÑŒ ÐºÐ½Ð¾Ð¿ÐºÑƒ ÐºÐ¾Ð¿Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ñ Ð² Ð¾ÐºÐ½Ðµ Ñ‡Ð°Ñ‚Ð°",
		["showbutton_name"] = "ÐšÐ½Ð¾Ð¿ÐºÐ° ÐºÐ¾Ð¿Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ñ",
		["TOPLEFT"] = "Ð¡Ð²ÐµÑ€Ñ…Ñƒ, Ð¡Ð»ÐµÐ²Ð°",
		["TOPRIGHT"] = "Ð¡Ð²ÐµÑ€Ñ…Ñƒ, Ð¡Ð¿Ñ€Ð°Ð²Ð°",
		["Wowace.com Forums"] = "Ð¤Ð¾Ñ€ÑƒÐ¼Ñ‹ Wowace.com",
	}
}
PL:AddLocale(PRAT_MODULE, "ruRU",L)
L=
{
	["CopyChat"] = {
		[" Text"] = "æ–‡æœ¬",
		["BBCode"] = "BBä»£ç ",
		["BOTTOMLEFT"] = "å·¦ä¸‹",
		["BOTTOMRIGHT"] = "å³ä¸‹",
		["buttonpos_desc"] = "å¤åˆ¶æŒ‰é’®åœ¨èŠå¤©æ¡†çš„ä½ç½®",
		["buttonpos_name"] = "æŒ‰é’®ä½ç½®",
		["ChatFrame"] = "èŠå¤©æ¡†",
		["Copy all of the text in the selected chat frame into an edit box"] = "åœ¨é€‰å®šçš„èŠå¤©æ¡†å¤åˆ¶å…¨éƒ¨æ–‡æœ¬åˆ°è¾“å…¥æ¡†",
		["Copy Text"] = "å¤åˆ¶æ–‡æœ¬",
		["Copy Text Format"] = "å¤åˆ¶æ–‡æœ¬æ ¼å¼",
		["Copy text from the active chat window."] = "ä»Žæ´»è·ƒçš„èŠå¤©çª—å£å¤åˆ¶æ–‡æœ¬",
		["Copy To Editbox"] = "å¤åˆ¶åˆ°ç¼–è¾‘æ¡†",
		["CopyChat"] = "èŠå¤©å¤åˆ¶",
		["HTML"] = "è¶…æ–‡æœ¬æ ‡è®°è¯­è¨€",
		["Message From : %s"] = "ä¿¡æ¯æ¥è‡ª: %s",
		["Plain"] = "ç®€æ´",
		["Should the copied text be plain, or formatted so you can see the colors."] = "å¦‚æžœç”¨ç®€æ´æˆ–æŽ’ç‰ˆå¤åˆ¶çš„æ–‡æœ¬,ä½ å¯ä»¥çœ‹åˆ°é¢œè‰²",
		["showbutton_desc"] = "åœ¨èŠå¤©æ¡†æ˜¾ç¤ºæŒ‰é’®",
		["showbutton_name"] = "å¤åˆ¶æŒ‰é’®",
		["TOPLEFT"] = "å·¦ä¸Š",
		["TOPRIGHT"] = "å³ä¸Š",
		["Wowace.com Forums"] = "Wowace.comè®ºå›",
	}
}
PL:AddLocale(PRAT_MODULE, "zhCN",L)
L=
{
	["CopyChat"] = {
		[" Text"] = "Texto",
		["BBCode"] = true,
		--[[Translation missing --]]
		--[[ ["BOTTOMLEFT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["BOTTOMRIGHT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["buttonpos_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["buttonpos_name"] = "",--]] 
		["ChatFrame"] = "MarcoChat",
		["Copy all of the text in the selected chat frame into an edit box"] = "Copiar todo el texto seleccionado en el marco del chat a una caja de ediciÃ³n",
		["Copy Text"] = "Copiar Texto",
		["Copy Text Format"] = "Copiar Texto con fomato",
		["Copy text from the active chat window."] = "Copiar texto desde la ventana de chat activa.",
		--[[Translation missing --]]
		--[[ ["Copy To Editbox"] = "",--]] 
		["CopyChat"] = "ChatCopiar",
		["HTML"] = true,
		["Message From : %s"] = "Mensaje de : %s",
		["Plain"] = "Liso",
		["Should the copied text be plain, or formatted so you can see the colors."] = "El texto copiado deberÃ­a ser llano, o con formato para que pueda ver los colores. ",
		["showbutton_desc"] = "Muestra un botÃ³n en el marco del chat",
		["showbutton_name"] = "BotÃ³n Copiar",
		--[[Translation missing --]]
		--[[ ["TOPLEFT"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["TOPRIGHT"] = "",--]] 
		["Wowace.com Forums"] = "Foros Wowace.com",
	}
}
PL:AddLocale(PRAT_MODULE, "esES",L)
L=
{
	["CopyChat"] = {
		[" Text"] = "æ–‡å­—",
		["BBCode"] = true,
		["BOTTOMLEFT"] = "ä¸‹, å·¦",
		["BOTTOMRIGHT"] = "ä¸‹, å³",
		--[[Translation missing --]]
		--[[ ["buttonpos_desc"] = "",--]] 
		["buttonpos_name"] = "æŒ‰éˆ•ä½ç½®",
		["ChatFrame"] = "èŠå¤©è¦–çª—",
		--[[Translation missing --]]
		--[[ ["Copy all of the text in the selected chat frame into an edit box"] = "",--]] 
		["Copy Text"] = "è¤‡è£½æ–‡å­—",
		["Copy Text Format"] = "è¤‡è£½æ–‡å­—æ ¼å¼",
		["Copy text from the active chat window."] = "è¤‡è£½ä½¿ç”¨ä¸­èŠå¤©è¦–çª—æ–‡å­—",
		["Copy To Editbox"] = "è¤‡è£½è‡³ç·¨è¼¯ç›’",
		["CopyChat"] = true,
		["HTML"] = true,
		["Message From : %s"] = "ä¾†è‡ª %s çš„è¨Šæ¯",
		--[[Translation missing --]]
		--[[ ["Plain"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Should the copied text be plain, or formatted so you can see the colors."] = "",--]] 
		["showbutton_desc"] = "æ–¼èŠå¤©è¦–çª—ä¸­é¡¯ç¤ºæŒ‰éˆ•",
		["showbutton_name"] = "è¤‡è£½æŒ‰éˆ•",
		["TOPLEFT"] = "ä¸Š, å·¦",
		["TOPRIGHT"] = "ä¸Š, å³",
		["Wowace.com Forums"] = "Wowace.com è«–å£‡",
	}
}
PL:AddLocale(PRAT_MODULE, "zhTW",L)
end
--@end-non-debug@


Prat:SetModuleDefaults(module.name, {
    profile = {
        on  = true,
        showbutton = {["*"] = true},
        buttonpos = "TOPLEFT",
        copyformat = "plain"
    }
} )

Prat:SetModuleOptions(module.name, {
    name = PL["CopyChat"],
    desc = PL["Copy text from the active chat window."],
    type = "group",
    args = {
        showbutton = {
            name = PL["showbutton_name"],
            desc = PL["showbutton_desc"],
            type = "multiselect",
            values = Prat.FrameList,
            get = "GetSubValue",
            set = "SetSubValue"
        },
        buttonpos = {
            name = PL.buttonpos_name,
            desc = PL.buttonpos_desc,
            type = "select",
            order = 195,
            get = "GetValue", 
            set = "SetValue",
            values = { ["TOPLEFT"] = PL.TOPLEFT, ["TOPRIGHT"] = PL.TOPRIGHT , 
                       ["BOTTOMLEFT"] = PL.BOTTOMLEFT, ["BOTTOMRIGHT"] = PL.BOTTOMRIGHT },
        },
        copy = {
            name = PL["Copy Text"],
            desc = PL["Copy all of the text in the selected chat frame into an edit box"],
            type = "execute",
            order = 190,
            func = "MenuScrape"
        },
        copyformat = {
            name = PL["Copy Text Format"],
            desc = PL["Should the copied text be plain, or formatted so you can see the colors."],
            type = "select",
            order = 195,
            get = "GetValue", 
            set = "SetValue",
            values = { ["plain"] = PL["Plain"], ["bbcode"] = PL["BBCode"] , ["html"] = PL["HTML"], ["wowace"] = PL["Wowace.com Forums"] },
        },

    }
})

function module:MenuScrape()
    self:ScrapeChatFrame(SELECTED_CHAT_FRAME) 
    HideDropDownMenu(1)
end


Prat:SetModuleInit(module.name,
    function(module)
        PratCCFrameScrollText:SetScript("OnTextChanged", function(this) module:OnTextChanged(this) end)
        PratCCFrameScrollText:SetScript("OnEscapePressed", function(this) PratCCFrame:Hide() module.str = nil end)


        Prat.RegisterChatCommand("copychat",
        function(name)
            local frame = SELECTED_CHAT_FRAME

            if frame then
                module:ScrapeChatFrame(frame)
            end
        end)
    end)




function module:OnModuleEnable()
    self.buttons = {}
    for k,v in pairs(Prat.Frames) do
        self.buttons[k] = self:MakeReminder(v:GetID())
        self:showbutton(k, self.db.profile.showbutton[k])
    end
--    UnitPopupButtons["COPYCHAT"]    = { text =PL["Copy Text"], dist = 0 , func = function(a1, a2) module:CopyLineFromPlayerlink(a1, a2) end , arg1 = "", arg2 = ""};
--    UnitPopupButtons["COPYCHATEDIT"]    = { text =PL["Copy To Editbox"], dist = 0 , func = function(a1, a2) module:CopyLineFromPlayerlinkToEdit(a1, a2) end , arg1 = "", arg2 = ""};



--    if not self.menusAdded then
--        tinsert(UnitPopupMenus["FRIEND"],#UnitPopupMenus["FRIEND"]-1,"COPYCHATEDIT");
--        tinsert(UnitPopupMenus["FRIEND"],#UnitPopupMenus["FRIEND"]-1,"COPYCHAT");
--        self.menusAdded = true
--    end
--
--    Prat:RegisterDropdownButton("COPYCHAT", function(menu, button) button.arg1 = module.clickedFrame end )
--    Prat:RegisterDropdownButton("COPYCHATEDIT", function(menu, button) button.arg1 = module.clickedFrame end )
--
--
--    self:SecureHook("ChatFrame_OnHyperlinkShow")
    Prat.RegisterChatEvent(self, Prat.Events.FRAMES_UPDATED)
end

function module:GetDescription()
    return PL["Copy text from the active chat window."]
end

function module:Prat_FramesUpdated(info, name, chatFrame, ...)
    local id = chatFrame:GetID()
    self.buttons[id] = self:MakeReminder(id)
    self:showbutton(id, self.db.profile.showbutton[1])
end

function module:ChatFrame_OnHyperlinkShow(this, ...)
    self.clickedframe = this
end

function module:OnModuleDisable()
    Prat.UnregisterAllChatEvents(self)
    self:hidebuttons()
    PratCCFrame:Hide()
end


--[[------------------------------------------------
    Core Functions
------------------------------------------------]]--

module.lines = {}
module.str = nil

--function module:UnitPopup_ShowMenu(dropdownMenu, which, unit, name, userData, ...)
--    local ORIGIN_FRAME = self.clickedframe
--    
--    for i=1, UIDROPDOWNMENU_MAXBUTTONS do
--        button = _G["DropDownList"..UIDROPDOWNMENU_MENU_LEVEPL.."Button"..i];
--        
--        if button.value == "COPYCHAT" then 
--          --  self:Debug(dropdownMenu:GetName(), which, unit, name, userData, button.value, ...)
--            button.func = UnitPopupButtons["COPYCHAT"].func
--            button.arg1 = ORIGIN_FRAME
--        end
--    end
--end


function module:GetFormattedLine(line, r, g, b)
    local fmt = self.copyformat or self.db.profile.copyformat
    local CLR = Prat.CLR
    
    line = line:gsub("|c00000000|r", "")

    if fmt == "plain" then 
        return line
    end

    if fmt == "bbcode" or fmt == "wowace" then
       local fline = line:gsub("|c[fF][fF](%w%w%w%w%w%w)", "[color=#%1]"):gsub("|r", "[/color]")
    
       return "[color=#"..CLR:GetHexColor(r,g,b).."]"..fline.."[/color]"
    end

    if fmt == "html" then
       local fline = line:gsub("|c[fF][fF](%w%w%w%w%w%w)", "<font color='#%1'>"):gsub("|r", "</font>")
    
       return "<p><font color='#"..CLR:GetHexColor(r,g,b).."' face='monospace'>"..fline.."</font></p>"
    end

end


function module:CopyLineFromPlayerlinkToEdit(origin_frame, ...)

    -- TODO: Consider just using self.clickedFrame (I dont remember why the other code is there)
    local frame = (origin_frame and origin_frame:GetObjectType() == "ScrollingMessageFrame" and origin_frame) or self.clickedframe

    wipe(self.lines)

    self:AddLines(self.lines, frame:GetRegions())

    local dropdownFrame = UIDROPDOWNMENU_INIT_MENU

    local name = dropdownFrame.name
    local server = dropdownFrame.server  or ""
    local linenum = dropdownFrame.lineID

    local fullname = name;

    if server:len()>0 then
        fullname = name.."-"..server;
    end

    local findname = "|Hplayer:"..fullname..":"..tostring(linenum)

    for i=1, #self.lines do
        if self.lines[i]:find(findname:gsub("%-", "%%-")) then
            local text = self.lines[i]:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", "")
            --self:StaticPopupCopyLine(fullname, self.lines[i])

            local editBox = ChatEdit_ChooseBoxForSend(frame);

            --DEBUG FIXME - for now, we're not going to remove spaces from names. We need to make sure X-server still works.
            -- Remove spaces from the server name for slash command parsing
            --name = gsub(name, " ", "");

            if ( editBox ~= ChatEdit_GetActiveWindow() ) then
                ChatFrame_OpenChat(text, frame);
            else
                editBox:SetText(text);
            end
            
        end
    end
end

function module:CopyLineFromPlayerlink(origin_frame, ...)

    -- TODO: Consider just using self.clickedFrame (I dont remember why the other code is there)
    local frame = (origin_frame and origin_frame:GetObjectType() == "ScrollingMessageFrame" and origin_frame) or self.clickedframe

    wipe(self.lines)

    for _,v in ipairs(frame.visibleLines) do
        local msg = v.messageInfo

        if msg then
            table.insert(self.lines, 1, msg.message)
        end
    end

    local dropdownFrame = UIDROPDOWNMENU_INIT_MENU
    
    local name = dropdownFrame.name
    local server = dropdownFrame.server  or ""
    local linenum = dropdownFrame.lineID
    
    local fullname = name;

    if server:len()>0 then
        fullname = name.."-"..server;
    end

    local findname = "|Hplayer:"..fullname..":"..tostring(linenum)

    for i=1, #self.lines do
        Prat:PrintLiteral(findname:gsub("%-", "%%-"))
        if self.lines[i]:find(findname:gsub("%-", "%%-")) then
            self:StaticPopupCopyLine(fullname, self.lines[i])
        end
    end

    wipe(self.lines)
end


function module:StaticPopupCopyLine(sender, text)
    StaticPopupDialogs["COPY_LINE"] = StaticPopupDialogs["COPY_LINE"] or {
        text = PL["Message From : %s"],
        chattext = "",
        button2 = ACCEPT,
        hasEditBox = 1,
        hasWideEditBox = 1,

        preferredIndex = 3,

        OnShow = function(this)
            this:SetWidth(420)
            local editBox = _G[this:GetName().."WideEditBox"] or _G[this:GetName().."EditBox"]
            editBox:SetText(StaticPopupDialogs["COPY_LINE"].chattext);
            editBox:SetFocus();
            editBox:HighlightText(false);

            local button = _G[this:GetName().."Button2"];
            button:ClearAllPoints();
            button:SetWidth(200);
            button:SetPoint("CENTER", editBox, "CENTER", 0, -30);
        end,

        OnHide = function() end,
        OnAccept = function() end,
        OnCancel = function() end,
        EditBoxOnEscapePressed = function(this) this:GetParent():Hide(); end,
        timeout = 0,
        whileDead = 1,
        hideOnEscape = 1
    };

    StaticPopupDialogs["COPY_LINE"].chattext = text
    StaticPopup_Show ("COPY_LINE", sender);
end


function module:ScrapeChatFrame(frame, noshow)
    self:DoCopyChat(frame, noshow)
end

function module:ScrapeFullChatFrame(frame)
    self:DoCopyChatScroll(frame)
end
     
local scrapelines = {}
function module:DoCopyChatScroll(frame, noshow)
    self.longstr = ""
    self.str = ""
    
    if frame:GetNumMessages() == 0 then return end
    
    wipe(scrapelines)

    for i,v in ipairs(frame.historyBuffer.elements) do
        local msg = v.message

        if msg then
            scrapelines[#scrapelines+1] = msg
        end
    end

    self.str = table.concat(scrapelines, "\n")
    wipe(scrapelines)

    if not noshow then
        if (self.copyformat and self.copyformat == "wowace") or self.db.profile.copyformat == "wowace" then
            self.str = "[bgcolor=black]"..self.str.."[/bgcolor]"
        end

        PratCCText:SetText(PL["ChatFrame"]..frame:GetName():gsub("ChatFrame", "")..PL[" Text"], lines)
        PratCCFrameScrollText:SetText(self.str or "")
        PratCCFrame:Show()
    end
end

function module:DoCopyChatArg(arg)
    self:DoCopyChat(unpack(arg))
end

function module:DoCopyChat(frame, noshow)
    wipe(self.lines)

    for _,v in ipairs(frame.visibleLines) do
        local msg = v.messageInfo

        if msg then
            table.insert(self.lines, 1, msg.message)
        end
    end

    self.str = table.concat(self.lines, "\n")

    wipe(self.lines)
    
    if not noshow then 
        if (self.copyformat and self.copyformat == "wowace") or self.db.profile.copyformat == "wowace" then
            self.str = "[bgcolor=black]"..self.str.."[/bgcolor]"
        end

        PratCCText:SetText(PL["ChatFrame"]..frame:GetName():gsub("ChatFrame", "")..PL[" Text"], lines)
        PratCCFrameScrollText:SetText(self.str or "")
        PratCCFrame:Show()
    end
end

function module:CopyChat()
    module:ScrapeChatFrame(SELECTED_CHAT_FRAME)
end

function module:OnTextChanged(this)
    if self.str and this:GetText() ~= self.str then
        this:SetText(self.str)
        self.str = nil
    end
    local s = PratCCFrameScrollScrollBar
    this:GetParent():UpdateScrollChildRect()
    local _, m = s:GetMinMaxValues()
    if m > 0 and this.max ~= m then
        this.max = m
        s:SetValue(m)
    end
end

function module:hidebuttons()
    for k,v in pairs(self.buttons) do
        v:Hide()
    end
end

function module:showbutton(id, show)
    local b = self.buttons[id]
    if show then b:Show() else b:Hide() end
end

do 
    local function reminderOnClick(self, button, down) 
        PlaySound(SOUNDKIT.IG_CHAT_BOTTOM);
        if (IsShiftKeyDown()) then
            module.copyformat = "wowace"
        end
        if (IsControlKeyDown()) then
            module:ScrapeFullChatFrame(self:GetParent()) 
        else
            module:ScrapeChatFrame(self:GetParent()) 
        end
            
        module.copyformat = nil
    end
    local function reminderOnEnter(self, motion) self:SetAlpha(0.9) end
    local function reminderOnLeave(self, motion) self:SetAlpha(0.2) end
    
    function module:MakeReminder(id)
        local cf = _G["ChatFrame"..id]
        local name = "ChatFrame"..id.."PratCCReminder"
        local b = _G[name]
        if not b then
            b = CreateFrame("Button", name, cf)
            b:SetFrameStrata("BACKGROUND")
            b:SetWidth(24)
            b:SetHeight(24)
            b:SetNormalTexture("Interface\\Addons\\Prat-3.0\\textures\\prat-chatcopy2")
            b:SetPushedTexture("Interface\\Addons\\Prat-3.0\\textures\\prat-chatcopy")
            b:SetHighlightTexture("Interface\\Buttons\\UI-Common-MouseHilight")
            b:SetPoint(self.db.profile.buttonpos, cf, self.db.profile.buttonpos, 0, 0)
            b:SetScript("OnClick", reminderOnClick)
            b:SetScript("OnEnter", reminderOnEnter)
            b:SetScript("OnLeave", reminderOnLeave)
            b:SetAlpha(0.2)
            b:Hide()
        end

        return b
    end
end

  return
end ) -- Prat:AddModuleToLoad
