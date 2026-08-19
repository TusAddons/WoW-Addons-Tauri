--[[

	CALL OF ELEMENTS
	The All-In-One Shaman Addon
	
	by Wyverex (2006)
	
	
	Totem Module Data
	
]]

local tinsert = table.insert;

--[[ ----------------------------------------------------------------
	COE.TotemData contains a list of totem classes that are
	returned by COE:CreateTotem
	For every available totem the player has, one object is
	added to this list
-------------------------------------------------------------------]]
COE["TotemData"] = {};
COE["TotemCount"] = 0;


--[[ ----------------------------------------------------------------
	COE.MaxTotems stores the maximum number of totems per element
-------------------------------------------------------------------]]
COE["MaxTotems"] = { Earth = 9, Fire = 9, Water = 9, Air = 9 };
COE["KnownTotems"] = { };

--[[ ----------------------------------------------------------------
	COE.TotemsAvailable contains the number of totems available
	of each element
-------------------------------------------------------------------]]
COE["TotemsAvailable"] = {};
COE.TotemsAvailable["Earth"] = 0;
COE.TotemsAvailable["Fire"] = 0;
COE.TotemsAvailable["Water"] = 0;
COE.TotemsAvailable["Air"] = 0;
COE.TotemicCallName = nil;

--[[ ----------------------------------------------------------------
	COE.ActiveTotems contains a pointer to the active totem of
	each element

	COE.TotemPending contains a pointer to the last totem spell
	that was initiated but not yet completed. This lets COE check
	whether something went wrong while casting (sitting etc.) by
	activating the timer first when SPELLCAST_STOP is fired
	After the timeout a pending totem timer is automatically removed
	to prevent actions that trigger SPELLCAST_STOP and are not
	hooked from activating the timer accidentally
-------------------------------------------------------------------]]
COE["ActiveTotems"] = { Earth = nil, Fire = nil, Water = nil, Air = nil };
COE["TotemPending"] = { Totem = nil, UseRank = 0, Timeout = 0.75 };


--[[ ----------------------------------------------------------------
	COE.CleansingTotems stores pointers to the buttons and totems
	that are able to cleanse poisons, diseases and sleep, charm
	or fear effects
-------------------------------------------------------------------]]
COE["CleansingTotems"] = { 
Poison = { Totem = nil, Button = nil, Warn = false },
Disease = { Totem = nil, Button = nil, Warn = false },
Tremor = { Totem = nil, Button = nil, Warn = false } };


--[[ ----------------------------------------------------------------
	COE.TotemSets contains the totem pointers for each set and
	element
-------------------------------------------------------------------]]
COE["TotemSetCount"] = 0;
COE["TotemSets"] = { }


--[[ ----------------------------------------------------------------
	COE.SetCycle stores which totem of the active set have
	already been thrown
-------------------------------------------------------------------]]
COE["SetCycle"] = { Earth = false, Fire = false, Water = false, Air = false };


--[[ ----------------------------------------------------------------
	COE.NoTotem is a placeholder for an empty anchor button
-------------------------------------------------------------------]]
COE["NoTotem"] = { SpellName = "", Element = "", Texture = "Interface\\Icons\\INV_Misc_Idol_03.blp",
	ToolPresent = false, Ranks = { SpellID = 0, Mana = 0, Duration = 0, Health = 0, Cooldown = 0 },
	MaxRank = 1, isActive = false, CurDuration = 0, CurHealth = 0, CurCooldown = 0 };


--[[ ----------------------------------------------------------------
	METHOD: COE:CreateTotem
	
	PURPOSE: Returns the totem class for a new totem
-------------------------------------------------------------------]]
function COE:CreateTotem()
	return { SpellName = "", Element = "", Texture = "", 
		ToolPresent = false, Ranks = {}, MaxRank = 0, isActive = false,
		CurDuration = 0, CurHealth = 0, CurCooldown = 0,
		isTrinket = false, TrinketSlot = nil };
end


--[[ ----------------------------------------------------------------
	METHOD: COE:CreateTotemRank
	
	PURPOSE: Returns the class for a new totem rank
-------------------------------------------------------------------]]
function COE:CreateTotemRank()
	return { SpellID = 0, Mana = 0, Duration = 0, Health = 0, Cooldown = 0 };
