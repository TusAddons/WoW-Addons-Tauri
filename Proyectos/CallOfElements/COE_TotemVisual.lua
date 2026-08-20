--[[

	CALL OF ELEMENTS
	The All-In-One Shaman Addon
	
	by Wyverex (2006)
	
	
	Totem Module / Visual
	
]]

if( not COE_Totem ) then 
	COE_Totem = {};
end 

COEUI_CurrentScale = 1;

COEUI_BUTTONGAP = 0;

COE_Totem.FlexTime = 0.3;

COEFramePositions = { Earth = { x = 0, y = 0 }, Fire = { x = 0, y = 0 }, 
	Water = { x = 0, y = 0 }, Air = { x = 0, y = 0 } } 

COEDynamic = { n = 7, nil, nil, nil, nil, nil, nil, nil };

COE_SlotToElement = {
  [FIRE_TOTEM_SLOT] = "Fire",
  [EARTH_TOTEM_SLOT] = "Earth",
  [WATER_TOTEM_SLOT] = "Water",
  [AIR_TOTEM_SLOT] = "Air"
};

--[[ =============================================================================================

										M A I N F R A M E 

================================================================================================]]

--[[ ---------------------------------------------------------------------------------------------

	Each element frame has the following properties:
	
		- AdvisorTime		: <time since the last advisor scan>
		- Reconfigure		: <true if totems have to be reassigned to the buttons>

------------------------------------------------------------------------------------------------]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:InitMainFrame
	
	PURPOSE: Initializes the totem module and registers events
-------------------------------------------------------------------]]
function COE_Totem:InitMainFrame(self)
	-- addon loaded?
	-- --------------
	if( not COE.Initialized ) then
		return;
	end

	-- init frame properties
	-- ----------------------
	self.AdvisorTime = 0;
	self.Reconfigure = true;
	
	-- register events
	-- ----------------
	self:RegisterEvent( "PLAYER_ENTERING_WORLD" );
	self:RegisterEvent( "PLAYER_REGEN_ENABLED" );
	self:RegisterEvent( "LEARNED_SPELL_IN_TAB" );
	self:RegisterEvent( "PLAYER_TARGET_CHANGED" );
	self:RegisterEvent( "PLAYER_DEAD" );

	self:RegisterEvent( "UNIT_SPELLCAST_SUCCEEDED" );
	--self:RegisterEvent( "CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS" );
	--self:RegisterEvent( "CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS" );
	--self:RegisterEvent( "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE" );
	--self:RegisterEvent( "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE" );

        --self:RegisterEvent( "COMBAT_LOG_EVENT_UNFILTERED" );
        self:RegisterEvent( "PLAYER_TOTEM_UPDATE" );
        self:RegisterEvent("PLAYER_TALENT_UPDATE");
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnMainFrameEvent
	
	PURPOSE: Handles UI events
-------------------------------------------------------------------]]
function COE_Totem:OnMainFrameEvent( event,... )
	
	if( event == "PLAYER_ENTERING_WORLD" ) then
		-- fix saved variables
		-- --------------------
                COE:CheckTalentSpecChanged(true);
		COE:Fix_DisplayedTotems();
	
		-- scan for available totems. do self here instead of inside COE:Init
		-- because spells cannot be retrieved there yet
		-- -------------------------------------------------------------------
		COE_Totem:Rescan();

		-- start advisor schedule
		-- -----------------------
		if( COE_Config:GetSaved( COEOPT_ADVISOR ) == 1 ) then		
			Chronos.scheduleRepeating( "COEAdvise", COE.AdvisorInterval, COESched_RunAdvisor );
		end
		
		-- get current element frame coordinates
		-- --------------------------------------
		COE_Totem:UpdateFrameCoordinates();

		-- show timer frame if needed
		-- --------------------------------------
		COEOptionEnableTimerFrame();

		-- Check state header initialization
		-- ---------------------------------
		COE_Config:CheckStateInit2();
		COE_Config:CheckStateInit();
		
		-- Check for already dropped totems
		-- ---------------------------------
		for i=1, MAX_TOTEMS do
			local haveTotem, name, startTime, duration, icon = GetTotemInfo(i);
			if(duration ~= 0) then -- Totem dropped
				COE_Totem:CheckTotemSpell(name,startTime,duration);
			end
		end
		
	elseif( event == "PLAYER_REGEN_ENABLED" ) then
		-- Out of combat, check for Set Changed
		-- -----------------------------------
		if(COETotemFrame.MustConfigureSet and COETotemFrame.MustConfigureSet ~= -1) then
				COE_Config:ConfigureStateSet(COETotemFrame.MustConfigureSet);
				COETotemFrame.MustConfigureSet = -1;
		end
		
	elseif( event == "LEARNED_SPELL_IN_TAB" ) then
		-- learned a new spell. rescan totems
		-- -----------------------------------
		COE:CheckTalentSpecChanged();
		COE_Totem:Rescan();
		
	elseif( event == "PLAYER_TARGET_CHANGED" ) then
	
		if( COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) == 0 ) then
			return;
		end

		-- Switch to named set if appropriate
		-- -----------------------------------
		if( not COE_Totem:SwitchNamedSet() ) then
			-- Switch to class set if appropriate
			-- -----------------------------------		
			COE_Totem:SwitchPVPSet();
		end
	
	elseif( event == "UNIT_SPELLCAST_SUCCEEDED" and select(1,...) == "player") then
		--[[if(select(2,...) == COE.TotemicCallName) then
			COE_Totem:ResetTimers();
		else
			COE_Totem:CheckTotemSpell(select(2,...));
		end]]

	elseif( event == "PLAYER_DEAD" ) then
	
		-- reset all timers upon death
		-- ----------------------------
		COE_Totem:ResetTimers();
		
	elseif(event == "PLAYER_TOTEM_UPDATE") then
		local slot = ...;
		if(slot) then
			local haveTotem, name, startTime, duration, icon = GetTotemInfo(slot);
			if(duration == 0) then -- Totem removed
				-- Convert slot to Element
				local totem = COE.ActiveTotems[COE_SlotToElement[slot]];
				if(totem and totem.isActive) then
					if( COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 1 ) then
						COE:DebugMessage( totem.SpellName .. " destroyed" );
						if( COE_Config:GetSaved( COEOPT_TIMERNOTIFICATIONS ) == 1 ) then
							COE:Notification( string.format( COESTR_TOTEMDESTROYED, totem.SpellName ),COECOL_TOTEMDESTROYED );
						end
						COE_Totem:DeactivateTimer(totem);
					end
				end
			else -- Totem dropped
				COE_Totem:CheckTotemSpell(name,startTime,duration);
				--kud("Totem dropped ("..slot.."): "..tostring(haveTotem).." - "..tostring(name).." - "..tostring(startTime).." - "..tostring(duration).." - "..tostring(icon));
			end
		end
	elseif(event == "PLAYER_TALENT_UPDATE") then
		COE:CheckTalentSpecChanged();
	end
	
end

function COE_Totem:SetSpellOrTrinket(button)
  if(button.totem.isTrinket)
  then
    button:SetAttribute("type","item");
    button:SetAttribute("slot",button.totem.TrinketSlot);
    button:SetAttribute("shift-spell1",ATTRIBUTE_NOOP);
    button:SetAttribute("alt-spell1",ATTRIBUTE_NOOP);
    button:SetAttribute("ctrl-spell1",ATTRIBUTE_NOOP);
    button:SetAttribute("ctrl-item1",ATTRIBUTE_NOOP);
  else
    button:SetAttribute("type","spell");
    button:SetAttribute("spell",button.totem.SpellName);
    button:SetAttribute("shift-spell1",ATTRIBUTE_NOOP);
    button:SetAttribute("alt-spell1",ATTRIBUTE_NOOP);
    button:SetAttribute("ctrl-spell1",ATTRIBUTE_NOOP);
    button:SetAttribute("ctrl-item1",ATTRIBUTE_NOOP);
    if(COE_Config:GetSaved( COEOPT_OVERRIDERANK ) == 2) -- Shift key
    then
      button:SetAttribute("shift-spell1",button.totem.SpellName.."("..RANK.." 1)");
    elseif(COE_Config:GetSaved( COEOPT_OVERRIDERANK ) == 3) -- Alt key
    then
      button:SetAttribute("alt-spell1",button.totem.SpellName.."("..RANK.." 1)");
    elseif(COE_Config:GetSaved( COEOPT_OVERRIDERANK ) == 4) -- Ctrl key
    then
      button:SetAttribute("ctrl-spell1",button.totem.SpellName.."("..RANK.." 1)");
    end
  end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ConfigureTotemButtons
	
	PURPOSE: Assigns all totems to the corresponding buttons and
		returns the number of totems per element
