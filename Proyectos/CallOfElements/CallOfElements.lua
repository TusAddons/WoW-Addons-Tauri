--[[

	CALL OF ELEMENTS
	The All-In-One Shaman Addon
	
	by Wyverex (2006)
	by Kiki (post WoW 2.0)

  ChangeLog:
   - 2014/02/06 : Version 6.13
     - TOC update for WoW 5.4
   - 2011/12/04 : Version 6.12
     - TOC update for WoW 4.3
   - 2011/07/05 : Version 6.1
     - Fixed totemic call button missing in DropSet sub-menu
   - 2011/07/04 : Version 6.0
     - Updated for WoW 4.2
     - Rewrote totems scanning code
   - 2009/08/30 : Version 5.6
     - Added 3 new totem sets (automatic). When you activate or configure those sets, it will use blizzard multi-drop sets instead!!
     - Automatically setting blizzard multicast totem frame to the last one, if it was the active set in CoE
     - Added a new option to disable tooltips while in combat
   - 2009/07/16 : Version 5.51
     - Fixed German localization
     - Attempt to fix Taint issue
     - Added more debug message attempting to fix 'GetTotemInfo' issue
   - 2009/07/16 : Version 5.5
     - WoW 3.2 compatible
     - Now detecting already dropped totems after a ReloadUI
     - Added a new popup sub-menu, with the 4 new elemental "Calls" (dropping all 4 totems at once). Go check the shortcuts menu!!
   - 2009/04/17 : Version 5.41
     - Fixed minor lua error
   - 2009/04/17 : Version 5.4
     - Fixed deDE localization
     - Fixed GetTotemInfo() lua error that occurs for some people
   - 2009/04/09 : Version 5.3
     - WoW 3.1 compatible
     - Totem bars (position and config) and global options are now saved per talent spec!
     - Fixed ruRU localization
   - 2009/01/22 : Version 5.2
     - WoW 3.0.8 compatible
   - 2008/10/16 : Version 5.12
     - Fixed 'restrictedExecution' error
   - 2008/10/16 : Version 5.1
     - Now forcing a totem reorder if spells are no longer available
   - 2008/08/28 : Version 5.0
     - Updated for WotLK
     - Right clicking on a totem in the timer frame will destroy that totem
     - Fixed tooltips
   - 2008/08/07 : Version 4.7
     - Added ruRU localization
   - 2008/04/07 : Version 4.6
     - Fixed frFR totem detection (thank blizzard to have removed a space in the "totem tools" tooltip, which is a language error)
   - 2008/04/07 : Version 4.5
     - Updated for WoW 2.4
     - Correctly detecting totem destruction!
     - Automatically reordering blizzard Totem frame, depending on your current active totem set!
   - 2007/11/20 : Version 4.4
     - Fixed totems detection during arena/bg warmup
   - 2007/11/15 : Version 4.3
     - Toc update
     - Fixed taint issues
   - 2007/10/08 :
     - Added support for Cosmos (Thx to MisterT)
   - 2007/09/27 : Version 4.2
     - Updated Spanish localization file (thx Kaie)
     - Updated ToC
   - 2007/05/28 : Version 4.1
     - Added a comment line in bindings, to prevent the game from removing empty bindings
     - Added tw localization (Thanks Yukinoba)
   - 2007/05/23 : Version 4.0
     - Updated ToC
     - Re enabled ctrl/shift/alt key modifier to drop Rank 1 totem (warning, Ctrl is already used to change anchor of flex buttons)
   - 2007/02/01 : Version 3.92
     - Fixed TimersFrame with localized clients (Thanks tayedaen)
   - 2007/01/30 : Version 3.9
     - Fixed an issue with TotemAdvisor (Chronos related)
   - 2007/01/29 : Version 3.81
     - Now locking Timers, when "Fix totem bar" option is checked
   - 2007/01/29 : Version 3.8
     - Added Changes by Tayedaen (Thanks!)
      - Now scanning the whole 40 debuff slots (instead of 16)
      - Warnings can now be enabled/disabled independently of the ShowTimers option
      - Fixed some scaling issues
      - Don't show the Cooldown frame for the timer buttons
     - Added esES localization (thanks Kaie!)
     - Increased max totems to 9 for all school
     - Fixed Timer frame
      - Always shown if activated
      - Separated scaling value (see options)
      - Totem timers order depends on active set
     - Removed all unusable healing stuff
     - Improved Advisor: Only show advices for players in 30y range, not charmed, and not dead
   - 2007/01/18 : Version 3.7
     - Fixed lua error if you don't have Totemic Call
     - Fixed totem parsing function (Totem of Wrath should be available once again)
   - 2007/01/12 : Version 3.6
     - Fixed lua error when mouseing over TotemicCall button in sub-menu
     - Fixed deDE localization (Totemic Call)
   - 2007/01/11 : Version 3.5
     - Fixed TOC
     - Handle Totemic Call spell:
       - Added direct Totemic Call button into DropSet sub-menu
       - Resetting totems when Totemic Call is used
     - Improved totem spells detection
     - Chronos is now embedded
   - 2006/12/18 : Version 3.4
     - Re-enabled tooltips (you must mouseover the center of a totem button)
   - 2006/12/15 :
     - Fixed issues with anchoring totem and "None" totem
   - 2006/12/11 : Version 3.3
     - Reloadui is no longer needed after totem set configuration
     - Fixed PreClick handler
     - Re-enabled CTRL-click to set anchored totem
     - Re-enabled trinket totems
     - Fixed lua errors when creating a new totem set
     - Fixed DropSet menu cooldowns not showing after zoning
   - 2006/12/08 :
     - Fixed that damned incorrect copy/paste!!
   - 2006/12/08 : Version 3.2
     - Fixed DropSet menu issues (timer refresh, cooldown refresh)
     - Fixed bindings issues (lua errors, multiple keys to one binding)
   - 2006/12/07 :
     - Increased max Fire totems count
   - 2006/12/07 : Version 3.1
     - Many lua errors fixed
     - PvP set re-enabled (works only if ooc)
     - Fixed buttons scaling issue
     - Fixed DropSet menu not keeping its position when leaving the game
     - DropSet menu doesn't close when you drop a totem (allow multiple drops without re-opening menu). Hit the DropSet menu key again, or ESCAPE to close it.
     
  Todo:
   - Add a fifth bar, with weapon buffs and shields

   - Dropped totem distance detection (maybe coloring dropped totem icon, or show timer in another color)
   - Create a macro that uses castsequence
   - Fix Totem bindings (drop totem X of Element Y)
   - Add an option to close or not the DropSet menu after dropping a totem
]]