end


--[[ ----------------------------------------------------------------
	METHOD: COE:ElementFromTool
	
	PURPOSE: Returns the element corresponding to a totem tool.
		This is needed for the french version to work. In the
		english and german versions it just returns the input
-------------------------------------------------------------------]]
function COE:ElementFromTool( element )

	if element == COESTR_TOTEMTOOLS_EARTH then
    	return COESTR_ELEMENT_EARTH;
	elseif element == COESTR_TOTEMTOOLS_FIRE then
    	return COESTR_ELEMENT_FIRE;
	elseif element == COESTR_TOTEMTOOLS_WATER then
    	return COESTR_ELEMENT_WATER;
	elseif element == COESTR_TOTEMTOOLS_AIR then
    	return COESTR_ELEMENT_AIR;
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE:LocalizedElement
	
	PURPOSE: Translates a localized element name into english
-------------------------------------------------------------------]]
function COE:LocalizedElement( element )

	if( element == COESTR_ELEMENT_EARTH ) then
		return "Earth";
	elseif( element == COESTR_ELEMENT_FIRE ) then
		return "Fire";
	elseif( element == COESTR_ELEMENT_WATER ) then
		return "Water";
	elseif( element == COESTR_ELEMENT_AIR ) then
		return "Air";
	end
	
end