-------------------------------------------------------------------]]
function COE_Totem:ConfigureTotemButtons()

	-- reconfiguration necessary?
	-- ---------------------------
	if( not COETotemFrame.Reconfigure ) then
		return;
	end 

	local i;
	local buttons = { Earth = 0, Fire = 0, Water = 0, Air = 0 };
	local indices = { "Earth", "Fire", "Water", "Air" };
	
	local mode = COE_Config:GetSaved( COEOPT_DISPLAYMODE );
	local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );
	
	-- assign placeholder totem
	-- -------------------------
	for i = 1, 4 do
		local button = _G[ "COETotem" .. COE_Element[i] .. "None" ];
		
		button.totem = COE.NoTotem;
	end
	
	-- clear all buttons or we could get double totems
	-- when switching from customize to another mode
	-- ------------------------------------------------
	for i = 1, 4 do
		for k = 1, COE.MaxTotems[indices[i]] do
			local button = _G[ "COETotem" .. indices[i] .. k ];
			
			button.totem = nil;
		end
	end			
	
	-- assign totems
	-- --------------
	for i = 1, COE.TotemCount do
		local totem = COE.TotemData[i];
		
		-- increase button counter
		-- ------------------------
		buttons[totem.Element] = buttons[totem.Element] + 1;
		if(COE_DisplayedTotems[COE_ActiveTalents][totem.SpellName] == nil) then
			break; -- TO DO, CONTINUER LA BOUCLE
                end
		local order = COE_DisplayedTotems[COE_ActiveTalents][totem.SpellName].Order;
		local button;		

		--===================================================
		-- find out the button to store the totem in		
		--===================================================		
		if( mode == COEMODE_ALLTOTEMS ) then  
			button = _G[ "COETotem" .. totem.Element .. order ];
		elseif( mode == COEMODE_TIMERSONLY ) then
			if( COE.ActiveTotems[totem.Element] ) then
				if( COE.ActiveTotems[totem.Element] == totem ) then 
					-- self totem is/was last active. store at pos 1
					-- ----------------------------------------------
					button = _G[ "COETotem" .. totem.Element .. "1" ];
				
				else
					-- check if self totem's order is before or after
					-- the normal order of self element's active totem
					-- ------------------------------------------------
					local activeorder = COE_DisplayedTotems[COE_ActiveTalents][COE.ActiveTotems[totem.Element].SpellName].Order;
					if( order < activeorder ) then
						order = order + 1;
					end
					
					button = _G[ "COETotem" .. totem.Element .. order ];
				end
				
			else
				-- there has not been any active totem for self element yet
				-- use the normal ordering
				-- ---------------------------------------------------------			
				button = _G[ "COETotem" .. totem.Element .. order ];
			end		

		else
			if( COE.TotemSets[activeset][totem.Element] == totem ) then
				-- self totem is in the active set. store at pos 1
				-- ------------------------------------------------
				button = _G[ "COETotem" .. totem.Element .. "1" ];
	
			elseif( COE.TotemSets[activeset][totem.Element] ) then
				-- check if self totem's order is before or after
				-- the normal order of self set's element totem
				-- -----------------------------------------------
				local activeorder = COE_DisplayedTotems[COE_ActiveTalents][COE.TotemSets[activeset][totem.Element].SpellName].Order;
				if( order < activeorder ) then
					order = order + 1;
				end
					
				button = _G[ "COETotem" .. totem.Element .. order ];	
			else
				-- there is no totem for self element in the set
				-- use the normal ordering
				-- ----------------------------------------------			
				button = _G[ "COETotem" .. totem.Element .. order ];
			end		
		end
		
		--===================================================
		-- store the totem		
		--===================================================		
		if( button ~= nil ) then
			-- store totem object in button
			-- -----------------------------
			button.totem = totem;
			COE_Totem:SetSpellOrTrinket(button);
			ClearOverrideBindings(button);
			local key,key2 = GetBindingKey("TOTEM"..string.upper(totem.Element)..tostring(math.fmod(button:GetID(),10)));
			if(key) then
				SetOverrideBindingClick(button, false, key, button:GetName());
                        end
			if(key2) then
				SetOverrideBindingClick(button, false, key2, button:GetName());
                        end
			
			-- assign button for cleansing advisory
			-- -------------------------------------
			if( totem == COE.CleansingTotems.Poison.Totem ) then
				COE.CleansingTotems.Poison.Button = button;
			elseif( totem == COE.CleansingTotems.Disease.Totem ) then
				COE.CleansingTotems.Disease.Button = button;
			elseif( totem == COE.CleansingTotems.Tremor.Totem ) then
				COE.CleansingTotems.Tremor.Button = button;
			end
		end	
	end
	
	-- invalidate all frames
	-- ----------------------
	COE_Totem:Invalidate( COEEarthFrame, true, true, true );
	COE_Totem:Invalidate( COEFireFrame, true, true, true );
	COE_Totem:Invalidate( COEWaterFrame, true, true, true );
	COE_Totem:Invalidate( COEAirFrame, true, true, true );

	-- only reconfigure the next time it is really necessary
	-- ------------------------------------------------------	
	COETotemFrame.Reconfigure = false;

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateAllFrames
	
	PURPOSE: Forces an update of all element frames
-------------------------------------------------------------------]]
function COE_Totem:UpdateAllFrames()

	if( COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) == 1 ) then
		if( COE.TotemsAvailable.Earth > 0 ) then
			COEEarthFrame:Show();
			COE_Totem:Invalidate( COEEarthFrame, true, true, true );
		else
			COEEarthFrame:Hide();
		end
		if( COE.TotemsAvailable.Fire > 0 ) then
			COEFireFrame:Show();
			COE_Totem:Invalidate( COEFireFrame, true, true, true );
		else
			COEFireFrame:Hide();
		end
		if( COE.TotemsAvailable.Water > 0 ) then
			COEWaterFrame:Show();
			COE_Totem:Invalidate( COEWaterFrame, true, true, true );
		else
			COEWaterFrame:Hide();
		end
		if( COE.TotemsAvailable.Air > 0 ) then
			COEAirFrame:Show();
			COE_Totem:Invalidate( COEAirFrame, true, true, true );
		else
			COEAirFrame:Hide();
		end
	else
		COEEarthFrame:Hide();
		COEFireFrame:Hide();
		COEWaterFrame:Hide();
		COEAirFrame:Hide();
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ResetFrames
	
	PURPOSE: Resets all element frames' positions
-------------------------------------------------------------------]]
function COE_Totem:ResetFrames()

	COEEarthFrame:ClearAllPoints();
	COEEarthFrame:SetPoint( "CENTER", "UIParent", "CENTER", -75, 75 );
	COEFireFrame:ClearAllPoints();
	COEFireFrame:SetPoint( "CENTER", "UIParent", "CENTER", 75, 75 );
	COEWaterFrame:ClearAllPoints();
	COEWaterFrame:SetPoint( "CENTER", "UIParent", "CENTER", -75, -75 );
	COEAirFrame:ClearAllPoints();
	COEAirFrame:SetPoint( "CENTER", "UIParent", "CENTER", 75, -75 );
	
	COE_Totem:UpdateFrameCoordinates();

end


--[[ =============================================================================================

										F R A M E 

================================================================================================]]

--[[ ---------------------------------------------------------------------------------------------

	Each element frame has the following properties:
	
		- Element			: Earth, Fire, Water, Air
		- Direction			: Up, Down, Left, Right
			- Point			: <anchorpoint for the totem buttons>
			- RelPoint		: <relative anchorpoint for the totem buttons>
			- XSpacing		: <amount of horizontal spacing between the totem buttons> 
			- YSpacing		: <amount of vertical spacing between the totem buttons> 
		- Mode				: Open, Closed, Flex
		- FlexCount			: <number of totems to show always when in Flex-Mode>
		- Expanded			: True, False
		- UpdateTime		: <time since the last visual update>
		- AnchorTotem		: <totem button that serves as the frame anchor>
		- IsMoving			: <true if frame is being dragged>
		
		- Updates			: <controls which updates will be run in the next UpdateFrame>
			- Anchor		: true, false <update positioning of the anchor button>
			- Static		: true, false <update alignment of the static buttons>
			- Dynamic		: true, false <update alignment of the dynamic buttons> 

------------------------------------------------------------------------------------------------]]


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:InitFrame
	
	PURPOSE: Initializes the element frame
-------------------------------------------------------------------]]
function COE_Totem:InitFrame(self)
	-- addon loaded?
	-- --------------
	if( not COE.Initialized ) then
		return;
	end

	-- init update timer
	-- ------------------
	self.UpdateTime = 0;
	
	-- initially update all frame parts
	-- ---------------------------------
	self.Updates = { Anchor = true, Static = true, Dynamic = true };

	-- frame doesn't move initially
	-- -----------------------------	
	self.IsMoving = false;

	-- register events
	-- ----------------
	self:RegisterEvent( "PLAYER_ENTERING_WORLD" );

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnFrameEvent
	
	PURPOSE: Handles UI events
-------------------------------------------------------------------]]
function COE_Totem:OnFrameEvent( self, event, ... )
	
	if( event == "PLAYER_ENTERING_WORLD" ) then
		-- load frame settings from saved variables 
		-- -----------------------------------------
                if(COE_ActiveTalents == nil) then return end -- Let's see later
		COE_Totem:SetFrameDirection( self, COE_TotemBars[COE_ActiveTalents][self.Element].Direction );
		self.Mode = COE_TotemBars[COE_ActiveTalents][self.Element].Mode;
		self.FlexCount = COE_TotemBars[COE_ActiveTalents][self.Element].FlexCount;
		self.MouseHover = false;
		self.Expanded = false;
		self.AnchorTotem = nil; 

		-- update all frame parts now that we
		-- know which totems and options we have
		-- --------------------------------------
		COE_Totem:Invalidate( self, true, true, true );
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:Invalidate
	
	PURPOSE: Invalidates anchor button, static and/or dynamic 
		buttons if any or all are set to true