if( not COE ) then 
	COE = {};
end 

COE_VERSION = 6.16

COECOL_TOTEMWARNING = 1;
COECOL_TOTEMDESTROYED = 2;
COECOL_TOTEMCLEANSING = 3;

COE_ActiveTalents = nil;

--[[ ----------------------------------------------------------------
	METHOD: COE_GetTalentGroup

	PURPOSE: WoW removed the old dual-spec "talent group" API
		(GetActiveTalentGroup) starting with Mists of Pandaria's
		talent revamp, and Legion clients (like this Tauri 7.3.5
		server) don't expose it at all. Calling it directly threw
		a Lua error on every PLAYER_ENTERING_WORLD, which aborted
		COE:CheckTalentSpecChanged() before COE_ActiveTalents was
		ever set - and with COE_ActiveTalents left nil, every table
		keyed by it (COE_TotemBars[COE_ActiveTalents], etc.) errored
		too, which is why the totem bars never appeared and the
		config panel misbehaved (e.g. the Totem Sets tab).
		GetSpecialization() is the modern equivalent (1/2/3 for a
		Shaman's Elemental/Enhancement/Restoration spec) and serves
		the same purpose here: a stable per-spec index to save
		distinct totem bar / totem set configs under.
-------------------------------------------------------------------]]
function COE_GetTalentGroup()
	if( GetSpecialization ) then
		return GetSpecialization() or 1;
	elseif( GetActiveTalentGroup ) then
		return GetActiveTalentGroup();
	else
		return 1;
	end
end


--[[ ----------------------------------------------------------------
	METHOD: COE_GetNumPartyMembers

	PURPOSE: GetNumPartyMembers() was removed from the WoW API (the
		advisor's party scan in COE_TotemLogic.lua called it
		directly, which errored with "attempt to call global
		'GetNumPartyMembers' (a nil value)" every time the advisor
		ran). GetNumGroupMembers() is the modern replacement: it
		counts the player too and also counts raid members, so we
		subtract 1 for the player and return 0 while in a raid to
		match the old function's exact behaviour (only "party1".."party4"
		style members, not raid members).
-------------------------------------------------------------------]]
function COE_GetNumPartyMembers()
	if( IsInRaid and IsInRaid() ) then
		return 0;
	elseif( GetNumGroupMembers ) then
		local n = GetNumGroupMembers();
		if( n > 0 ) then
			return n - 1;
		else
			return 0;
		end
	elseif( GetNumPartyMembers ) then
		return GetNumPartyMembers();
	else
		return 0;
	end
