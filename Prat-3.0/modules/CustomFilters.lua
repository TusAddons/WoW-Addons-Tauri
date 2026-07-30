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

  local PRAT_MODULE = Prat:RequestModuleName("CustomFilters")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE, "LibSink-2.0")

  local PL = module.PL

  --[===[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["module_name"] = "CustomFilters",
    ["module_desc"] = "Module to support custom filters.",
    ["Add Pattern"] = true,
    ["Add a pattern to search for."] = true,
    ["Remove Pattern"] = true,
    ["Remove an existing pattern."] = true,
    ["Pattern Options"] = true,
    ["Inbound"] = true,
    ["Outbound"] = true,
    ["Search Pattern"] = true,
    ["Search Format String"] = true,
    ["Supplied pattern is a format string instead of a pattern"] = true,
    ["<string>"] = true,
    ["Replacement Text"] = true,
    ["Block Message"] = true,
    ["Prevent the message from being displayed"] = true,
    ["Hilight Match Text"] = true,
    ["Hilight Color"] = true,
    ["Secondary Output"] = true,
    ["Send to a secondary output"] = true,
    ["Play Sound"] = true,
    ["Play a sound when this message is output to the chatframe"] = true,
    ["Forward"] = true,
    ["ForwardMessage"] = true,
    ["Forward the message to a chat channel."] = true,
    ["Output Channel"] = true,
    ["Channel to send output text to."] = true,
    ["Channel Data"] = true,
    ["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = true,
    ["Output Message Only"] = true;
    ["Only output the message portion of the chat text, leave out the channel, and playername etc."] = true,
    ["Your name for this filter"] = true,
    ["Filter Name"] = true,
    ["Enabled"] = true,
    ["Is this pattern enabled for use?"] = true,
    ["Pattern Info"] = true,
    ["Match Options"] = true,
    ["inchannels_name"] = "Search Channels",
    ["inchannels_desc"] = "Search in certain channels",
    ["ForwardCustom"] = true,
    ["ForwardMessageCustom"] = "Private Channel",
    ["Forward the message to a custom chat channel."] = "Output to a private chat channel",
  })
  --@end-debug@]===]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/

  --@non-debug@
do
    local L

L=
{
	["CustomFilters"] = {
		["<string>"] = true,
		["Add a pattern to search for."] = true,
		["Add Pattern"] = true,
		["Block Message"] = true,
		["Channel Data"] = true,
		["Channel to send output text to."] = true,
		["Enabled"] = true,
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = true,
		["Filter Name"] = true,
		["Forward"] = true,
		["Forward the message to a chat channel."] = true,
		["Forward the message to a custom chat channel."] = "Output to a private chat channel",
		["ForwardCustom"] = true,
		["ForwardMessage"] = true,
		["ForwardMessageCustom"] = "Private Channel",
		["Hilight Color"] = true,
		["Hilight Match Text"] = true,
		["Inbound"] = true,
		["inchannels_desc"] = "Search in certain channels",
		["inchannels_name"] = "Search Channels",
		["Is this pattern enabled for use?"] = true,
		["Match Options"] = true,
		["module_desc"] = "Module to support custom filters.",
		["module_name"] = "CustomFilters",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = true,
		["Outbound"] = true,
		["Output Channel"] = true,
		["Output Message Only"] = true,
		["Pattern Info"] = true,
		["Pattern Options"] = true,
		["Play a sound when this message is output to the chatframe"] = true,
		["Play Sound"] = true,
		["Prevent the message from being displayed"] = true,
		["Remove an existing pattern."] = true,
		["Remove Pattern"] = true,
		["Replacement Text"] = true,
		["Search Format String"] = true,
		["Search Pattern"] = true,
		["Secondary Output"] = true,
		["Send to a secondary output"] = true,
		["Supplied pattern is a format string instead of a pattern"] = true,
		["Your name for this filter"] = true,
	}
}

  PL:AddLocale(PRAT_MODULE, "enUS",L)