-------------------------------------------------------------------]]
function COE_Totem:Invalidate( frame, Anchor, Static, Dynamic )

	-- don't set any flag to false to prevent overwriting
	-- a previous call to Invaldiate with a true parameter
	-- ----------------------------------------------------
	if( Anchor ) then
		frame.Updates.Anchor = true;
	end

	if( Static ) then
		frame.Updates.Static = true;
	end

	if( Dynamic ) then
		frame.Updates.Dynamic = true;
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateFrame
	
	PURPOSE: Configures the totem buttons and adjusts the frame size
-------------------------------------------------------------------]]
function COE_Totem:UpdateFrame( self, elapsed )

	-- check if visual update is necessary
	-- ------------------------------------
	self.UpdateTime = self.UpdateTime + elapsed;
	if( self.UpdateTime <= COE.UpdateInterval ) then
		return;
	end

        -- In combat ? delay update
	if(InCombatLockdown()) then
		return;
	end

	-- show frame?
	-- ------------
	if( COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) == 1 and
		COE_TotemBars[COE_ActiveTalents][self.Element].Mode ~= "Hidden" ) then
		self:Show();
	else 
		self:Hide();
		return;
	end
	
	-- set scaling
	-- ------------
	self:SetScale( COE_Config:GetSaved( COEOPT_SCALING ) );
	
	-- invalidate all if moving
	-- -------------------------
	if( self.isMoving ) then
		COE_Totem:Invalidate( self, true, true, true );
	end		
	
	-- configure buttons for self frame
	-- ---------------------------------
	COE_Totem:ConfigureTotemButtons();
	
	-- configure anchor button
	-- ------------------------
	if( self.Updates.Anchor ) then
		COE_Totem:UpdateAnchorButton(self);
	end
	
	-- only update if at least the anchor
	-- totem button has a totem assigned
	-- -----------------------------------
	if( COE.TotemsAvailable[self.Element] > 0 ) then
		self.AnchorTotem:Show();
	
		-- update the dynamic flex-totems
		-- -------------------------------
		if( self.Updates.Dynamic ) then
			COE_Totem:UpdateDynamic(self);
		end
		
		-- update the static flex-totems
		-- ------------------------------
		if( self.Updates.Static ) then
			COE_Totem:UpdateStatic(self);
		end
	else
		self.AnchorTotem:Hide();
	end
	
	-- adjust other frames when dragging
	-- ----------------------------------
	if( self.IsMoving ) then
		COE_Totem:AdjustDraggedFrames(self);
	end
	
	-- reset invalidation flags
	-- -------------------------
	self.Updates.Anchor = false;
	self.Updates.Static = false;
	self.Updates.Dynamic = false;
	
	-- reset update time
	-- ------------------
	COETotemFrame.UpdateTime = 0;
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateAnchorButton
	
	PURPOSE: Sets the right anchor button depending on the 
		display and bar mode
-------------------------------------------------------------------]]
function COE_Totem:UpdateAnchorButton( self )

	local mode = COE_Config:GetSaved( COEOPT_DISPLAYMODE );
	local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );

	if( mode == COEMODE_ALLTOTEMS ) then
		self.AnchorTotem = _G[ "COETotem" .. self.Element .. "1" ];
		
	elseif( mode == COEMODE_TIMERSONLY ) then
		if( COE.ActiveTotems[self.Element] or COE_TotemBars[COE_ActiveTalents][self.Element].Mode == "Open" ) then
			self.AnchorTotem = _G[ "COETotem" .. self.Element .. "1" ];
		else 
			self.AnchorTotem = _G[ "COETotem" .. self.Element .. "None" ];
			return;
		end

	else
		if( COE.TotemSets[activeset][self.Element] or COE_TotemBars[COE_ActiveTalents][self.Element].Mode == "Open" ) then
			self.AnchorTotem = _G[ "COETotem" .. self.Element .. "1" ];
		else 
			self.AnchorTotem = _G[ "COETotem" .. self.Element .. "None" ];
			return;
		end
	end
	
	-- hide the no-totem button
	-- -------------------------
	_G[ "COETotem" .. self.Element .. "None" ]:Hide();

-- CHANGE by tayedaen: Added next 2 lines to fix some scaling issues
	COEUI_CurrentScale = COE_Config:GetSaved( COEOPT_SCALING );
	self.AnchorTotem:SetScale( COEUI_CurrentScale );

	--self.AnchorTotem:SetScale( 1 );
	self.AnchorTotem:ClearAllPoints();
	self.AnchorTotem:SetPoint( "CENTER", self, "CENTER" );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateStatic
	
	PURPOSE: Shows the FlexiCount first totems of self element
-------------------------------------------------------------------]]
function COE_Totem:UpdateStatic(self)

	local inConfig = COE.ConfigureBarMode or COE.ConfigureOrderMode or COE.ConfigureSetsMode; 

	if( self.Mode == "Closed" and not inConfig) then
		return;
	end

	-- show all buttons in "Open" mode and
	-- FlexCount buttons in "Flex" mode
	-- -------------------------------------		
	local count;
	if( self.Mode == "Open" or inConfig ) then
		count = COE.MaxTotems[self.Element];
	else
		count = self.FlexCount;
	end 
	
-- CHANGE by tayedaen: Added next line to fix some scaling issues
	COEUI_CurrentScale = COE_Config:GetSaved( COEOPT_SCALING );
	local scale_value;
	if( self.Mode == "Flex") then
		scale_value = COEUI_CurrentScale;
	else
		scale_value = 1;
	end 


	-- align and show buttons
	-- -----------------------
	local i, start, button, lastvisible;
	lastvisible = self.AnchorTotem;
	
	if( self.AnchorTotem.totem == COE.NoTotem ) then
		start = 1;
	else
		start = 2;
	end

	for i = start, count do
		button = _G[ "COETotem" .. self.Element .. i ];
		button:ClearAllPoints();
		button:SetScale(scale_value);

		-- only show button if it has a totem
		-- -----------------------------------		
		if( button.totem and (COE_DisplayedTotems[COE_ActiveTalents][button.totem.SpellName].Visible or inConfig) ) then
			button:SetPoint( self.Point, lastvisible, self.RelPoint, self.XSpacing, self.YSpacing );
			button:Show();
			lastvisible = button;
		else
			button:Hide();
		end
	end

end

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateDynamic
	
	PURPOSE: Shows the FlexiTotems if "Flex" mode is enabled and 
		the	frame is expanded
-------------------------------------------------------------------]]
function COE_Totem:UpdateDynamic(self)
 	-- no dynamic buttons in configuration
	-- ------------------------------------
	if( COE.ConfigureBarMode or COE.ConfigureOrderMode or COE.ConfigureSetsMode ) then
		return;
	end

	if( self.Mode == "Flex" ) then
	
		local i, start, lastvisible, idx;
		idx = 1;
		
		if( self.AnchorTotem.totem == COE.NoTotem ) then
			if( self.FlexCount > 1 ) then
				lastvisible = _G[ "COETotem" .. self.Element .. self.FlexCount - 1 ];
			else
				lastvisible = _G[ "COETotem" .. self.Element .. "None" ];
			end
			start = self.FlexCount;
		else
			lastvisible = _G[ "COETotem" .. self.Element .. self.FlexCount ];
			start = self.FlexCount + 1;
		end

		-- we need two passes now. the first one aligns all
		-- "docked" totems and the second pass adds all other totems.
		-- self way, the docked totems are shown first in the expanded bar
		-- ---------------------------------------------------------------- 
				
		for i = start, COE.MaxTotems[self.Element] do
			button = _G[ "COETotem" .. self.Element .. i ];
			button:ClearAllPoints();

			if( button.totem and COE_DisplayedTotems[COE_ActiveTalents][button.totem.SpellName].Visible ) then