local function COE_GetTotemDurationAndHealth(description,cooldowntext)
	local duration = 0;
	local health = 0;
	local cooldown = 0;

	if(description == nil) then
		return duration, health, cooldown;
	end
	-- ===============================================================
	-- 		Duration	
	-- ===============================================================	

	-- first search for a minute specification
	-- if we find one it is surely the totem duration
	-- -----------------------------------------------
	local _,_,minutetext = string.find(description, COESTR_MINUTEDURATION );
	if( minutetext ) then
		-- calculate the duration in seconds
		-- ----------------------------------
		local min = tonumber( string.sub( minutetext, 1, 1 ) );
		local sec = tonumber( string.sub( minutetext, 3, 4 ) ) / 100 * 60;
		
		duration = min * 60 + sec;
	else
		_,_,minutetext = string.find(description, COESTR_MINUTEDURATION_INT );
		if( minutetext ) then
			duration = tonumber( minutetext ) * 60;
		else
			-- now test for a duration in seconds
			-- -----------------------------------
			local _,b,sectext1 = string.find(description, COESTR_SECDURATION );
			if( sectext1 ) then
			
				-- look if there are two second specifications
				-- if so, take the greate one
				-- --------------------------------------------
				local _,_,sectext2 = string.find( string.sub(description, b ), COESTR_SECDURATION ); 
				
				if( sectext2 ) then
					duration = math.max( tonumber( sectext1 ), tonumber( sectext2 ) );
				else
					duration = tonumber( sectext1 );
				end 
			end
		end
	end
	
	-- ===============================================================
	-- 		Health	
	-- ===============================================================	

	for num, regex in ipairs(COESTR_TOTEMHEALTH) do
		local match = { string.gmatch(description, regex )() };
		if ( #match >= 1 ) then

			health = tonumber( match[1] );
			break;
		end
	end
	
	-- ===============================================================
	-- 		Cooldown	
	-- ===============================================================	

	if( not cooldowntext ) then
		cooldown = 0;
	else
		_,_,cooldown = string.find( cooldowntext, COESTR_SECDURATION );
		if( cooldown ) then
			cooldown = tonumber( cooldown );
		else
			_,_,cooldown = string.find( cooldowntext, COESTR_MINUTEDURATION_INT );
			if( cooldown ) then
				cooldown = tonumber( cooldown ) * 60;
			else
				cooldown = 0;
			end
		end			
	end	

	return duration, health, cooldown;

end

local function COE_GetTotemInfos(spellID)
  local tool = nil;
  local mana = 0;
  local duration = 0;
  local health = 5;
  local cooldown = 0;

  COETotemTT:SetSpellByID(spellID);

  if(COETotemTTTextLeft4)
  then
    duration, health, cooldown = COE_GetTotemDurationAndHealth(COETotemTTTextLeft4:GetText(),COETotemTTTextRight3:GetText());
    if(COETotemTTTextLeft2)
    then
      text = COETotemTTTextLeft2:GetText();
      if(text)
      then
        local _,_, manastr = string.find(text,COESTR_TOTEMMANA);
        if(manastr)
        then
          mana = tonumber(manastr);
        end
      end
    end
  end
  if(duration == 0 and COETotemTTTextLeft3) -- Search Infos in the 3rd line (Arena/BG warmup)
  then
    duration, health, cooldown = COE_GetTotemDurationAndHealth(COETotemTTTextLeft3:GetText(),COETotemTTTextRight2:GetText());
    -- Mana is 0 during warmup
  end
  return mana,duration,health,cooldown;
end

--[[ ----------------------------------------------------------------
	METHOD: COE:ScanTotems
	
	PURPOSE: Scans the spellbook for available totems and
		populates the COE.TotemData list
-------------------------------------------------------------------]]
local function COE_ConcatSpellIDList(element,list,...)
  local numSpells = select("#", ...);
  for i = 1, numSpells
  do
    local spellId = select(i, ...);
    local name, rank, icon = GetSpellInfo(spellId);
    tinsert(list,{element=element,id=spellId,name=name,icon=icon});
  end
end

local function COE_BuildSpellIDList()
  local list = {};
  COE_ConcatSpellIDList("Fire",list,GetMultiCastTotemSpells(1));
  COE_ConcatSpellIDList("Earth",list,GetMultiCastTotemSpells(2));
  COE_ConcatSpellIDList("Water",list,GetMultiCastTotemSpells(3));
  COE_ConcatSpellIDList("Air",list,GetMultiCastTotemSpells(4));
  return list;
end

local function COE_GetGlobalSpellID(name)
  for _,spell in ipairs(COE.KnownTotems)
  do
    if(spell.name == name)
    then
      return spell.id;
    end
  end
  return 0;
end

function COE:ScanTotems()
	COE.KnownTotems = COE_BuildSpellIDList();
	COE:DebugMessage( "Scanning Totems..." );
	
	-- delete existing totem objects
	-- ------------------------------
	COE.TotemData = {};
	COE.TotemCount = 0;
	COE.TotemsAvailable.Earth = 0;
	COE.TotemsAvailable.Fire = 0;
	COE.TotemsAvailable.Water = 0;
	COE.TotemsAvailable.Air = 0;

	if(COE.TotemicCallName == nil)
	then
		COE.TotemicCallName = GetSpellInfo(36936);
		COE["TotemicCall"] = { id=36936, SpellName=COE.TotemicCallName, Texture=GetSpellTexture(36936) };
	end
	-- iterate over all known totems
	-- -----------------------------
	for _,spell in ipairs(COE.KnownTotems)
	do
	
		local SpellName = spell.name;
		local element = spell.element;
		local mana = 0;
                local totemDuration = 0;
                local totemHealth = 5;
                local totemCooldown = 0;
                local toolPresent = true;
		
		mana,totemDuration,totemHealth,totemCooldown = COE_GetTotemInfos(spell.id);

		if(mana)
		then
			local newtotem = true;
			local totem = nil;
			
			-- get the rank value
			-- -------------------
			local rank = 1;

			-- =======================================================================			
			-- create new totem object if not found
			-- =======================================================================			
			totem = COE:CreateTotem();
			
			-- set totem spell name and id
			-- ---------------------------
			totem.SpellName = SpellName;
			totem.GlobalSpellID = spell.id;
			
			-- get totem texture
			-- ------------------
			totem.Texture = spell.icon;
			
			-- valid element?
			-- ---------------
			if( COE.TotemsAvailable[element] ~= nil ) then
				totem.Element = element;
				COE.TotemsAvailable[element] = COE.TotemsAvailable[element] + 1;
			else
				COE:Message( COESTR_INVALIDELEMENT .. SpellName );
			end										
			
			-- get tool presence
			-- ------------------
			totem.ToolPresent = true;

			-- =======================================================================			
			-- create new totem rank
			-- =======================================================================			
			local totemrank = COE:CreateTotemRank();
			
			-- set totemrank id
			-- ----------------
			totemrank.GlobalSpellID = spell.id;
			
			-- get totem mana cost
			-- ---------------------------------
			totemrank.Mana = mana;
			
			-- get totem duration and health
			-- ------------------------------
			totemrank.Duration = totemDuration;
			totemrank.Health = totemHealth;
			totemrank.Cooldown = totemCooldown;
			
			-- store rank in totem
			-- --------------------
			totem.Ranks[rank] = totemrank;
			if( rank > totem.MaxRank ) then
				totem.MaxRank = rank;
			end		
			
			-- is this a new totem?
			-- ---------------------
			if( newtotem ) then
				-- store totem
				-- ------------
				COE.TotemCount = COE.TotemCount + 1;
				COE.TotemData[COE.TotemCount] = totem;

				--print( "Found totem: " .. SpellName );
			end
			
			-- =======================================================================			
			-- check visibility options
			-- =======================================================================

			if( COE_DisplayedTotems[COE_ActiveTalents][SpellName] == nil ) then
				-- perhaps a new totem. set it to default visible
				-- and reorder it when the element count is known
				-- -----------------------------------------------
				COE_DisplayedTotems[COE_ActiveTalents][SpellName] = { Order = 0, Element = totem.Element, Visible = true };
			else
				-- update old saved variables versions by adding the element
				-- ----------------------------------------------------------
				COE_DisplayedTotems[COE_ActiveTalents][SpellName]["Element"] = totem.Element;
			end
		end
	
	end

	-- ====================================
	-- Trinket support
	-- ====================================
		
	-- create the trinket totem even if the player doesn't have it.
	-- this makes handling it much simpler and the player can choose
	-- to make it invisible anyway
	-- the player needs to have at least one water totem though
	-- --------------------------------------------------------------
	if( COE.TotemsAvailable.Water > 0 ) then
		local trinket = COE:CreateTotem();
		trinket.SpellName = "Trinket";
		trinket.Element = "Water";
		trinket.Texture = "Interface\\Icons\\INV_Wand_01"; 
		trinket.isTrinket = true;
		trinket.ToolPresent, trinket.TrinketSlot = COE:IsTrinketPresent();
		trinket.Ranks[0] = COE:CreateTotemRank();
		trinket.Ranks[0].Duration = 24;
		trinket.Ranks[0].Health = 5;
		trinket.Ranks[0].Cooldown = 180;
	
		-- store totem
		-- ------------
		COE.TotemsAvailable.Water = COE.TotemsAvailable.Water + 1;
		COE.TotemCount = COE.TotemCount + 1;
		COE.TotemData[COE.TotemCount] = trinket;

		if( COE_DisplayedTotems[COE_ActiveTalents][trinket.SpellName] == nil ) then
			-- perhaps a new totem. set it to default visible
			-- and reorder it when the element count is known
			-- -----------------------------------------------
			COE_DisplayedTotems[COE_ActiveTalents][trinket.SpellName] = { Order = 0, Visible = true };
		end
	end

	-- ===================================
	-- Finish
	-- ===================================
	
	COE:DebugMessage( "Found " .. COE.TotemCount .. " totems in spellbook" .. 
		"(" .. COE.TotemsAvailable.Earth .. " Earth, " ..
		COE.TotemsAvailable.Fire .. " Fire, " .. COE.TotemsAvailable.Water .. " Water, " ..
		COE.TotemsAvailable.Air .. " Air)" );
--[[ -- Bug avec le nouveau code dualspec
  -- Check for non existant totems
  for name,totem in pairs(COE_DisplayedTotems[COE_ActiveTalents])
  do
    if(GetSpellInfo(name) == nil and totem.Element ~= nil) -- Check for existing totem spell (and not a trinket)
    then
      COE:Message("Spell no longer exists: "..name);
      COE_DisplayedTotems[COE_ActiveTalents][name] = nil;
    end
  end
]]
	-- reorder new totems
	-- -------------------
	COE:ReorderNewTotems();
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE:IsTrinketPresent
	
	PURPOSE: Checks if the player has the enamored water spirit 
		trinket equipped and returns the trinket slot
		
	RETURNS: equipped, slot 
-------------------------------------------------------------------]]
function COE:IsTrinketPresent()

	for i = 0, 1 do
		local slot = GetInventorySlotInfo( "Trinket" .. i .. "Slot" );
		local item = GetInventoryItemLink( "player", slot );

		if( item ) then
			local itemname = string.find( item, COESTR_TRINKET );
			if( itemname ) then
				-- trinket is equipped
				-- --------------------
				return true, slot;
			end
		end
	end
	
	return false, nil;	

