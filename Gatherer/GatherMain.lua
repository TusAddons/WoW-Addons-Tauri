--[[
	Gatherer Addon for World of Warcraft(tm).
	Version: 7.3.1 (<%codename%>)
	Revision: $Id: GatherMain.lua 967 2012-09-02 21:37:21Z Esamynn $

	License:
		This program is free software; you can redistribute it and/or
		modify it under the terms of the GNU General Public License
		as published by the Free Software Foundation; either version 2
		of the License, or (at your option) any later version.

		This program is distributed in the hope that it will be useful,
		but WITHOUT ANY WARRANTY; without even the implied warranty of
		MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
		GNU General Public License for more details.

		You should have received a copy of the GNU General Public License
		along with this program(see GPL.txt); if not, write to the Free Software
		Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.

	Note:
		This AddOn's source code is specifically designed to work with
		World of Warcraft's interpreted AddOn system.
		You have an implicit licence to use this AddOn with these facilities
		since that is it's designated purpose as per:
		http://www.fsf.org/licensing/licenses/gpl-faq.html#InterpreterIncompat
]]
Gatherer_RegisterRevision("$URL: http://svn.norganna.org/gatherer/tags/REL_7.3.1/Gatherer/GatherMain.lua $", "$Rev: 967 $")


Gatherer.Var.Version="7.3.1"
if (Gatherer.Var.Version == "<%".."version%>") then
	Gatherer.Var.Version = "4.0-DEV"
end
Gatherer.Version = Gatherer.Var.Version

Gatherer.AstrolabeVersion = "Astrolabe-1.0"

-- Global variables
Gatherer.Var.NoteUpdateInterval = 0.1
Gatherer.Var.NoteCheckInterval = 5.0
Gatherer.Var.Loaded = false
Gatherer.Var.ClosestCheck = 0.4

Gatherer.Var.UpdateWorldMap = -1

Gatherer.Var.Skills = { }
Gatherer.Var.ZoneData = { }
Gatherer.Var.MainMapItem = { }

SLASH_ESCLOG1 = "/esc"
SlashCmdList["ESCLOG"] = function()
    local blocking = false
    for index, value in pairs(UISpecialFrames) do
        local frame = _G[value]
        if frame and frame:IsShown() then
            print("|cffff0000[EscLog] Bloqueando ESC (Especial):|r " .. value)
            blocking = true
        end
    end
    local panels = {"left", "center", "right", "doublewide", "fullscreen"}
    for _, pos in ipairs(panels) do
        local frame = GetUIPanel(pos)
        if frame and frame:IsShown() then
            print("|cffff0000[EscLog] Bloqueando ESC (Panel " .. pos .. "):|r " .. (frame:GetName() or tostring(frame)))
            blocking = true
        end
    end
    if UIDROPDOWNMENU_OPEN_MENU then
        print("|cffff0000[EscLog] Bloqueando ESC (Dropdown):|r " .. (UIDROPDOWNMENU_OPEN_MENU:GetName() or tostring(UIDROPDOWNMENU_OPEN_MENU)))
        blocking = true
    end
    if not blocking then
        print("|cff00ff00[EscLog]|r Ningún marco especial está bloqueando ESC ahora mismo.")
    else
        print("|cffffff00[EscLog]|r Uno de estos marcos se niega a cerrarse al pulsar ESC. (Fallo de AddOn / OnHide)")
    end
end