--[[ Dynamic buttons can't work anymore, Just setup Flex anchors
				if( COE.ActiveTotems[self.Element] == button.totem and COE_Totem:IsTimerActive( button.totem ) ) then
					-- show button if it is active
					-- ----------------------------		
					button:SetScale( 0.8 );
					button:SetPoint( self.Point, lastvisible, self.RelPoint, self.XSpacing, self.YSpacing );
					button:Show();
					lastvisible = button;
				
				elseif( COE_Totem:GetCooldownLeft( button.totem ) > 0 ) then
					-- show button if it has a running cooldown
					-- -----------------------------------------		
					button:SetScale( 0.8 );
					button:SetPoint( self.Point, lastvisible, self.RelPoint, self.XSpacing, self.YSpacing );
					button:Show();
					lastvisible = button;

				elseif( COE_Totem:IsAdvisedTotem( button.totem ) ) then
					-- show button if it is advised
					-- -----------------------------		
					button:SetScale( 0.8 );
					button:SetPoint( self.Point, lastvisible, self.RelPoint, self.XSpacing, self.YSpacing );
					button:Show();
					lastvisible = button;
							
				elseif( self.Expanded ) then
					-- process totem in second pass
					-- -----------------------------
					COEDynamic[idx] = button;
					idx = idx + 1;
					
				else
					button:SetScale( 1 );
					button:Hide();
				end
				]]
					-- process totem in second pass
					-- -----------------------------
					COEDynamic[idx] = button;
					idx = idx + 1;
			else
				button:SetScale(COEUI_CurrentScale);
				button:Hide();
			end
		end	
					
		for i = 1, idx - 1 do
			button = COEDynamic[i];
			
			-- show button if it has a totem and the bar is expanded
			-- ------------------------------------------------------		
			button:SetScale( COEUI_CurrentScale * 0.8 );
			button:SetPoint( self.Point, lastvisible, self.RelPoint, self.XSpacing, self.YSpacing );
			--button:Show(); -- Don't show, let the State Header do it
                        button:Hide(); -- Hide it, the State Header will show it
			lastvisible = button;
			
			COEDynamic[i] = nil;
		end
		COE_Totem:SetElementTotemFlex(self); -- Update state header data and childs
	elseif( self.Mode == "Closed" ) then
	
		local i, start, lastvisible;
		lastvisible = self.AnchorTotem;
		
		if( self.AnchorTotem.totem == COE.NoTotem ) then
			start = 1;
		else
			start = 2;
		end

		for i = start, COE.MaxTotems[self.Element] do
			button = _G[ "COETotem" .. self.Element .. i ];
			button:ClearAllPoints();
			
--[[ Dynamic buttons can't work anymore, Force HIDE
			if( button.totem and COE.ActiveTotems[self.Element] == button.totem and 
					COE_Totem:IsTimerActive( button.totem ) ) then
				-- show button if it is active
				-- ----------------------------		
				button:SetScale( 0.8 );
				button:SetPoint( self.Point, lastvisible, self.RelPoint, self.XSpacing, self.YSpacing );
				button:Show();
				lastvisible = button;
				
			elseif( button.totem and COE_Totem:GetCooldownLeft( button.totem ) > 0 ) then
				-- show button if it has a running cooldown
				-- -----------------------------------------		
				button:SetScale( 0.8 );
				button:SetPoint( self.Point, lastvisible, self.RelPoint, self.XSpacing, self.YSpacing );
				button:Show();
				lastvisible = button;
					
			elseif( COE_Totem:IsAdvisedTotem( button.totem ) ) then
				-- show button if it isa advised
				-- ------------------------------		
				button:SetScale( 0.8 );
				button:SetPoint( self.Point, lastvisible, self.RelPoint, self.XSpacing, self.YSpacing );
				button:Show();
				lastvisible = button;

			else
				button:SetScale( 1 );
				button:Hide();
			end	]]
			button:SetScale( 1 );
			button:Hide();
		end	
		COE_Totem:SetElementTotemNotControlled(self); -- Update state header data and childs
	
	elseif( self.Mode == "Hidden" ) then
		COE_Totem:SetElementTotemNotControlled(self); -- Update state header data and childs
	
	elseif( self.Mode == "Open" ) then
		COE_Totem:SetElementTotemNotControlled(self); -- Update state header data and childs
	end
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:COESched_HideDynamicButtons
	
	PURPOSE: Set the expanded state to false to hide the dynamic
		buttons of self frame
-------------------------------------------------------------------]]
function COESched_HideDynamicButtons( frame )

	COE_Totem:Invalidate( frame, false, false, true );
	frame.Expanded = false;

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:SetFrameDirection
	
	PURPOSE: Sets the frame parameters responsible for aligning
		the totem buttons in a specific direction
-------------------------------------------------------------------]]
function COE_Totem:SetFrameDirection( frame, direction )

	if( direction == "Up" ) then
		frame.Direction = direction;
		frame.Point = "BOTTOM";
		frame.RelPoint = "TOP";
		frame.XSpacing = 0;
		frame.YSpacing = COEUI_BUTTONGAP;
	
	elseif( direction == "Down" ) then
		frame.Direction = direction;
		frame.Point = "TOP";
		frame.RelPoint = "BOTTOM";
		frame.XSpacing = 0;
		frame.YSpacing = -COEUI_BUTTONGAP;
	
	elseif( direction == "Left" ) then
		frame.Direction = direction;
		frame.Point = "RIGHT";
		frame.RelPoint = "LEFT";
		frame.XSpacing = -COEUI_BUTTONGAP;
		frame.YSpacing = 0;
	
	elseif( direction == "Right" ) then
		frame.Direction = direction;
		frame.Point = "LEFT";
		frame.RelPoint = "RIGHT";
		frame.XSpacing = COEUI_BUTTONGAP;
		frame.YSpacing = 0;
	
	end
	
	-- invalidate static and dynamic buttons
	-- --------------------------------------
	COE_Totem:Invalidate( frame, false, true, true );

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:AdjustDraggedFrames
	
	PURPOSE: If the frames are grouped together and one of them
		is being dragged, the other frames' positions are adjusted
		to retain their relative position 
-------------------------------------------------------------------]]
function COE_Totem:AdjustDraggedFrames(self)

	if( COE_Config:GetSaved( COEOPT_GROUPBARS ) == 0 ) then
		return;
	end

	local x, y, k, dx, dy;
	
	-- get current frame position
	-- ---------------------------
	x = self:GetLeft();
	y = self:GetTop();

	-- get the offset from the old position
	-- -------------------------------------	
	dx = x - COEFramePositions[self.Element].x;		
	dy = y - COEFramePositions[self.Element].y;		

	-- adjust all other frames' positions
	-- -----------------------------------
	for k = 1, 4 do
		if( self.Element ~= COE_Element[k] ) then
			local frame = _G[ "COE" .. COE_Element[k] .. "Frame" ];
			
			-- calculate the frame's new position by retaining
			-- the relative position to the frame being dragged
			-- -------------------------------------------------
			frame:ClearAllPoints();
			frame:SetPoint( "TOPLEFT", UIParent, "BOTTOMLEFT", COEFramePositions[frame.Element].x + dx, 
				COEFramePositions[frame.Element].y + dy );
			
			-- invalidate all parts
			-- ---------------------
			COE_Totem:Invalidate( frame, true, true, true );
		
		end
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateFrameCoordinates
	
	PURPOSE: Stores the current element frame coordinates 
-------------------------------------------------------------------]]
function COE_Totem:UpdateFrameCoordinates()

	local k;
	for k = 1, 4 do
		local frame = _G[ "COE" .. COE_Element[k] .. "Frame" ];

		COEFramePositions[COE_Element[k]].x = frame:GetLeft();
		COEFramePositions[COE_Element[k]].y = frame:GetTop();
                
                if(COE_TotemBars[COE_ActiveTalents] and COE_TotemBars[COE_ActiveTalents].positions)
                then
                  local point, relativeTo, relativePoint, xOfs, yOfs = frame:GetPoint(1);
                  COE_TotemBars[COE_ActiveTalents].positions[COE_Element[k]] = { point, relativePoint, xOfs, yOfs };
                end

		-- Invalidate all parts
		-- ---------------------
		COE_Totem:Invalidate( frame, true, true, true );
	end	

end

function COE_Totem:ForceFrameCoordinates()

	-- adjust all other frames' positions
	-- -----------------------------------
	for k = 1, 4 do
		local frame = _G[ "COE" .. COE_Element[k] .. "Frame" ];
		
		-- calculate the frame's new position by retaining
		-- the relative position to the frame being dragged
		-- -------------------------------------------------
		frame:ClearAllPoints();
                if(COE_TotemBars[COE_ActiveTalents] and COE_TotemBars[COE_ActiveTalents].positions)
                then
                  local point = COE_TotemBars[COE_ActiveTalents].positions[COE_Element[k]]
                  frame:SetPoint(point[1],nil,point[2],point[3],point[4]);
                else
			frame:SetPoint( "TOPLEFT", UIParent, "BOTTOMLEFT", COEFramePositions[frame.Element].x, 
				COEFramePositions[frame.Element].y);
                end
		
		-- invalidate all parts
		-- ---------------------
		COE_Totem:Invalidate( frame, true, true, true );
		
	end
end

--[[ =============================================================================================

										B U T T O N 

================================================================================================]]

--[[ ---------------------------------------------------------------------------------------------

	Each element frame has the following properties:
	
		- totem				: <totem pointer>
		- UpdateTime		: <time since the last visual update>
		- Flashtime			: <time since the last flash when advised>
		- ElementFrame		: <the parent frame>

------------------------------------------------------------------------------------------------]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnTotemButtonLoad
	
	PURPOSE: Registers events for the totem button
-------------------------------------------------------------------]]
function COE_Totem:OnTotemButtonLoad(self)

	if( not COE.Initialized ) then
		return;
	end

	-- init properties
	-- ----------------
	self.UpdateTime = 0;
	self.Flashtime = 0;
	self.ElementFrame = self:GetParent();

	-- register for drag
	-- ------------------
	self:RegisterForDrag( "LeftButton" );
	
	-- register events
	-- ----------------
	self:RegisterEvent( "ACTIONBAR_UPDATE_STATE" );
	self:RegisterEvent( "ACTIONBAR_UPDATE_USABLE" );
	self:RegisterEvent( "ACTIONBAR_UPDATE_COOLDOWN" );
	self:RegisterEvent( "UNIT_MANA" );
	self:RegisterEvent( "UNIT_INVENTORY_CHANGED" );
	self:RegisterEvent( "BAG_UPDATE" );
	self:RegisterEvent( "UPDATE_BINDINGS" );

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnTotemButtonEvent
	
	PURPOSE: Handles UI events for the totem button