end


--[[ ----------------------------------------------------------------
	METHOD: COE:ReorderNewTotems
	
	PURPOSE: Assigns each COE_DisplayedTotems entry with a zero
		order a valid order depending on the number of available
		totems in this element
-------------------------------------------------------------------]]
function COE:ReorderNewTotems()

	local nextslot = { Earth = COE.TotemsAvailable.Earth, Fire = COE.TotemsAvailable.Fire,
		Water = COE.TotemsAvailable.Water, Air = COE.TotemsAvailable.Air };
		
	local used = { Earth = {}, Fire = {}, Water = {}, Air = {} };
	local bError = false;  

	local k;
	for k = 1, COE.TotemCount do
		
		local totem = COE.TotemData[k];
		if( COE_DisplayedTotems[COE_ActiveTalents][totem.SpellName] ~= nil ) then
			if( COE_DisplayedTotems[COE_ActiveTalents][totem.SpellName].Order == 0 ) then

				-- this totem has just been added				
				-- assign the currently free slot
				-- -------------------------------
				COE_DisplayedTotems[COE_ActiveTalents][totem.SpellName].Order = nextslot[totem.Element];
				nextslot[totem.Element] = nextslot[totem.Element] - 1;
			end

			-- register that this slot of the element is now in use
			-- mark as error if already in use
			-- -----------------------------------------------------
			if( used[totem.Element][COE_DisplayedTotems[COE_ActiveTalents][totem.SpellName].Order] == nil ) then
				used[totem.Element][COE_DisplayedTotems[COE_ActiveTalents][totem.SpellName].Order] = true;
			else
				bError = true;
			end		
		end
	end
	
	-- are there multiple entries for one slot?
	-- -----------------------------------------
	if( bError ) then
		-- there is something wrong with the saved variables
		-- reset all ordering and reassign it
		-- --------------------------------------------------
		for k = 1, COE.TotemCount do

			local totem = COE.TotemData[k];
			if( COE_DisplayedTotems[COE_ActiveTalents][totem.SpellName] ~= nil ) then
				COE_DisplayedTotems[COE_ActiveTalents][totem.SpellName].Order = 0;
			end
		end

		COE:ReorderNewTotems();		
		
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE:InitTotemSets
	
	PURPOSE: Fills the COE.TotemSets list with the totem objects
		corresponding to the spell names saved in COEOPT_TOTEMSETS
