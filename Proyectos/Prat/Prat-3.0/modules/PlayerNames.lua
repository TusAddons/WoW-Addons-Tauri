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

  local PRAT_MODULE = Prat:RequestModuleName("PlayerNames")

  if PRAT_MODULE == nil then
    return
  end

  local module = Prat:NewModule(PRAT_MODULE,  "AceHook-3.0", "AceEvent-3.0", "AceTimer-3.0")

  -- define localized strings
  local PL = module.PL

  --[===[@debug@
  PL:AddLocale(PRAT_MODULE, "enUS", {
    ["PlayerNames"] = true,
    ["Player name formating options."] = true,
    ["Brackets"] = true,
    ["Square"] = true,
    ["Angled"] = true,
    ["None"] = true,
    ["Class"] = true,
    ["Random"] = true,
    ["Reset Settings"] = true,
    ["No additional coloring"] = true,
    ["Restore default settings, and delete stored character data."] = true,
    ["Sets style of brackets to use around player names."] = true,
    ["Unknown Use Common Color"] = true,
    ["Toggle using a common color for unknown player names."] = true,
    ["Unknown Common Color"] = true,
    ["Set common color of unknown player names."] = true,
    ["Enable TabComplete"] = true,
    ["Toggle tab completion of player names."] = true,
    ["Show Level"] = true,
    ["Toggle level showing."] = true,
    ["Level Color Mode"] = true,
    ["Use Player Color"] = true,
    ["Use Channel Color"] = true,
    ["Color by Level Difference"] = true,
    ["How to color other player's level."] = true,
    ["Show Group"] = true,
    ["Toggle raid group showing."] = true,
    ["Show Raid Target Icon"] = true,
    ["Toggle showing the raid target icon which is currently on the player."] = true,
    ["Use toon name for RealID"] = true,

    -- In the high-cpu pullout
    ["coloreverywhere_name"] = "Color Names Everywhere",
    ["coloreverywhere_desc"] = "Color player names if they appear in the text of the chat message",
    ["hoverhilight_name"] = "Hover Hilighting",
    ["hoverhilight_desc"] = "Hilight chat lines from a specific player when hovering over thier playerlink",
    ["realidcolor_name"] = "RealID Coloring",
    ["realidcolor_desc"] = "RealID Name Coloring",
    ["Keep Info"] = true,
    ["Keep Lots Of Info"] = true,
    ["Keep player information between session for all players except cross-server players"] = true,
    ["Keep player information between session, but limit it to friends and guild members."] = true,
    ["Player Color Mode"] = true,
    ["How to color player's name."] = true,
    ["Unknown Common Color From TasteTheNaimbow"] = true,
    ["Let TasteTheNaimbow set the common color for unknown player names."] = true,
    ["Brackets Common Color"] = true,
    ["Sets common color of brackets to use around player names."] = true,
    ["Brackets Use Common Color"] = true,
    ["Toggle using a common color for brackets around player names."] = true,
    ["linkifycommon_name"] = "Linkify Common Messages",
    ["linkifycommon_desc"] = "Linkify Common Messages",
    ["Prat_Playernames: Stored Player Data Cleared"] = true,
    ["tabcomplete_name"] = "Possible Names",
    ["Tab completion : "] = true,
    ["Too many matches (%d possible)"] = true,
    ["Actively Query Player Info"] = true,
    ["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = true,
  })
  --@end-debug@]===]

  -- These Localizations are auto-generated. To help with localization
  -- please go to http://www.wowace.com/projects/prat-3-0/localization/
  --@non-debug@
  do
      local L

  L=
{
	["PlayerNames"] = {
		["Actively Query Player Info"] = true,
		["Angled"] = true,
		["Brackets"] = true,
		["Brackets Common Color"] = true,
		["Brackets Use Common Color"] = true,
		["Class"] = true,
		["Color by Level Difference"] = true,
		["coloreverywhere_desc"] = "Color player names if they appear in the text of the chat message",
		["coloreverywhere_name"] = "Color Names Everywhere",
		["Enable Alt-Invite"] = true,
		["Enable Invite Links"] = true,
		["Enable TabComplete"] = true,
		["hoverhilight_desc"] = "Hilight chat lines from a specific player when hovering over thier playerlink",
		["hoverhilight_name"] = "Hover Hilighting",
		["How to color other player's level."] = true,
		["How to color player's name."] = true,
		["Keep Info"] = true,
		["Keep Lots Of Info"] = true,
		["Keep player information between session for all players except cross-server players"] = true,
		["Keep player information between session, but limit it to friends and guild members."] = true,
		["Let TasteTheNaimbow set the common color for unknown player names."] = true,
		["Level Color Mode"] = true,
		["linkifycommon_desc"] = "Linkify Common Messages",
		["linkifycommon_name"] = "Linkify Common Messages",
		["No additional coloring"] = true,
		["None"] = true,
		["Player Color Mode"] = true,
		["Player name formating options."] = true,
		["PlayerNames"] = true,
		["Prat_Playernames: Stored Player Data Cleared"] = true,
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = true,
		["Random"] = true,
		["realidcolor_desc"] = "RealID Name Coloring",
		["realidcolor_name"] = "RealID Coloring",
		["Reset Settings"] = true,
		["Restore default settings, and delete stored character data."] = true,
		["Set common color of unknown player names."] = true,
		["Sets common color of brackets to use around player names."] = true,
		["Sets style of brackets to use around player names."] = true,
		["Show Group"] = true,
		["Show Level"] = true,
		["Show Raid Target Icon"] = true,
		["Square"] = true,
		["Tab completion : "] = true,
		["tabcomplete_name"] = "Possible Names",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = true,
		["Toggle group invites by alt-clicking on player name."] = true,
		["Toggle level showing."] = true,
		["Toggle raid group showing."] = true,
		["Toggle showing the raid target icon which is currently on the player."] = true,
		["Toggle tab completion of player names."] = true,
		["Toggle using a common color for brackets around player names."] = true,
		["Toggle using a common color for unknown player names."] = true,
		["Too many matches (%d possible)"] = true,
		["Unknown Common Color"] = true,
		["Unknown Common Color From TasteTheNaimbow"] = true,
		["Unknown Use Common Color"] = true,
		["Use Channel Color"] = true,
		["Use Player Color"] = true,
		["Use toon name for RealID"] = true,
	}
}

    PL:AddLocale(PRAT_MODULE, "enUS",L)


  L=
{
	["PlayerNames"] = {
		["Actively Query Player Info"] = "Interroger activement les joueurs",
		["Angled"] = "Chevrons",
		["Brackets"] = "Crochets",
		["Brackets Common Color"] = "Couleur des crochets",
		["Brackets Use Common Color"] = "Couleur des crochets",
		["Class"] = "Classe du joueur",
		["Color by Level Difference"] = "DiffÃ©rence de niveau",
		["coloreverywhere_desc"] = "Colorier le nom des joueurs si ils apparaissent dans le texte des messages.",
		["coloreverywhere_name"] = "Couleur partout",
		["Enable Alt-Invite"] = "Invitation avec Alt",
		["Enable Invite Links"] = "Liens d'invitation",
		["Enable TabComplete"] = "ComplÃ©tion avec Tab",
		["hoverhilight_desc"] = "Mettre en surbrillance les lignes de chat d'un joueur spÃ©cifique quand la souris survole un lien vers ce joueur",
		["hoverhilight_name"] = "Surbrillance de noms survolÃ©s",
		["How to color other player's level."] = "DÃ©finit la couleur du niveau des autres joueurs.",
		["How to color player's name."] = "DÃ©finit la couleur du nom des joueurs.",
		["Keep Info"] = "Garder les info.",
		["Keep Lots Of Info"] = "Garder beaucoup d'info.",
		["Keep player information between session for all players except cross-server players"] = "Garder les informations sur tous les joueurs entre les sessions sauf pour les joueurs inter-serveurs.",
		["Keep player information between session, but limit it to friends and guild members."] = "Garder les informations sur les joueurs entre les sessions, mais seulement pour les amis et membres de la guilde.",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "Laisser TasteTheNaimbow dÃ©finir la couleur des joueurs inconnus.",
		["Level Color Mode"] = "Couleur des niveaux",
		--[[Translation missing --]]
		--[[ ["linkifycommon_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["linkifycommon_name"] = "",--]] 
		["No additional coloring"] = "Pas de couleur",
		["None"] = "Aucun",
		["Player Color Mode"] = "Couleur des joueurs",
		["Player name formating options."] = "Options de formatage pour les noms des joueurs.",
		["PlayerNames"] = "Nom des joueurs",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames: Informations des joueurs rÃ©initialisÃ©es.",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "Interroge le serveur pour tous les noms de joueurs que nous ne connaissons pas. Note : Cela peut Ãªtre trÃ¨s lent, et les informations ne sont pas sauvegardÃ©es.",
		["Random"] = "AlÃ©atoire",
		["realidcolor_desc"] = "Couleur des noms RealID.",
		["realidcolor_name"] = "Couleur RealID",
		["Reset Settings"] = "RÃ©initialiser",
		["Restore default settings, and delete stored character data."] = "Remets les options par dÃ©faut, et supprime toutes les informations enregistrÃ©es sur les joueurs.",
		["Set common color of unknown player names."] = "DÃ©finit la couleur pour les noms de joueurs inconnus.",
		["Sets common color of brackets to use around player names."] = "DÃ©finit la couleur des crochets autour du noms des joueurs.",
		["Sets style of brackets to use around player names."] = "DÃ©finit le style des crochets autour du nom des joueurs.",
		["Show Group"] = "Montrer le groupe",
		["Show Level"] = "Montrer le niveau",
		["Show Raid Target Icon"] = "Montrer l'icÃ´ne de raid",
		["Square"] = "Crochets",
		["Tab completion : "] = "Auto-complÃ©tion :",
		["tabcomplete_name"] = "Noms possibles",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "Active/DÃ©sactive l'invitation de groupe en faisant Alt+clic sur des mots-clÃ© hyperliens comme 'inviter'.",
		["Toggle group invites by alt-clicking on player name."] = "Active/DÃ©sactive l'invitation de groupe en faisant Alt+clic sur le nom d'un joueur.",
		["Toggle level showing."] = "Active/DÃ©sactive l'affichage du niveau.",
		["Toggle raid group showing."] = "Active/DÃ©sactive l'affichage du groupe de raid.",
		["Toggle showing the raid target icon which is currently on the player."] = "Active/DÃ©sactive l'affichage de l'icÃ´ne de raid qui est sur le joueur.",
		["Toggle tab completion of player names."] = "Active/DÃ©sactive l'auto-complÃ©tion du nom des joueurs.",
		["Toggle using a common color for brackets around player names."] = "Active/DÃ©sactive l'utilisation d'une couleur commune pour les crochets autour du nom des joueurs.",
		["Toggle using a common color for unknown player names."] = "Active/DÃ©sactive l'utilisation d'une couleur commune pour les joueurs inconnus.",
		["Too many matches (%d possible)"] = "Trop de rÃ©sultats (%d possibles)",
		["Unknown Common Color"] = "Couleur pour inconnu",
		--[[Translation missing --]]
		--[[ ["Unknown Common Color From TasteTheNaimbow"] = "",--]] 
		["Unknown Use Common Color"] = "Couleur pour inconnu",
		["Use Channel Color"] = "Couleur du canal",
		["Use Player Color"] = "Couleur du joueur",
		--[[Translation missing --]]
		--[[ ["Use toon name for RealID"] = "",--]] 
	}
}

    PL:AddLocale(PRAT_MODULE, "frFR",L)


  L=
{
	["PlayerNames"] = {
		["Actively Query Player Info"] = "Spielerinformationen aktiv abfragen",
		["Angled"] = "Abgewinkelt",
		["Brackets"] = "Klammern",
		["Brackets Common Color"] = "Standardfarbe der Klammern",
		["Brackets Use Common Color"] = "Klammern verwende die Standardfarbe",
		["Class"] = "Klasse",
		["Color by Level Difference"] = "Entsprechend des Stufenunterschieds einfÃ¤rben",
		["coloreverywhere_desc"] = "Spielernamen einfÃ¤rben, wenn diese im Text einer Chat-Mitteilung auftreten.",
		["coloreverywhere_name"] = "Namen Ã¼berall einfÃ¤rben",
		["Enable Alt-Invite"] = "Alt-Einladungen aktivieren",
		["Enable Invite Links"] = "Einladungs-Links aktivieren",
		["Enable TabComplete"] = "TabComplete aktivieren",
		["hoverhilight_desc"] = "Chat-Zeilen eines bestimmten Spielers hervorheben, wenn die Maus Ã¼ber den Spielerlink gelegt wird.",
		["hoverhilight_name"] = "Schwebendes Hervorheben",
		["How to color other player's level."] = "Wie die Stufen anderer Spieler eingefÃ¤rbt werden sollen.",
		["How to color player's name."] = "Wie die Namen der Spieler eingefÃ¤rbt werden sollen.",
		["Keep Info"] = "Informationen merken",
		["Keep Lots Of Info"] = "Viele Informationen speichern",
		["Keep player information between session for all players except cross-server players"] = "Spielerinformationen aller Spieler auÃŸer Spielern anderer Server zwischen Sitzungen merken.",
		["Keep player information between session, but limit it to friends and guild members."] = "Spielerinformationen zwischen Sitzungen speichern, aber schrÃ¤nke dies ein auf Freunde und Gildenmitglieder.",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "Lasse TasteTheNaimbow die Ã¼bliche Farbe fÃ¼r unbekannte Spielernamen einstellen.",
		["Level Color Mode"] = "Stufenfarbe-Modus",
		["linkifycommon_desc"] = "Allgemeine Mitteilungen in Links umwandeln",
		["linkifycommon_name"] = "Allgemeine Mitteilungen in Links umwandeln",
		["No additional coloring"] = "Keine zusÃ¤tzliche EinfÃ¤rbung",
		["None"] = "Keine",
		["Player Color Mode"] = "Spielerfarbe-Modus",
		["Player name formating options."] = "Formatierungsoptionen fÃ¼r Spielernamen",
		["PlayerNames"] = true,
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames: Gespeicherte Spielerdaten gelÃ¶scht",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "Alle uns unbekannten Spielernamen beim Server abfragen. Merke: dies passiert ziemlich langsam und diese Daten sind nicht gespeichert.",
		["Random"] = "ZufÃ¤llig",
		["realidcolor_desc"] = "RealID-NamenseinfÃ¤rbung",
		["realidcolor_name"] = "RealID-EinfÃ¤rbung",
		["Reset Settings"] = "Einstellungen zurÃ¼cksetzen",
		["Restore default settings, and delete stored character data."] = "Standardeinstellungen wiederherstellen und gespeicherte Charakterdaten lÃ¶schen.",
		["Set common color of unknown player names."] = "Allgemein Ã¼bliche Farbe bei unbekannten Spielernamen einstellen.",
		["Sets common color of brackets to use around player names."] = "Allgemein Ã¼bliche Farbe der Klammern bei Spielernamen einstellen.",
		["Sets style of brackets to use around player names."] = "Stil der Klammern bei Spielernamen einstellen.",
		["Show Group"] = "Gruppe anzeigen",
		["Show Level"] = "Stufe anzeigen",
		["Show Raid Target Icon"] = "Zielmarkierungssymbol anzeigen",
		["Square"] = "Quadrat",
		["Tab completion : "] = "Tab-ErgÃ¤nzung:",
		["tabcomplete_name"] = "MÃ¶gliche Namen",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "Gruppeneinladungen umschalten, indem Hyperlinks von Stichworten wie \"invite\" bei gleichzeitigem DrÃ¼cken der Alt-Taste angeklickt werden.",
		["Toggle group invites by alt-clicking on player name."] = "Gruppeneinladungen umschalten, indem Spielernamen bei gleichzeitigem DrÃ¼cken der Alt-Taste angeklickt werden.",
		["Toggle level showing."] = "Stufenanzeige umschalten.",
		["Toggle raid group showing."] = "Schlachtzugsgruppenanzeige umschalten.",
		["Toggle showing the raid target icon which is currently on the player."] = "Anzeige von Schlachtzugsziel-Symbol, welches gegenwÃ¤rtig dem Spieler zugewiesen ist, umschalten.",
		["Toggle tab completion of player names."] = "Tag-ErgÃ¤nzung von Spielernamen umschalten.",
		["Toggle using a common color for brackets around player names."] = "Die Verwendung der allgemein Ã¼blichen Farbe fÃ¼r Klammern bei Spielernamen umschalten.",
		["Toggle using a common color for unknown player names."] = "Die Verwendung der allgemein Ã¼blichen Farbe fÃ¼r unbekannte Spielernamen umschalten.",
		["Too many matches (%d possible)"] = "Zu viele Entsprechungen (%d mÃ¶glich)",
		["Unknown Common Color"] = "Unbekannte Ã¼bliche Farbe",
		["Unknown Common Color From TasteTheNaimbow"] = "Unbekannte Ã¼bliche Farbe von TasteTheNaimbow",
		["Unknown Use Common Color"] = "Unbekannt - Ã¼bliche Farbe verwenden",
		["Use Channel Color"] = "Kanalfarbe verwenden",
		["Use Player Color"] = "Spielerfarbe verwenden",
		["Use toon name for RealID"] = "Charakternamen statt RealID verwenden",
	}
}

    PL:AddLocale(PRAT_MODULE, "deDE",L)


  L=
{
	["PlayerNames"] = {
		["Actively Query Player Info"] = "ì ê·¹ì ì¸ í”Œë ˆì´ì–´ ì •ë³´ ìš”ì²­",
		["Angled"] = "<í”Œë ˆì´ì–´>",
		["Brackets"] = "ê´„í˜¸ ì„ íƒ",
		["Brackets Common Color"] = "ê´„í˜¸ ìƒ‰ìƒ",
		["Brackets Use Common Color"] = "ê´„í˜¸ì— ìƒ‰ìƒ ì‚¬ìš©",
		["Class"] = "ì§ì—…",
		["Color by Level Difference"] = "ë ˆë²¨ ì°¨ì´ì— ì˜í•œ ìƒ‰ìƒ",
		["coloreverywhere_desc"] = "ëŒ€í™” ë©”ì‹œì§€ì— ë‚˜íƒ€ë‚˜ëŠ” í”Œë ˆì´ì–´ ì´ë¦„ì— ìƒ‰ìƒ ì ìš©",
		["coloreverywhere_name"] = "ëª¨ë“  ê³³ì˜ ì´ë¦„ì— ìƒ‰ìƒ ì‚¬ìš©",
		["Enable Alt-Invite"] = "Alt-ì´ˆëŒ€ ì¼œê¸°",
		["Enable Invite Links"] = "ì´ˆëŒ€ ë§í¬ ì¼œê¸°",
		["Enable TabComplete"] = "íƒ­ ì™„ì„± ì¼œê¸°",
		["hoverhilight_desc"] = "í”Œë ˆì´ì–´ ë§í¬ì— ë§ˆìš°ìŠ¤ë¥¼ ì˜¬ë¦¬ë©´ íŠ¹ì • í”Œë ˆì´ì–´ì˜ ëŒ€í™” ë‚´ìš©ì„ ê°•ì¡°í•©ë‹ˆë‹¤",
		["hoverhilight_name"] = "ë§ˆìš°ìŠ¤ ì˜¤ë²„ ê°•ì¡°",
		["How to color other player's level."] = "ë‹¤ë¥¸ í”Œë ˆì´ì–´ì˜ ë ˆë²¨ ìƒ‰ìƒí™” ë°©ë²•ì„ ì„¤ì •í•©ë‹ˆë‹¤.",
		["How to color player's name."] = "í”Œë ˆì´ì–´ì˜ ì´ë¦„ ìƒ‰ìƒí™” ë°©ë²•ì„ ì„¤ì •í•©ë‹ˆë‹¤.",
		["Keep Info"] = "ì¹œêµ¬/ê¸¸ë“œì› ì •ë³´ ì €ìž¥",
		["Keep Lots Of Info"] = "ëª¨ë“  í”Œë ˆì´ì–´ ì •ë³´ ì €ìž¥",
		["Keep player information between session for all players except cross-server players"] = "ë‹¤ë¥¸ ì„œë²„ë¥¼ ì œì™¸í•œ ëª¨ë“  í”Œë ˆì´ì–´ì˜ ì •ë³´ë¥¼ ì„¸ì…˜ ê°„ ìœ ì§€í•©ë‹ˆë‹¤",
		["Keep player information between session, but limit it to friends and guild members."] = "ì¹œêµ¬ì™€ ê¸¸ë“œì›ì˜ ì •ë³´ë¥¼ ì„¸ì…˜ ê°„ ìœ ì§€í•©ë‹ˆë‹¤",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "ì•Œ ìˆ˜ ì—†ëŠ” í”Œë ˆì´ì–´ ì´ë¦„ì— ëŒ€í•œ ìƒ‰ìƒìœ¼ë¡œ TasteTheNaimBow ì• ë“œì˜¨ì˜ ì„¤ì •ì„ ì‚¬ìš©í•©ë‹ˆë‹¤.",
		["Level Color Mode"] = "ë ˆë²¨ ìƒ‰ìƒ ì„¤ì •",
		["linkifycommon_desc"] = "ì¼ë°˜ ë©”ì‹œì§€ ë§í¬",
		["linkifycommon_name"] = "ì¼ë°˜ ë©”ì‹œì§€ ë§í¬",
		["No additional coloring"] = "ì‚¬ìš© ì•ˆí•¨",
		["None"] = "ì•ˆí•¨",
		["Player Color Mode"] = "í”Œë ˆì´ì–´ ìƒ‰ìƒ ì„¤ì •",
		["Player name formating options."] = "í”Œë ˆì´ì–´ ì´ë¦„ í˜•ì‹í™” ì„¤ì •ìž…ë‹ˆë‹¤.",
		["PlayerNames"] = "í”Œë ˆì´ì–´ ì´ë¦„",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames: ì €ìž¥ëœ í”Œë ˆì´ì–´ ì •ë³´ ì´ˆê¸°í™”",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "ëª¨ë¥´ëŠ” ëª¨ë“  í”Œë ˆì´ì–´ ì´ë¦„ ì •ë³´ë¥¼ ì„œë²„ì— ìš”ì²­í•©ë‹ˆë‹¤. ì£¼ì˜: ìž‘ë™ ì‹œ ëŠë ¤ì§ˆ ìˆ˜ ìžˆìœ¼ë©°, ìˆ˜ì§‘ëœ ì •ë³´ë“¤ì€ ì €ìž¥ë˜ì§€ ì•ŠìŠµë‹ˆë‹¤.",
		["Random"] = "ë¬´ìž‘ìœ„",
		["realidcolor_desc"] = "ì‹¤ëª…ID ì´ë¦„ì— ìƒ‰ì„ ìž…íž™ë‹ˆë‹¤",
		["realidcolor_name"] = "ì‹¤ëª…ID ìƒ‰ ìž…ížˆê¸°",
		["Reset Settings"] = "ì„¤ì • ì´ˆê¸°í™”",
		["Restore default settings, and delete stored character data."] = "ê¸°ë³¸ ì„¤ì •ì„ ë³µêµ¬í•˜ê³  ì €ìž¥ëœ ìºë¦­í„° ì„¤ì •ì„ ì§€ì›ë‹ˆë‹¤.",
		["Set common color of unknown player names."] = "ì•Œ ìˆ˜ ì—†ëŠ” í”Œë ˆì´ì–´ ì´ë¦„ì˜ ìƒ‰ìƒì„ ì„¤ì •í•©ë‹ˆë‹¤.",
		["Sets common color of brackets to use around player names."] = "í”Œë ˆì´ì–´ ì´ë¦„ ì£¼ìœ„ì— ì‚¬ìš©í•  ê´„í˜¸ì˜ ìƒ‰ìƒì„ ì„¤ì •í•©ë‹ˆë‹¤.",
		["Sets style of brackets to use around player names."] = "í”Œë ˆì´ì–´ ì´ë¦„ ì£¼ìœ„ì— ì‚¬ìš©í•  ê´„í˜¸ì˜ ëª¨ì–‘ì„ ì„¤ì •í•©ë‹ˆë‹¤.",
		["Show Group"] = "ê·¸ë£¹ í‘œì‹œ",
		["Show Level"] = "ë ˆë²¨ í‘œì‹œ",
		["Show Raid Target Icon"] = "ì „ìˆ  ì•„ì´ì½˜ í‘œì‹œ",
		["Square"] = "ì‚¬ê°í˜•",
		["Tab completion : "] = "íƒ­ ì™„ì„± :",
		["tabcomplete_name"] = "ê°€ëŠ¥í•œ ì´ë¦„",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "'ì´ˆëŒ€' ê°™ì€ ë§í¬ëœ ë‹¨ì–´ë¥¼ Alt-í´ë¦­í•˜ì—¬ ì´ˆëŒ€í•©ë‹ˆë‹¤.",
		["Toggle group invites by alt-clicking on player name."] = "í”Œë ˆì´ì–´ ì´ë¦„ì„ Alt-í´ë¦­í•˜ì—¬ ì´ˆëŒ€í•©ë‹ˆë‹¤.",
		["Toggle level showing."] = "ë ˆë²¨ì„ í‘œì‹œí•©ë‹ˆë‹¤.",
		["Toggle raid group showing."] = "ê³µê²©ëŒ€ íŒŒí‹°ë¥¼ í‘œì‹œí•©ë‹ˆë‹¤.",
		["Toggle showing the raid target icon which is currently on the player."] = "í”Œë ˆì´ì–´ì—ê²Œ ì§€ì •ëœ ì „ìˆ  ì•„ì´ì½˜ì„ í‘œì‹œí•©ë‹ˆë‹¤.",
		["Toggle tab completion of player names."] = "í”Œë ˆì´ì–´ ì´ë¦„ì˜ íƒ­ ì™„ì„±ì„ ì¼­ë‹ˆë‹¤.",
		["Toggle using a common color for brackets around player names."] = "í”Œë ˆì´ì–´ ì´ë¦„ ì£¼ìœ„ ê´„í˜¸ì— ìƒ‰ìƒì„ ìž…íž™ë‹ˆë‹¤.",
		["Toggle using a common color for unknown player names."] = "ì•Œ ìˆ˜ ì—†ëŠ” í”Œë ˆì´ì–´ ì´ë¦„ì— ìƒ‰ìƒì„ ìž…íž™ë‹ˆë‹¤.",
		["Too many matches (%d possible)"] = "ë„ˆë¬´ ë§Žì€ ì¼ì¹˜ (%d ê°€ëŠ¥)",
		["Unknown Common Color"] = "ì•Œ ìˆ˜ ì—†ëŠ” ìƒ‰ìƒ",
		["Unknown Common Color From TasteTheNaimbow"] = "ì•Œ ìˆ˜ ì—†ëŠ” ì´ë¦„ì— TasteTheNaimbow ìƒ‰ìƒ ì‚¬ìš©",
		["Unknown Use Common Color"] = "ì•Œ ìˆ˜ ì—†ëŠ” ì´ë¦„ì— ìƒ‰ìƒ ì‚¬ìš©",
		["Use Channel Color"] = "ì±„ë„ ìƒ‰ìƒ ì‚¬ìš©",
		["Use Player Color"] = "í”Œë ˆì´ì–´ ìƒ‰ìƒ ì‚¬ìš©",
		["Use toon name for RealID"] = "ì‹¤ëª…IDì— ë³„ëª… ì‚¬ìš©",
	}
}

    PL:AddLocale(PRAT_MODULE, "koKR",L)


  L=
{
	["PlayerNames"] = {
		--[[Translation missing --]]
		--[[ ["Actively Query Player Info"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Angled"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Brackets"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Brackets Common Color"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Brackets Use Common Color"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Class"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Color by Level Difference"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["coloreverywhere_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["coloreverywhere_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Enable Alt-Invite"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Enable Invite Links"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Enable TabComplete"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["hoverhilight_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["hoverhilight_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["How to color other player's level."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["How to color player's name."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Keep Info"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Keep Lots Of Info"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Keep player information between session for all players except cross-server players"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Keep player information between session, but limit it to friends and guild members."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Let TasteTheNaimbow set the common color for unknown player names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Level Color Mode"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["linkifycommon_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["linkifycommon_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["No additional coloring"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["None"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Player Color Mode"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Player name formating options."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["PlayerNames"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Prat_Playernames: Stored Player Data Cleared"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Random"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["realidcolor_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["realidcolor_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Reset Settings"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Restore default settings, and delete stored character data."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Set common color of unknown player names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Sets common color of brackets to use around player names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Sets style of brackets to use around player names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Group"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Level"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Show Raid Target Icon"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Square"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Tab completion : "] = "",--]] 
		--[[Translation missing --]]
		--[[ ["tabcomplete_name"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle group invites by alt-clicking on player name."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle level showing."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle raid group showing."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle showing the raid target icon which is currently on the player."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle tab completion of player names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle using a common color for brackets around player names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Toggle using a common color for unknown player names."] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Too many matches (%d possible)"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Unknown Common Color"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Unknown Common Color From TasteTheNaimbow"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Unknown Use Common Color"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Use Channel Color"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Use Player Color"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["Use toon name for RealID"] = "",--]] 
	}
}

    PL:AddLocale(PRAT_MODULE, "esMX",L)


  L=
{
	["PlayerNames"] = {
		["Actively Query Player Info"] = "ÐÐºÑ‚Ð¸Ð²Ð½Ñ‹Ð¹ Ð·Ð°Ð¿Ñ€Ð¾Ñ Ð¸Ð½Ñ„Ñ‹ Ð¾ Ð¸Ð³Ñ€Ð¾ÐºÐµ",
		["Angled"] = "Ð¢Ñ€ÐµÑƒÐ³Ð¾Ð»ÑŒÐ½Ñ‹Ðµ",
		["Brackets"] = "Ð¡ÐºÐ¾Ð±ÐºÐ¸",
		["Brackets Common Color"] = "ÐžÑÐ½Ð¾Ð²Ð½Ð¾Ð¹ Ñ†Ð²ÐµÑ‚ ÑÐºÐ¾Ð±Ð¾Ðº",
		["Brackets Use Common Color"] = "Ð¡ÐºÐ¾Ð±ÐºÐ¸ Ð¾Ð±Ñ‰ÐµÐ³Ð¾ Ñ†Ð²ÐµÑ‚Ð°",
		["Class"] = "ÐšÐ»Ð°ÑÑ",
		["Color by Level Difference"] = "ÐžÐºÑ€Ð°ÑˆÐ¸Ð²Ð°Ð½Ð¸Ðµ Ð¿Ð¾ Ð¾Ñ‚Ð»Ð¸Ñ‡Ð¸ÑŽ Ð² ÑƒÑ€Ð¾Ð²Ð½Ðµ",
		["coloreverywhere_desc"] = "ÐžÐºÑ€Ð°ÑÐºÐ° Ñ‚ÐµÐºÑÑ‚ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ñ Ð² Ñ†Ð²ÐµÑ‚ Ð¸Ð¼ÐµÐ½Ð¸ Ð¸Ð³Ñ€Ð¾ÐºÐ°, ÐµÑÐ»Ð¸ Ñ†Ð²ÐµÑ‚ Ð·Ð°Ð´Ð°Ð½",
		["coloreverywhere_name"] = "Ð¦Ð²ÐµÑ‚ Ð¸Ð¼ÐµÐ½Ð¸ Ð²ÐµÐ·Ð´Ðµ",
		["Enable Alt-Invite"] = "Ð’ÐºÐ»ÑŽÑ‡Ð¸Ñ‚ÑŒ Ð¿Ñ€Ð¸Ð³Ð»Ð°ÑˆÐµÐ½Ð¸Ðµ Ñ ÐºÐ½Ð¾Ð¿ÐºÐ¾Ð¹ Alt",
		["Enable Invite Links"] = "Ð’ÐºÐ»ÑŽÑ‡Ð¸Ñ‚ÑŒ Ð¿Ñ€Ð¸Ð³Ð»Ð°ÑˆÐµÐ½Ð¸Ðµ Ð¿Ð¾ ÑÑÑ‹Ð»ÐºÐ°Ð¼",
		["Enable TabComplete"] = "Ð’ÐºÐ»ÑŽÑ‡Ð¸Ñ‚ÑŒ TabComplete",
		["hoverhilight_desc"] = "ÐŸÐ¾Ð´ÑÐ²ÐµÑ‡Ð¸Ð²Ð°ÐµÑ‚ ÑÑ‚Ñ€Ð¾ÐºÐ¸ Ñ‡Ð°Ñ‚Ð° Ð¾Ñ‚ Ð¾Ð¿Ñ€ÐµÐ´ÐµÐ»ÐµÐ½Ð½Ñ‹Ñ… Ð¸Ð³Ñ€Ð¾ÐºÐ¾Ð² Ð¿Ñ€Ð¸ Ð½Ð°Ð²ÐµÐ´ÐµÐ½Ð¸Ð¸ Ð¼Ñ‹ÑˆÐºÐ¾Ð¹ Ð½Ð° Ð¸Ñ… Ð½Ð¸ÐºÐ½ÐµÐ¹Ð¼.",
		["hoverhilight_name"] = "ÐŸÐ¾Ð´ÑÐ²ÐµÑ‚ÐºÐ° Ð¿Ñ€Ð¸ Ð½Ð°Ð²ÐµÐ´ÐµÐ½Ð¸Ð¸ Ð¼Ñ‹ÑˆÐºÐ¾Ð¹",
		["How to color other player's level."] = "ÐšÐ°Ðº Ð¾ÐºÑ€Ð°ÑˆÐ¸Ð²Ð°Ñ‚ÑŒ ÑƒÐ¿Ð¾Ð²ÐµÐ½ÑŒ Ð¸Ð³Ñ€Ð¾ÐºÐ°.",
		["How to color player's name."] = "ÐšÐ°Ðº Ð¾ÐºÑ€Ð°ÑˆÐ¸Ð²Ð°Ñ‚ÑŒ Ð¸Ð¼Ñ Ð¸Ð³Ñ€Ð¾ÐºÐ°.",
		["Keep Info"] = "Ð¥Ñ€Ð°Ð½Ð¸Ñ‚ÑŒ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸ÑŽ",
		["Keep Lots Of Info"] = "Ð¥Ñ€Ð°Ð½Ð¸Ñ‚ÑŒ Ð±Ð¾Ð»ÑŒÑˆÐ¾Ðµ ÐºÐ¾Ð»Ð¸Ñ‡ÐµÑÑ‚Ð²Ð¾ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸Ð¸",
		["Keep player information between session for all players except cross-server players"] = "Ð¥Ñ€Ð°Ð½Ð¸Ñ‚ÑŒ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸ÑŽ Ð¾ Ð²ÑÐµÑ… ÑÐ¾Ð±ÐµÑÐµÐ´Ð½Ð¸ÐºÐ°Ñ… Ð¼ÐµÐ¶Ð´Ñƒ ÑÐµÑÑÐ¸ÑÐ¼Ð¸ Ð·Ð° Ð¸ÑÐºÐ»ÑŽÑ‡ÐµÐ½Ð¸ÐµÐ¼ Ð¸Ð³Ñ€Ð¾ÐºÐ¾Ð² Ñ Ð´Ñ€ÑƒÐ³Ð¸Ñ… ÑÐµÑ€Ð²ÐµÑ€Ð¾Ð²",
		["Keep player information between session, but limit it to friends and guild members."] = "Ð¥Ñ€Ð°Ð½Ð¸Ñ‚ÑŒ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸ÑŽ Ð¾ ÑÐ¾Ð±ÐµÑÐµÐ´Ð½Ð¸ÐºÐ°Ñ… Ð¼ÐµÐ¶Ð´Ñƒ ÑÐµÑÑÐ¸ÑÐ¼Ð¸, Ð½Ð¾ Ð¾Ð³Ñ€Ð°Ð½Ð¸Ñ‡Ð¸Ñ‚ÑŒ ÑÑ‚Ð¾Ñ‚ ÑÐ¿Ð¸ÑÐ¾Ðº Ñ‚Ð¾Ð»ÑŒÐºÐ¾ Ð´Ñ€ÑƒÐ·ÑŒÑÐ¼Ð¸ Ð¸ Ñ‡Ð»ÐµÐ½Ð°Ð¼Ð¸ Ð³Ð¸Ð»ÑŒÐ´Ð¸Ð¸.",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "ÐŸÐ¾Ð·Ð²Ð¾Ð»Ð¸Ñ‚ÑŒ TasteTheNaimbow ÑƒÑÑ‚Ð°Ð½Ð¾Ð²Ð¸Ñ‚ÑŒ Ð¾Ð±Ñ‰Ð¸Ð¹ Ñ†Ð²ÐµÑ‚Ð´Ð»Ñ Ð½ÐµÐ¸Ð·Ð²ÐµÑÑ‚Ð½Ñ‹Ñ… Ð¸Ð³Ñ€Ð°ÐºÐ¾Ð².",
		["Level Color Mode"] = "Ð ÐµÐ¶Ð¸Ð¼ Ð¾ÐºÑ€Ð°ÑˆÐ¸Ð²Ð°Ð½Ð¸Ñ ÑƒÑ€Ð¾Ð²Ð½Ñ",
		["linkifycommon_desc"] = "ÐžÐ±Ñ‰Ð¸Ðµ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ñ Ñ ÑÑ‹Ð»ÐºÐ°Ð¼Ð¸",
		["linkifycommon_name"] = "ÐžÐ±Ñ‰Ð¸Ðµ ÑÐ¾Ð¾Ð±Ñ‰ÐµÐ½Ð¸Ñ Ñ ÑÑ‹Ð»ÐºÐ°Ð¼Ð¸",
		["No additional coloring"] = "ÐžÑ‚ÐºÐ»ÑŽÑ‡Ð¸Ñ‚ÑŒ Ð´Ð¾Ð¿Ð¾Ð»Ð½Ð¸Ñ‚ÐµÐ»ÑŒÐ½Ð¾Ðµ Ñ†Ð²ÐµÑ‚Ð¾-Ð²Ñ‹Ð´ÐµÐ»ÐµÐ½Ð¸Ðµ",
		["None"] = "ÐÐµÑ‚",
		["Player Color Mode"] = "Ð ÐµÐ¶Ð¸Ð¼ Ñ†Ð²ÐµÑ‚Ð° Ð¸Ð³Ñ€Ð¾ÐºÐ°",
		["Player name formating options."] = "ÐÐ°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸ Ñ„Ð¾Ñ€Ð¼Ð°Ñ‚Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ñ Ð¸Ð¼ÐµÐ½Ð¸ ÑÐ¾Ð±ÐµÑÐµÐ´Ð½Ð¸ÐºÐ°.",
		["PlayerNames"] = "Ð˜Ð¼Ñ Ð¸Ð³Ñ€Ð¾ÐºÐ°",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames: Ð˜Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸Ñ Ð¾ ÑÐ¾Ð±ÐµÑÐµÐ´Ð½Ð¸ÐºÐ°Ñ… Ð¾Ñ‡Ð¸Ñ‰ÐµÐ½Ð°",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "Ð—Ð°Ð¿Ñ€Ð¾Ñ ÑÐµÑ€Ð²ÐµÑ€Ð° Ð´Ð»Ñ Ð²ÑÐµÑ… Ð½ÐµÐ¸Ð·Ð²ÐµÑÑ‚Ð½Ñ‹Ñ… Ð¸Ð³Ñ€Ð°ÐºÐ¾Ð². Ð—Ð°Ð¼ÐµÑ‚ÐºÐ°: Ð­Ñ‚Ð¾ Ð¿Ñ€Ð¾Ð¸ÑÑ…Ð¾Ð´Ð¸Ñ‚ Ð´Ð°ÑÑ‚Ð°Ñ‚Ð¾Ñ‡Ð½Ð¾ Ð¼ÐµÐ´Ð»ÐµÐ½Ð½Ð¾, Ð¸ Ð¸Ñ… Ð´Ð°Ð½Ð½Ñ‹Ðµ Ð½Ðµ ÑÐ¾Ñ…Ñ€Ð°Ð½ÑÑŽÑ‚ÑÑ.",
		["Random"] = "Ð¡Ð»ÑƒÑ‡Ð°Ð¹Ð½Ð¾",
		["realidcolor_desc"] = "ÐžÐºÑ€Ð°ÑˆÐ¸Ð²Ð°Ð½Ð¸Ðµ Ð¸Ð¼ÐµÐ½ RealID",
		["realidcolor_name"] = "RealID Ð¦Ð²ÐµÑ‚",
		["Reset Settings"] = "Ð¡Ð±Ñ€Ð¾Ñ Ð½Ð°ÑÑ‚Ñ€Ð¾ÐµÐº",
		["Restore default settings, and delete stored character data."] = "Ð’Ð¾ÑÑÑ‚Ð°Ð½Ð¾Ð²Ð¸Ñ‚ÑŒ Ð½Ð°ÑÑ‚Ñ€Ð¾Ð¹ÐºÐ¸ Ð¿Ð¾ ÑƒÐ¼Ð¾Ð»Ñ‡Ð°Ð½Ð¸ÑŽ Ð¸ ÑƒÐ´Ð°Ð»Ð¸Ñ‚ÑŒ ÑÐ¾Ñ…Ñ€Ð°Ð½ÐµÐ½Ð½ÑƒÑŽ Ð¸Ð½Ñ„Ð¾Ñ€Ð¼Ð°Ñ†Ð¸ÑŽ Ð¾ ÑÐ¾Ð±ÐµÑÐµÐ´Ð½Ð¸ÐºÐ°Ñ….",
		["Set common color of unknown player names."] = "Ð’Ñ‹Ð±Ð¾Ñ€ Ñ†Ð²ÐµÑ‚Ð°, ÐºÐ¾Ñ‚Ð¾Ñ€Ñ‹Ð¼ Ð±ÑƒÐ´ÑƒÑ‚ Ð¾ÐºÑ€Ð°ÑˆÐµÐ½Ñ‹ Ð½ÐµÐ¸Ð·Ð²ÐµÑÑ‚Ð½Ñ‹Ðµ Ð¸Ð³Ñ€Ð¾ÐºÐ¸.",
		["Sets common color of brackets to use around player names."] = "Ð£ÑÑ‚Ð°Ð½Ð¾Ð²Ð¸Ñ‚ÑŒ Ñ†Ð²ÐµÑ‚ ÑÐºÐ¾Ð±Ð¾Ðº, Ð¾ÐºÑ€ÑƒÐ¶Ð°ÑŽÑ‰Ð¸Ñ… Ð¸Ð¼Ñ Ð¸Ð³Ñ€Ð¾ÐºÐ°.",
		["Sets style of brackets to use around player names."] = "Ð£ÑÑ‚Ð°Ð½Ð¾Ð²Ð¸Ñ‚ÑŒ ÑÑ‚Ð¸Ð»ÑŒ ÑÐºÐ¾Ð±Ð¾Ðº Ð²Ð¾ÐºÑ€ÑƒÐ³ Ð¸Ð¼ÐµÐ½Ð¸ ÑÐ¾Ð±ÐµÑÐµÐ´Ð½Ð¸ÐºÐ°.",
		["Show Group"] = "ÐŸÐ¾ÐºÐ°Ð·Ñ‹Ð²Ð°Ñ‚ÑŒ Ð³Ñ€ÑƒÐ¿Ð¿Ñƒ",
		["Show Level"] = "ÐŸÐ¾ÐºÐ°Ð·Ñ‹Ð²Ð°Ñ‚ÑŒ ÑƒÑ€Ð¾Ð²ÐµÐ½ÑŒ",
		["Show Raid Target Icon"] = "ÐŸÐ¾ÐºÐ°Ð·Ð°Ñ‚ÑŒ Ð¸ÐºÐ¾Ð½ÐºÑƒ Ñ†ÐµÐ»Ð¸ Ñ€ÐµÐ¹Ð´Ð°",
		["Square"] = "ÐšÐ²Ð°Ð´Ñ€Ð°Ñ‚Ð½Ñ‹Ðµ",
		["Tab completion : "] = "Ð—Ð°Ð²ÐµÑ€ÑˆÐµÐ½Ð¸Ðµ Ð·Ð°ÐºÐ»Ð°Ð´ÐºÐ¸ : ",
		["tabcomplete_name"] = "Ð’Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ñ‹Ðµ Ð¸Ð¼ÐµÐ½Ð°",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "Ð’ÐºÐ»/Ð²Ñ‹ÐºÐ» Ð¿Ñ€Ð¸Ð³Ð»Ð°ÑˆÐµÐ½Ð¸Ðµ Ð² Ð³Ñ€ÑƒÐ¿Ð¿Ñƒ Ñ Ð¿Ð¾Ð¼Ð¾Ñ‰ÑŒÑŽ alt+ÐºÐ»Ð¸Ðº Ð¿Ð¾ ÐºÐ»ÑŽÑ‡ÐµÐ²Ð¾Ð¼Ñƒ ÑÐ»Ð¾Ð²Ñƒ Ñ‚Ð¸Ð¿Ð°: 'Ð¸Ð½Ð²Ð°Ð¹Ñ‚'.",
		["Toggle group invites by alt-clicking on player name."] = "Ð’ÐºÐ»ÑŽÑ‡Ð¸Ñ‚ÑŒ Ñ€ÐµÐ¶Ð¸Ð¼, Ð² ÐºÐ¾Ñ‚Ð¾Ñ€Ð¾Ð¼ Ð¼Ð¾Ð¶Ð½Ð¾ Ð¿Ñ€Ð¸Ð³Ð»Ð°ÑÐ¸Ñ‚ÑŒ Ð¸Ð³Ñ€Ð¾ÐºÐ° Ð² Ð³Ñ€ÑƒÐ¿Ð¿Ñƒ Ñ‰ÐµÐ»ÐºÐ½ÑƒÐ² Ð¿Ð¾ ÐµÐ³Ð¾ Ð¸Ð¼ÐµÐ½Ð¸  Ñ Ð½Ð°Ð¶Ð°Ñ‚Ð¾Ð¹ ÐºÐ»Ð°Ð²Ð¸ÑˆÐµÐ¹ Alt.",
		["Toggle level showing."] = "Ð’ÐºÐ»/Ð²Ñ‹ÐºÐ» Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ ÑƒÑ€Ð¾Ð²Ð½Ñ ÑÐ¾Ð±ÐµÑÐµÐ´Ð½Ð¸ÐºÐ°.",
		["Toggle raid group showing."] = "Ð’ÐºÐ»/Ð²Ñ‹ÐºÐ» Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ñ Ñ€ÐµÐ¹Ð´Ð¾Ð²Ð¾Ð¹ Ð³Ñ€ÑƒÐ¿Ð¿Ñ‹.",
		["Toggle showing the raid target icon which is currently on the player."] = "Ð’ÐºÐ»/Ð’Ñ‹ÐºÐ» Ð¾Ñ‚Ð¾Ð±Ñ€Ð°Ð¶ÐµÐ½Ð¸Ðµ Ð¸ÐºÐ¾Ð½ÐºÐ¸ Ñ†ÐµÐ»Ð¸ Ñ€ÐµÐ¹Ð´Ð° ÐºÐ¾Ñ‚Ð¾Ñ€Ð¾Ð¹ Ð¿Ð¾Ð¼ÐµÑ‡ÐµÐ½ Ð¸Ð³Ñ€Ð¾Ðº.",
		["Toggle tab completion of player names."] = "Ð’ÐºÐ»/Ð²Ñ‹ÐºÐ» Ð·Ð°Ð²ÐµÑ€ÑˆÐµÐ½Ð¸Ðµ Ð·Ð°ÐºÐ»Ð°Ð´ÐºÐ¸ Ð¸Ð¼ÐµÐ½Ð°Ð¼Ð¸ Ð¸Ð³Ñ€Ð°ÐºÐ°.",
		["Toggle using a common color for brackets around player names."] = "Ð’ÐºÐ»ÑŽÑ‡Ð¸Ñ‚ÑŒ Ð¾ÐºÑ€Ð°ÑˆÐ¸Ð²Ð°Ð½Ð¸Ðµ ÑÐºÐ¾Ð±Ð¾Ðº Ð²Ð¾ÐºÑ€ÑƒÐ³ Ð¸Ð¼ÐµÐ½Ð¸ Ð¸Ð³Ñ€Ð¾ÐºÐ° Ð¾Ð±Ñ‰Ð¸Ð¼, Ð²Ñ‹Ð±Ñ€Ð°Ð½Ð½Ñ‹Ð¼ Ñ†Ð²ÐµÑ‚Ð¾Ð¼.",
		["Toggle using a common color for unknown player names."] = "Ð’ÐºÐ»ÑŽÑ‡Ð¸Ñ‚ÑŒ Ð¾ÐºÑ€Ð°ÑˆÐ¸Ð²Ð°Ð½Ð¸Ðµ Ð¸Ð¼ÐµÐ½ Ð²ÑÐµÑ… Ð½ÐµÐ¸Ð·Ð²ÐµÑÑ‚Ð½Ñ‹Ñ… ÑÐ¾Ð±ÐµÑÐµÐ´Ð½Ð¸ÐºÐ¾Ð² Ð² Ð¾Ð±Ñ‰Ð¸Ð¹ Ñ†Ð²ÐµÑ‚.",
		["Too many matches (%d possible)"] = "Ð—Ð° Ð¼Ð½Ð¾Ð³Ð¾ ÑÐ¾Ð²Ð¿Ð°Ð´ÐµÐ½Ð¸Ðµ (%d Ð²Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ñ‹Ñ…)",
		["Unknown Common Color"] = "ÐžÐ±Ñ‰Ð¸Ð¹ Ñ†Ð²ÐµÑ‚ Ð½ÐµÐ¸Ð·Ð²ÐµÑÑ‚Ð½Ñ‹Ñ…",
		["Unknown Common Color From TasteTheNaimbow"] = "ÐžÐ±Ñ‰Ð°Ñ Ð¾ÐºÑ€Ð°ÑÐºÐ° Ð½ÐµÐ¸Ð·Ð²ÐµÑÑ‚Ð½Ñ‹Ñ… Ð¸Ð· TasteTheNaimbow",
		["Unknown Use Common Color"] = "ÐžÐ±Ñ‰Ð¸Ð¹ Ñ†Ð²ÐµÑ‚ Ð´Ð»Ñ Ð½ÐµÐ¸Ð·Ð²ÐµÑÑ‚Ð½Ñ‹Ñ…",
		["Use Channel Color"] = "Ð˜ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÑŒ Ñ†Ð²ÐµÑ‚ ÐºÐ°Ð½Ð°Ð»Ð°",
		["Use Player Color"] = "Ð˜ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÑŒ Ñ†Ð²ÐµÑ‚ Ð¸Ð³Ñ€Ð¾ÐºÐ°",
		["Use toon name for RealID"] = "Ð˜ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ñ‚ÑŒ Ð¸Ð¼Ñ Ð¿ÐµÑ€ÑÐ¾Ð½Ð°Ð¶Ð° Ð²Ð¼ÐµÑÑ‚Ð¾ RealID",
	}
}

    PL:AddLocale(PRAT_MODULE, "ruRU",L)


  L=
{
	["PlayerNames"] = {
		["Actively Query Player Info"] = "æ´»è·ƒçš„æŸ¥è¯¢çŽ©å®¶ä¿¡æ¯",
		["Angled"] = "æŠ˜è§’",
		["Brackets"] = "æ‹¬å·",
		["Brackets Common Color"] = "åŒä¸€é¢œè‰²æ‹¬å·",
		["Brackets Use Common Color"] = "ä½¿ç”¨åŒä¸€é¢œè‰²æ‹¬å·",
		["Class"] = "èŒä¸š",
		["Color by Level Difference"] = "å½©è‰²çš„ç­‰çº§å·®åˆ«",
		["coloreverywhere_desc"] = "å½©è‰²æ˜¾ç¤ºèŠå¤©ä¿¡æ¯ä¸­å‡ºçŽ°çš„çŽ©å®¶å§“å",
		["coloreverywhere_name"] = "å½©è‰²æ˜¾ç¤ºå§“ååœ¨æ‰€æœ‰åœ°æ–¹",
		["Enable Alt-Invite"] = "å¯ç”¨Alt-é‚€è¯·",
		["Enable Invite Links"] = "å¯ç”¨é‚€è¯·é“¾æŽ¥",
		["Enable TabComplete"] = "å¯ç”¨Tabé”®è¡¥å…¨",
		["hoverhilight_desc"] = "å½“æ‚¬åœåœ¨çŽ©å®¶é“¾æŽ¥ä¸Šæ—¶é«˜äº®è¯¥çŽ©å®¶çš„èŠå¤©è¯­å¥",
		["hoverhilight_name"] = "æ‚¬åœé«˜äº®",
		["How to color other player's level."] = "å¦‚ä½•ç€è‰²å…¶ä»–çŽ©å®¶çš„ç­‰çº§",
		["How to color player's name."] = "å¦‚ä½•ç€è‰²çŽ©å®¶çš„åç§°",
		["Keep Info"] = "ä¿æŒä¿¡æ¯",
		["Keep Lots Of Info"] = "ä¿æŒå¤§é‡çš„ä¿¡æ¯",
		["Keep player information between session for all players except cross-server players"] = "ä¸ºé™¤è·¨æœçŽ©å®¶å¤–çš„æ‰€æœ‰çŽ©å®¶åœ¨ä¼šè¯é—´ä¿æŒçŽ©å®¶ä¿¡æ¯",
		["Keep player information between session, but limit it to friends and guild members."] = "åœ¨ä¼šè¯é—´ä¿æŒçŽ©å®¶ä¿¡æ¯,ä½†ä»…é™äºŽæœ‹å‹å’Œå…¬ä¼šæˆå‘˜",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "è®©TasteTheNaimbow(æ’ä»¶)ä¸ºæœªçŸ¥çŽ©å®¶åç§°è®¾ç½®å…¬å…±é¢œè‰²",
		["Level Color Mode"] = "ç­‰çº§ç€è‰²æ¨¡å¼",
		["linkifycommon_desc"] = "è‡ªåŠ©é“¾æŽ¥å…¬å…±ä¿¡æ¯",
		["linkifycommon_name"] = "è‡ªåŠ©é“¾æŽ¥å…¬å…±ä¿¡æ¯",
		["No additional coloring"] = "æ— é¢å¤–ç€è‰²",
		["None"] = "æ— ",
		["Player Color Mode"] = "çŽ©å®¶ç€è‰²æ¨¡å¼",
		["Player name formating options."] = "çŽ©å®¶åç§°æ ¼å¼é€‰é¡¹",
		["PlayerNames"] = "çŽ©å®¶åç§°",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_çŽ©å®¶åç§°: çŽ©å®¶æ•°æ®å­˜å‚¨å·²æ¸…é™¤",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "ä¸ºæ‰€æœ‰æœªçŸ¥çŽ©å®¶æŸ¥è¯¢æœåŠ¡å™¨,æ³¨æ„:è¿™å°†éžå¸¸ç¼“æ…¢,å¹¶ä¸”æ•°æ®ä¸ä¼šè¢«å­˜å‚¨",
		["Random"] = "éšæœº",
		["realidcolor_desc"] = "å®žååå­—é¢œè‰²",
		["realidcolor_name"] = "å®žåé¢œè‰²",
		["Reset Settings"] = "é‡ç½®è®¾ç½®",
		["Restore default settings, and delete stored character data."] = "æ¢å¤é»˜è®¤è®¾ç½®å¹¶åˆ é™¤å·²å­˜è§’è‰²æ•°æ®",
		["Set common color of unknown player names."] = "è®¾ç½®æœªçŸ¥çŽ©å®¶åç§°å…±æœ‰é¢œè‰²",
		["Sets common color of brackets to use around player names."] = "è®¾ç½®ç”¨æ¥å›´ç»•çŽ©å®¶åç§°çš„æ‹¬å·é¢œè‰²",
		["Sets style of brackets to use around player names."] = "è®¾ç½®ç”¨æ¥å›´ç»•çŽ©å®¶åç§°çš„æ‹¬å·ç±»åž‹",
		["Show Group"] = "æ˜¾ç¤ºå›¢é˜Ÿ",
		["Show Level"] = "æ˜¾ç¤ºç­‰çº§",
		["Show Raid Target Icon"] = "æ˜¾ç¤ºå›¢é˜Ÿç›®æ ‡å›¾æ ‡",
		["Square"] = "ç›´è§’",
		["Tab completion : "] = "Tabé”®è¡¥å…¨",
		["tabcomplete_name"] = "å¯èƒ½çš„åç§°",
		["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "ç»„é˜Ÿé‚€è¯·ç”¨alt-ç‚¹å‡»è¶…é“¾æŽ¥çš„å…³é”®è¯å¦‚'é‚€è¯·'",
		["Toggle group invites by alt-clicking on player name."] = "ç»„é˜Ÿé‚€è¯·ç”¨alt-ç‚¹å‡»çŽ©å®¶åç§°",
		["Toggle level showing."] = "ç­‰çº§æ˜¾ç¤º",
		["Toggle raid group showing."] = "å›¢é˜Ÿåˆ†ç»„æ˜¾ç¤º",
		["Toggle showing the raid target icon which is currently on the player."] = "æ˜¾ç¤ºå½“å‰çŽ©å®¶çš„å›¢é˜Ÿç›®æ ‡å›¾æ ‡",
		["Toggle tab completion of player names."] = "Tabé”®è¡¥å…¨çŽ©å®¶å§“å",
		["Toggle using a common color for brackets around player names."] = "ä¸ºæ‹¬å·å†…çŽ©å®¶å§“åä½¿ç”¨å…¬å…±é¢œè‰²",
		["Toggle using a common color for unknown player names."] = "ä¸ºä½ç½®æœªçŸ¥çŽ©å®¶åç§°ä½¿ç”¨å…¬å…±é¢œè‰²",
		["Too many matches (%d possible)"] = "å¤ªå¤šçš„åŒ¹é… (%då¯èƒ½çš„)",
		["Unknown Common Color"] = "æœªçŸ¥å…¬å…±é¢œè‰²",
		["Unknown Common Color From TasteTheNaimbow"] = "æœªçŸ¥å…¬å…±é¢œè‰²è‡ªTasteTheNaimbow",
		["Unknown Use Common Color"] = "æœªçŸ¥ä½¿ç”¨å…¬å…±é¢œè‰²",
		["Use Channel Color"] = "ä½¿ç”¨é¢‘é“é¢œè‰²",
		["Use Player Color"] = "ä½¿ç”¨çŽ©å®¶é¢œè‰²",
		["Use toon name for RealID"] = "ä½¿ç”¨è§’è‰²åä»£æ›¿æˆ˜ç½‘ID",
	}
}

    PL:AddLocale(PRAT_MODULE, "zhCN",L)


  L=
{
	["PlayerNames"] = {
		["Actively Query Player Info"] = "Pedir InformaciÃ³n de Jugador Activamente",
		["Angled"] = "Angulo",
		["Brackets"] = "Corchetes",
		["Brackets Common Color"] = "Color ComÃºn Corchetes",
		["Brackets Use Common Color"] = "Utilizar Color ComÃºn Corchetes",
		["Class"] = "Clase",
		["Color by Level Difference"] = "Color por Diferencia de Nivel",
		["coloreverywhere_desc"] = "Colorear nombres de jugadores si ellos aparecen en el texto de los mensajes del chat.",
		["coloreverywhere_name"] = "Colorear Nombres Siempre",
		["Enable Alt-Invite"] = "Habilitar Alt-Invitar",
		["Enable Invite Links"] = "Habilitar Enlaces Invitar",
		["Enable TabComplete"] = "Habilitar Ficha completa",
		["hoverhilight_desc"] = "Resaltar lÃ­neas de chat de un jugador al situarse sobre su enlace de jugador",
		--[[Translation missing --]]
		--[[ ["hoverhilight_name"] = "",--]] 
		["How to color other player's level."] = "CÃ³mo el color de otro jugador de nivel.",
		["How to color player's name."] = "CÃ³mo el color de nombre del jugador.",
		["Keep Info"] = "Mantener InformaciÃ³n",
		["Keep Lots Of Info"] = "Mantener Mucha InformaciÃ³n",
		["Keep player information between session for all players except cross-server players"] = "Mantiene informaciÃ³n de jugadores entre sesiones para todos los jugadores excepto entre servidores",
		["Keep player information between session, but limit it to friends and guild members."] = "Mantiene informaciÃ³n de jugadores entre sesiones, pero lo limita a amigos y miembros de la hermandad.",
		["Let TasteTheNaimbow set the common color for unknown player names."] = "Deje a TasteTheNaimbow establecer el color comÃºn para nombres de jugador desconocidos.",
		["Level Color Mode"] = "Modo Color por Nivel",
		["linkifycommon_desc"] = "Linkify Common Messages",
		["linkifycommon_name"] = "Enlazar Mensajes Comunes",
		["No additional coloring"] = "Sin color adicional",
		["None"] = "Ninguno",
		["Player Color Mode"] = "Modo Color del Jugador",
		["Player name formating options."] = "Opciones de formato del nombre de jugador.",
		["PlayerNames"] = "Nombre del Jugador",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernames: Limpiados los Datos de Jugador Guardados",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "Consulta el servidor para todos los nombres de jugador que desconocemos. Nota: esto sucede muy lentamente, y estos datos no se guardan.",
		["Random"] = "Aleatorio",
		--[[Translation missing --]]
		--[[ ["realidcolor_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["realidcolor_name"] = "",--]] 
		["Reset Settings"] = "Restablecer Ajustes",
		["Restore default settings, and delete stored character data."] = "Restablece ajustes por defecto, y eliminar informaciÃ³n del jugador guardada.",
		["Set common color of unknown player names."] = "Establece el color comÃºn para los nombres de jugadores desconocidos.",
		["Sets common color of brackets to use around player names."] = "Establece el color comÃºn de los corchetes a utilizar en torno a los nombres de jugador.",
		["Sets style of brackets to use around player names."] = "Establece el estilo de los corchetes a utilizar en torno a los nombres de jugador.",
		["Show Group"] = "Mostrar Grupo",
		["Show Level"] = "Mostrar Nivel",
		["Show Raid Target Icon"] = "Mostrar Icono Objetivo Banda",
		["Square"] = "Cuadrado",
		["Tab completion : "] = "FinalizaciÃ³n de PestaÃ±a : ",
		["tabcomplete_name"] = "Nombres Posibles",
		--[[Translation missing --]]
		--[[ ["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "",--]] 
		["Toggle group invites by alt-clicking on player name."] = "Activa invitar a grupo al hacer alt-click en el nombre del jugador.",
		["Toggle level showing."] = "Alterna mostrar nivel.",
		["Toggle raid group showing."] = "Alterna mostrar grupo de raid.",
		["Toggle showing the raid target icon which is currently on the player."] = "Altterna mostrar el icono de objetivo de banda que estÃ¡ en el jugador.",
		["Toggle tab completion of player names."] = "Alterna la finalizaciÃ³n de la pestaÃ±a de nombres de jugador.",
		["Toggle using a common color for brackets around player names."] = "Alterna utilizar un color comÃºn de corchetes en torno a los nombres de jugador.",
		["Toggle using a common color for unknown player names."] = "Alterna el utilizar un color comÃºn para los nombres de jugadores desconocidos.",
		["Too many matches (%d possible)"] = "Demasiadas coincidencias (%d posibles)",
		["Unknown Common Color"] = "Color ComÃºn Desconocido",
		["Unknown Common Color From TasteTheNaimbow"] = "Color ComÃºn Desconocido de TasteTheNaimbow",
		["Unknown Use Common Color"] = "Desconocido Color de Uso ComÃºn",
		["Use Channel Color"] = "Utilizar Color Canal",
		["Use Player Color"] = "Utilizar Color Jugador",
		--[[Translation missing --]]
		--[[ ["Use toon name for RealID"] = "",--]] 
	}
}

    PL:AddLocale(PRAT_MODULE, "esES",L)


  L=
{
	["PlayerNames"] = {
		["Actively Query Player Info"] = "ä¸»å‹•æŸ¥è©¢çŽ©å®¶è³‡è¨Š",
		["Angled"] = "è§’",
		["Brackets"] = "æ‹¬è™Ÿ",
		["Brackets Common Color"] = "æ‹¬è™Ÿé€šç”¨è‰²å½©",
		["Brackets Use Common Color"] = "æ‹¬è™Ÿä½¿ç”¨çš„é€šç”¨è‰²å½©",
		["Class"] = "è·æ¥­",
		["Color by Level Difference"] = "ç­‰ç´šå·®ç•°è‰²å½©",
		["coloreverywhere_desc"] = "ç•¶çŽ©å®¶åç¨±å‡ºç¾åœ¨èŠå¤©è¨Šæ¯æ–‡å­—ä¸­æ™‚ï¼Œç‚ºå…¶ä¸Šè‰²ã€‚",
		["coloreverywhere_name"] = "é¡è‰²åå­—åˆ°è™•",
		["Enable Alt-Invite"] = "å•Ÿç”¨ Alt æŒ‰éµé‚€è«‹",
		["Enable Invite Links"] = "å•Ÿç”¨é‚€è«‹é€£çµ",
		["Enable TabComplete"] = "å•Ÿç”¨ TabComplete",
		--[[Translation missing --]]
		--[[ ["hoverhilight_desc"] = "",--]] 
		["hoverhilight_name"] = "æ»‘é¼ æ‡¸åœé«˜äº®",
		["How to color other player's level."] = "å¦‚ä½•ç‚ºçŽ©å®¶ç­‰ç´šè‘—è‰²",
		["How to color player's name."] = "å¦‚ä½•ç‚ºçŽ©å®¶åç¨±è‘—è‰²",
		["Keep Info"] = "ä¿å­˜è³‡è¨Š",
		["Keep Lots Of Info"] = "ä¿å­˜å¤§é‡è³‡è¨Š",
		["Keep player information between session for all players except cross-server players"] = "ä¿å­˜æ­¤éšŽæ®µæ‰€æœ‰çŽ©å®¶è³‡è¨Šï¼Œé™¤äº†è·¨ä¼ºæœå™¨äººç‰©ã€‚",
		["Keep player information between session, but limit it to friends and guild members."] = "ä¿å­˜æ­¤éšŽæ®µçŽ©å®¶è³‡è¨Šï¼Œä½†é™åˆ¶ç‚ºå¥½å‹ä»¥åŠå…¬æœƒæˆå“¡ã€‚",
		--[[Translation missing --]]
		--[[ ["Let TasteTheNaimbow set the common color for unknown player names."] = "",--]] 
		["Level Color Mode"] = "ç­‰ç´šè‰²å½©æ¨¡å¼",
		["linkifycommon_desc"] = "è£½ä½œé€£çµå…±åŒçš„è¨Šæ¯",
		["linkifycommon_name"] = "è£½ä½œé€£çµå…±åŒçš„è¨Šæ¯",
		["No additional coloring"] = "ç„¡é¡å¤–è‘—è‰²",
		["None"] = "ç„¡",
		["Player Color Mode"] = "çŽ©å®¶è‰²å½©æ¨¡å¼",
		["Player name formating options."] = "çŽ©å®¶åç¨±æ ¼å¼åŒ–é¸é …ã€‚",
		["PlayerNames"] = "çŽ©å®¶åç¨±",
		["Prat_Playernames: Stored Player Data Cleared"] = "Prat_Playernamesï¼šå·²æ¸…é™¤å„²å­˜çš„çŽ©å®¶è³‡æ–™",
		["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."] = "æŸ¥è©¢æ‰€æœ‰æ­¤ä¼ºæœå™¨æˆ‘å€‘ä¸çŸ¥é“çš„è§’è‰²åç¨±ã€‚å‚™è¨»ï¼šé€™å€‹ç¨‹åºç›¸ç•¶ç·©æ…¢ä¸”ä¸¦ä¸æœƒå„²å­˜æ­¤è³‡æ–™ã€‚",
		["Random"] = "éš¨æ©Ÿ",
		["realidcolor_desc"] = "RealID åç¨±è‘—è‰²",
		["realidcolor_name"] = "RealID è‘—è‰²",
		["Reset Settings"] = "é‡ç½®è¨­å®š",
		["Restore default settings, and delete stored character data."] = "æ¢å¾©è‡³é è¨­å€¼ä¸”åˆªé™¤å„²å­˜çš„è§’è‰²è³‡æ–™ã€‚",
		["Set common color of unknown player names."] = "è¨­å®šæœªçŸ¥è§’è‰²çš„é¡¯ç¤ºè‰²å½©",
		["Sets common color of brackets to use around player names."] = "è¨­å®šç”¨ä¾†åœç¹žçŽ©å®¶åç¨±çš„æ‹¬è™Ÿé¡è‰²ã€‚",
		["Sets style of brackets to use around player names."] = "è¨­å®šç”¨ä¾†åœç¹žçŽ©å®¶åç¨±çš„æ‹¬è™Ÿé¡žåž‹ã€‚",
		["Show Group"] = "é¡¯ç¤ºéšŠä¼ç·¨è™Ÿ",
		["Show Level"] = "é¡¯ç¤ºç­‰ç´š",
		["Show Raid Target Icon"] = "é¡¯ç¤ºåœ˜éšŠæ¨™è¨˜",
		["Square"] = "æ–¹æ¡†",
		["Tab completion : "] = "æ¨™ç±¤å®Œæˆ:",
		["tabcomplete_name"] = "å¯èƒ½çš„åç¨± ",
		--[[Translation missing --]]
		--[[ ["Toggle group invites by alt-clicking hyperlinked keywords like 'invite'."] = "",--]] 
		["Toggle group invites by alt-clicking on player name."] = "çµ„éšŠé‚€è«‹ç”¨alt-é»žæ“ŠçŽ©å®¶åç¨±ã€‚",
		["Toggle level showing."] = "åˆ‡æ›ç­‰ç´šé¡¯ç¤ºã€‚",
		["Toggle raid group showing."] = "åˆ‡æ›åœ˜éšŠçµ„éšŠé¡¯ç¤ºã€‚",
		["Toggle showing the raid target icon which is currently on the player."] = "é¡¯ç¤ºç•¶å‰çŽ©å®¶çš„åœ˜éšŠç›®æ¨™åœ–æ¨™",
		["Toggle tab completion of player names."] = "åˆ‡æ›çŽ©å®¶åç¨±çš„æ¨™ç±¤å®Œæˆã€‚",
		["Toggle using a common color for brackets around player names."] = "é¸æ“‡æ˜¯å¦ç‚ºçŽ©å®¶åç¨±å¤–çš„æ‹¬è™Ÿä½¿ç”¨ä¸€å€‹é€šç”¨é¡è‰²",
		["Toggle using a common color for unknown player names."] = "åˆ‡æ›æœªçŸ¥çŽ©å®¶ä»¥ä¸€èˆ¬è‰²å½©é¡¯ç¤º",
		["Too many matches (%d possible)"] = "å¤ªå¤šç¬¦åˆ (å¯èƒ½ %d)",
		["Unknown Common Color"] = "æœªçŸ¥çš„æ–‡å­—é€šç”¨é¡è‰²",
		["Unknown Common Color From TasteTheNaimbow"] = "ä¾†è‡ªTasteTheNaimbow çš„æœªçŸ¥çš„æ–‡å­—é€šç”¨é¡è‰²",
		["Unknown Use Common Color"] = "æœªçŸ¥çš„æ–‡å­—ä½¿ç”¨é€šç”¨é¡è‰²",
		["Use Channel Color"] = "ä½¿ç”¨é »é“æ–‡å­—é¡è‰²",
		["Use Player Color"] = "ä½¿ç”¨è…³è‰²åç¨±æ–‡å­—è‰²å½©",
		--[[Translation missing --]]
		--[[ ["Use toon name for RealID"] = "",--]] 
	}
}

    PL:AddLocale(PRAT_MODULE, "zhTW",L)


  end
  --@end-non-debug@

  module.Classes = {}
  module.Levels = {}
  module.Subgroups = {}

  local NOP = function(self) return end

  module.OnPlayerDataChanged = NOP


  Prat:SetModuleDefaults(module.name, {
    realm = {
      classes = {},
      levels = {}
    },
    profile = {
      on = true,
      brackets = "Square",
      tabcomplete = true,
      tabcompletelimit = 20,
      level = true,
      levelcolor = "DIFFICULTY",
      subgroup = true,
      showtargeticon = false,
      keep = false,
      keeplots = false,
      colormode = "CLASS",
      realidcolor = "CLASS",
      realidname = false,
      coloreverywhere = true,
      usecommoncolor = true,
      bracketscommoncolor = true,
      linkifycommon = true,
      bracketscolor = {
        r = 0.85,
        g = 0.85,
        b = 0.85,
        a = 1.0
      },
      useTTN = true,
      usewho = false,
      color = {
        r = 0.65,
        g = 0.65,
        b = 0.65,
        a = 1.0
      },
    }
  })


  Prat:SetModuleInit(module,
    function(self)
    -- Right click - who

      UnitPopupButtons["WHOIS"] = {
        text = "Who Is?",
        dist = 0,
        func = function()
          local dropdownFrame = UIDROPDOWNMENU_INIT_MENU
          local name = dropdownFrame.name

          if name then
            SendWho(name)
          end
        end
      }
      tinsert(UnitPopupMenus["FRIEND"], #UnitPopupMenus["FRIEND"] - 1, "WHOIS");

      Prat:RegisterDropdownButton("WHOIS")
    end)

  module.pluginopts = {}

  Prat:SetModuleOptions(module, {
    name = PL["PlayerNames"],
    desc = PL["Player name formating options."],
    type = "group",
    plugins = module.pluginopts,
    args = {
      brackets = {
        name = PL["Brackets"],
        desc = PL["Sets style of brackets to use around player names."],
        type = "select",
        order = 110,
        values = { ["Square"] = PL["Square"], ["Angled"] = PL["Angled"], ["None"] = PL["None"] }
      },
      bracketscommoncolor = {
        name = PL["Brackets Use Common Color"],
        desc = PL["Toggle using a common color for brackets around player names."],
        type = "toggle",
        order = 111,
      },
      bracketscolor = {
        name = PL["Brackets Common Color"],
        desc = PL["Sets common color of brackets to use around player names."],
        type = "color",
        order = 112,
        get = "GetColorValue",
        set = "SetColorValue",
        disabled = function(info) return not info.handler.db.profile.bracketscommoncolor end,
      },
      usecommoncolor = {
        name = PL["Unknown Use Common Color"],
        desc = PL["Toggle using a common color for unknown player names."],
        type = "toggle",
        order = 120,
      },
      color = {
        name = PL["Unknown Common Color"],
        desc = PL["Set common color of unknown player names."],
        type = "color",
        order = 121,
        get = "GetColorValue",
        set = "SetColorValue",
        disabled = function(info) if not info.handler.db.profile.usecommoncolor then return true else return false
        end
        end,
      },
      useTTN = {
        name = PL["Unknown Common Color From TasteTheNaimbow"],
        desc = PL["Let TasteTheNaimbow set the common color for unknown player names."],
        type = "toggle",
        order = 122,
        hidden = function(info) if TasteTheNaimbow_Loaded then return false else return true end end,
        disabled = function(info) if not info.handler.db.profile.usecommoncolor then return true else return false
        end
        end,
      },
      colormode = {
        name = PL["Player Color Mode"],
        desc = PL["How to color player's name."],
        type = "select",
        order = 130,
        values = { ["RANDOM"] = PL["Random"], ["CLASS"] = PL["Class"], ["NONE"] = PL["None"] }
      },
      realidcolor = {
        name = PL["realidcolor_name"],
        desc = PL["realidcolor_desc"],
        type = "select",
        order = 135,
        values = { ["RANDOM"] = PL["Random"], ["CLASS"] = PL["Class"], ["NONE"] = PL["None"] }
      },
      realidname = {
        name = PL["Use toon name for RealID"],
        desc = PL["Use toon name for RealID"],
        type = "toggle",
        order = 136,
      },
      levelcolor = {
        name = PL["Level Color Mode"],
        desc = PL["How to color other player's level."],
        type = "select",
        order = 131,
        values = {
          ["PLAYER"] = PL["Use Player Color"],
          ["CHANNEL"] = PL["Use Channel Color"],
          ["DIFFICULTY"] = PL["Color by Level Difference"],
          ["NONE"] = PL["No additional coloring"]
        }
      },
      level = {
        name = PL["Show Level"],
        desc = PL["Toggle level showing."],
        type = "toggle",
        order = 140,
      },
      subgroup = {
        name = PL["Show Group"],
        desc = PL["Toggle raid group showing."],
        type = "toggle",
        order = 141,
      },
      showtargeticon = {
        name = PL["Show Raid Target Icon"],
        desc = PL["Toggle showing the raid target icon which is currently on the player."],
        type = "toggle",
        order = 142,
      },
      tabcomplete = {
        name = PL["Enable TabComplete"],
        desc = PL["Toggle tab completion of player names."],
        type = "toggle",
        order = 150,
        get = function(info) return info.handler.db.profile.tabcomplete end,
        set = function(info, v) info.handler.db.profile.tabcomplete = v; info.handler:TabComplete(v) end
      },
      keep = {
        name = PL["Keep Info"],
        desc = PL["Keep player information between session, but limit it to friends and guild members."],
        type = "toggle",
        order = 200,
      },
      keeplots = {
        name = PL["Keep Lots Of Info"],
        desc = PL["Keep player information between session for all players except cross-server players"],
        type = "toggle",
        order = 201,
        disabled = function(info) return not info.handler.db.profile.keep end,
      },
      usewho = {
        name = PL["Actively Query Player Info"],
        desc = PL["Query the server for all player names we do not know. Note: This happpens pretty slowly, and this data is not saved."],
        type = "toggle",
        order = 202,
        hidden = function(info)
          if LibStub:GetLibrary("LibWho-2.0", true) then
            return false
          end

          if GetAddOnInfo("LibWho-2.0") then
            return false
          end

          return true
        end
      },
      reset = {
        name = PL["Reset Settings"],
        desc = PL["Restore default settings, and delete stored character data."],
        type = "execute",
        order = 250,
        func = "resetStoredData"
      },
    }
  })

  function module:OnValueChanged(info, b)
    local field = info[#info]
    if field == "altinvite" or field == "linkinvite" then
      self:SetAltInvite()
    elseif field == "usewho" then
      if b and not LibStub:GetLibrary("LibWho-2.0", true) then
        LoadAddOn("LibWho-2.0")
      end
      self.wholib = b and LibStub:GetLibrary("LibWho-2.0", true)
      self:updateAll()
    elseif field == "coloreverywhere" then
      self:OnPlayerDataChanged(b and UnitName("player") or nil)
    end
  end

  local mt_GuildClass = {}


  function module:OnModuleEnable()
    Prat.RegisterChatEvent(self, "Prat_FrameMessage")
    Prat.RegisterChatEvent(self, "Prat_Ready")

    Prat.RegisterMessageItem("PREPLAYERDELIM", "PLAYER", "before")
    Prat.RegisterMessageItem("POSTPLAYERDELIM", "Ss", "after")

    Prat.RegisterMessageItem("PLAYERTARGETICON", "Ss", "after")

    Prat.EnableProcessingForEvent("CHAT_MSG_GUILD_ACHIEVEMENT")

    Prat.RegisterMessageItem("PLAYERLEVEL", "PREPLAYERDELIM", "before")
    Prat.RegisterMessageItem("PLAYERGROUP", "POSTPLAYERDELIM", "after")

    self:RegisterEvent("FRIENDLIST_UPDATE", "updateFriends")
    self:RegisterEvent("GUILD_ROSTER_UPDATE", "updateGuild")
    self:RegisterEvent("RAID_ROSTER_UPDATE", "updateRaid")
    self:RegisterEvent("PLAYER_LEVEL_UP", "updatePlayerLevel")

    if select(4, GetBuildInfo()) < 80000 then
      self:RegisterEvent("PARTY_MEMBERS_CHANGED", "updateParty")
    end
    self:RegisterEvent("PLAYER_TARGET_CHANGED", "updateTarget")
    self:RegisterEvent("UPDATE_MOUSEOVER_UNIT", "updateMouseOver")
    self:RegisterEvent("WHO_LIST_UPDATE", "updateWho")
    self:RegisterEvent("CHAT_MSG_SYSTEM", "updateWho") -- for short /who command

    self:RegisterEvent("PLAYER_LEAVING_WORLD", "EmptyDataCache")

    if self.db.profile.usewho then
      if not LibStub:GetLibrary("LibWho-2.0", true) then
        LoadAddOn("LibWho-2.0")
      end
      self.wholib = LibStub:GetLibrary("LibWho-2.0", true)
    end

    self:updatePlayer()
    self.NEEDS_INIT = true

    if IsInGuild() then
      GuildRoster()
    end

    self:TabComplete(self.db.profile.tabcomplete)
  end

  function module:OnModuleDisable()
    self:TabComplete(false)
    self:UnregisterAllEvents()
    Prat.UnregisterAllChatEvents(self)
  end


  function module:Prat_Ready()
    self:updateAll()
  end

  local cache = {
    module.Levels,
    module.Classes,
    module.Subgroups
  }


  function module:EmptyDataCache(force)
    for k, v in pairs(cache) do
      wipe(v)
    end

    self:updatePlayer()
    self.NEEDS_INIT = true
    self:OnPlayerDataChanged()
  end


  --[[------------------------------------------------
    Core Functions
  ------------------------------------------------]] --
  function module:GetDescription()
    return PL["Player name formating options."]
  end

  function module:updateAll()
    self:updatePlayer()
    self:updateParty()

	self:updateRaid()

    self:updateFriends()

    self.NEEDS_INIT = nil

    self:updateGuild(self.db.profile.keeplots)
  end


  function module:updateGF()
    if IsInGuild() then GuildRoster() end
    self:updateFriends()
    if GetNumBattlefieldScores() > 0 then
      self:updateBG()
    end
    self:updateWho()
    self:updateGuild()
  end

  function module:updatePlayer()
    local PlayerClass = select(2, UnitClass("player"))
    local Name, Server = UnitName("player")
    self:addName(Name, Server, PlayerClass, UnitLevel("player"), nil, "PLAYER")
  end

  function module:updatePlayerLevel(event, level, hp, mp, talentPoints, str, agi, sta, int, spi)
    local PlayerClass = select(2, UnitClass("player"))
    local Name, Server = UnitName("player")
    self:addName(Name, Server, PlayerClass, level, nil, "PLAYER")
  end


  function module:updateFriends()
    local Name, Class, Level
    for i = 1, GetNumFriends() do
      Name, Level, Class = GetFriendInfo(i) -- name, level, class, area, connected, status
      self:addName(Name, nil, Class, Level, nil, "FRIEND")
    end
  end



  function module:updateGuild()
    if IsInGuild()  then
      GuildRoster()

      local Name, Class, Level, _
      for i = 1, GetNumGuildMembers(true) do
        Name, _, _, Level, _, _, _, _, _, _, Class = GetGuildRosterInfo(i)

        -- GetGuildRosterInfo can return a nil name for an index whose data
        -- hasn't streamed in yet right after GuildRoster()/login (same race
        -- other functions in this file already guard against, e.g. updateBG
        -- below checks "if name then" before doing the same match). Without
        -- this check, Name:match() throws "attempt to index local 'Name'
        -- (a nil value)" and aborts the whole guild scan.
        if Name then
          local plr, svr = Name:match("([^%-]+)%-?(.*)")

          self:addName(plr, nil, Class, Level, nil, "GUILD")
          self:addName(plr, svr, Class, Level, nil, "GUILD")
        end
      end
    end
  end

  local GetNumRaidMembers = GetNumGroupMembers or GetNumRaidMembers
  function module:updateRaid()
    --  self:Debug("updateRaid -->")
    local Name, Class, SubGroup, Level, Server, rank
    local _, zone, online, isDead, role, isML
    for k, v in pairs(self.Subgroups) do
      self.Subgroups[k] = nil
    end

    for i = 1, GetNumRaidMembers() do
      _, rank, SubGroup, Level, _, Class, zone, online, isDead, role, isML = GetRaidRosterInfo(i)
      Name, Server = UnitName("raid" .. i)
      self:addName(Name, Server, Class, Level, SubGroup, "RAID")
    end
  end

  local GetNumPartyMembers = GetNumSubgroupMembers or GetNumPartyMembers -- Mists of Pandaria support
  function module:updateParty()
    local Class, Unit, Name, Server, _
    for i = 1, GetNumPartyMembers() do
      Unit = "party" .. i
      _, Class = UnitClass(Unit)
      Name, Server = UnitName(Unit)
      self:addName(Name, Server, Class, UnitLevel(Unit), nil, "PARTY")
    end
  end

  function module:updateTarget()
    local Class, Name, Server
    if not UnitIsPlayer("target") or not UnitIsFriend("player", "target") then
      return
    end
    Class = select(2, UnitClass("target"))
    Name, Server = UnitName("target")
    self:addName(Name, Server, Class, UnitLevel("target"), nil, "TARGET")
  end

  function module:updateMouseOver(event)
    local Class, Name, Server
    if not UnitIsPlayer("mouseover") or not UnitIsFriend("player", "mouseover") then
      return
    end
    Class = select(2, UnitClass("mouseover"))
    Name, Server = UnitName("mouseover")
    self:addName(Name, Server, Class, UnitLevel("mouseover"), nil, "MOUSE")
  end

  function module:updateWho()
    if self.wholib then return end

    local Name, Class, Level, Server, _
    for i = 1, GetNumWhoResults() do
      Name, _, Level, _, _, _, Class = GetWhoInfo(i)
      self:addName(Name, Server, Class, Level, nil, "WHO")
    end
  end

  function module:updateBG()
    for i = 1, GetNumBattlefieldScores() do
      local name, killingBlows, honorKills, deaths, honorGained, faction, rank, race, class, filename, damageDone,
      healingDone = GetBattlefieldScore(i);

      if name then
        local plr, svr = name:match("([^%-]+)%-?(.*)")
        self:addName(plr, svr, class, nil, nil, "BATTLEFIELD")
        self:addName(plr, nil, class, nil, nil, "BATTLEFIELD")
      end
    end
    self:updateRaid()
  end


  function module:resetStoredData()
    self.db.realm.classes = {}
    self.db.realm.levels = {}

    self:EmptyDataCache(true)

    Prat:Print(PL["Prat_Playernames: Stored Player Data Cleared"])
  end

  --
  -- Coloring Functions
  --
  local CLR = Prat.CLR
  function CLR:Bracket(text) return self:Colorize(module:GetBracketCLR(), text) end

  function CLR:Common(text) return self:Colorize(module:GetCommonCLR(), text) end

  function CLR:Random(text, seed) return self:Colorize(module:GetRandomCLR(seed), text) end

  function CLR:Class(text, class) return self:Colorize(module:GetClassColor(class), text) end

  local colorFunc = GetQuestDifficultyColor or GetDifficultyColor
  function CLR:Level(text, level, name, class, mode)
    local mode = mode or module.db.profile.levelcolor
    if mode and type(level) == "number" and level > 0 then
      if mode == "DIFFICULTY" then
        local diff = colorFunc(level)
        return self:Colorize(CLR:GetHexColor(CLR:Desaturate(diff)), text)
      elseif mode == "PLAYER" then
        return self:Player(text, name, class)
      end
    end

    return text
  end

  function CLR:Player(text, name, class)
    return self:Colorize(module:GetPlayerCLR(name, class), text)
  end

  local servernames

  function module:addName(Name, Server, Class, Level, SubGroup, Source)
    if Name then
      local nosave
      Source = Source or "UNKNOWN"

      -- Messy negations, but this says dont save data from
      -- sources other than guild or friends unless you enable
      -- the keeplots option
      if Source ~= "GUILD" and Source ~= "FRIEND" and Source ~= "PLAYER" then
        nosave = not self.db.profile.keeplots
      end

      if Server and Server:len() > 0 then
        nosave = true
        servernames = servernames or Prat.Addon:GetModule("ServerNames", true)

        if servernames then
          servernames:GetServerKey(Server)
        end
      end


      Name = Name .. (Server and Server:len() > 0 and ("-" .. Server) or "")

      local changed
      if Level and Level > 0 then
        local currentLevel = self.Levels[Name:lower()] or (self.db.realm.levels and self.db.realm.levels[Name:lower()]) or 0
        if Level >= currentLevel then
          self.Levels[Name:lower()] = Level
          if ((not nosave) and self.db.profile.keep) then
            self.db.realm.levels[Name:lower()] = Level
          else -- Update it if it exists
            if self.db.realm.levels and self.db.realm.levels[Name:lower()] then
              self.db.realm.levels[Name:lower()] = Level
            end
          end
          changed = true
        end
      end
      if Class and Class ~= UNKNOWN then
        self.Classes[Name:lower()] = Class
        if ((not nosave) and self.db.profile.keep) then self.db.realm.classes[Name:lower()] = Class end

        changed = true
      end
      if SubGroup then
        module.Subgroups[Name:lower()] = SubGroup

        changed = true
      end

      if changed then
        self:OnPlayerDataChanged(Name)
      end
    end
  end

  function module:getClass(player)
    return self.Classes[player:lower()] or self.db.realm.classes[player:lower()] or self.db.realm.classes[player]
  end

  function module:getLevel(player)
    return self.Levels[player:lower()] or self.db.realm.levels[player:lower()] or self.db.realm.levels[player]
  end

  function module:getSubgroup(player)
    return self.Subgroups[player:lower()]
  end

  function module:GetData(player, frame)
    local class = self:getClass(player)
    local level = self:getLevel(player)

    if level == 0 then level = nil end
    if class == UNKNOWN then class = nil end

    if self.wholib and not (class and level) then
      local user, cachetime = self.wholib:UserInfo(player, { timeout = 20 })

      if user then
        level = user.Level or level
        class = user.NoLocaleClass or user.Class or class
      end
    end
    return class, level, self:getSubgroup(player)
  end

  function module:GetClassColor(class)
    return CLR:GetHexColor(Prat.GetClassGetColor(class))
  end

  function module:addInfo(Name, Server)
    return
  end



  function module:FormatPlayer(message, Name, frame, class)
    if not Name or Name:len() == 0 then return end



    local storedclass, level, subgroup = self:GetData(Name, frame)
    if class == nil then
      class = storedclass
    end

    -- Add level information if needed
    if level and self.db.profile.level then
      message.PLAYERLEVEL = CLR:Level(tostring(level), level, Name, class)
      message.PREPLAYERDELIM = ":"
    end

    -- Add raid subgroup information if needed
    if subgroup and self.db.profile.subgroup and (GetNumRaidMembers() > 0) then
      message.POSTPLAYERDELIM = ":"
      message.PLAYERGROUP = subgroup
    end

    -- Add raid target icon
    if self.db.profile.showtargeticon then
      local icon = UnitExists(Name) and GetRaidTargetIndex(Name)
      if icon then
        icon = ICON_LIST[icon]

        if icon and icon:len() > 0 then
          -- since you cant have icons in links end the link before the icon
          message.PLAYERTARGETICON = "|h" .. icon .. "0|t"
          message.Ll = ""
        end
      end
    end

    if message.PLAYERLINKDATA and (message.PLAYERLINKDATA:find("BN_") and message.PLAYER ~= UnitName("player")) then
      if self.db.profile.realidcolor == "CLASS" then
        local numFriends = BNGetNumFriends()
        for i = 1, numFriends do
          local _, name, _, _, toon, id = BNGetFriendInfo(i)

          if id then
            if BNTokenFindName(name) == message.PLAYER then

              local _, toonName, client, realmName, _, faction, race, class, _, zoneName, level, gameText,
                broadcastText, broadcastTime = BNGetGameAccountInfo(id)

              if toonName and toonName ~= "" and self.db.profile.realidname then
                message.PLAYER = toonName

                if level and self.db.profile.level then
                  message.PLAYERLEVEL = CLR:Level(tostring(level), tonumber(level), nil, nil, "DIFFICULTY")
                  message.PREPLAYERDELIM = ":"
                end
              end

              message.PLAYER = CLR:Class(message.PLAYER, class)
            end
          end
        end
      elseif self.db.profile.realidcolor == "RANDOM" then
        message.PLAYER = CLR:Random(message.PLAYER, message.PLAYER:lower())
      end

    else
      -- Add the player name in the proper color
      message.PLAYER = CLR:Player(message.PLAYER, Name, class)
    end

    -- Add the correct bracket style and color
    if message.pP then
      local prof_brackets = self.db.profile.brackets
      if prof_brackets == "Angled" then
        message.pP = CLR:Bracket("<") .. message.pP
        message.Pp = message.Pp .. CLR:Bracket(">")
      elseif prof_brackets == "None" then
      else
        message.pP = CLR:Bracket("[") .. message.pP
        message.Pp = message.Pp .. CLR:Bracket("]")
      end
    end
  end


  --
  -- Prat Event Implementation
  --
  local EVENTS_FOR_RECHECK = {
    ["CHAT_MSG_GUILD"] = module.updateGF,
    -- ["CHAT_MSG_OFFICER"] = module.updateGuild,
    -- ["CHAT_MSG_PARTY"] = module.updateParty,
    -- ["CHAT_MSG_PARTY_LEADER"] = module.updateParty,
    -- ["CHAT_MSG_PARTY_GUIDE"] = module.updateParty,
    -- ["CHAT_MSG_RAID"] = module.updateRaid,
    -- ["CHAT_MSG_RAID_LEADER"] = module.updateRaid,
    -- ["CHAT_MSG_RAID_WARNING"] = module.updateRaid,
    ["CHAT_MSG_INSTANCE_CHAT"] = module.updateBG,
    ["CHAT_MSG_INSTANCE_CHAT_LEADER"] = module.updateBG,
    ["CHAT_MSG_SYSTEM"] = module.updateGF,
  }

  local EVENTS_FOR_CACHE_GUID_DATA = {
    CHAT_MSG_PARTY = true,
    CHAT_MSG_PARTY_LEADER = true,
    CHAT_MSG_PARTY_GUIDE = true,
    CHAT_MSG_RAID = true,
    CHAT_MSG_RAID_WARNING = true,
    CHAT_MSG_RAID_LEADER = true,
    CHAT_MSG_INSTANCE_CHAT = true,
    CHAT_MSG_INSTANCE_CHAT_LEADER = true,
  }


  function module:MakePlayer(message, name)
    if type(name) == "string" then
      local plr, svr = name:match("([^%-]+)%-?(.*)")
      --     self:Debug("MakePlayer", name, plr, svr)

      message.lL = "|Hplayer:"
      message.PLAYERLINK = name
      message.LL = "|h"
      message.PLAYER = plr
      message.Ll = "|h"

      if svr and strlen(svr) > 0 then
        message.sS = "-"
        message.SERVER = svr
      end
    end
  end


  function module:Prat_FrameMessage(info, message, frame, event)
    local _
    if self.NEEDS_INIT then
      self:updateAll()
    end

    -- This name is used to lookup playerdata, not for display
    local Name = message.PLAYERLINK or ""
    message.Pp = ""
    message.pP = ""

    -- If there is no playerlink, then we have nothing to do
    if Name:len() == 0 then
      return
    end

    Name = Ambiguate(Name, "all")

    local class, level, subgroup = self:GetData(Name)

    if (class == nil) and message and message.ORG and message.ORG.GUID and message.ORG.GUID:len() > 0 and message.ORG.GUID ~= "0000000000000000" then
      _, class = GetPlayerInfoByGUID(message.ORG.GUID)

      if class ~= nil and EVENTS_FOR_CACHE_GUID_DATA[event] then
        self:addName(Name, message.SERVER, class, level, subgroup, "GUID")
      end
    end
    local fx = EVENTS_FOR_RECHECK[event]
    if fx ~= nil and (level == nil or level == 0) then
      fx(self)
    end

    self:FormatPlayer(message, Name, frame, class)
  end

  function module:GetPlayerCLR(name, class, mode)
    if not mode then mode = module.db.profile.colormode end

    if name and strlen(name) > 0 then
      if class and mode == "CLASS" then
        return self:GetClassColor(class)
      elseif mode == "RANDOM" then
        return self:GetRandomCLR(name)
      else
        return self:GetCommonCLR()
      end
    end
  end

  function module:GetBracketCLR()
    if not self.db.profile.bracketscommoncolor then
      return CLR.COLOR_NONE
    else
      local color = self.db.profile.bracketscolor
      return CLR:GetHexColor(color)
    end
  end

  function module:GetCommonCLR()
    local color = CLR.COLOR_NONE
    if self.db.profile.usecommoncolor then
      if self.db.profile.useTTN and TasteTheNaimbow_Loaded then
        color = TasteTheNaimbowExternalColor(name)
      else
        color = CLR:GetHexColor(self.db.profile.color)
      end
    end
    return color
  end

  function module:GetRandomCLR(Name)
    local hash = 17
    for i = 1, string.len(Name) do
      hash = hash * 37 * string.byte(Name, i);
    end

    local r = math.floor(math.fmod(hash / 97, 255));
    local g = math.floor(math.fmod(hash / 17, 255));
    local b = math.floor(math.fmod(hash / 227, 255));

    if ((r * 299 + g * 587 + b * 114) / 1000) < 105 then
      r = math.abs(r - 255);
      g = math.abs(g - 255);
      b = math.abs(b - 255);
    end

    return string.format("%02x%02x%02x", r, g, b)
  end


  function module:TabComplete(enabled)
    local AceTab = LibStub("AceTab-3.0")

    if enabled then
      servernames = servernames or Prat.Addon:GetModule("ServerNames", true)

      if not AceTab:IsTabCompletionRegistered(PL["tabcomplete_name"]) then
        local foundCache = {}
        AceTab:RegisterTabCompletion(PL["tabcomplete_name"], nil,
          function(t, text, pos)
            for name in pairs(self.Classes) do
              t[#t+1] = name
            end
          end,
          function(u, cands, ...)
            local candcount = #cands
            if candcount <= self.db.profile.tabcompletelimit then
              local text
              for key, cand in pairs(cands) do
                if servernames then
                  local plr, svr = key:match("([^%-]+)%-?(.*)")

                  cand = CLR:Player(cand, plr, self:getClass(key))

                  if svr then
                    svr = servernames:FormatServer(nil, servernames:GetServerKey(svr))
                    cand = cand .. (svr and ("-" .. svr) or "")
                  end
                else
                  cand = CLR:Player(cand, cand, self:getClass(cand))
                end


                text = text and (text .. ", " .. cand) or cand
              end
              return "   " .. text
            else
              return "   " .. PL["Too many matches (%d possible)"]:format(candcount)
            end
          end,
          nil,
          function(name)
            return name:gsub(Prat.MULTIBYTE_FIRST_CHAR, string.upper, 1):match("^[^%-]+")
          end)
      end
    else
      if AceTab:IsTabCompletionRegistered(PL["tabcomplete_name"]) then
        AceTab:UnregisterTabCompletion(PL["tabcomplete_name"])
      end
    end
  end

  return
end) -- Prat:AddModuleToLoad