-------------------------------------------------------------------]]
function COE_Totem:OnTotemButtonEvent( self, event, ... )

	if( event == "ACTIONBAR_UPDATE_STATE" ) then
		if( self.totem ) then
			COE_Totem:UpdateTotemButton( self, COE.ForceUpdate );
		end
		
	elseif( event == "ACTIONBAR_UPDATE_USABLE" ) then
		if( self.totem and self:GetParent() ~= COETimerFrame ) then
			COE_Totem:UpdateTotemButtonIsUsable(self);
		end
		
	elseif( event == "ACTIONBAR_UPDATE_COOLDOWN" ) then
		if( self.totem and self:GetParent() ~= COETimerFrame ) then
			COE_Totem:UpdateTotemButtonCooldown(self);
		end
		
	elseif( event == "UNIT_MANA" and select(1,...) == "player" ) then
		if( self.totem ) then
			COE_Totem:UpdateTotemButtonIsUsable(self);
		end
		
	elseif( event == "UNIT_INVENTORY_CHANGED" or event == "BAG_UPDATE" ) then
		-- check for presence of totem tools
		-- ----------------------------------
		local totem = self.totem;
		if( totem and totem ~= COE.NoTotem ) then

			if( totem.isTrinket ) then
				local slot;
				totem.ToolPresent, slot = COE:IsTrinketPresent();
				
				if( slot and slot ~= totem.TrinketSlot and totem.CurCooldown < 30 ) then
					-- trinket has been (re-)equipped
					-- start item cooldown
					-- -------------------------------
					totem.CurCooldown = 30;
					Chronos.startTimer( "COECooldown" .. totem.SpellName );	
					Chronos.scheduleByName( "COECooldownSwitch" .. totem.SpellName, totem.CurCooldown, COESched_CooldownEnd, totem );	
					
				end
				
				totem.TrinketSlot = slot;
				totem.MustUpdateTrinketOrSpell = true;
			else
				totem.ToolPresent = true;
			end
		end
		
	elseif( event == "UPDATE_BINDINGS" ) then
		if( self.totem and self:GetParent() ~= COETimerFrame ) then
			COE_Totem:UpdateTotemButtonHotKey(self);
		end
	end
	
end

StaticPopupDialogs["COE_RESETORDERING"] = {
  text = TEXT("The anchor totem from your 'XXXXXXXX' school seems to be missing.\nDo you want to reset 'XXXXXXXX' bar ordering?"),
  button1 = TEXT(OKAY),
  button2 = TEXT(CANCEL),
  OnAccept = function(self)
    if(COE_DisplayedTotems[COE_ActiveTalents])
    then
      for name,totem in pairs(COE_DisplayedTotems[COE_ActiveTalents])
      do
        if(totem.Element == self.element)
        then
          totem.Order = 0;
        end
      end
      COE:ReorderNewTotems();
      COETotemFrame.Reconfigure = true;
      _G["COE"..self.element.."Frame"].FirstNotVisibleWarningShown = nil;
    end
  end,
  OnUpdate = function(self,elapsed)
    -- Check for Text changing
    if(self.element ~= nil and self.text_updated == nil)
    then
      self.text_updated = true;
      _G[self:GetName().."Text"]:SetText("The anchor totem from your '"..self.element.."' school seems to be missing.\nDo you want to reset '"..self.element.."' bar ordering?");
    end
    -- Check for popup auto-canceling due to Talent spec switch *bug*
    if(self.element ~= nil)
    then
      local totem = _G["COETotem"..self.element.."1"];
      if(totem and totem.totem ~= nil) -- "totem" table has been altered while the popup was being shown
      then
        self:Hide();
      end
    end
  end,
  timeout = 0,
  exclusive = 1
};


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTotemButton
	
	PURPOSE: Updates the button state
-------------------------------------------------------------------]]
function COE_Totem:UpdateTotemButton( self, elapsed )

	-- check if visual update is necessary
	-- ------------------------------------
	self.UpdateTime = self.UpdateTime + elapsed;
	if( self.UpdateTime <= COE.UpdateInterval ) then
		return;
	end

	if( self.totem == nil ) then
		local id = self:GetID();
		local parent = self:GetParent();
		if(parent.FirstNotVisibleWarningShown == nil and (id == 1 or id == 11 or id == 21 or id == 31)) then -- First totem of an element
			parent.FirstNotVisibleWarningShown = true;
			local dialogFrame = StaticPopup_Show("COE_RESETORDERING");
			if(dialogFrame) then
				dialogFrame.element = parent.Element;
			end
		end
		self:Hide();
		return;
	end

	-- Check for Trinket update
	if(self.totem.MustUpdateTrinketOrSpell and not InCombatLockdown())
	then
		COE_Totem:SetSpellOrTrinket(self);
		self.totem.MustUpdateTrinketOrSpell = false;
	end
	-- set the icon
	-- -------------
	icon = _G[ self:GetName() .. "Icon" ];
	icon:SetTexture( self.totem.Texture );

	if( self:GetParent() ~= COETimerFrame ) then        
		-- update usability state
		-- -----------------------	
		COE_Totem:UpdateTotemButtonIsUsable(self);

		-- update cooldown
		-- ----------------
		COE_Totem:UpdateTotemButtonCooldown(self);

		-- update hotkey
		-- --------------
		COE_Totem:UpdateTotemButtonHotKey(self);

		-- flash button if advisor warning is active
		-- ------------------------------------------
		COE_Totem:UpdateTotemButtonFlash( self, elapsed );

		if( self.totem ~= COE.NoTotem ) then
			local border = _G[ self:GetName() .. "Border" ];
			if( COE.ConfigureBarMode ) then
				-- set a green border when self totem 
				-- should be visible and we are in config bar mode
				-- ------------------------------------------------
				if( COE_DisplayedTotems[COE_ActiveTalents][self.totem.SpellName].Visible ) then
					border:SetVertexColor( 0, 1.0, 0, 0.75 );
					border:Show();
				else
					border:Hide();
				end

			elseif( COE.ConfigureOrderMode ) then
				-- set a blue border when self totem 
				-- is the first totem to be swapped
				-- ----------------------------------
				if( COE_Config.ConfigureOrderTotem == self.totem ) then
					border:SetVertexColor( 1.0, 0, 1.0, 0.75 );
					border:Show();
				else
					border:Hide();
				end

			elseif( COE_Config:GetSaved( COEOPT_ENABLESETS ) == 1 and not self.DropTotem and 
					COE.TotemSets[COE_Config:GetSaved( COEOPT_ACTIVESET )][self.totem.Element] == self.totem ) then
				-- set a red border when self totem 
				-- belongs to the current totem set
				-- -----------------------------------
				border:SetVertexColor( 1.0, 0, 0, 0.75 );
				border:Show();
			else
				border:Hide();
			end
		end
	end
	self:SetChecked( false );

	-- update timer text
	-- ------------------
	COE_Totem:SetTimerText(self);
	
	self.UpdateTime = 0;
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTotemButtonCooldown
	
	PURPOSE: Updates the cooldown texture of the button
-------------------------------------------------------------------]]
function COE_Totem:UpdateTotemButtonCooldown(self)

-- CHANGE by tayedaen
-- check if the Button is a belonging to the TimerFrame
--  If YES, then no Cooldown is shown for self button
	if( self:GetParent() == COETimerFrame ) then
		return;
	end;

	if( self.totem == COE.NoTotem ) then
		return;
	end;
	
	local cooldown = _G[ self:GetName() .. "Cooldown" ];

	if( self:IsVisible() ) then
		local start, duration, enable;
		
		if( self.totem.isTrinket ) then
			if( self.totem.ToolPresent ) then
				start, duration, enable = GetInventoryItemCooldown( "player", self.totem.TrinketSlot );
			else
				cooldown:Hide();
				return;
			end
		else
			local SpellID = self.totem.Ranks[self.totem.MaxRank].GlobalSpellID;
			start, duration, enable = GetSpellCooldown( SpellID );
		end 
		CooldownFrame_SetTimer( cooldown, start, duration, enable );
	else
		cooldown:Hide();	
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTotemButtonIsUsable
	
	PURPOSE: Since we don't use the totem buttons as "real" action
		buttons in order to be independent on other mods messing 
		around with action bars, we cannot use IsActionUsable() to
		know if the totem is usable or if we have enough mana