end

--[[ ----------------------------------------------------------------
	When DebugMode is set to true, all DebugMessage calls will
	write a debug message into the chat frame
-------------------------------------------------------------------]]
COE["DebugMode"] = false;


--[[ ----------------------------------------------------------------
	These variables control frame updates
	UpdateInterval sets the interval in seconds after which a 
	frame is updated
	ForceUpdate can be used as input into Update handlers to force
	an update regardless of the current timer
-------------------------------------------------------------------]]
COE["UpdateInterval"] = 0.1;
COE["ForceUpdate"] = COE.UpdateInterval * 2; 


--[[ ----------------------------------------------------------------
	The AdvisorInterval controls how often the party/raid is
	scanned for debuffs that are curable by totems
	The AdvisorWarningInterval controls how often the player is
	notified about existing debuffs
-------------------------------------------------------------------]]
COE["AdvisorInterval"] = 1;
COE["AdvisorWarningInterval"] = 7;


--[[ ----------------------------------------------------------------
	METHOD: COE:Init
	
	PURPOSE: Loads submodules and initializes data
-------------------------------------------------------------------]]
function COE:Init(self)
	COE:Message( "Call of Elements v" .. COE_VERSION );
	
	-- load only for shamans
	-- ----------------------
	local _, EnglishClass = UnitClass( "player" );
	if( EnglishClass ~= "SHAMAN" ) then
		COE:Message( COESTR_NOTASHAMAN );
		COE.Initialized = false;
	else
		COE.Initialized = true;

		self:RegisterEvent( "VARIABLES_LOADED" );
	
		-- register shell command
		-- -----------------------
		SlashCmdList["COE"] = COEProcessShellCommand;
    	SLASH_COE1="/coe";
		
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE:OnEvent
	
	PURPOSE: Handles frame events
-------------------------------------------------------------------]]
function COE:OnEvent(self,event,...)

	if( event == "VARIABLES_LOADED" ) then
		-- fix saved variables if self update has to do so
		-- ------------------------------------------------
		COE:FixSavedVariables();
	end
end


--[[ ----------------------------------------------------------------
	METHOD: COE:Message
	
	PURPOSE: Adds a message to the default chat frame
-------------------------------------------------------------------]]
function COE:Message( msg )
	DEFAULT_CHAT_FRAME:AddMessage( "[COE] " .. msg, 0.93, 0.83, 0.45 );
end;


--[[ ----------------------------------------------------------------
	METHOD: COE:DebugMessage
	
	PURPOSE: Adds a debug message to the default chat frame if
		debug mode is enabled
-------------------------------------------------------------------]]
function COE:DebugMessage( msg )
	if( COE.DebugMode ) then
		DEFAULT_CHAT_FRAME:AddMessage( "[COE] " .. msg, 0.5, 0.5, 0.5 );
	end
end;


--[[ ----------------------------------------------------------------
	METHOD: COE:Notification
	
	PURPOSE: Adds a message to the error frame in the upper
		screen center
-------------------------------------------------------------------]]
function COE:Notification( msg, color )

	local col;

	-- choose color
	-- -------------
	if( color == COECOL_TOTEMWARNING ) then
		col = { r = 0, g = 0.6, b = 1 };
	elseif( color == COECOL_TOTEMDESTROYED ) then
		col = { r = 1, g = 0.4, b = 0 };
	elseif( color == COECOL_TOTEMCLEANSING ) then
		col = { r = 0, g = 1, b = 0.4 };
	else
		col = { r = 1, g = 1, b = 1 };
	end

	-- add message
	-- ------------
	UIErrorsFrame:AddMessage( msg, col.r, col.g, col.b, 1.0, UIERRORS_HOLD_TIME );
	
end;


--[[ ----------------------------------------------------------------
	METHOD: COE_ToggleConfigFrame
	
	PURPOSE: Toggles the configuration dialog
-------------------------------------------------------------------]]
function COE_ToggleConfigFrame()
	
	if( COE_ConfigFrame:IsVisible() ) then
		COE_Config:CloseDialog()
	else
		COE_ConfigFrame:Show();
	end

	PlaySound(856);

end