-------------------------------------------------------------------]]
function COE:InitTotemSets()

	local indices = { "Earth", "Fire", "Water", "Air" };

	COE.TotemSets = {};

	-- for each standard set
	-- ----------------------
	local set;
	for set = 1, #COE_SavedTotemSets do

		COE.TotemSets[set] = { Earth = nil, Fire = nil, Water = nil, Air = nil, 
			CastOrder = COE_SavedTotemSets[set].CastOrder };
	
		-- for each element
		-- -----------------
		local k, totem;
		for k = 1,4 do

			if( COE_SavedTotemSets[set][indices[k]] ~= "" ) then
			
				-- iterate over all totems
				-- ------------------------
				for totem in pairs(COE.TotemData) do
				
					if( COE.TotemData[totem].SpellName == COE_SavedTotemSets[set][indices[k]] ) then
						COE.TotemSets[set][indices[k]] = COE.TotemData[totem];
					end
				end
			end
		end	
	end

  -- for each blizzard set
  -- ----------------------
  local set;
  for set = 1, 3 do
    local multiname = COE_KnowSpell(COE_TotemicCallsSpellIDs[set]);
    if(multiname)
    then
      COE_BlizzTotemSets[set] = { Name = "[Bliz] "..multiname, Earth = nil, Fire = nil, Water = nil, Air = nil, CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } };
      COE.TotemSets[COESET_START_MULTI+set-1] = COE_BlizzTotemSets[set];
    end	
  end

	-- for each custom set
	-- --------------------
	for set = 1, #COE_CustomTotemSets do
	
		COE.TotemSets[COESET_DEFAULT + set] = { Earth = nil, Fire = nil, Water = nil, Air = nil, 
			CastOrder = COE_CustomTotemSets[set].CastOrder };

		-- for each element
		-- -----------------
		local k, totem;
		for k = 1,4 do

			if( COE_CustomTotemSets[set][indices[k]] ~= "" ) then
			
				-- iterate over all totems
				-- ------------------------
				for totem in pairs(COE.TotemData) do
				
					if( COE.TotemData[totem].SpellName == COE_CustomTotemSets[set][indices[k]] ) then
						COE.TotemSets[COESET_DEFAULT + set][indices[k]] = COE.TotemData[totem];
					end
				end
			end
		end	
	end

	COE.TotemSetCount = #COE.TotemSets;  
	