-------------------------------------------------------------------]]
function COE_Totem:UpdateTotemButtonIsUsable(self)

	if( self.totem == COE.NoTotem ) then
		return;
	end;

	local icon = _G[ self:GetName() .. "Icon" ];
	local normalTexture = _G[ self:GetName() .. "NormalTexture" ];

	-- assume the player doesn't have the required tool
	-- -------------------------------------------------
	icon:SetVertexColor( 0.4, 0.4, 0.4 );
	normalTexture:SetVertexColor( 1.0, 1.0, 1.0 );

	-- check if totem tool is present
	-- -------------------------------
	if( self.totem.ToolPresent ) then
		icon:SetVertexColor( 1.0, 1.0, 1.0 );
		normalTexture:SetVertexColor( 1.0, 1.0, 1.0 );
	end

	if( not self.totem.isTrinket ) then
		-- now check for enough mana
		-- --------------------------
		local rank;
		if( COE_Totem:RankModifierDown() ) then
			rank = self.totem.Ranks[1];
		else
			rank = self.totem.Ranks[self.totem.MaxRank];
		end
	
		if( rank.Mana > UnitMana( "player" ) ) then
			icon:SetVertexColor(0.5, 0.5, 1.0);
			normalTexture:SetVertexColor(0.5, 0.5, 1.0);
		end
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTotemButtonHotKey
	
	PURPOSE: Updates the hot key display
-------------------------------------------------------------------]]
function COE_Totem:UpdateTotemButtonHotKey(self)

	if( self.totem == COE.NoTotem ) then
		return;
	end;

	-- get the binding name
	-- ---------------------
	local binding = "TOTEM" .. string.upper( self.totem.Element );
	local id = self:GetID() - _G[ "COETotem" .. self.totem.Element .. "1" ]:GetID() + 1;
	binding = binding .. id;	

	-- get the binding text
	-- ---------------------	
	local text = GetBindingText( GetBindingKey( binding ), "KEY_" );	

	-- replace modifiers
	-- ------------------
	text = gsub( text, COEMODIFIER_ALT, COEMODIFIER_ALT_SHORT );
	text = gsub( text, COEMODIFIER_CTRL, COEMODIFIER_CTRL_SHORT );
	text = gsub( text, COEMODIFIER_SHIFT, COEMODIFIER_SHIFT_SHORT );
	text = gsub( text, COEMODIFIER_NUMPAD, COEMODIFIER_NUMPAD_SHORT );

	-- set button text
	-- ----------------
	local hotkey = _G[ self:GetName() .. "HotKey" ];
	hotkey:SetText( text );	

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTotemButtonFlash
	
	PURPOSE: Updates the button flash if it has a cleansing totem
		and the corresponding warning is active
-------------------------------------------------------------------]]
function COE_Totem:UpdateTotemButtonFlash( self, elapsed )

	if( (self.totem == COE.NoTotem) or self.totem.isTrinket ) then
		return;
	end;

	if( COE_Config:GetSaved( COEOPT_ADVISOR ) == 1 ) then
		if( (self == COE.CleansingTotems.Tremor.Button and COE.CleansingTotems.Tremor.Warn) or  
			(self == COE.CleansingTotems.Disease.Button and COE.CleansingTotems.Disease.Warn) or
			(self == COE.CleansingTotems.Poison.Button and COE.CleansingTotems.Poison.Warn) ) then

			self.Flashtime = self.Flashtime - elapsed;
			if ( self.Flashtime <= 0 ) then
				local overtime = - self.Flashtime;
				if ( overtime >= ATTACK_BUTTON_FLASH_TIME ) then
					overtime = 0;
				end
				self.Flashtime = ATTACK_BUTTON_FLASH_TIME - overtime;

				local flashTexture = _G[ self:GetName().."Flash" ];
				if ( flashTexture:IsVisible() ) then
					flashTexture:Hide();
				else
					flashTexture:Show();
				end
			end
			
			return;
		end
	end

	_G[ self:GetName().."Flash" ]:Hide();
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnEnterTotemButton
	
	PURPOSE: Shows the tooltip and the dynamic buttons of the
		parent frame if in flex mode
-------------------------------------------------------------------]]
function COE_Totem:OnEnterTotemButton(button)
  -- show tooltip if enabled
  -- ------------------------
  if(InCombatLockdown() and COE_Config:GetSaved(COEOPT_DISABLE_TT_COMBAT) == 1) then
    return;
  end
  if( COEUI_TTALIGN[COE_Config:GetSaved( COEOPT_TTALIGNMENT )][1] ~= "DISABLED" and button.totem ~= COE.NoTotem )
  then
    GameTooltip:SetOwner( button, COEUI_TTALIGN[COE_Config:GetSaved( COEOPT_TTALIGNMENT )][1] );
    if( button.tc)
    then
      -- show Totemic Call tooltip
      -- -------------------
      --GameTooltip:SetSpell( button.tc.SpellID, BOOKTYPE_SPELL );
      GameTooltip:SetSpellByID(button.tc.id, false, true);
    elseif( button.totem.isTrinket )
    then
      -- show item tooltip if equipped
      -- else show name of the item
      -- ------------------------------
      if( button.totem.ToolPresent )
      then
        GameTooltip:SetInventoryItem( "player", button.totem.TrinketSlot );
      else
        GameTooltip:SetText( COESTR_TRINKET_TOOLTIP );
      end
    else
      -- show spell tooltip
      -- -------------------
      local SpellID = button.totem.Ranks[button.totem.MaxRank].GlobalSpellID;
      GameTooltip:SetSpellByID( SpellID );
    end
  end
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnLeaveTotemButton
	
	PURPOSE: Hides the tooltip
-------------------------------------------------------------------]]
function COE_Totem:OnLeaveTotemButton()
  -- hide tooltip if enabled
  -- ------------------------
  if( COEUI_TTALIGN[COE_Config:GetSaved( COEOPT_TTALIGNMENT )][1] ~= "DISABLED" )
  then
    GameTooltip:Hide();
  end
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:OnTotemButtonConfigureClick
	
	PURPOSE: activates the totem for the current totem set 
        if in set config mode
-------------------------------------------------------------------]]
function COE_Totem:OnTotemButtonConfigureClick(button) -- 'self' is automatically passed because we use a class function, then the first param is the clicked button

	if( self.totem == COE.NoTotem ) then
		return;
	end;

	if( COE.ConfigureBarMode ) then
		
		-- toggle totem visibility
		-- ------------------------ 
		if( COE_DisplayedTotems[COE_ActiveTalents][self.totem.SpellName].Visible ) then
			COE_DisplayedTotems[COE_ActiveTalents][self.totem.SpellName].Visible = false;
		else
			COE_DisplayedTotems[COE_ActiveTalents][self.totem.SpellName].Visible = true;
		end

	elseif( COE.ConfigureOrderMode ) then

		if( COE_Config.ConfigureOrderTotem == nil or 
			COE_Config.ConfigureOrderTotem.Element ~= self.totem.Element ) then

			-- set first totem to be swapped
			-- ------------------------------
			COE_Config.ConfigureOrderTotem = self.totem;
			
		elseif( COE_Config.ConfigureOrderTotem == self.totem ) then
			-- unset first totem
			-- ------------------
			COE_Config.ConfigureOrderTotem = nil;
			
		else
			-- swap self totem with the first one
			-- -----------------------------------
			local swap = COE_DisplayedTotems[COE_ActiveTalents][COE_Config.ConfigureOrderTotem.SpellName].Order;
			COE_DisplayedTotems[COE_ActiveTalents][COE_Config.ConfigureOrderTotem.SpellName].Order = COE_DisplayedTotems[COE_ActiveTalents][self.totem.SpellName].Order;
			COE_DisplayedTotems[COE_ActiveTalents][self.totem.SpellName].Order = swap;
			
			COE_Config.ConfigureOrderTotem = nil;
		
		end;
		
		-- reconfigure totem bar
		-- ----------------------
		COETotemFrame.Reconfigure = true;		

	elseif( COE.ConfigureSetsMode ) then
		local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );
        local element_to_index = { Earth = 1, Fire = 2, Water = 3, Air = 4 };
        local element_to_actionID = { [1] = {134,133,135,136}, [2] = {138, 137, 139, 140}, [3] = {142,141,143,144} };
        local blizz_page = MultiCastActionBarFrame.currentPage;

		if( COE.TotemSets[activeset][self.totem.Element] == self.totem ) then
			-- already in the set, remove
			-- ---------------------------
			COE.TotemSets[activeset][self.totem.Element] = nil;
			if( activeset <= COESET_DEFAULT ) then 
				COE_SavedTotemSets[activeset][self.totem.Element] = "";
			elseif(activeset >= COESET_START_MULTI) then
              SetMultiCastSpell(element_to_actionID[blizz_page][element_to_index[self.totem.Element]],0);
			else
				COE_CustomTotemSets[activeset - COESET_DEFAULT][self.totem.Element] = "";
			end
		else
			-- store in set
			-- -------------
			COE.TotemSets[activeset][self.totem.Element] = self.totem;
			if( activeset <= COESET_DEFAULT ) then 
				COE_SavedTotemSets[activeset][self.totem.Element] = self.totem.SpellName;
			elseif(activeset >= COESET_START_MULTI) then
				SetMultiCastSpell(element_to_actionID[blizz_page][element_to_index[self.totem.Element]],self.totem.GlobalSpellID);
			else
				COE_CustomTotemSets[activeset - COESET_DEFAULT][self.totem.Element] = self.totem.SpellName;
			end
		end
		
		-- reconfigure totem bar
		-- ----------------------
		COETotemFrame.Reconfigure = true;

	else
	
		-- if the ctrl key is down, make self totem the anchor totem
		-- ----------------------------------------------------------
		if( IsControlKeyDown() ) then
			COE_Totem:MakeAnchorTotem( self );
		end

		--[[if( self.totem.isTrinket ) then
			
			if( self.totem.TrinketSlot ) then
				UseInventoryItem( self.totem.TrinketSlot );
			end 
		
		else
			local spellid = self.totem.Ranks[self.totem.MaxRank].SpellID;
		
			-- check if the override key is down
			-- ----------------------------------
			if( COE_Totem:RankModifierDown() ) then
				spellid = self.totem.Ranks[1].SpellID;
			end
		
			-- throw totem
			-- ------------
			CastSpell( spellid, BOOKTYPE_SPELL );
		end]]
	
	end