--[[ ----------------------------------------------------------------
	METHOD: COEProcessShellCommand
	
	PURPOSE: Executes the entered shell command
-------------------------------------------------------------------]]
function COEProcessShellCommand( msg )

	if( msg == "" or msg == "config" ) then
		COE_ToggleConfigFrame();
		
	elseif( msg == "list" ) then
		COE:DisplayShellCommands();
		
	elseif( msg == "nextset" ) then
		COE_Totem:SwitchToNextSet();
		
	elseif( msg == "priorset" ) then
		COE_Totem:SwitchToPriorSet();

	elseif( msg == "throwset" ) then
        COE:Message("Disabled feature since WoW 2.0 - Use new keybinding '"..BINDING_NAME_COEDROPSET.."' instead");
		--COE_Totem:ThrowSet();
		
	elseif( msg == "restartset" ) then
        COE:Message("Disabled feature since WoW 2.0 - Use new keybinding '"..BINDING_NAME_COEDROPSET.."' instead");
		--COE_Totem:ResetSetCycle();
		
	elseif( msg == "reset" ) then
		COE_Totem:ResetTimers();
		
	elseif( msg == "reload" ) then
		COE_Totem:Rescan();
		
	elseif( msg == "resetframes" ) then
		COE_Totem:ResetFrames();

	elseif( msg == "advised" ) then
		COE_Totem:ThrowAdvisedTotem();
		
	elseif( msg == "resetordering" ) then
		COE_DisplayedTotems[COE_ActiveTalents] = {};
		COE_Totem:Rescan();
		
	elseif( msg == "bestheal" ) then
		COE_Heal:BestHeal();
		
	elseif( msg == "battleheal" ) then
		COE_Heal:BattleHeal();

	else
		local _,_,arg = string.find( msg, "set (.*)" );
		if( arg ) then
			COE_Totem:SwitchToSet( arg );
		end
	end  	

end


--[[ ----------------------------------------------------------------
	METHOD: COE:DisplayShellCommands
	
	PURPOSE: Shows a list of all shell commands
-------------------------------------------------------------------]]
function COE:DisplayShellCommands()

	COE:Message( COESHELL_INTRO );
	COE:Message( COESHELL_CONFIG );
	COE:Message( COESHELL_LIST );
	COE:Message( COESHELL_NEXTSET );
	COE:Message( COESHELL_PRIORSET );
	COE:Message( COESHELL_SET );
	COE:Message( COESHELL_RESTARTSET );
	COE:Message( COESHELL_RESET );
	COE:Message( COESHELL_RESETFRAMES );
	COE:Message( COESHELL_RESETORDERING );
	COE:Message( COESHELL_RELOAD );
	COE:Message( COESHELL_MACRONOTE );
	COE:Message( COESHELL_THROWSET );
	COE:Message( COESHELL_ADVISED );

end

function COE:DuplicateTable(tab)
  if(type(tab) ~= "table")
  then
    return nil;
  end
  local newtab = {};
  for n,v in pairs(tab)
  do
    if(type(v) == "table") -- recurs dup
    then
      newtab[n] = COE:DuplicateTable(v);
    else
      newtab[n] = v;
    end
  end
  return newtab;
end

function COE:CheckTalentSpecChanged(dont_scan)
  -- Check for SV init
  if(COE_ActiveTalents ~= COE_GetTalentGroup()) then
    COE_ActiveTalents = COE_GetTalentGroup();
    COE:Message("Switched to talent spec "..COE_ActiveTalents);

    if(COE_Saved[COE_ActiveTalents] == nil) then
      if(COE_ActiveTalents > 1 and COE_Saved[1] ~= nil) then -- Try to copy from main spec
        COE:Message("Duplicating Main config from main talent spec");
        COE_Saved[COE_ActiveTalents] = COE:DuplicateTable(COE_Saved[1]);
      else
        COE:Message("Resetting Main config from defaults for self talent spec");
        COE_Saved[COE_ActiveTalents] = COE:DuplicateTable(COE_Saved_Defaults);
      end
    end

    if(COE_DisplayedTotems[COE_ActiveTalents] == nil) then
      COE_DisplayedTotems[COE_ActiveTalents] = { };
      if(not dont_scan) then
        COE:ScanTotems(); -- Rescanning totems to fill COE_DisplayedTotems array
      end
    end
    
    if(COE_TotemBars[COE_ActiveTalents] == nil) then
      COE_TotemBars[COE_ActiveTalents] = COE:DuplicateTable(COE_TotemBars_Defaults);
    end
    
    -- Update config
    for _,element in pairs(COE_Element)
    do
      local frame = _G[ "COE" .. element .. "Frame" ]; 
      frame.Mode = COE_TotemBars[COE_ActiveTalents][element].Mode;
      frame.FlexCount = COE_TotemBars[COE_ActiveTalents][element].FlexCount;
      COE_Totem:SetFrameDirection( frame, COE_TotemBars[COE_ActiveTalents][element].Direction );
      --COE_Totem:Invalidate( frame, true, true, true ); -- Will be done during COE_Totem:ForceFrameCoordinates()
    end
    
    COE_Totem:ForceFrameCoordinates(); -- Update frame coordinates and invalidate them
  end
