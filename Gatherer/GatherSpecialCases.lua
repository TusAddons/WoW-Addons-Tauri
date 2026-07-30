--[[
	Gatherer Addon for World of Warcraft(tm).
	Version: 7.3.1 (<%codename%>)
	Revision: $Id: GatherSpecialCases.lua 894 2010-12-02 22:46:33Z Esamynn $

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
	
	Special Case Handling
	
	This file handles modifications that need to be made to various data tables
	throughout Gatherer that need to be "hacked up" in some fashion to handle
	Special Case nodes.
	
	THIS FILE SHOULD ALWAYS BE HEAVILY COMMENTED SO THAT IT IS EASY TO UNDERSTAND
	EXACTLY WHAT IS BEING DONE AND WHY!!!
]]
Gatherer_RegisterRevision("$URL: http://svn.norganna.org/gatherer/tags/REL_7.3.1/Gatherer/GatherSpecialCases.lua $", "$Rev: 894 $")

--[[
	Processing function that does the actual work.  This function nils itself
	out after running, to ensure that it can only ever be run once.  
]]
function Gatherer.SpecialCases.ProcessSpecialCases()
	local db = (Gatherer.Storage and Gatherer.Storage.GetRawDataTable and Gatherer.Storage.GetRawDataTable()) or _G["GatherItems"]
	if db then
		db["GARRISON_ALLIANCE_TIER3"] = nil
		db["GARRISON_ALLIANCE_TIER2"] = nil
		db["GARRISON_ALLIANCE_TIER1"] = nil
		db["GARRISON_HORDE_TIER3"] = nil
		db["GARRISON_HORDE_TIER2"] = nil
		db["GARRISON_HORDE_TIER1"] = nil
		db[971] = nil
		db[972] = nil
		db[973] = nil
	end
	if db then
		local smvList = {db["DRAENOR_SHADOWMOON_VALLEY"], db[947]}
		for _, gZone in ipairs(smvList) do
			if gZone then
				for gType, gData in pairs(gZone) do
					for i = #gData, 1, -1 do
						local node = gData[i]
						if node and not node[4] and ((node[1] >= 0.57 and node[1] <= 0.76 and node[2] >= 0.26 and node[2] <= 0.48) or (node[1] >= 57 and node[1] <= 76 and node[2] >= 26 and node[2] <= 48)) then
							table.remove(gData, i)
						end
					end
				end
			end
		end
		local ffrList = {db["DRAENOR_FROSTFIRE_RIDGE"], db[941]}
		for _, gZone in ipairs(ffrList) do
			if gZone then
				for gType, gData in pairs(gZone) do
					for i = #gData, 1, -1 do
						local node = gData[i]
						if node and not node[4] and ((node[1] >= 0.44 and node[1] <= 0.60 and node[2] >= 0.45 and node[2] <= 0.68) or (node[1] >= 44 and node[1] <= 60 and node[2] >= 45 and node[2] <= 68)) then
							table.remove(gData, i)
						end
					end
				end
			end
		end
	end

	-- nil out this function so that it cannot be called again
	Gatherer.SpecialCases.ProcessSpecialCases = nil
end