end

local _COE_FrameToElement =
{
  ["COETimerFire"] = 1,
  ["COETimerEarth"] = 2,
  ["COETimerWater"] = 3,
  ["COETimerAir"] = 4,
};

function COE_Totem:OnTotemButtonControlClick(frame,button)
	if( frame.totem == COE.NoTotem ) then
		return;
	end;
	local parent = frame:GetParent();
	if(parent:GetName() == "COETimerFrame" and button == "RightButton")
	then
		DestroyTotem(_COE_FrameToElement[frame:GetName()]);
	end

	if( COE.ConfigureBarMode or COE.ConfigureOrderMode or COE.ConfigureSetsMode) then
		return;
	end

	if( IsControlKeyDown() ) then
		COE_Totem:MakeAnchorTotem( frame );
	end
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ButtonStartDrag
	
	PURPOSE: Starts dragging of all or one parent frames
-------------------------------------------------------------------]]
function COE_Totem:ButtonStartDrag(button)

	if(COE_Config:GetSaved( COEOPT_FIXBAR ) ~= 0) then
		return;
	end

	if( button:GetParent() == COETimerFrame ) then
		button:GetParent():StartMoving();
		
	-- When the Shift key is held, pickup the spell instead. 
	-- Additionally holding the control key while doing so 
	-- picks up Rank 1.
	---------------------------------------------------------
	elseif( (button.totem ~= COE.NoTotem) and (not button.totem.isTrinket) and IsShiftKeyDown() ) then
		local rank;
		if( IsControlKeyDown() ) then 
			rank = 1;
		else
			rank = button.totem.MaxRank;
		end
		
		local SpellID = button.totem.Ranks[rank].GlobalSpellID;
		PickupSpell( SpellID );
		
	elseif( button == button.ElementFrame.AnchorTotem ) then
		button.ElementFrame:StartMoving();
		button.ElementFrame.IsMoving = true;
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:ButtonStopDrag
	
	PURPOSE: Stops dragging of all or one parent frames
-------------------------------------------------------------------]]
function COE_Totem:ButtonStopDrag(button)

	button.ElementFrame:StopMovingOrSizing();

	if( button:GetParent() == COETimerFrame ) then
		button:GetParent():StopMovingOrSizing();
	else
		button.ElementFrame:StopMovingOrSizing();
		button.ElementFrame.IsMoving = false;
		COE_Totem:UpdateFrameCoordinates();
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:MakeAnchorTotem
	
	PURPOSE: If the totem is currently shown as a dynamic button,
		it is made the anchor totem if we are in Active Set or
		Customize mode. In Active Set mode, it is also replaces
		the element totem in the current set
-------------------------------------------------------------------]]
function COE_Totem:MakeAnchorTotem( button )

	local mode = COE_Config:GetSaved( COEOPT_DISPLAYMODE );
	local totem = button.totem;
        if(button.ElementFrame.AnchorTotem == nil) -- Sub menu ?
        then
          return;
        end
	local anchor = button.ElementFrame.AnchorTotem.totem;
	
	if( totem ~= anchor ) then		
		if( mode == COEMODE_ALLTOTEMS ) then
			-- swap self totem with the anchor totem
			-- --------------------------------------
			local swap = COE_DisplayedTotems[COE_ActiveTalents][anchor.SpellName].Order;
			COE_DisplayedTotems[COE_ActiveTalents][anchor.SpellName].Order = COE_DisplayedTotems[COE_ActiveTalents][totem.SpellName].Order;
			COE_DisplayedTotems[COE_ActiveTalents][totem.SpellName].Order = swap;
		
		elseif( mode == COEMODE_ACTIVESET ) then
			-- replace the set totem with self one
			-- ------------------------------------
			COE.TotemSets[COE_Config:GetSaved( COEOPT_ACTIVESET )][totem.Element] = totem;
		end
		
		COE_Totem:Invalidate( button.ElementFrame, true, true, true );
		COETotemFrame.Reconfigure = true;	
	end	

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:SetTimerText
	
	PURPOSE: Updates the timer text shown in the button if the
		associated totem has an active timer
-------------------------------------------------------------------]]
function COE_Totem:SetTimerText(self)

	local timertext = _G[ self:GetName() .. "Text" ];
	local overlaytex = _G[ self:GetName().. "OverlayTex" ]; 

	if( self.totem == COE.NoTotem ) then
		timertext:Hide();
		overlaytex:Hide();
		return;
	end;
	
	-- show timers only in timerframe and self is a bar button?
	-- ---------------------------------------------------------
	if( COE_Config:GetSaved( COEOPT_FRAMETIMERSONLY ) == 1 and self:GetParent() ~= COETimerFrame ) then
		timertext:Hide();
		overlaytex:Hide();
		return;
	end;

	if( COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 1 ) then
		if( COE_Totem:IsTimerActive( self.totem ) ) then
			-- format text
			-- ------------
			local time = COE_Totem:GetTimeLeft( self.totem );
			local min = math.floor( time / 60 );
			local sec = math.fmod( math.floor( time ), 60 );
			local text;
		
			if( min > 0 ) then
				text = string.format( "%d:%02d", min, sec );
			else
				text = sec;
			end
	
			-- set text
			-- ---------
			timertext:SetText( text );
		
			-- set the color 
			-- --------------	
			overlaytex:SetVertexColor( 0.1, 0.1, 0.1, 0.75 );
			timertext:SetVertexColor( 1, 1, 1, 1 );

			-- show text and overlay
			-- ----------------------
			timertext:Show();
			overlaytex:Show();
			
		elseif( self.totem.CurCooldown > 0 ) then
		
			-- format text
			-- ------------
			local time = COE_Totem:GetCooldownLeft( self.totem );
			local min = math.floor( time / 60 );
			local sec = math.fmod( math.floor( time ), 60 );
			local text;
		
			if( min > 0 ) then
				text = string.format( "%d:%02d", min, sec );
			else
				text = sec;
			end

			-- set text
			-- ---------
			timertext:SetText( text );
		
			-- set the color 
			-- --------------	
			overlaytex:SetVertexColor( 1, 1, 1, 1 );
			timertext:SetVertexColor( 1, 0, 0, 1 );

			-- show text and overlay
			-- ----------------------
			timertext:Show();
			overlaytex:Show();
			
		else
			-- if timer has just expired, deactivate it
			-- if it isn't active anyway, the call doesn't hurt
			-- -------------------------------------------------
			COE_Totem:DeactivateTimer( self.totem );

			timertext:Hide();
			overlaytex:Hide();
		end
	else
		timertext:Hide();
		overlaytex:Hide();
	end

end


--[[ =============================================================================================

										T I M E R F R A M E 

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:InitTimerFrame
	
	PURPOSE: Initializes the timer frame
-------------------------------------------------------------------]]
function COE_Totem:InitTimerFrame(self)
	-- addon loaded?
	-- --------------
	if( not COE.Initialized ) then
		return;
	end
	
	self.UpdateTime = 0;

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Totem:UpdateTimerFrame
	
	PURPOSE: Updates the timer frame
-------------------------------------------------------------------]]
function COE_Totem:UpdateTimerFrame( self, elapsed )

	-- check if visual update is necessary
	-- ------------------------------------
	self.UpdateTime = self.UpdateTime + elapsed;
	if( self.UpdateTime <= COE.UpdateInterval ) then
		return;
	end

	if(InCombatLockdown())
	then
		return;
	end
	-- set scaling
	-- ------------
	self:SetScale( COE_Config:GetSaved( COEOPT_SCALING_TIMERS ) );
	
	local k;
	local lastbutton = nil;
	local count = 0;
	local order_array = COE_Element;
	local activeset = COE_Config:GetSaved(COEOPT_ACTIVESET);

	if( activeset and COE.TotemSets[activeset] and COE.TotemSets[activeset].CastOrder ) then
		order_array = COE.TotemSets[activeset].CastOrder;
		for k = 1,4 do
			if order_array[k] == COESTR_ELEMENT_EARTH then
				order_array[k] = "Earth";
			elseif order_array[k] == COESTR_ELEMENT_FIRE then
				order_array[k] = "Fire";
			elseif order_array[k] == COESTR_ELEMENT_WATER then
				order_array[k] = "Water";
			elseif order_array[k] == COESTR_ELEMENT_AIR then
				order_array[k] = "Air";
			end
		end                 
	end
	
	for k = 1,4 do
		local button = _G[ "COETimer" .. order_array[k] ]; 

		if( button.totem ) then
			button:ClearAllPoints();
				
			if( lastbutton ) then
				if( COE_Config:GetSaved( COEOPT_DISPLAYALIGN ) == COEMODE_BOX ) then
					if( count == 2 ) then
						button:SetPoint( "TOPRIGHT", lastbutton:GetName(), "BOTTOMLEFT", -COEUI_BUTTONGAP, -COEUI_BUTTONGAP );
						lastbutton = button;
					else
						button:SetPoint( "TOPLEFT", lastbutton:GetName(), "TOPRIGHT", COEUI_BUTTONGAP, 0 );
						lastbutton = button;
					end
				elseif( COE_Config:GetSaved( COEOPT_DISPLAYALIGN ) == COEMODE_VERTICAL ) then 
					button:SetPoint( "TOPLEFT", lastbutton:GetName(), "BOTTOMLEFT", 0, -COEUI_BUTTONGAP );
					lastbutton = button;
				else
					button:SetPoint( "TOPLEFT", lastbutton:GetName(), "TOPRIGHT", COEUI_BUTTONGAP, 0 );
					lastbutton = button;
				end
			else
				button:SetPoint( "TOPLEFT", 0, 0 );
				lastbutton = button;
			end
				
			count = count + 1;
		end
	end