L=
{
	["CustomFilters"] = {
		--[[Translation missing --]]
		--[[ ["<string>"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Add a pattern to search for."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Add Pattern"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Block Message"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Channel Data"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Channel to send output text to."] = "",--]] 
		["Enabled"] = "ActivÃ©",
		--[[Translation missing --]]
		--[[ ["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Filter Name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Forward"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Forward the message to a chat channel."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Forward the message to a custom chat channel."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["ForwardCustom"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["ForwardMessage"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["ForwardMessageCustom"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Hilight Color"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Hilight Match Text"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Inbound"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["inchannels_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["inchannels_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Is this pattern enabled for use?"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Match Options"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Outbound"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Output Channel"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Output Message Only"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Pattern Info"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Pattern Options"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Play a sound when this message is output to the chatframe"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Play Sound"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Prevent the message from being displayed"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Remove an existing pattern."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Remove Pattern"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Replacement Text"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Search Format String"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Search Pattern"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Secondary Output"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Send to a secondary output"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Supplied pattern is a format string instead of a pattern"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Your name for this filter"] = "",--]] 
	}
}

  PL:AddLocale(PRAT_MODULE, "frFR",L)


L=
{
	["CustomFilters"] = {
		["<string>"] = true,
		["Add a pattern to search for."] = "Muster hinzufÃ¼gen, nach dem gesucht wird.",
		["Add Pattern"] = "Muster hinzufÃ¼gen",
		["Block Message"] = "Blockiere Mitteilung",
		["Channel Data"] = "Kanal-Daten",
		["Channel to send output text to."] = "Kanal, an den Ausgabetext gesendet werden soll.",
		["Enabled"] = "Aktiviert",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "ZusÃ¤tzliche Daten fÃ¼r WHISPER (Ziel) und CHANNEL (Kanalname oder -nummer)",
		["Filter Name"] = "Name filtern",
		["Forward"] = "Weiterleiten",
		["Forward the message to a chat channel."] = "Mitteilung weiterleiten an Chat-Kanal.",
		["Forward the message to a custom chat channel."] = "Ausgabe an einen privaten Chat-Kanal",
		["ForwardCustom"] = true,
		["ForwardMessage"] = true,
		["ForwardMessageCustom"] = "Privater Kanal",
		["Hilight Color"] = "Farbe fÃ¼r Hervorhebungen",
		["Hilight Match Text"] = "Text hervorheben, der Suchbegriff entspricht",
		["Inbound"] = "Eingehend",
		["inchannels_desc"] = "Suche in bestimmten KanÃ¤len",
		["inchannels_name"] = "Suche KanÃ¤le",
		["Is this pattern enabled for use?"] = "Ist das Muster zur Anwendung aktiviert?",
		["Match Options"] = "Ãœbereinstimmungsoptionen",
		["module_desc"] = "Modul zur UnterstÃ¼tzung eigener Filter.",
		["module_name"] = "CustomFilters",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "Nur den Mitteilungsabschnitt des Chat-Textes ausgeben - Kanal, Spielernamen etc. auslassen.",
		["Outbound"] = "Ausgehend",
		["Output Channel"] = "Ausgabekanal",
		["Output Message Only"] = "Nur Mitteilung ausgeben",
		["Pattern Info"] = "Muster-Informationen",
		["Pattern Options"] = "Optionen fÃ¼r Muster",
		["Play a sound when this message is output to the chatframe"] = "Einen Klang abspielen, wenn diese Mitteilung an das Chatfenster ausgegeben wurde.",
		["Play Sound"] = "Ton abspielen",
		["Prevent the message from being displayed"] = "Die Anzeige der Mitteilung verhindern.",
		["Remove an existing pattern."] = "Ein vorhandenes Muster entfernen.",
		["Remove Pattern"] = "Muster entfernen",
		["Replacement Text"] = "Ersatztext",
		["Search Format String"] = "Suche Formatierungs-String",
		["Search Pattern"] = "Suchmuster",
		["Secondary Output"] = "SekundÃ¤re Ausgabe",
		["Send to a secondary output"] = "Versende eine sekundÃ¤re Ausgabe",
		["Supplied pattern is a format string instead of a pattern"] = "Geliefertes Muster ist eine Formatierungsvariable anstatt eines Musters.",
		["Your name for this filter"] = "Dein Name fÃ¼r diesen Filter",
	}
}

  PL:AddLocale(PRAT_MODULE, "deDE",L)


L=
{
	["CustomFilters"] = {
		["<string>"] = "<ë‚´ìš©>",
		["Add a pattern to search for."] = "ê²€ìƒ‰í•  íŒ¨í„´ì„ ì¶”ê°€í•©ë‹ˆë‹¤.",
		["Add Pattern"] = "íŒ¨í„´ ì¶”ê°€",
		["Block Message"] = "ë©”ì‹œì§€ ì°¨ë‹¨",
		["Channel Data"] = "ì±„ë„ ë°ì´í„°",
		["Channel to send output text to."] = "ì¶œë ¥ ë‚´ìš©ì„ ë³´ë‚¼ ì±„ë„.",
		["Enabled"] = "ì‚¬ìš©",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "ê·“ì†ë§ (ëŒ€ìƒ)ê³¼ ì±„ë„ (ì±„ë„ ì´ë¦„ ë˜ëŠ” ìˆ«ìž)ì˜ ì¶”ê°€ ë°ì´í„°",
		["Filter Name"] = "í•„í„° ì´ë¦„",
		["Forward"] = "ë³´ë‚´ê¸°",
		["Forward the message to a chat channel."] = "ë©”ì‹œì§€ë¥¼ ëŒ€í™” ì±„ë„ë¡œ ë³´ë‚´ê¸°.",
		["Forward the message to a custom chat channel."] = "ì‚¬ì„¤ ì±„ë„ë¡œ ì¶œë ¥",
		["ForwardCustom"] = "ì‚¬ì„¤ ì±„ë„ë¡œ ë³´ë‚´ê¸°",
		["ForwardMessage"] = "ë©”ì‹œì§€ ë³´ë‚´ê¸°",
		["ForwardMessageCustom"] = "ì‚¬ì„¤ ì±„ë„",
		["Hilight Color"] = "ìƒ‰ìƒ ê°•ì¡°",
		["Hilight Match Text"] = "ì¼ì¹˜í•˜ëŠ” ë¬¸ìž ê°•ì¡°",
		["Inbound"] = "ë°›ëŠ” ë©”ì‹œì§€",
		["inchannels_desc"] = "íŠ¹ì • ì±„ë„ì—ì„œ ê²€ìƒ‰",
		["inchannels_name"] = "ì±„ë„ ê²€ìƒ‰",
		["Is this pattern enabled for use?"] = "ì´ íŒ¨í„´ì„ ì‚¬ìš©í•˜ê¸° ìœ„í•´ í™œì„±í™” í• ê¹Œìš”?",
		["Match Options"] = "ì¼ì¹˜ ì˜µì…˜",
		["module_desc"] = "ì‚¬ìš©ìž ì„¤ì • í•„í„°ë¥¼ ì§€ì›í•˜ëŠ” ëª¨ë“ˆìž…ë‹ˆë‹¤.",
		["module_name"] = "ì‚¬ìš©ìž ì„¤ì • í•„í„°",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "ëŒ€í™” ë¬¸ìžì—´, ì±„ë„ ë‚˜ê°, í”Œë ˆì´ì–´ ì´ë¦„ ë“±ì˜ ë©”ì‹œì§€ ë¶€ë¶„ë§Œ ì¶œë ¥í•©ë‹ˆë‹¤.",
		["Outbound"] = "ë³´ë‚¸ ë©”ì‹œì§€",
		["Output Channel"] = "ì¶œë ¥ ì±„ë„",
		["Output Message Only"] = "ì¶œë ¥ ë©”ì‹œì§€ë§Œ",
		["Pattern Info"] = "íŒ¨í„´ ì •ë³´",
		["Pattern Options"] = "íŒ¨í„´ ì˜µì…˜",
		["Play a sound when this message is output to the chatframe"] = "ì´ ë©”ì‹œì§€ê°€ ëŒ€í™”ì°½ì— ì¶œë ¥ë˜ë©´ ì†Œë¦¬ë¥¼ ìž¬ìƒí•©ë‹ˆë‹¤",
		["Play Sound"] = "ì†Œë¦¬ ìž¬ìƒ",
		["Prevent the message from being displayed"] = "í‘œì‹œ ì¤‘ì¸ ë©”ì‹œì§€ ì°¨ë‹¨í•˜ê¸°",
		["Remove an existing pattern."] = "ì €ìž¥ ì¤‘ì¸ íŒ¨í„´ì„ ì œê±°í•©ë‹ˆë‹¤.",
		["Remove Pattern"] = "íŒ¨í„´ ì‚­ì œ",
		["Replacement Text"] = "ëŒ€ì²´ í…ìŠ¤íŠ¸",
		["Search Format String"] = "í˜•ì‹ êµ¬ë¬¸ ê²€ìƒ‰",
		["Search Pattern"] = "íŒ¨í„´ ê²€ìƒ‰",
		["Secondary Output"] = "ë³´ì¡° ì¶œë ¥",
		["Send to a secondary output"] = "ë³´ì¡° ì¶œë ¥ìœ¼ë¡œ ì „ì†¡í•˜ê¸°",
		["Supplied pattern is a format string instead of a pattern"] = "ì œê³µëœ íŒ¨í„´ì€ íŒ¨í„´ì´ ì•„ë‹Œ í˜•ì‹ êµ¬ë¬¸ìž…ë‹ˆë‹¤",
		["Your name for this filter"] = "ì´ í•„í„°ì˜ ì´ë¦„",
	}
}

  PL:AddLocale(PRAT_MODULE, "koKR",L)


L=
{
	["CustomFilters"] = {
		--[[Translation missing --]]
		--[[ ["<string>"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Add a pattern to search for."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Add Pattern"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Block Message"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Channel Data"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Channel to send output text to."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Enabled"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Filter Name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Forward"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Forward the message to a chat channel."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Forward the message to a custom chat channel."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["ForwardCustom"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["ForwardMessage"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["ForwardMessageCustom"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Hilight Color"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Hilight Match Text"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Inbound"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["inchannels_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["inchannels_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Is this pattern enabled for use?"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Match Options"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Outbound"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Output Channel"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Output Message Only"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Pattern Info"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Pattern Options"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Play a sound when this message is output to the chatframe"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Play Sound"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Prevent the message from being displayed"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Remove an existing pattern."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Remove Pattern"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Replacement Text"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Search Format String"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Search Pattern"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Secondary Output"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Send to a secondary output"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Supplied pattern is a format string instead of a pattern"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Your name for this filter"] = "",--]] 
	}
}

  PL:AddLocale(PRAT_MODULE, "esMX",L)


L=
{
	["CustomFilters"] = {
		["<string>"] = true,
		["Add a pattern to search for."] = "Ð”Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ Ð¾Ð±Ñ€Ð°Ð·ÐµÑ† Ð´Ð»Ñ Ð¿Ð¾Ð¸ÑÐºÐ°.",
		["Add Pattern"] = "Ð”Ð¾Ð±Ð°Ð²Ð¸Ñ‚ÑŒ Ð¾Ð±Ñ€Ð°Ð·ÐµÑ†",
		["Block Message"] = "Ð‘Ð»Ð¾ÐºÐ¸Ñ€Ð¾Ð²ÐºÐ° ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ñ",
		["Channel Data"] = "ÐšÐ°Ð½Ð°Ð» Ð´Ð°Ð½Ð½Ñ‹Ñ…",
		["Channel to send output text to."] = "ÐšÐ°Ð½Ð°Ð» Ð´Ð»Ñ Ð¾Ñ‚ÑÑ‹Ð»ÐºÐ¸ Ð²Ñ‹Ñ…Ð¾Ð´ÑÑ‰ÐµÐ³Ð¾ Ñ‚ÐµÐºÑÑ‚Ð°.",
		["Enabled"] = "Ð’ÐºÐ»ÑŽÑ‡ÐµÐ½Ð¾",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "Ð”Ð¾Ð±Ð°Ð²Ð¾Ñ‡Ð½Ñ‹Ðµ Ð´Ð°Ð½Ð½Ñ‹Ðµ Ð´Ð»Ñ Ð¨Ð•ÐŸÐžÐ¢Ð (Ñ†ÐµÐ»ÑŒ) Ð¸ ÐšÐÐÐÐ›Ð (Ð½Ð°Ð·Ð²Ð°Ð½Ð¸Ðµ ÐºÐ°Ð½Ð°Ð»Ð° Ð¸Ð»Ð¸ Ð½Ð¾Ð¼ÐµÑ€)",
		["Filter Name"] = "ÐÐ°Ð·Ð²Ð°Ð½Ð¸Ðµ Ñ„Ð¸Ð»ÑŒÑ‚Ñ€Ð°",
		["Forward"] = "ÐŸÐµÑ€ÐµÑÑ‹Ð»Ð°Ñ‚ÑŒ",
		["Forward the message to a chat channel."] = "ÐŸÐµÑ€ÐµÑÑ‹Ð»Ð°Ñ‚ÑŒ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ðµ Ð² ÐºÐ°Ð½Ð°Ð» Ñ‡Ð°Ñ‚Ð°.",
		["Forward the message to a custom chat channel."] = "Ð’Ñ‹Ð²Ð¾Ð´ Ð² Ñ‡Ð°ÑÑ‚Ð½Ñ‹Ð¹ ÐºÐ°Ð½Ð°Ð»",
		["ForwardCustom"] = true,
		["ForwardMessage"] = true,
		["ForwardMessageCustom"] = "Ð§Ð°ÑÑ‚Ð½Ñ‹Ð¹ ÐºÐ°Ð½Ð°Ð»",
		["Hilight Color"] = "Ð¦Ð²ÐµÑ‚ Ð²Ñ‹Ð´ÐµÐ»ÐµÐ½Ð¸Ñ",
		["Hilight Match Text"] = "Ð’Ñ‹Ð´ÐµÐ»ÐµÐ½Ð¸Ðµ Ñ‚ÐµÐºÑÑ‚Ð°",
		["Inbound"] = "Ð’Ñ…Ð¾Ð´ÑÑ‰Ð¸Ðµ",
		["inchannels_desc"] = "ÐŸÐ¾Ð¸ÑÐº Ð² Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»Ñ‘Ð½Ð½Ñ‹Ñ… ÐºÐ°Ð½Ð°Ð»Ð°Ñ…",
		["inchannels_name"] = "ÐŸÐ¾Ð¸ÑÐº ÐºÐ°Ð½Ð°Ð»Ð°",
		["Is this pattern enabled for use?"] = "Ð’ÐºÐ»ÑŽÑ‡Ð¸Ñ‚ÑŒ Ð² Ð¸ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ð½Ð¸Ðµ Ð´Ð°Ð½Ð½Ñ‹Ð¹ ÑˆÐ°Ð±Ð»Ð¾Ð½?",
		["Match Options"] = "ÐžÐ¿Ñ†Ð¸Ð¸ ÑÐ¾Ð²Ð¿Ð°Ð´ÐµÐ½Ð¸Ñ",
		["module_desc"] = "ÐœÐ¾Ð´ÑƒÐ»ÑŒ Ð¿Ð¾Ð´Ð´ÐµÑ€Ð¶Ð¸Ð²Ð°ÑŽÑ‰Ð¸Ð¹ Ð¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒÑÐºÐ¸Ðµ Ñ„Ð¸Ð»ÑŒÑ‚Ñ€Ñ‹.",
		["module_name"] = "CustomFilters",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "Ð’Ñ‹Ð²Ð¾Ð´ Ñ‚Ð¾Ð»ÑŒÐºÐ¾ Ñ‡Ð°ÑÑ‚Ð¸ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ð¹, Ð²Ñ‹Ñ…Ð¾Ð´ Ñ ÐºÐ°Ð½Ð°Ð»Ð°, Ð¸Ð¼Ñ Ð¸Ð³Ñ€Ð¾ÐºÐ° Ð¸ Ñ‚.Ð´.",
		["Outbound"] = "Ð˜ÑÑ…Ð¾Ð´ÑÑ‰Ð¸Ðµ",
		["Output Channel"] = "ÐšÐ°Ð½Ð°Ð» Ð²Ñ‹Ð²Ð¾Ð´Ð°",
		["Output Message Only"] = "Ð¢Ð¾Ð»ÑŒÐºÐ¾ Ð²Ñ‹Ð²Ð¾Ð´ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ñ",
		["Pattern Info"] = "Ð¨Ð°Ð±Ð»Ð¾Ð½",
		["Pattern Options"] = "ÐÐ°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸ Ð¾Ð±Ñ€Ð°Ð·Ñ†Ð°",
		["Play a sound when this message is output to the chatframe"] = "ÐŸÑ€Ð¾Ð¸Ð³Ñ€Ð°Ñ‚ÑŒ Ð·Ð²ÑƒÐº ÐºÐ¾Ð³Ð´Ð° Ð´Ð°Ð½Ð½Ð¾Ðµ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ðµ Ð²Ñ‹Ð²Ð¾Ð´Ð¸Ñ‚ÑÑ Ð² Ð¾ÐºÐ½Ð¾ Ñ‡Ð°Ñ‚Ð°.",
		["Play Sound"] = "ÐŸÑ€Ð¾Ð¸Ð³Ñ€Ð°Ñ‚ÑŒ Ð·Ð²ÑƒÐº",
		["Prevent the message from being displayed"] = "ÐŸÑ€ÐµÐ´Ð¾Ñ‚Ð²Ñ€Ð°Ñ‰Ð°ÐµÑ‚ Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ðµ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ñ",
		["Remove an existing pattern."] = "Ð£Ð´Ð°Ð»Ð¸Ñ‚ÑŒ ÑÑƒÑ‰ÐµÑÑ‚Ð²ÑƒÑŽÑ‰Ð¸Ð¹ Ð¾Ð±Ñ€Ð°Ð·ÐµÑ†.",
		["Remove Pattern"] = "Ð£Ð´Ð°Ð»Ð¸Ñ‚ÑŒ Ð¾Ð±Ñ€Ð°Ð·ÐµÑ†",
		["Replacement Text"] = "Ð—Ð°Ð¼ÐµÐ½Ð° Ñ‚ÐµÐºÑÑ‚Ð°",
		["Search Format String"] = "Ð¤Ð¾Ñ€Ð¼Ð°Ñ‚ ÑÑ‚Ñ€Ð¾ÐºÐ¸ Ð¿Ð¾Ð¸ÑÐºÐ°",
		["Search Pattern"] = "ÐžÐ±Ñ€Ð°Ð·ÐµÑ† Ð¿Ð¾Ð¸ÑÐºÐ°",
		["Secondary Output"] = "Ð’Ñ‚Ð¾Ñ€Ð¸Ñ‡Ð½Ñ‹Ð¹ Ð²Ñ‹Ð²Ð¾Ð´",
		["Send to a secondary output"] = "ÐžÑ‚Ð¾ÑÐ»Ð°Ñ‚ÑŒ Ð½Ð° Ð²Ñ‚Ð¾Ñ€Ð¸Ñ‡Ð½Ñ‹Ð¹ Ð²Ñ‹Ð²Ð¾Ð´",
		["Supplied pattern is a format string instead of a pattern"] = "ÐŸÐ¾ÑÑ‚Ð°Ð²Ð»ÑÐµÑ‚ÑÑ Ð¾Ð±Ñ€Ð¾Ð·ÐµÑ† Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚Ð° ÑÑ‚Ñ€Ð¾ÐºÐ¸ Ð²Ð¼ÐµÑÑ‚Ð¾ ÑˆÐ°Ð±Ð»Ð¾Ð½Ð°",
		["Your name for this filter"] = "Ð’Ð°ÑˆÐµ Ð¸Ð¼Ñ Ð´Ð»Ñ Ð´Ð°Ð½Ð½Ð¾Ð³Ð¾ Ñ„Ð¸Ð»ÑŒÑ‚Ñ€Ð°",
	}
}

  PL:AddLocale(PRAT_MODULE, "ruRU",L)


L=
{
	["CustomFilters"] = {
		["<string>"] = true,
		["Add a pattern to search for."] = "æ·»åŠ ä¸€ä¸ªæœç´¢æ¨¡æ¿",
		["Add Pattern"] = "æ·»åŠ æ¨¡æ¿",
		["Block Message"] = "æ¶ˆæ¯é˜»æ­¢",
		["Channel Data"] = "é¢‘é“æ•°æ®",
		["Channel to send output text to."] = "é¢‘é“å‘é€è¾“å‡ºæ–‡æœ¬",
		["Enabled"] = "å¯ç”¨",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "å¯†è¯­(ç›®æ ‡)å’Œé¢‘é“(é¢‘é“åç§°æˆ–æ•°å­—)çš„æ‰©å±•æ•°æ®",
		["Filter Name"] = "è¿‡æ»¤å™¨åå­—",
		["Forward"] = "è½¬å‘",
		["Forward the message to a chat channel."] = "è½¬å‘ä¿¡æ¯åˆ°èŠå¤©é¢‘é“",
		["Forward the message to a custom chat channel."] = "è¾“å‡ºåˆ°ä¸€ä¸ªç§äººé¢‘é“",
		["ForwardCustom"] = "è‡ªå®šä¹‰ä¼ é€",
		["ForwardMessage"] = "ä¿¡æ¯è½¬å‘",
		["ForwardMessageCustom"] = "ç§æœ‰é¢‘é“",
		["Hilight Color"] = "é¢œè‰²é«˜äº®",
		["Hilight Match Text"] = "é«˜äº®åŒ¹é…æ–‡æœ¬",
		["Inbound"] = "è¾“å…¥èŒƒå›´",
		["inchannels_desc"] = "åœ¨å½“å‰é¢‘é“æœç´¢",
		["inchannels_name"] = "æœç´¢é¢‘é“",
		["Is this pattern enabled for use?"] = "è¿™ä¸ªæ ·å¼å¯ç”¨äº†å—ï¼Ÿ",
		["Match Options"] = "é€‚é…é€‰é¡¹",
		["module_desc"] = "æ”¯æŒè‡ªå®šä¹‰è¿‡æ»¤çš„æ¨¡å—",
		["module_name"] = "è‡ªå®šä¹‰è¿‡æ»¤",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "ä»…åœ¨èŠå¤©æ–‡æœ¬ä¸­è¾“å‡ºéƒ¨åˆ†ä¿¡æ¯ï¼Œç§»é™¤é¢‘é“å’ŒçŽ©å®¶å§“åç­‰",
		["Outbound"] = "è¾“å‡ºèŒƒå›´",
		["Output Channel"] = "è¾“å‡ºé¢‘é“",
		["Output Message Only"] = "åªè¾“å‡ºä¿¡æ¯",
		["Pattern Info"] = "æ ·å¼ä¿¡æ¯",
		["Pattern Options"] = "æ¨¡å—é€‰é¡¹",
		["Play a sound when this message is output to the chatframe"] = "å½“ä¿¡æ¯åœ¨èŠå¤©æ¡†è¾“å‡ºæ—¶æ’­æ”¾å£°éŸ³",
		["Play Sound"] = "æ’­æ”¾å£°éŸ³",
		["Prevent the message from being displayed"] = "é˜»æ­¢ä¿¡æ¯è¢«çŽ°å®ž",
		["Remove an existing pattern."] = "ç§»é™¤çŽ°æœ‰æ¨¡æ¿",
		["Remove Pattern"] = "ç§»é™¤æ¨¡æ¿",
		["Replacement Text"] = "æ›¿æ¢æ–‡æœ¬",
		["Search Format String"] = "æœç´¢æ ¼å¼å­—ç¬¦ä¸²",
		["Search Pattern"] = "æœç´¢æ¨¡æ¿",
		["Secondary Output"] = "äºŒæ¬¡è¾“å‡º",
		["Send to a secondary output"] = "å‘é€äºŒæ¬¡è¾“å‡º",
		["Supplied pattern is a format string instead of a pattern"] = "æ”¯æŒæ¨¡æ¿æ˜¯æ ¼å¼å­—ç¬¦ä¸²è€Œéžæ¨¡æ¿",
		["Your name for this filter"] = "è¿™ä¸ªè¿‡æ»¤å™¨çš„åå­—",
	}
}

  PL:AddLocale(PRAT_MODULE, "zhCN",L)


L=
{
	["CustomFilters"] = {
		["<string>"] = "<cadena>",
		["Add a pattern to search for."] = "AÃ±adir un patrÃ³n de bÃºsqueda.",
		["Add Pattern"] = "AÃ±adir PatrÃ³n",
		["Block Message"] = "Bloque de Mensaje",
		["Channel Data"] = "Datos de Canal",
		["Channel to send output text to."] = "Canal a enviar el texto de salida",
		["Enabled"] = "Activado",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "Datos extra para SUSURRAR (objetivo) y CANAL (nombre de canal o nÃºmero)",
		["Filter Name"] = "Nombre del Filtro",
		["Forward"] = "Reenviar",
		["Forward the message to a chat channel."] = "Reenviar el mensaje a un canal de chat.",
		["Forward the message to a custom chat channel."] = "Salida a un canal privado de chat",
		["ForwardCustom"] = "Reenviar Personalizado",
		["ForwardMessage"] = "ReenviarMensaje",
		["ForwardMessageCustom"] = "Canal Privado",
		["Hilight Color"] = "Color Resaltado",
		["Hilight Match Text"] = "Texto Coincidente Resaltado",
		["Inbound"] = "Entrante",
		["inchannels_desc"] = "Buscar en algunos canales",
		["inchannels_name"] = "Buscar canales",
		["Is this pattern enabled for use?"] = "Â¿EstÃ¡ habilitado este patrÃ³n para su uso?",
		["Match Options"] = "Opciones de Coincidencias",
		["module_desc"] = "MÃ³dulo para soportar filtros personalizados.",
		["module_name"] = "Filtros Personalizados",
		["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "SÃ³lo mostrar la parte del mensaje del chat de texto, omitir el canal, nombre de jugador, etc.",
		["Outbound"] = "Saliente",
		["Output Channel"] = "Canal de Salida",
		["Output Message Only"] = "Solo Mensajes Salientes",
		["Pattern Info"] = "PatrÃ³n de InformaciÃ³n",
		["Pattern Options"] = "Opciones de PatrÃ³n",
		["Play a sound when this message is output to the chatframe"] = "Reproducir un sonido cuando este mensaje sale en el marco de chat",
		["Play Sound"] = "Reproducir Sonido",
		["Prevent the message from being displayed"] = "Impedir que el mensaje sea visualizado",
		["Remove an existing pattern."] = "Elimina un patrÃ³n existente.",
		["Remove Pattern"] = "Eliminar PatrÃ³n",
		["Replacement Text"] = "SustituciÃ³n de texto",
		["Search Format String"] = "Cadena de Formato de BÃºsqueda",
		["Search Pattern"] = "PatrÃ³n de BÃºsqueda",
		["Secondary Output"] = "Salida Secundaria",
		["Send to a secondary output"] = "Enviar a un salida secundaria",
		["Supplied pattern is a format string instead of a pattern"] = "El patrÃ³n suministrado es una cadena de formato en lugar de un patrÃ³n",
		["Your name for this filter"] = "Su nombre para este filtro",
	}
}

  PL:AddLocale(PRAT_MODULE, "esES",L)


L=
{
	["CustomFilters"] = {
		["<string>"] = true,
		["Add a pattern to search for."] = "æ–°å¢žæ¨¡å¼æœç´¢ã€‚",
		["Add Pattern"] = "æ–°å¢žæ¨£å¼",
		["Block Message"] = "å±è”½è¨Šæ¯",
		["Channel Data"] = "é »é“è³‡æ–™",
		["Channel to send output text to."] = "é »é“ç™¼é€è¼¸å‡ºæ–‡å­—è‡³ã€‚",
		["Enabled"] = "å·²å•Ÿç”¨",
		["Extra data for WHISPER (target) and CHANNEL (channel name or num)"] = "é¡å¤–è³‡æ–™å¯†è©±(ç›®æ¨™)å’Œé »é“(é »é“åç¨±æˆ–æ•¸å­—)",
		["Filter Name"] = "éŽæ¿¾åç¨±",
		["Forward"] = "è½‰é€",
		["Forward the message to a chat channel."] = "è½‰é€è¨Šæ¯è‡³èŠå¤©é »é“",
		["Forward the message to a custom chat channel."] = "è½‰é€åç¨±è‡³è‡ªè¨‚èŠå¤©é »é“",
		["ForwardCustom"] = "è‡ªè¨‚è½‰é€",
		["ForwardMessage"] = "è½‰é€è¨Šæ¯",
		["ForwardMessageCustom"] = "ç§äººé »é“",
		["Hilight Color"] = "é«˜äº®æç¤ºè‰²å½©",
		["Hilight Match Text"] = "ç¬¦åˆé«˜äº®æç¤ºæ–‡å­—",
		["Inbound"] = "å‚³å…¥",
		["inchannels_desc"] = "æœå°‹æŸäº›é »é“",
		["inchannels_name"] = "æœå°‹é »é“",
		--[[Translation missing --]]
		--[[ ["Is this pattern enabled for use?"] = "",--]] 
		["Match Options"] = "åŒ¹é…é¸é …",
		["module_desc"] = "æ”¯æ´è‡ªè¨‚éŽæ¿¾çš„æ¨¡çµ„",
		["module_name"] = "è‡ªå®šç¾©éŽæ¿¾",
		--[[Translation missing --]]
		--[[ ["Only output the message portion of the chat text, leave out the channel, and playername etc."] = "",--]] 
		["Outbound"] = "å‚³å‡º",
		["Output Channel"] = "è¼¸å‡ºé »é“",
		["Output Message Only"] = "åƒ…è¼¸å‡ºè¨Šæ¯",
		["Pattern Info"] = "æ¨£å¼è³‡è¨Š",
		["Pattern Options"] = "æ¨¡å¼é¸é …",
		--[[Translation missing --]]
		--[[ ["Play a sound when this message is output to the chatframe"] = "",--]] 
		["Play Sound"] = "æ’­æ”¾éŸ³æ•ˆ",
		--[[Translation missing --]]
		--[[ ["Prevent the message from being displayed"] = "",--]] 
		["Remove an existing pattern."] = "æ›¿æ›æ–‡æœ¬",
		["Remove Pattern"] = "ç§»é™¤æ¨¡æ¿",
		["Replacement Text"] = "æ›¿æ›æ–‡å­—",
		["Search Format String"] = "æœå°‹æ ¼å¼å­—ä¸²",
		["Search Pattern"] = "æœå°‹æ¨£å¼",
		["Secondary Output"] = "æ¬¡è¦è¼¸å‡º",
		["Send to a secondary output"] = "ç™¼é€æ¬¡è¦è¼¸å‡º",
		--[[Translation missing --]]
		--[[ ["Supplied pattern is a format string instead of a pattern"] = "",--]] 
		["Your name for this filter"] = "ä½ çš„åå­—æ­¤éŽæ¿¾",
	}
}

  PL:AddLocale(PRAT_MODULE, "zhTW",L)


end
--@end-non-debug@


  local eventMap = {
    CHAT_MSG_CHANNEL_LIST = true,
    CHAT_MSG_SAY = true,
    CHAT_MSG_GUILD = true,
    CHAT_MSG_WHISPER_INFORM = true,
    CHAT_MSG_WHISPER = true,
    CHAT_MSG_YELL = true,
    CHAT_MSG_PARTY = true,
    CHAT_MSG_PARTY_LEADER = true,
    CHAT_MSG_OFFICER = true,
    CHAT_MSG_RAID = true,
    CHAT_MSG_RAID_LEADER = true,
    CHAT_MSG_INSTANCE_CHAT = true,
    CHAT_MSG_INSTANCE_CHAT_LEADER = true,
  }

  local eventTypes = {}
  local function getTypes()
    for k, v in pairs(ChatTypeGroup) do
      eventTypes[k] = _G["CHAT_MSG_" .. k]
    end
    eventTypes.CHANNEL = CHANNEL
    eventTypes.WHISPER_INFORM = CHAT_MSG_WHISPER_INFORM
    return eventTypes
  end

  local newmap = {}
  for i, v in ipairs(eventMap) do
    newmap[v] = v
  end

  eventMap, newmap = newmap




  local patterndefaults = {
    ["*"] = {
      enabled = true,
      sink20OutputSink = "None",
      replacement_is_code = false,
      outputmessageonly = true,
      inchannels = {
        SYSTEM = true,
        SAY = true,
        EMOTE = true,
        YELL = true,
        WHISPER = true,
        WHISPER_INFORM = true,
        PARTY = true,
        RAID = true,
        RAID_LEADER = true,
        RAID_WARNING = true,
        INSTANCE_CHAT = true,
        INSTANCE_CHAT_LEADER = true,
        GUILD = true,
        GUILD_OFFICER = true,
        MONSTER_SAY = true,
        MONSTER_YELL = true,
        MONSTER_EMOTE = true,
        MONSTER_WHISPER = true,
        MONSTER_BOSS_EMOTE = true,
        MONSTER_BOSS_WHISPER = true,
        ERRORS = true,
        AFK = true,
        DND = true,
        IGNORED = true,
        BG_HORDE = true,
        BG_ALLIANCE = true,
        BG_NEUTRAL = true,
        COMBAT_XP_GAIN = true,
        COMBAT_HONOR_GAIN = true,
        COMBAT_FACTION_CHANGE = true,
        SKILL = true,
        LOOT = true,
        MONEY = true,
        OPENING = true,
        TRADESKILLS = true,
        PET_INFO = true,
        COMBAT_MISC_INFO = true,
        ACHIEVEMENT = true,
        GUILD_ACHIEVEMENT = true,
        CHANNEL = true,
      }
    }
  }
  Prat:SetModuleDefaults(module, {
    profile = {
      on = false,
      inbound = patterndefaults,
      outbound = patterndefaults,
      outputchannel = CHAT_MSG_SAY,
      outputchanneldata = "",
      sinkoptions = {}
    }
  })

  local modeOptions = {
    mode = {
      inbound = {
        type = "group",
        name = PL["Inbound"],
        desc = PL["Inbound"],
        args = {}
      },
      outbound = {
        type = "group",
        name = PL["Outbound"],
        desc = PL["Outbound"],
        args = {}
      },
    }
  }

  Prat:SetModuleOptions(module, {
    name = PL["module_name"],
    desc = PL["module_desc"],
    type = "group",
    plugins = modeOptions,
    args = {
      outputchannel = {
        type = "select",
        name = PL["Output Channel"],
        desc = PL["Channel to send output text to."],
        order = 110,
        values = eventMap,
      },
      outputchanneldata = {
        type = "input",
        order = 115,
        name = PL["Channel Data"],
        desc = PL["Extra data for WHISPER (target) and CHANNEL (channel name or num)"],
        usage = "<string>",
        disabled = function(info) return not (info.handler.db.profile.outputchannel == CHAT_MSG_WHISPER_INFORM or
                                              info.handler.db.profile.outputchannel == CHAT_MSG_CHANNEL_LIST) end
      },
      outputmessageonly = {
        type = "toggle",
        name = PL["Output Message Only"],
        desc = PL["Only output the message portion of the chat text, leave out the channel, and playername etc."],
        order = 118,
      }
    }
  })


  function module:BuildModeOptions(mode, opts)
    local mode = mode
    local po = opts[mode].args


    self[mode] = {}
    self[mode].validate = {}

    --    po.pathdr = {
    --        type = "header",
    --        name = PL["Pattern Options"],
    --        order = 80,
    --    }

    for k, v in pairs(self.db.profile[mode]) do
      self:AddPatternOptions(po, v.name or k, mode, k)
      self[mode].validate[k] = v.name or k
    end

    --    po.opspc = {
    --        type = "header",
    --        order = 94,
    --    }

    po.addpattern = {
      name = PL["Add Pattern"],
      desc = PL["Add a pattern to search for."],
      type = "input",
      usage = PL["<string>"],
      get = false,
      set = "AddPattern"
    }

    po.removepattern = {
      name = PL["Remove Pattern"],
      desc = PL["Remove an existing pattern."],
      type = "select",
      get = function(info) return "" end,
      set = "RemovePattern",
      values = self[mode].validate,
      disabled = function(info)
        local mode = info[#info - 1]
        for k, v in pairs(info.handler.db.profile[mode]) do
          return false
        end return true
      end,
    }
  end

  function module:DisableOutputOption(info)
    return self.db.profile[info[#info - 3]][info[#info - 2]].tosink
  end

  function module:AddPatternOptions(o, pattern, mode, key)
    key = key or pattern
    o[key] = o[key] or {}
    local po = o[key]
    local settings = self.db.profile[mode][key]
    local mode = mode
    local pattern = pattern
    po.type = "group"
    po.name = pattern
    po.desc = pattern
    po.order = 90

    po.args = {
      name = {
        order = 1,
        type = "input",
        name = PL["Filter Name"],
        desc = PL["Your name for this filter"],
        get = "GetPatternValue",
        set = "UpdatePatternValue",
      },
      enabled = {
        order = 5,
        type = "toggle",
        name = PL["Enabled"],
        desc = PL["Is this pattern enabled for use?"],
        get = "GetPatternValue",
        set = "UpdatePatternValue",
      },
      opspc9 = {
        name = PL["Pattern Info"],
        type = "header",
        order = 9,
      },
      searchfor = {
        order = 10,
        type = "input",
        name = PL["Search Pattern"],
        desc = PL["Search Pattern"],
        usage = PL["<string>"],
        get = "GetPatternValue",
        set = "UpdatePatternValue"
      },
      inchannels = {
        name = PL["inchannels_name"],
        desc = PL["inchannels_desc"],
        type = "multiselect",
        order = 110,
        values = getTypes(),
        get = "GetPatternSubValue",
        set = "SetPatternSubValue",
      },
      --        searchfordeformat = {
      --            type = "toggle",
      --            name = PL["Search Format String"],
      --            desc = PL["SuPLied pattern is a format string instead of a pattern"],
      --            get = "GetPatternValue",
      --            set = "UpdatePatternValue"
      --            },
      replacewith = {
        order = 20,
        type = "input",
        name = PL["Replacement Text"],
        desc = PL["Replacement Text"],
        usage = PL["<string>"],
        get = "GetPatternValue",
        set = "UpdatePatternValue",
        disabled = "GetDisableReplace",
      },
      opspc29 = {
        name = PL["Match Options"],
        type = "header",
        order = 29,
      },
      block = {
        type = "toggle",
        name = PL["Block Message"],
        desc = PL["Prevent the message from being displayed"],
        get = "GetPatternValue",
        set = "SetPatternValue"
      },
      tosink = {
        type = "toggle",
        name = PL["Secondary Output"],
        desc = PL["Send to a secondary output"],
        get = "GetPatternValue",
        set = "SetPatternValue"
      },
      sound = {
        type = "select",
        name = PL["Play Sound"],
        desc = PL["Play a sound when this message is output to the chatframe"],
        dialogControl = 'LSM30_Sound',
        get = "GetPatternValue",
        set = "SetPatternValue",
        values = AceGUIWidgetLSMlists.sound,
      },
      hilight = {
        type = "toggle",
        name = PL["Hilight Match Text"],
        desc = PL["Hilight Match Text"],
        get = "GetPatternValue",
        set = "UpdatePatternValue",
        disabled = "GetBlockMessage",
      },
      hilight_color = {
        type = "color",
        name = PL["Hilight Color"],
        desc = PL["Hilight Color"],
        get = "GetPatternColorValue",
        set = "SetPatternColorValue",
        disabled = "GetBlockMessage",
      },
      replacement_is_code = {
        type = "toggle",
        get = "GetPatternValue",
        set = "SetPatternValue",
        name = "Replacement is Lua code",
        desc = "Replacement is Lua code",
      }
    }

    self.SetSinkStorage(settings, settings)

    po.args.outputmessageonly = {
      type = "toggle",
      name = PL["Output Message Only"],
      desc = PL["Only output the message portion of the chat text, leave out the channel, and playername etc."],
      order = 190,
      get = "GetPatternValue",
      set = "UpdatePatternValue",
    }
    po.args.output = self.GetSinkAce3OptionsDataTable(settings)
    po.args.output.inline = true
    po.args.output.order = 200
    po.args.output.disabled = "DisableOutputOption"
  end

  local CLR = Prat.CLR

  local function match(text, matchopts, mode)
    if (not matchopts) or (not matchopts.enabled) then return end

    local matchtype
    if mode == "inbound" then
      matchtype = "FRAME"
    else
      matchtype = "OUTBOUND"
    end

    local textout = text

    if mode == "inbound" then
      if not matchopts.inchannels[Prat.SplitMessage.CHATTYPE] then
        return
      end
    end

    if matchopts.replacewith and matchopts.replacewith ~= matchopts.searchfor then
      if matchopts.replacement_is_code then
        textout = loadstring(matchopts.replacewith)(text)
      elseif matchopts.replacewith:find("%%1") then
        textout = matchopts.replacewith:gsub("%%1", textout)
      else
        textout = matchopts.replacewith
      end
    end

    if matchopts.hilight then
      local hexcolor = CLR:GetHexColor(matchopts.hilight_color)
      textout = CLR:Colorize(hexcolor, textout)
    end

    if matchopts.sink20OutputSink then
      if mode == "inbound" then
        Prat.SplitMessage.CF_SINK_OUT = matchopts
      else
        Prat.SplitMessageOut.CF_SINK_OUT = matchopts
      end
    end

    if matchopts.tosink then
      if mode == "inbound" then
        Prat.SplitMessage.CF_SINK = true
      else
        Prat.SplitMessageOut.CF_SINK = true
      end
    end

    if matchopts.sound then
      if mode == "inbound" then
        Prat.SplitMessage.CF_SOUND = matchopts.sound
      else
        Prat.SplitMessageOut.CF_SOUND = matchopts.sound
      end
    end

    if matchopts.block then
      if mode == "inbound" then
        Prat.SplitMessage.DONOTPROCESS = true
      else
        Prat.SplitMessageOut.DONOTPROCESS = true
      end
    end


    textout = Prat:RegisterMatch(textout, matchtype)
    --  end

    return textout
  end

  module.modulePatterns = {}

  function module:RegisterPattern(matchopts, mode)
    local mode = mode
    local matchopts = matchopts
    local matchtype
    if mode == "inbound" then
      matchtype = "FRAME"
    else
      matchtype = "OUTBOUND"
    end
    local patterninfo = {
      pattern = matchopts.searchfor,
      matchopts = matchopts,
      matchfunc =
      function(text, ...)
        local mode = mode
        local matchopts = matchopts
        return match(text, matchopts, mode)
      end,
      type = matchtype,
      deformat = matchopts.deformat
    }

    Prat.RegisterPattern(patterninfo, self.name)

    self.modulePatterns[#self.modulePatterns+1] = patterninfo
  end

  function module:UnregisterPattern(matchopts)
    local patterninfo
    for _, v in pairs(self.modulePatterns) do
      if v.matchopts == matchopts then
        patterninfo = v
      end
    end

    if patterninfo == nil then return end

    if patterninfo.idx then
      Prat.UnregisterPattern(patterninfo.idx)
    end

    local idx
    for k, v in pairs(self.modulePatterns) do
      if v == patterninfo then
        idx = k
      end
    end

    table.remove(self.modulePatterns, idx)
  end

  function module:UpdatePattern(matchopts)
    local patterninfo
    for _, v in pairs(self.modulePatterns) do
      if v.matchopts == matchopts then
        patterninfo = v
      end
    end

    if patterninfo == nil then return end

    local mode
    local matchopts = matchopts
    if patterninfo.type == "FRAME" then
      mode = "inbound"
    else
      mode = "outbound"
    end

    patterninfo.pattern = matchopts.searchfor
    patterninfo.deformat = matchopts.deformat
    patterninfo.matchfunc =
    function(text, ...)
      return match(text, matchopts, mode)
    end
  end

  --[[------------------------------------------------
      Module Event Functions
  ------------------------------------------------]] --

  Prat:SetModuleInit(module,
    function(self)
      local function tailChan(t, cnum, cname, ...)
        if not cnum then return t end
        if Prat.IsPrivateChannel(cnum) then
          t[#t + 1] = cname
        end
        return tailChan(t, ...)
      end

      self:RegisterSink(PL["ForwardCustom"],
        PL["ForwardMessageCustom"],
        PL["Forward the message to a custom chat channel."],
        "ForwardCustom",
        function() return tailChan({}, GetChannelList()) end)

      local modeOpts = modeOptions.mode
      for k, v in pairs(modeOpts) do
        self:BuildModeOptions(k, modeOpts)
      end

      self:SetSinkStorage(self.db.profile.sinkoptions)
      modeOpts.output = self:GetSinkAce3OptionsDataTable()
      modeOpts.output.inline = true
    end)

  -- things to do when the module is enabled
  function module:OnModuleEnable()
    local modeOpts = modeOptions.mode
    local mode
    for mode, _ in pairs(modeOpts) do
      if type(self.db.profile[mode]) == "table" then
        local patopts
        for _, patopts in pairs(self.db.profile[mode]) do
          if patopts.enabled then
            self:RegisterPattern(patopts, mode)
          end
        end
      end
    end

    Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE)
    Prat.RegisterChatEvent(self, Prat.Events.POST_ADDMESSAGE_BLOCKED, "Prat_PostAddMessage")
  end


  function module:OnModuleDisable()
    Prat.UnregisterAllChatEvents(self)
  end

  function module:Prat_PostAddMessage(info, message, frame, event, text, r, g, b, id)
    local uid = Prat.EVENT_ID
    if uid and
       uid == self.lastevent and
       self.lasteventtype == event then
      return
    end

    self.lasteventtype = event
    self.lastevent = uid


    if message.CF_SINK or message.CF_SINK_OUT then
      if self.db.profile.outputmessageonly then
        self.Pour(message.CF_SINK_OUT or self, message.MESSAGE, r, g, b)
      else
        self.Pour(message.CF_SINK_OUT or self, text, r, g, b)
      end
    end

    if message.CF_SOUND then
      Prat:PlaySound(message.CF_SOUND)
    end
  end


  --[[------------------------------------------------
      Core Functions
  ------------------------------------------------]] --

  function module:GetPatternValue(info)
    return self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]]
  end

  function module:UpdatePatternValue(info, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = v
    self:UpdatePattern(self.db.profile[info[#info - 2]][info[#info - 1]])
  end

  function module:SetPatternValue(info, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = v
  end

  function module:GetPatternSubValue(info, val)
    return self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]][val]
  end

  function module:SetPatternSubValue(info, val, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]][val] = v
  end

  function module:SetPatternName(info, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = v
  end

  local defclr = { r = 1, b = 1, g = 1, a = 1 }
  function module:GetPatternColorValue(info)
    local c = self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]]
    if c == nil then
      self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = { r = 1, g = 1, b = 1, a = 1 }
      c = self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]]
    end
    return c.r, c.g, c.b, c.a
  end

  function module:SetPatternColorValue(info, r, g, b, a)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = { r = r, g = g, b = b, a = a }
  end


  function module:GetPatternSearch(info)
    return self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]]
  end

  function module:SetPatternSearch(info, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = v
    self:UpdatePattern(self.db.profile[info[#info - 2]][info[#info - 1]])
  end

  function module:GetPatternReplace(info)
    return self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]]
  end

  function module:SetPatternReplace(info, v)
    self.db.profile[info[#info - 2]][info[#info - 1]][info[#info]] = v
    self:UpdatePattern(self.db.profile[info[#info - 2]][info[#info - 1]])
  end

  function module:GetPatternHilight(p)
    return p.hilight
  end

  function module:SetPatternHilight(p, v)
    p.hilight = v

    self:UpdatePattern(p)
  end

  function module:GetDisableReplace(p)
    return p.block or p.tosink
  end

  function module:GetBlockMessage(p)
    return p.block
  end

  function module:SetBlockMessage(p, v)
    p.block = v
  end

  function module:GetSinkMessage(p)
    return p.tosink
  end

  function module:SetSinkMessage(p, v)
    p.tosink = v
  end

  function module:GetSoundMessage(p)
    return p.sound
  end

  function module:SetSoundMessage(p, v)
    p.sound = v

    Prat:PlaySound(v)
  end


  local white_clr = { r = 1.0, b = 1.0, g = 1.0 }
  function module:GetPatternHilightClr(p)
    local h = p.hilight_color or white_clr
    return h.r or 1.0, h.g or 1.0, h.b or 1.0
  end

  function module:SetPatternHilightClr(p, r, g, b)
    p.hilight_color = p.hilight_color or {}
    local h = p.hilight_color
    h.r, h.g, h.b = r, g, b

    self:UpdatePattern(p)
  end



  function module:AddPattern(info, pattern)
    local mode = info[#info - 1]
    local p = self.db.profile[mode]

    for k, v in pairs(p) do
      if v.name == pattern then
        return
      end
    end


    self[mode].validate = self[mode].validate or {}
    local v = self[mode].validate


    local num = 0
    while rawget(p, "pat" .. num) ~= nil do
      num = num + 1
    end

    local key = "pat" .. num

    p[key] = p[key] or {}
    p[key].name = pattern
    p[key].searchfor = pattern
    p[key].replacewith = pattern

    v[key] = pattern

    local o = modeOptions.mode[mode].args
    self:AddPatternOptions(o, pattern, mode, key)

    self:RegisterPattern(p[key], mode)

    self:RefreshOptions()
  end

  function module:RemovePattern(info, pattern)
    local mode = info[#info - 1]
    local p = self.db.profile[mode]

    local v = self[mode].validate
    local key, name

    if type(pattern) == "number" then
      name = v[pattern]
    else
      name = pattern
    end


    for k, v in pairs(p) do
      if k == name then
        key = k
        break
      end

      if v.name == name then
        key = k
        break
      end
    end

    if key == nil then return end

    self:UnregisterPattern(p[key])

    p[key] = nil

    modeOptions.mode[mode].args = {}

    self:BuildModeOptions(mode, modeOptions.mode)

    self:RefreshOptions()
  end

  function module:RefreshOptions()
    LibStub("AceConfigRegistry-3.0"):NotifyChange("Prat")
  end

  local sink
  function module:ForwardCustom(source, text, ...)
    sink = sink or LibStub("LibSink-2.0")
    local s = sink.storageForAddon[source]
    local loc = s and s.sink20ScrollArea or ""
    local cnum = Prat.GetChannelName(loc)

    if cnum and cnum > 0 then
      local cleantext = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", "")

      SendChatMessage(cleantext, "CHANNEL", GetDefaultLanguage("player"), cnum)
    end
  end

  --msg, chatType, language, channel)
  function module:Forward(source, text, r, g, b, ...)
    local cleantext = text:gsub("|c%x%x%x%x%x%x%x%x", ""):gsub("|r", ""):gsub("|H.-|h", ""):gsub("|h", "")

    if self.db.profile.outputchannel == CHAT_MSG_WHISPER_INFORM then
      SendChatMessage(cleantext, "WHISPER", GetDefaultLanguage("player"), self.db.profile.outputchanneldata)
    elseif self.db.profile.outputchannel == CHAT_MSG_CHANNEL_LIST then
      SendChatMessage(cleantext, "CHANNEL", GetDefaultLanguage("player"), Prat.GetChannelName(self.db.profile
      .outputchanneldata))
    else
      local chatType = strsub(self.db.profile.outputchannel, 10)
      SendChatMessage(cleantext, chatType, GetDefaultLanguage("player"))
    end
  end


  return
end) -- Prat:AddModuleToLoad