end

--[[ ----------------------------------------------------------------
	METHOD: COE:FixSavedVariables
	
	PURPOSE: If self addon version is higher than the one in
		the saved variables, check if we have to fix the
		saved variables due to fixed bugs
-------------------------------------------------------------------]]
function COE:FixSavedVariables()

	-- is the version stored in the saved variables?
	-- ----------------------------------------------
	if( not COE_Config:GetSaved( COEOPT_VERSION ) ) then
		-- self is version <= v1.6
		-- ------------------------
		COE_Config:SetOption( COEOPT_VERSION, 1.6 );
	end
	
	local version = COE_Config:GetSaved( COEOPT_VERSION );

	if( version == 1.6 ) then
		-- fix localized cast order in 1.7
		-- --------------------------------
		COE:Fix_CastOrderLocalization();
		
		COE:Message( COESTR_UDATEDSAVED .. "1.7" );
		COE_Config:SetOption( COEOPT_VERSION, 1.7 );
		version = COE_Config:GetSaved( COEOPT_VERSION );
	end

	if( version == 1.7 ) then
		-- fix cast order again to due to a typo
		-- --------------------------------------
		COE:Fix_CastOrderLocalization();
	
		COE:Message( COESTR_UDATEDSAVED .. "1.8" );
		COE_Config:SetOption( COEOPT_VERSION, 1.8 );
		version = COE_Config:GetSaved( COEOPT_VERSION );
	end
	
        if( version < 2.2 ) then
          -- Convert to 2.2
          COE:Message( COESTR_UDATEDSAVED .. "2.2" );

          -- Backup data
          local saf_main = COE_Saved;
          COE_Saved = {};

          local saf_displayed = {};
          for n,v in pairs(COE_DisplayedTotems) -- Backup displayed Totems
          do
            if(type(n) ~= "number") -- Don't get already created Talent spec tables
            then
              saf_displayed[n] = v;
            end
          end
          COE_DisplayedTotems = {};
          local saf_bars = {};
          for n,v in pairs(COE_TotemBars) -- Backup totem bars
          do
            if(type(n) ~= "number") -- Don't get already created Talent spec tables
            then
              saf_bars[n] = v;
            end
          end
          COE_TotemBars = {};
          
          -- Check/init talent spec
          COE:CheckTalentSpecChanged(true);

          -- Restore old config to active Talent spec
          COE_Saved[COE_ActiveTalents] = saf_main;
          COE_DisplayedTotems[COE_ActiveTalents] = saf_displayed;
          COE_TotemBars[COE_ActiveTalents] = saf_bars;
          -- Add new data
          if(COE_TotemBars[COE_ActiveTalents].positions == nil)
          then
            COE_TotemBars[COE_ActiveTalents].positions = COE:DuplicateTable(COE_TotemBars_Defaults.positions);
          end
        end
        
	-- fix totem set element strings
	-- ------------------------------
	COE:Fix_CastOrderLocalization2();

	COE_Config:SetOption( COEOPT_VERSION, 2.2 );
        
	-- Cosmos support
	if(EarthFeature_AddButton) then 
		EarthFeature_AddButton(
			{ id = BINDING_HEADER_CALLOFELEMENTS;
			name = BINDING_HEADER_CALLOFELEMENTS;
			subtext = "Version: " .. COE_VERSION; 
			tooltip = "";      
			icon = "Interface\\Icons\\INV_Misc_Idol_03";
			callback = COE_ToggleConfigFrame;
			test = nil;
			} )
	elseif (Cosmos_RegisterButton) then 
		Cosmos_RegisterButton(BINDING_HEADER_CALLOFELEMENTS, BINDING_HEADER_CALLOFELEMENTS, COE_VERSION, "Interface\\Icons\\INV_Misc_Idol_03", COE_ToggleConfigFrame);
	end        
end