end

--[[ ----------------------------------------------------------------
	FLEX BUTTONS - State Header & stuff
	
-------------------------------------------------------------------]]

local COE_Totem_ElementToState = {
  ["Earth"] = "1";
  ["Fire"] = "2";
  ["Air"] = "3";
  ["Water"] = "4";
};

function COE_Totem:CheckForStateHeader()
  local hdr = COE_SH_Flex;
  -- Create the state header
  if(not COE_SH_Flex)
  then
    hdr = CreateFrame("Frame","COE_SH_Flex", UIParent, "SecureHandlerEnterLeaveTemplate,SecureHandlerAttributeTemplate"); -- SecureHandlerShowHideTemplate
    hdr:SetWidth(1);
    hdr:SetHeight(1);
    hdr:Hide();
    hdr:Execute("buttons = newtable();");
    hdr:Execute("statics = newtable();");
    for element in pairs(COE_Totem_ElementToState)
    do
      hdr:Execute("buttons['"..element.."'] = newtable();");
      hdr:Execute("statics['"..element.."'] = newtable();");
    end
    hdr:SetFrameRef("header",hdr);
    hdr:Execute("header = self:GetFrameRef('header');");
    hdr:SetAttribute("_onattributechanged",[[
      if(name == "show")
      then
        -- Show new element
        if(buttons[value])
        then
          for i,button in pairs(buttons[value])
          do
            button:Show();
          end
        end
      elseif(name == "hide")
      then
        -- Hide element
        if(buttons[value])
        then
          for i,button in pairs(buttons[value])
          do
            button:Hide();
          end
        end
      elseif(name == "checkhide")
      then
        local must_hide = true;
        if(buttons[value])
        then
          for i,button in pairs(buttons[value])
          do
            if(button:IsUnderMouse())
            then
              must_hide = false;
              break;
            end
          end
        end
        if(must_hide)
        then
          if(statics[value])
          then
            for i,button in pairs(statics[value])
            do
              if(button:IsUnderMouse())
              then
                must_hide = false;
                break;
              end
            end
          end
        end
        if(must_hide)
        then
          if(buttons[value])
          then
            for i,button in pairs(buttons[value])
            do
              button:Hide();
            end
          end
        end
      end
    ]]);
  end
  return hdr;
end

function COE_Totem:SetElementTotemFlex(ElementFrame)
  local button;
  local hdr = COE_Totem:CheckForStateHeader();

  -- Static buttons
  for i = 1, ElementFrame.FlexCount
  do
    button = _G[ "COETotem" .. ElementFrame.Element .. i ];
    
    -- only show button if it has a totem
    -- -----------------------------------		
    if(button.totem and (COE_DisplayedTotems[COE_ActiveTalents][button.totem.SpellName].Visible or inConfig) )
    then
      hdr:Execute("buttons['"..ElementFrame.Element.."']["..i.."] = nil;"); -- Not controlled by the header
      hdr:SetFrameRef("kid",button);
      hdr:Execute("statics['"..ElementFrame.Element.."']["..i.."] = self:GetFrameRef('kid');"); -- But is static
      hdr:WrapScript(button,"OnEnter","header:SetAttribute('show','"..ElementFrame.Element.."');");
      hdr:WrapScript(button,"OnLeave","header:SetAttribute('checkhide','"..ElementFrame.Element.."');");
      --hdr:WrapScript(button,"OnEnter","current = '"..ElementFrame.Element.."'; control:SetTimer(0,1);");
      --hdr:WrapScript(button,"OnLeave","current = nil; control:SetTimer(0.5);");
      button:Show();
    else
      hdr:Execute("buttons['"..ElementFrame.Element.."']["..i.."] = nil;"); -- Not controlled by the header
      button:Hide();
    end
    button:SetScale(COEUI_CurrentScale);
  end
  -- None button (The StateHeader must control it only in Timers mode) -- Currently disabled
  if(COE_Config:GetSaved( COEOPT_DISPLAYMODE ) == COEMODE_TIMERSONLY)
  then
    button = _G[ "COETotem" .. ElementFrame.Element .. "None" ];
    button:Show();
  end
  
  -- Flex buttons
  for i=ElementFrame.FlexCount+1, COE.MaxTotems[ElementFrame.Element]
  do
    button = _G[ "COETotem" .. ElementFrame.Element .. i ];
    if(button.totem and (COE_DisplayedTotems[COE_ActiveTalents][button.totem.SpellName].Visible or inConfig) )
    then
      hdr:SetFrameRef("kid",button);
      hdr:Execute("buttons['"..ElementFrame.Element.."']["..i.."] = self:GetFrameRef('kid');"); -- Controlled by the header
      hdr:WrapScript(button,"OnEnter",""); -- Needed empty for some strange reason
      hdr:WrapScript(button,"OnLeave","header:SetAttribute('checkhide','"..ElementFrame.Element.."');");
      hdr:WrapScript(button,"OnClick","header:SetAttribute('hide','"..ElementFrame.Element.."');");
      --hdr:WrapScript(button,"OnEnter","current = '"..ElementFrame.Element.."';");
      --hdr:WrapScript(button,"OnLeave","current = nil; control:SetTimer(0.5);");
      button:Hide();
    else
      hdr:Execute("buttons['"..ElementFrame.Element.."']["..i.."] = nil;"); -- Not controlled by the header
      button:Hide();
    end
    button:Hide();
  end
end

function COE_Totem:SetElementTotemNotControlled(ElementFrame)
  local button;
  local hdr = COE_Totem:CheckForStateHeader();

  -- Static buttons
  for i = 1, COE.MaxTotems[ElementFrame.Element]
  do
    button = _G[ "COETotem" .. ElementFrame.Element .. i ];
    hdr:Execute("buttons['"..ElementFrame.Element.."']["..i.."] = nil;"); -- Not controlled by the header
    hdr:UnwrapScript(button,"OnEnter");
    hdr:UnwrapScript(button,"OnLeave");
    --button:SetScale(1); -- button:SetScale(COEUI_CurrentScale); ???
    button:SetScale(COEUI_CurrentScale);
    button:Show();
  end
  -- None button
  button = _G[ "COETotem" .. ElementFrame.Element .. "None" ];
  button:SetParent(ElementFrame); -- Remove button from StateHeader's control
  --button:SetScale(1); -- button:SetScale(COEUI_CurrentScale); ??
  button:SetScale(COEUI_CurrentScale);
  COE_Totem:UpdateAnchorButton(ElementFrame); -- Force Anchor update to hide the "None" button (it's shown if we change its parent) -- Not sure about 'ElementFrame' arg
end

function COE_Totem:UpdateDropSetButton( self, elapsed )
  -- check if visual update is necessary
  -- ------------------------------------
  self.UpdateTime = self.UpdateTime + elapsed;
  if( self.UpdateTime <= COE.UpdateInterval ) then
    return;
  end

  self:SetChecked( false );
  self.UpdateTime = 0;
  
  if( self.totem == nil ) then
    if(self.tc)
    then
      -- Update cooldown
      local cooldown = _G[ self:GetName() .. "Cooldown" ];
      if( self:IsVisible() ) then
        local start, duration, enable = GetSpellCooldown(self.tc.id);
        CooldownFrame_SetTimer( cooldown, start, duration, enable );
      else
        cooldown:Hide();	
      end
    end
    return;
  end

  -- update usability state
  -- -----------------------	
  COE_Totem:UpdateTotemButtonIsUsable(self);
  
  -- update cooldown
  -- ----------------
  COE_Totem:UpdateTotemButtonCooldown(self);
  
  -- update hotkey
  -- --------------
  COE_Totem:UpdateTotemButtonHotKey(self);
  
  -- flash button if advisor warning is active
  -- ------------------------------------------
  COE_Totem:UpdateTotemButtonFlash( self, elapsed );
  
  if(not InCombatLockdown())
  then
    -- set scaling
    -- ------------
    self:SetScale(COEUI_CurrentScale);
  end
  
  -- update timer text
  -- ------------------
  COE_Totem:SetTimerText(self);
end