end


--[[ =============================================================================================

										F I X E S 

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE:Fix_CastOrderLocalization
	
	PURPOSE: Correctly localizes the element names in the 
		cast order in COE_SavedTotemSets
-------------------------------------------------------------------]]
function COE:Fix_CastOrderLocalization()

	-- for each standard set
	-- ----------------------
	local set, k;
	for set = 1, #COE_SavedTotemSets do
		
		for k = 1, 4 do
			if( COE_SavedTotemSets[set].CastOrder[k] == "Earth" ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_EARTH;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == "Fire" ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_FIRE;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == "Water" ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_WATER;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == "Air" ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_AIR;
			end
		end
	end

	-- notify user
	-- ------------
	COE:Message( COESTR_FIXEDSETS );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE:Fix_DisplayedTotems
	
	PURPOSE: Fixes errors in the COE_DisplayedTotems array
-------------------------------------------------------------------]]
function COE:Fix_DisplayedTotems()

	local i;
	local fixed = false;

	foreach( COE_DisplayedTotems[COE_ActiveTalents], function( index, value ) 

		-- is this an old-style entry?
		-- ----------------------------
		if( type( value ) == "boolean" ) then
			COE_DisplayedTotems[COE_ActiveTalents][index] = { Order = 0, Visible = value };
			fixed = true;
			
		elseif( type( value ) == "table" ) then
			if( COE_DisplayedTotems[COE_ActiveTalents][index].Visible == nil ) then
				COE_DisplayedTotems[COE_ActiveTalents][index].Visible = true;
				fixed = true;
			end
			
			if( COE_DisplayedTotems[COE_ActiveTalents][index].Order == nil ) then
				COE_DisplayedTotems[COE_ActiveTalents][index].Order = 0;
				fixed = true;
			end
		
		else
			COE_DisplayedTotems[COE_ActiveTalents][index] = { Order = 0, Visible = value };
			fixed = true;
		end 
	
	end  );

	-- notify user
	-- ------------
	if( fixed ) then
		COE:Message( COESTR_FIXEDDISPLAY );
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE:Fix_CastOrderLocalization2
	
	PURPOSE: Correctly localizes the element names in the 
		cast order in COE_SavedTotemSets
-------------------------------------------------------------------]]
function COE:Fix_CastOrderLocalization2()

	-- for each standard set
	-- ----------------------
	local set, k;
	for set = 1, #COE_SavedTotemSets do
		
		for k = 1, 4 do
			if( COE_SavedTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_EARTH ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_EARTH;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_FIRE ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_FIRE;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_WATER ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_WATER;
					 
			elseif( COE_SavedTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_AIR ) then
				COE_SavedTotemSets[set].CastOrder[k] = COESTR_ELEMENT_AIR;
			end
		end
	end

	-- for each custom set
	-- --------------------
	for set = 1, #COE_CustomTotemSets do
		
		for k = 1, 4 do
			if( COE_CustomTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_EARTH ) then
				COE_CustomTotemSets[set].CastOrder[k] = COESTR_ELEMENT_EARTH;
					 
			elseif( COE_CustomTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_FIRE ) then
				COE_CustomTotemSets[set].CastOrder[k] = COESTR_ELEMENT_FIRE;
					 
			elseif( COE_CustomTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_WATER ) then
				COE_CustomTotemSets[set].CastOrder[k] = COESTR_ELEMENT_WATER;
					 
			elseif( COE_CustomTotemSets[set].CastOrder[k] == COESTR_TOTEMTOOLS_AIR ) then
				COE_CustomTotemSets[set].CastOrder[k] = COESTR_ELEMENT_AIR;
			end
		end
	end

end

