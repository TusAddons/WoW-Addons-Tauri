--[[

	CALL OF ELEMENTS
	The All-In-One Shaman Addon
	
	by Wyverex (2006)
	
	
	Configuration Dialog
	
]]

COE_ElementToSlot = {}; -- Will be init later


if( not COE_Config ) then 
	COE_Config = {};
end 

COE_TotemicCallsSpellIDs = { 66842,66843,66844,0,36936 };


--[[ ----------------------------------------------------------------
	COE_Config.CurrentPanel and COE_Config.CurrentSubPanel contain 
	the button names for the currently active panel and subpanel 
	in the confiuration	dialog
-------------------------------------------------------------------]]
COE_Config["CurrentPanel"] = "COE_ConfigTotemTab";
COE_Config["CurrentSubPanel"] = "COE_ConfigTotemTotemBar";


--[[ ----------------------------------------------------------------
	COE_Config.Options contains all registered option defaults
-------------------------------------------------------------------]]
COE_Config["Options"] = {};
COE_Config["ConfigureSetsMode"] = false;
COE_Config["ConfigureBarMode"] = false;
COE_Config["ConfigureOrderMode"] = false;
COE_Config["CurrentOrderTotem"] = nil;

COEOPT_ENABLETOTEMBAR = 1;
COEOPT_HIDEBACKDROP = 2;
COEOPT_ENABLETIMERS = 3;
COEOPT_TIMERNOTIFICATIONS = 4;
COEOPT_TTALIGNMENT = 5;
COEOPT_DISPLAYMODE = 6;
COEOPT_DISPLAYALIGN = 7;
COEOPT_ADVISOR = 8;
COEOPT_ENABLESETS = 9;
COEOPT_ACTIVESET = 10;
COEOPT_AUTOSWITCH = 11;
COEOPT_FIXBAR = 12;
COEOPT_VERSION = 13;
COEOPT_OVERRIDESET = 14;
COEOPT_CURRENTFRAME = 15;
COEOPT_DIRECTION = 16;
COEOPT_FRAMEMODE = 17;
COEOPT_FLEXCOUNT = 18;
COEOPT_SCALING = 19;
COEOPT_TIMERFRAME = 20;
COEOPT_OVERRIDERANK = 21;
COEOPT_GROUPBARS = 22;
COEOPT_FRAMETIMERSONLY = 23;
COEOPT_SCALING_TIMERS = 24;
COEOPT_DISABLE_TT_COMBAT = 25;

COEMODE_ALLTOTEMS = 1;
COEMODE_TIMERSONLY = 2;
COEMODE_ACTIVESET = 3;

COEMODE_BOX = 1;
COEMODE_VERTICAL = 2;
COEMODE_HORIZONTAL = 3;

COEMODE_NOOVERRIDE = 1;
COEMODE_OVERRIDESHIFT = 2;
COEMODE_OVERRIDEALT = 3;
COEMODE_OVERRIDECTRL = 4;

--[[ ----------------------------------------------------------------
	COE_Config.Defaults contains the default values of all 
	saved variables
-------------------------------------------------------------------]]
COE_Config.Defaults = {
[COEOPT_ENABLETOTEMBAR] = 1;
[COEOPT_HIDEBACKDROP] = 1;
[COEOPT_ENABLETIMERS] = 1;
[COEOPT_TIMERNOTIFICATIONS] = 1;
[COEOPT_TTALIGNMENT] = 2;
[COEOPT_DISPLAYMODE] = 1;
[COEOPT_DISPLAYALIGN] = 1;
[COEOPT_ADVISOR] = 1;
[COEOPT_ENABLESETS] = 1;
[COEOPT_ACTIVESET] = 10;
[COEOPT_AUTOSWITCH] = 1;
[COEOPT_FIXBAR] = 0;
[COEOPT_OVERRIDESET] = 1;
[COEOPT_CURRENTFRAME] = "Earth";
[COEOPT_SCALING] = 1.0;
[COEOPT_TIMERFRAME] = 0;
[COEOPT_OVERRIDERANK] = 1;
[COEOPT_GROUPBARS] = 0;
[COEOPT_FRAMETIMERSONLY] = 0;
[COEOPT_SCALING_TIMERS] = 1.0;
[COEOPT_DISABLE_TT_COMBAT] = 0;
}

--[[ ----------------------------------------------------------------
	COE_Config.Saved contains all saved variables
-------------------------------------------------------------------]]
COE_Saved_Defaults = {
[COEOPT_ENABLETOTEMBAR] = 1;
[COEOPT_HIDEBACKDROP] = 1;
[COEOPT_ENABLETIMERS] = 1;
[COEOPT_TIMERNOTIFICATIONS] = 1;
[COEOPT_TTALIGNMENT] = 2;
[COEOPT_DISPLAYMODE] = 1;
[COEOPT_DISPLAYALIGN] = 1;
[COEOPT_ADVISOR] = 1;
[COEOPT_ENABLESETS] = 1;
[COEOPT_ACTIVESET] = 10;
[COEOPT_AUTOSWITCH] = 1;
[COEOPT_FIXBAR] = 0;
[COEOPT_OVERRIDESET] = 1;
[COEOPT_CURRENTFRAME] = "Earth";
[COEOPT_SCALING] = 1.0;
[COEOPT_TIMERFRAME] = 0;
[COEOPT_OVERRIDERANK] = 1;
[COEOPT_GROUPBARS] = 0;
[COEOPT_FRAMETIMERSONLY] = 0;
[COEOPT_SCALING_TIMERS] = 1.0;
[COEOPT_DISABLE_TT_COMBAT] = 0;
}
COE_Saved = COE:DuplicateTable(COE_Saved_Defaults);


--[[ ----------------------------------------------------------------
	COE_SavedTotemSets holds the default set and the PVP sets
	COE_CustomTotemSets holds the player-defined custom sets
-------------------------------------------------------------------]]
COE_SavedTotemSets = { 
{ Name = COEUI_PVPSETS[1], Earth = "", Fire = "", Water = "", Air = "", 
	CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } }; 
{ Name = COEUI_PVPSETS[2], Earth = "", Fire = "", Water = "", Air = "",  
	CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } }; 
{ Name = COEUI_PVPSETS[3], Earth = "", Fire = "", Water = "", Air = "",  
	CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } }; 
{ Name = COEUI_PVPSETS[4], Earth = "", Fire = "", Water = "", Air = "",  
	CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } }; 
{ Name = COEUI_PVPSETS[5], Earth = "", Fire = "", Water = "", Air = "",  
	CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } }; 
{ Name = COEUI_PVPSETS[6], Earth = "", Fire = "", Water = "", Air = "",  
	CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } }; 
{ Name = COEUI_PVPSETS[7], Earth = "", Fire = "", Water = "", Air = "",  
	CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } }; 
{ Name = COEUI_PVPSETS[8], Earth = "", Fire = "", Water = "", Air = "",  
	CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } }; 
{ Name = COEUI_PVPSETS[9], Earth = "", Fire = "", Water = "", Air = "",  
	CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } }; 
{ Name = COEUI_DEFAULTSET, Earth = "", Fire = "", Water = "", Air = "",  
	CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } };
}; 

COE_BlizzTotemSets = {};

COE_CustomTotemSets = { n = 0 };

COESET_DEFAULT = 10;
COESET_START_MULTI = 100;


--[[ ----------------------------------------------------------------
	COE_DisplayedTotems stores the visibility option for each
	totem when in "All Totems" display mode
-------------------------------------------------------------------]]
COE_DisplayedTotems = { };

 
--[[ ----------------------------------------------------------------
	COE_TotemBars stores the alignment options of the totem bars
-------------------------------------------------------------------]]
COE_TotemBars_Defaults = {
Earth = { Direction = "Left", Mode = "Flex", FlexCount = 1 }, 
Fire = { Direction = "Right", Mode = "Flex", FlexCount = 1 }, 
Water = { Direction = "Left", Mode = "Flex", FlexCount = 1 }, 
Air = { Direction = "Right", Mode = "Flex", FlexCount = 1 }, 
positions = { Earth = { "CENTER","CENTER",-75,75 }, Fire = { "CENTER","CENTER",75,75 }, 
	Water = { "CENTER","CENTER",-75,-75 }, Air = { "CENTER","CENTER",75,-75 } }, 
};
COE_TotemBars = COE:DuplicateTable(COE_TotemBars_Defaults);

COE_Element = { "Earth", "Fire", "Water", "Air" };
COE_Direction = { "Up", "Down", "Left", "Right" };
COE_FrameMode = { "Closed", "Open", "Flex", "Hidden" };


--[[ =============================================================================================

										I N T E R F A C E 

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnFrameLoad
	
	PURPOSE: Registers all options
-------------------------------------------------------------------]]
function COE_Config:OnFrameLoad(self)
	
	if( not COE.Initialized ) then
		return;
	end

	self:SetBackdropBorderColor( 0, 0, 0 );
	self:SetBackdropColor( 0, 0, 0 );
	
	-- make the dialog draggable
	-- --------------------------
	self:RegisterForDrag( "LeftButton" );
	
	-- totem options
	-- --------------
	COE_Config:RegisterOption( COEOPT_ENABLETOTEMBAR, 'check', COEOptionEnableTotemBar, COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) );
	COE_Config:RegisterOption( COEOPT_ENABLETIMERS, 'check', COEOptionEnableTimers, COE_Config:GetSaved( COEOPT_ENABLETIMERS ) );
	COE_Config:RegisterOption( COEOPT_TIMERNOTIFICATIONS, 'check', nil, COE_Config:GetSaved( COEOPT_TIMERNOTIFICATIONS ) );
	COE_Config:RegisterOption( COEOPT_TTALIGNMENT, 'combo', nil, COE_Config:GetSaved( COEOPT_TTALIGNMENT ), COEOptionTTAlignmentInit );
	COE_Config:RegisterOption( COEOPT_DISABLE_TT_COMBAT, 'check', COEOptionDisableTTCombat, COE_Config:GetSaved( COEOPT_DISABLE_TT_COMBAT ) );
	COE_Config:RegisterOption( COEOPT_DISPLAYMODE, 'combo', nil, COE_Config:GetSaved( COEOPT_DISPLAYMODE ), COEOptionDisplayModeInit );
	COE_Config:RegisterOption( COEOPT_ADVISOR, 'check', COEOptionEnableAdvisor, COE_Config:GetSaved( COEOPT_ADVISOR ) );
	COE_Config:RegisterOption( COEOPT_ENABLESETS, 'check', COEOptionEnableSets, COE_Config:GetSaved( COEOPT_ENABLESETS ) );
	COE_Config:RegisterOption( COEOPT_AUTOSWITCH, 'check', COEOptionEnableAutoSwitch, COE_Config:GetSaved( COEOPT_AUTOSWITCH ) );
	COE_Config:RegisterOption( COEOPT_ACTIVESET, 'combo', nil, COE_Config:GetSaved( COEOPT_ACTIVESET ), COEOptionActiveSetInit );
	COE_Config:RegisterOption( COEOPT_FIXBAR, 'check', nil, COE_Config:GetSaved( COEOPT_FIXBAR ) );
	COE_Config:RegisterOption( COEOPT_CURRENTFRAME, 'combo', nil, COE_Config:GetSaved( COEOPT_CURRENTFRAME ), COEOptionCurrentFrameInit );
	COE_Config:RegisterOption( COEOPT_DIRECTION, 'combo', nil, nil, COEOptionDirectionInit, true );
	COE_Config:RegisterOption( COEOPT_FRAMEMODE, 'combo', nil, nil, COEOptionFrameModeInit, true );
	COE_Config:RegisterOption( COEOPT_FLEXCOUNT, 'slider', COEOptionFlexCountChange, nil, COEOptionFlexCountShow, true );
	COE_Config:RegisterOption( COEOPT_SCALING, 'slider', COEOptionScalingChange, nil, COEOptionScalingShow );
	COE_Config:RegisterOption( COEOPT_TIMERFRAME, 'check', COEOptionEnableTimerFrame, COE_Config:GetSaved( COEOPT_TIMERFRAME ) );
	COE_Config:RegisterOption( COEOPT_DISPLAYALIGN, 'combo', nil, COE_Config:GetSaved( COEOPT_DISPLAYALIGN ), COEOptionDisplayAlignInit );
	COE_Config:RegisterOption( COEOPT_OVERRIDERANK, 'combo', nil, COE_Config:GetSaved( COEOPT_OVERRIDERANK ), COEOptionOverrideRankInit );
	COE_Config:RegisterOption( COEOPT_GROUPBARS, 'check', COEOptionGroupBars, COE_Config:GetSaved( COEOPT_GROUPBARS ) );
	COE_Config:RegisterOption( COEOPT_FRAMETIMERSONLY, 'check', nil, COE_Config:GetSaved( COEOPT_FRAMETIMERSONLY ) );
	COE_Config:RegisterOption( COEOPT_SCALING_TIMERS, 'slider', COEOptionScalingTimersChange, nil, COEOptionScalingTimersShow );

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:CloseDialog
	
	PURPOSE: Ends totem set configuration and closes the dialog
-------------------------------------------------------------------]]
function COE_Config:CloseDialog()

	COE_Config:ConfigureBar( false );
	COE_Config:ConfigureOrder( false );
	COE_Config:ConfigureSet( false );
	COE_ConfigFrame:Hide();

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnTabButtonClick
	
	PURPOSE: Shows the panel corresponding to the button
-------------------------------------------------------------------]]
function COE_Config:OnTabButtonClick(self)

	-- do nothing if self is already
	-- active panel
	-- ------------------------------
	if( COE_Config.CurrentPanel == self:GetName() ) then
		self:SetChecked( true );
		return;
	end

	-- first uncheck old button
	-- and hide the panel
	-- -------------------------
	_G[ COE_Config.CurrentPanel ]:SetChecked( false );
	_G[ COE_Config.CurrentPanel .. "Panel" ]:Hide();
	
	-- then check self button
	-- and show the panel
	-- -----------------------
	self:SetChecked( true );
	_G[ self:GetName() .. "Panel" ]:Show();
	
	COE_Config.CurrentPanel = self:GetName();

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnConfigElementLoad
	
	PURPOSE: Sets the localized element text
-------------------------------------------------------------------]]
function COE_Config:OnConfigElementLoad( self, element )

	if( not COE.Initialized ) then
		return;
	end

	if( COEUI_STRINGS[self:GetName()] ) then
		element:SetText( COEUI_STRINGS[self:GetName()] );
	else
		element:SetText( COESTR_UI_NOTASSIGNED );
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnConfigElementEnter
	
	PURPOSE: Shows the tooltip for the config element
-------------------------------------------------------------------]]
function COE_Config:OnConfigElementEnter(self)

	if( COEUI_TOOLTIPS[self:GetName()] ) then
		GameTooltip:SetOwner( self, "ANCHOR_RIGHT" );
		GameTooltip:SetText( COEUI_TOOLTIPS[self:GetName()], 1.0, 1.0, 1.0 );
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnConfigElementLeave
	
	PURPOSE: Hides the tooltip for the config element
-------------------------------------------------------------------]]
function COE_Config:OnConfigElementLeave()

	GameTooltip:Hide();

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnSubTabButtonClick
	
	PURPOSE: Shows the sub panel corresponding to the button
-------------------------------------------------------------------]]
function COE_Config:OnSubTabButtonClick( button )

	-- do nothing if self is already
	-- active panel
	-- ------------------------------
	if( COE_Config.CurrentSubPanel == button:GetName() ) then
		return;
	end

	-- first hide the old panel
	-- -------------------------
	_G[ COE_Config.CurrentSubPanel .. "Panel" ]:Hide();
	
	-- then show the new panel
	-- ------------------------
	_G[ button:GetName() .. "Panel" ]:Show();
	
	if( button:GetName() == "COE_ConfigTotemTotemSets" ) then
		COE_Config:ActivateSet( COE_Config:GetSaved( COEOPT_ACTIVESET ) );
	end 
	
	COE_Config.CurrentSubPanel = button:GetName();

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnCheckBoxShow
	
	PURPOSE: Sets the checked state depending on the current 
		option value and call the associated function to update
		the state
-------------------------------------------------------------------]]
function COE_Config:OnCheckBoxShow(self)

	-- set check state
	-- ----------------
	self:SetChecked( COE_Config:GetSaved( self:GetID() ) );

	-- call function
	-- --------------
	if( COE_Config.Options[self:GetID()].Func ) then
		COE_Config.Options[self:GetID()].Func();
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnCheckBoxClick
	
	PURPOSE: Toggles the associated option
-------------------------------------------------------------------]]
function COE_Config:OnCheckBoxClick(self)

	if( COE_Config.Options[self:GetID()] ) then
		local option = COE_Config.Options[self:GetID()]; 

		-- execute function and store new value
		-- -------------------------------------
		if( COE_Config:GetSaved( self:GetID() ) == 1 ) then
			COE_Config:SetOption( self:GetID(), 0 );
		else
			COE_Config:SetOption( self:GetID(), 1 );
		end  

		if( option.Func ) then
			option.Func();
		end
	else
		COE:DebugMessage( "No ID assigned" );
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:EnableCheckBox
	
	PURPOSE: Enables a check box and sets the text color to the
		normal text color
-------------------------------------------------------------------]]
function COE_Config:EnableCheckBox( element )

	element:Enable();
	_G[ element:GetName() .. "Text" ]:SetTextColor( NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:DisableCheckBox
	
	PURPOSE: Disables a check box and sets the text color to gray
-------------------------------------------------------------------]]
function COE_Config:DisableCheckBox( element )

	element:Disable();
	_G[ element:GetName() .. "Text" ]:SetTextColor( GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnComboBoxShow
	
	PURPOSE: Initializes the combo box content
-------------------------------------------------------------------]]
function COE_Config:OnComboBoxShow(self)

	if( COE_Config.Options[self:GetID()] ) then
		UIDropDownMenu_Initialize( self, COE_Config.Options[self:GetID()].InitFunc );
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:EnableComboBox
	
	PURPOSE: Enables a combo box and sets the text color to the
		normal text color
-------------------------------------------------------------------]]
function COE_Config:EnableComboBox( element )

	_G[ element:GetName() .. "CB" ]:Show();
	_G[ element:GetName() .. "LeftText" ]:SetTextColor( NORMAL_FONT_COLOR.r, NORMAL_FONT_COLOR.g, NORMAL_FONT_COLOR.b );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:DisableComboBox
	
	PURPOSE: Disables a combo box and sets the text color to gray
-------------------------------------------------------------------]]
function COE_Config:DisableComboBox( element )

	_G[ element:GetName() .. "CB" ]:Hide();
	_G[ element:GetName() .. "LeftText" ]:SetTextColor( GRAY_FONT_COLOR.r, GRAY_FONT_COLOR.g, GRAY_FONT_COLOR.b );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnSliderShow
	
	PURPOSE: Sets the slider texts and values
-------------------------------------------------------------------]]
function COE_Config:OnSliderShow(self)

	if( COE_Config.Options[self:GetID()] ) then
		COE_Config.Options[self:GetID()].InitFunc();
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:OnSliderChange
	
	PURPOSE: Sets the new value
-------------------------------------------------------------------]]
function COE_Config:OnSliderChange(self)

	if( COE_Config.Options[self:GetID()] ) then
		COE_Config.Options[self:GetID()].Func();
	end

end


function COE_Config:SetNewScript(element,event,newfunc)
  local button;
  local script = nil;
  
  for i=1, 10
  do
    button = _G["COETotem"..element..i];
    if(button)
    then
      if(script == nil)
      then
        script = button:GetScript(event);
      end
      button:SetScript(event,newfunc);
    end
  end
  return script;
end

function COE_Config:MustReloadUI()
  COE:Message("Secured click buttons has been altered during the configuration process, you'll need to '/console reloadui' for the totems to work again");
end

function COE_Config:EnterConfigurationMode()
  local set = COE_Config:GetSaved( COEOPT_ACTIVESET );
  if(set >= COESET_START_MULTI)
  then
    local element_to_actionID = { [1] = {134,133,135,136}, [2] = {138, 137, 139, 140}, [3] = {142,141,143,144} };
    local indices = { "Earth", "Fire", "Water", "Air" };
    local blizz_page = set - COESET_START_MULTI + 1;
    -- Setup set based on blizzard one
    -- for each element
    -- -----------------
    local k, totem;
    for k = 1,4 do
      local typ,id,subtype = GetActionInfo(element_to_actionID[blizz_page][k]);
      if(typ and typ == "spell")
      then
        local spellName = GetSpellInfo(id);
        if(spellName) then
          -- iterate over all totems
          -- ------------------------
          for totem in pairs(COE.TotemData) do
            if( COE.TotemData[totem].SpellName == spellName ) then
              COE.TotemSets[set][indices[k]] = COE.TotemData[totem];
            end
          end
        end
      end
    end
  end
  COE_Config:SetNewScript("Earth","OnClick",COE_Totem.OnTotemButtonConfigureClick);
  COE_Config:SetNewScript("Fire","OnClick",COE_Totem.OnTotemButtonConfigureClick);
  COE_Config:SetNewScript("Air","OnClick",COE_Totem.OnTotemButtonConfigureClick);
  COE_Config:SetNewScript("Water","OnClick",COE_Totem.OnTotemButtonConfigureClick);
end

function COE_Config:NeedRestoreClickButtons()
  local button = _G["COETotemEarth1"];
  local script = button:GetScript("OnClick");
  if(script ~= COE_Totem.OnTotemButtonConfigureClick)
  then
    return false;
  end
  return true;
end

function COE_Config:LeaveConfigurationMode()
  if(COE_Config:NeedRestoreClickButtons() == false)
  then
    return;
  end
  COE_Config:SetNewScript("Earth","OnClick",COE_Config.MustReloadUI);
  COE_Config:SetNewScript("Fire","OnClick",COE_Config.MustReloadUI);
  COE_Config:SetNewScript("Air","OnClick",COE_Config.MustReloadUI);
  COE_Config:SetNewScript("Water","OnClick",COE_Config.MustReloadUI);
end

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:ConfigureBar
	
	PURPOSE: Switches between set bar configuration modes 
-------------------------------------------------------------------]]
function COE_Config:ConfigureBar( mode )

	if( mode == nil ) then
		mode = not COE.ConfigureBarMode;
	end

	if( mode ) then
		COE_Config:ConfigureOrder( false );
		COE_Config:ConfigureSet( false );
		COE.ConfigureBarMode = true;
		COE_OptionConfigureBar:SetText( COEUI_STRINGS["COE_OptionStopConfigureSet"] );
                COE_Config:EnterConfigurationMode();
	else
		COE.ConfigureBarMode = false;
		COE_OptionConfigureBar:SetText( COEUI_STRINGS["COE_OptionConfigureBar"] );
                COE_Config:LeaveConfigurationMode();
	end

	-- Invalidate : Resets Frames, and OnClick handler
	COE_Totem:Invalidate( COEEarthFrame, true, true, true );
	COE_Totem:Invalidate( COEFireFrame, true, true, true );
	COE_Totem:Invalidate( COEWaterFrame, true, true, true );
	COE_Totem:Invalidate( COEAirFrame, true, true, true );
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:ConfigureOrder
	
	PURPOSE: Switches between set bar configuration modes 
-------------------------------------------------------------------]]
function COE_Config:ConfigureOrder( mode )

	if( mode == nil ) then
		mode = not COE.ConfigureOrderMode;
	end

	if( mode ) then
		COE_Config:ConfigureBar( false );
		COE_Config:ConfigureSet( false );
		COE.ConfigureOrderMode = true;
		COE_OptionConfigureOrder:SetText( COEUI_STRINGS["COE_OptionStopConfigureSet"] );
                COE_Config:EnterConfigurationMode();
	else
		COE.ConfigureOrderMode = false;
		COE_Config.ConfigureOrderTotem = nil;
		COE_OptionConfigureOrder:SetText( COEUI_STRINGS["COE_OptionConfigureOrder"] );
                COE_Config:LeaveConfigurationMode();
	end

	-- Invalidate : Resets Frames, and OnClick handler
	COE_Totem:Invalidate( COEEarthFrame, true, true, true );
	COE_Totem:Invalidate( COEFireFrame, true, true, true );
	COE_Totem:Invalidate( COEWaterFrame, true, true, true );
	COE_Totem:Invalidate( COEAirFrame, true, true, true );
end


--[[ =============================================================================================

										O P T I O N S 

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableTotemBar
	
	PURPOSE: Update the totem bar frame to reflect the change and 
		set availability of dependent options
-------------------------------------------------------------------]]
function COEOptionEnableTotemBar()

	-- self call is needed if the bar was invisible
	-- ---------------------------------------------
	COE_Totem:UpdateAllFrames();
	
	if( COE_Config:GetSaved( COEOPT_ENABLETOTEMBAR ) == 1 ) then
		COE_ConfigTotemTotemBar:Enable();
		COE_ConfigTotemTotemOptions:Enable();
		COE_ConfigTotemTotemSets:Enable();
		
		COE_Config:EnableCheckBox( COE_OptionFixBar );
		COE_Config:EnableCheckBox( COE_OptionGroupBars );
		COE_Config:EnableComboBox( COE_OptionTTAlignment );
		COE_Config:EnableComboBox( COE_OptionDisplayMode );
		COE_OptionConfigureBar:Enable();
		COE_OptionConfigureOrder:Enable();
		COE_Config:EnableComboBox( COE_OptionCurrentFrame );
		COE_Config:EnableComboBox( COE_OptionDirection );
		COE_Config:EnableComboBox( COE_OptionFrameMode );
		COE_OptionFlexCount:Show();
	else
		COE_ConfigTotemTotemBar:Disable();
		COE_ConfigTotemTotemOptions:Disable();
		COE_ConfigTotemTotemSets:Disable();

		COE_Config:OnSubTabButtonClick( COE_ConfigTotemTotemBar );
		
		COE_Config:DisableCheckBox( COE_OptionFixBar );
		COE_Config:DisableCheckBox( COE_OptionGroupBars );
		COE_Config:DisableComboBox( COE_OptionTTAlignment );
		COE_Config:DisableComboBox( COE_OptionDisplayMode );
		COE_Config:ConfigureSet( false );
		COE_Config:ConfigureBar( false );
		COE_Config:ConfigureOrder( false );
		COE_OptionConfigureBar:Disable();
		COE_OptionConfigureOrder:Disable();
		COE_Config:DisableComboBox( COE_OptionCurrentFrame );
		COE_Config:DisableComboBox( COE_OptionDirection );
		COE_Config:DisableComboBox( COE_OptionFrameMode );
		COE_OptionFlexCount:Hide();
	end

end

--[[ ----------------------------------------------------------------
	METHOD: COEOptionDisableTTCombat
	
	PURPOSE: Disable tooltip in combat
-------------------------------------------------------------------]]
function COEOptionDisableTTCombat()
end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableTimers
	
	PURPOSE: Disable dependent elements
-------------------------------------------------------------------]]
function COEOptionEnableTimers()

-- CHANGE by tayedaen
-- TimerNotifications independat of the timer-setting
	COE_Config:EnableCheckBox( COE_OptionEnableTimerNotifications );
	if( COE_Config:GetSaved( COEOPT_ENABLETIMERS ) == 0 ) then
		-- disable dependent elements
		-- ---------------------------
		COE_Config:DisableCheckBox( COE_OptionEnableTimerFrame );
		COE_Config:DisableComboBox( COE_OptionDisplayAlignment );
		COE_Config:DisableCheckBox( COE_OptionFrameTimersOnly );	
		COETimerFrame:Hide();
	else
		COE_Config:EnableCheckBox( COE_OptionEnableTimerFrame );
		COE_Config:EnableComboBox( COE_OptionDisplayAlignment );
		COE_Config:EnableCheckBox( COE_OptionFrameTimersOnly );	
		
		if( COE_Config:GetSaved( COEOPT_TIMERFRAME ) == 1 ) then
			COETimerFrame:Show();
		end
	end
end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionTTAlignmentInit
	
	PURPOSE: Fills the Tooltip Alignment combo box 
-------------------------------------------------------------------]]
function COEOptionTTAlignmentInit()

	local i;
	for i = 1, #COEUI_TTALIGN do
		UIDropDownMenu_AddButton( { text = COEUI_TTALIGN[i][2]; func = COEOptionTTAlignmentClick } );
	end
	UIDropDownMenu_SetSelectedID( COE_OptionTTAlignmentCB, COE_Config:GetSaved( COEOPT_TTALIGNMENT ) );

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionTTAlignmentClick()
	
	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionTTAlignmentClick(self)

	UIDropDownMenu_SetSelectedID( COE_OptionTTAlignmentCB, self:GetID() );
	COE_Config:SetOption( COEOPT_TTALIGNMENT, self:GetID() );

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionDisplayModeInit
	
	PURPOSE: Fills the Display Mode combo box 
-------------------------------------------------------------------]]
function COEOptionDisplayModeInit()

	local i;
	for i = 1, #COEUI_DISPLAYMODE do
		UIDropDownMenu_AddButton( { text = COEUI_DISPLAYMODE[i]; func = COEOptionDisplayModeClick } );
	end
	-- Hack to disable timers mode
	if(COE_Config:GetSaved( COEOPT_DISPLAYMODE ) == COEMODE_TIMERSONLY)
	then
		COE:Message("Timers mode no longer working");
		COE_Config:SetOption( COEOPT_DISPLAYMODE, COEMODE_ALLTOTEMS );
	end
	UIDropDownMenu_SetSelectedID( COE_OptionDisplayModeCB, COE_Config:GetSaved( COEOPT_DISPLAYMODE ) );

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionDisplayModeClick()
	
	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionDisplayModeClick(self)
	-- Hack to disable timers mode
	if(self:GetID() == COEMODE_TIMERSONLY)
	then
		COE:Message("Timers mode no longer working");
		return;
	end
	UIDropDownMenu_SetSelectedID( COE_OptionDisplayModeCB, self:GetID() );
	COE_Config:SetOption( COEOPT_DISPLAYMODE, self:GetID() );
	
	-- reconfigure totems
	-- -------------------
	COETotemFrame.Reconfigure = true;

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableSets()
	
	PURPOSE: Set availability of the set buttons
-------------------------------------------------------------------]]
function COEOptionEnableSets()

	if( COE_Config:GetSaved( COEOPT_ENABLESETS ) == 1 ) then
		COE_Config:EnableCheckBox( COE_OptionEnableAutoSwitch );
		COE_Config:EnableComboBox( COE_OptionActiveSet );
		COE_OptionConfigureSet:Enable();
		COE_OptionSetName:Show();
	else
		COE_Config:DisableCheckBox( COE_OptionEnableAutoSwitch );
		COE_Config:DisableComboBox( COE_OptionActiveSet );
		COE_OptionConfigureSet:Disable();
		COE_OptionSetName:Hide();

		COE_Config:ActivateSet( COESET_DEFAULT );
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableAdvisor()
	
	PURPOSE: Schedules the advisor check if enabled
-------------------------------------------------------------------]]
function COEOptionEnableAdvisor()

	if( COE_Config:GetSaved( COEOPT_ADVISOR ) == 1 ) then
		-- schedule only if not already scheduled to prevent
		-- rescheduling on config dialog display
		-- --------------------------------------------------
		if( not Chronos.isScheduledByName( "COEAdvise" ) ) then
			Chronos.scheduleRepeating( "COEAdvise", COE.AdvisorInterval, COESched_RunAdvisor );
		end
	else
		Chronos.unscheduleByName( "COEAdvise" );
		COE.CleansingTotems.Tremor.Warn = false;
		COE.CleansingTotems.Disease.Warn = false;
		COE.CleansingTotems.Poison.Warn = false;
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableAutoSwitch()
	
	PURPOSE: Refill the Active Set combo box 
-------------------------------------------------------------------]]
function COEOptionEnableAutoSwitch()

	if( COE_Config:GetSaved( COEOPT_AUTOSWITCH ) == 0 and 
		COE_Config:GetSaved( COEOPT_ACTIVESET ) <= COESET_DEFAULT ) then

		-- switch to default set
		-- ----------------------
		COE_Config:ActivateSet( COESET_DEFAULT );
	end
		
end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionActiveSetInit
	
	PURPOSE: Fills the Active Set combo box 
-------------------------------------------------------------------]]
function COE_KnowSpell(spellID)
  local name = GetSpellInfo(spellID); -- Always returns info if spellID is valid
  if(name)
  then
    local n = GetSpellInfo(name); -- Returns info only if spell is in your spellbook
    if(n)
    then
      return n;
    end
  end
  return nil;
end

local function COECheckAddMultiCast(spellID,value)
  local name = COE_KnowSpell(spellID);
  if(name)
  then
    UIDropDownMenu_AddButton( { text = "[Bliz] "..name; func = COEOptionActiveSetClick; value = value } );
  end
end

function COEOptionActiveSetInit()

	local i;
	
	-- pvp sets
	-- ---------
	if( COE_Config:GetSaved( COEOPT_AUTOSWITCH ) == 1 ) then
		for i = 1, #COEUI_PVPSETS do
			UIDropDownMenu_AddButton( { text = COEUI_PVPSETS[i]; func = COEOptionActiveSetClick; value = i } );
		end
	end
	
	-- default set
	-- ------------
	UIDropDownMenu_AddButton( { text = COEUI_DEFAULTSET; func = COEOptionActiveSetClick; value = COESET_DEFAULT } );

    -- MultiCast sets - Wow 3.2
    COECheckAddMultiCast(66842,COESET_START_MULTI);
    COECheckAddMultiCast(66843,COESET_START_MULTI+1);
    COECheckAddMultiCast(66844,COESET_START_MULTI+2);
    
	-- custom sets
	-- ------------
	for i = 1, #COE_CustomTotemSets do
		UIDropDownMenu_AddButton( { text = COE_CustomTotemSets[i].Name; func = COEOptionActiveSetClick; value = COESET_DEFAULT + i } );
	end

	-- select the activated set
	-- -------------------------
	UIDropDownMenu_SetSelectedValue( COE_OptionActiveSetCB, COE_Config:GetSaved( COEOPT_ACTIVESET ) );
	
	COE_Config:SetSetButtonStates();

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionActiveSetClick
	
	PURPOSE: Activates the chosen totem set 
-------------------------------------------------------------------]]
function COEOptionActiveSetClick(self)
	
	COE_Config:ActivateSet( self.value );

	-- reset set cycle
	-- ----------------
	COE_Totem:ResetSetCycle();
	
end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionCurrentFrameInit
	
	PURPOSE: Fills the Configure Bar combo box 
-------------------------------------------------------------------]]
function COEOptionCurrentFrameInit()

	local i;
	for i = 1, #COEUI_CURRENTFRAME do
		UIDropDownMenu_AddButton( { text = COEUI_CURRENTFRAME[i]; func = COEOptionCurrentFrameClick; value = COE_Element[i] } );
	end
	UIDropDownMenu_SetSelectedValue( COE_OptionCurrentFrameCB, COE_Config:GetSaved( COEOPT_CURRENTFRAME ) );

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionCurrentFrameClick()
	
	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionCurrentFrameClick(self)

	UIDropDownMenu_SetSelectedID( COE_OptionCurrentFrameCB, self:GetID() );
	COE_Config:SetOption( COEOPT_CURRENTFRAME, self.value );

	-- show associated options
	-- ------------------------
	UIDropDownMenu_Initialize( COE_OptionDirectionCB, COEOptionDirectionInit );
	UIDropDownMenu_Initialize( COE_OptionFrameModeCB, COEOptionFrameModeInit );
	COEOptionFlexCountShow();
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_EnsureTotemBars

	PURPOSE: The "Configure Bar" combo boxes (Direction/Frame mode/
		Flex count) index COE_TotemBars[COE_ActiveTalents] directly.
		That's normally set up by COE:CheckTalentSpecChanged on
		PLAYER_ENTERING_WORLD, but if this sub panel's OnShow fires
		before that has run (or the two ever get out of sync), the
		index is nil and every one of those combo boxes throws
		"attempt to index field '?' (a nil value)". Call this first
		in each of them to guarantee a valid entry exists.
-------------------------------------------------------------------]]
function COE_EnsureTotemBars()
	if( COE_ActiveTalents == nil or COE_TotemBars[COE_ActiveTalents] == nil ) then
		COE:CheckTalentSpecChanged(true);
	end
	if( COE_TotemBars[COE_ActiveTalents] == nil ) then
		-- still nothing (addon not fully initialized yet): fall back to
		-- a fresh copy of the defaults so the UI doesn't error out.
		if( COE_ActiveTalents == nil ) then
			COE_ActiveTalents = 1;
		end
		COE_TotemBars[COE_ActiveTalents] = COE:DuplicateTable(COE_TotemBars_Defaults);
	end
end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionDirectionInit

	PURPOSE: Fills the Configure Bar combo box
-------------------------------------------------------------------]]
function COEOptionDirectionInit()

	COE_EnsureTotemBars();

	local i;
	for i = 1, #COEUI_DIRECTION do
		UIDropDownMenu_AddButton( { text = COEUI_DIRECTION[i]; func = COEOptionDirectionClick; value = COE_Direction[i]} );
	end
	local dir = COE_TotemBars[COE_ActiveTalents][COE_Config:GetSaved( COEOPT_CURRENTFRAME )].Direction;
	UIDropDownMenu_SetSelectedValue( COE_OptionDirectionCB, dir );

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionDirectionClick()

	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionDirectionClick(self)

	COE_EnsureTotemBars();

	UIDropDownMenu_SetSelectedID( COE_OptionDirectionCB, self:GetID() );
	COE_TotemBars[COE_ActiveTalents][COE_Config:GetSaved( COEOPT_CURRENTFRAME )].Direction = self.value;
	
	-- set the frame parameters
	-- -------------------------
	local frame = _G[ "COE" .. COE_Config:GetSaved( COEOPT_CURRENTFRAME ) .. "Frame" ]; 
	COE_Totem:SetFrameDirection( frame, self.value );

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionFrameModeInit
	
	PURPOSE: Fills the Frame mode combo box 
-------------------------------------------------------------------]]
function COEOptionFrameModeInit()

	COE_EnsureTotemBars();

	local i;
	for i = 1, #COEUI_FRAMEMODE do
		UIDropDownMenu_AddButton( { text = COEUI_FRAMEMODE[i]; func = COEOptionFrameModeClick; value = COE_FrameMode[i]} );
	end
	local mode = COE_TotemBars[COE_ActiveTalents][COE_Config:GetSaved( COEOPT_CURRENTFRAME )].Mode;
	UIDropDownMenu_SetSelectedValue( COE_OptionFrameModeCB, mode );

	-- show the slider if appropriate
	-- -------------------------------
	if( mode == "Flex" ) then
		COE_OptionFlexCount:Show();
	else
		COE_OptionFlexCount:Hide();
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionFrameModeClick()
	
	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionFrameModeClick(self)

	COE_EnsureTotemBars();

	UIDropDownMenu_SetSelectedID( COE_OptionFrameModeCB, self:GetID() );
	COE_TotemBars[COE_ActiveTalents][COE_Config:GetSaved( COEOPT_CURRENTFRAME )].Mode = self.value;
	
	-- set the frame parameters
	-- -------------------------
	local frame = _G[ "COE" .. COE_Config:GetSaved( COEOPT_CURRENTFRAME ) .. "Frame" ];
	frame.Mode = self.value;
	
	-- show the slider if appropriate
	-- -------------------------------
	if( self.value == "Flex" ) then
		COE_OptionFlexCount:Show();
	else
		COE_OptionFlexCount:Hide();
	end
	
	-- force frame update
	-- -------------------
	COE_Totem:UpdateAllFrames(); 

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionFlexCountShow()
	
	PURPOSE: Sets the slider texts and values
-------------------------------------------------------------------]]
function COEOptionFlexCountShow()

	COE_EnsureTotemBars();

	local element = COE_Config:GetSaved( COEOPT_CURRENTFRAME );

	-- set values
	-- -----------
	COE_OptionFlexCount:SetMinMaxValues( 1, COE.MaxTotems[element] );
	COE_OptionFlexCount:SetValue( COE_TotemBars[COE_ActiveTalents][element].FlexCount );
	COE_OptionFlexCount:SetValueStep( 1 );
	
	-- set texts
	-- ----------
	_G[ COE_OptionFlexCount:GetName() .. "Low" ]:SetText( 1 ); 
	_G[ COE_OptionFlexCount:GetName() .. "High" ]:SetText( COE.MaxTotems[element] ); 

end



--[[ ----------------------------------------------------------------
	METHOD: COEOptionFlexCountChange()
	
	PURPOSE: Stores the option and updates the display
-------------------------------------------------------------------]]
function COEOptionFlexCountChange()

	COE_EnsureTotemBars();

	local element = COE_Config:GetSaved( COEOPT_CURRENTFRAME );

	COE_TotemBars[COE_ActiveTalents][element].FlexCount = COE_OptionFlexCount:GetValue();

	-- set the frame parameters
	-- -------------------------
	local frame = _G[ "COE" .. element .. "Frame" ];
	frame.FlexCount = COE_TotemBars[COE_ActiveTalents][element].FlexCount;
	COE_Totem:Invalidate( frame, false, true, true );
end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionScalingShow()
	
	PURPOSE: Sets the slider texts and values
-------------------------------------------------------------------]]
function COEOptionScalingShow()

	-- set values
	-- -----------
	COE_OptionScaling:SetMinMaxValues( 0.64, 1.2 );
	COE_OptionScaling:SetValue( COE_Config:GetSaved( COEOPT_SCALING ) );
	COE_OptionScaling:SetValueStep( 0.01 );
	
	-- set texts
	-- ----------
	_G[ COE_OptionScaling:GetName() .. "Low" ]:SetText( 0.64 ); 
	_G[ COE_OptionScaling:GetName() .. "High" ]:SetText( 1.2 ); 

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionScalingChange()
	
	PURPOSE: Stores the option and updates the display
-------------------------------------------------------------------]]
function COEOptionScalingChange()

	COE_Config:SetOption( COEOPT_SCALING, COE_OptionScaling:GetValue() );
	
	COEUI_CurrentScale = COE_Config:GetSaved( COEOPT_SCALING );

	-- invalidate all frames
	-- ----------------------
	COE_Totem:Invalidate( COEEarthFrame, true, true, true );
	COE_Totem:Invalidate( COEFireFrame, true, true, true );
	COE_Totem:Invalidate( COEWaterFrame, true, true, true );
	COE_Totem:Invalidate( COEAirFrame, true, true, true );
end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionScalingTimersShow()
	
	PURPOSE: Sets the slider texts and values
-------------------------------------------------------------------]]
function COEOptionScalingTimersShow()

	-- set values
	-- -----------
	COE_OptionScalingTimers:SetMinMaxValues( 0.4, 1.4 );
	COE_OptionScalingTimers:SetValue( COE_Config:GetSaved( COEOPT_SCALING_TIMERS ) );
	COE_OptionScalingTimers:SetValueStep( 0.01 );
	
	-- set texts
	-- ----------
	_G[ COE_OptionScalingTimers:GetName() .. "Low" ]:SetText( 0.4 ); 
	_G[ COE_OptionScalingTimers:GetName() .. "High" ]:SetText( 1.4 ); 

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionScalingTimersChange()
	
	PURPOSE: Stores the option and updates the display
-------------------------------------------------------------------]]
function COEOptionScalingTimersChange()

	COE_Config:SetOption( COEOPT_SCALING_TIMERS, COE_OptionScalingTimers:GetValue() );
	
end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionEnableTimerFrame()
	
	PURPOSE: Sets the visibility of the timer frame
-------------------------------------------------------------------]]
function COEOptionEnableTimerFrame()

	if( COE_Config:GetSaved( COEOPT_TIMERFRAME ) == 1 ) then
		COE_Totem:SetNoTotemTimer("Earth",false);
		COE_Totem:SetNoTotemTimer("Fire",false);
		COE_Totem:SetNoTotemTimer("Water",false);
		COE_Totem:SetNoTotemTimer("Air",false);
		COETimerFrame:Show();
	else
		COETimerFrame:Hide();
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionDisplayAlignInit
	
	PURPOSE: Fills the Display Alignment combo box 
-------------------------------------------------------------------]]
function COEOptionDisplayAlignInit()

	local i;
	for i = 1, #COEUI_DISPLAYALIGN do
		UIDropDownMenu_AddButton( { text = COEUI_DISPLAYALIGN[i]; func = COEOptionDisplayAlignClick } );
	end
	UIDropDownMenu_SetSelectedID( COE_OptionDisplayAlignmentCB, COE_Config:GetSaved( COEOPT_DISPLAYALIGN ) );

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionDisplayAlignClick()
	
	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionDisplayAlignClick(self)

	UIDropDownMenu_SetSelectedID( COE_OptionDisplayAlignmentCB, self:GetID() );
	COE_Config:SetOption( COEOPT_DISPLAYALIGN, self:GetID() );

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionOverrideRankInit
	
	PURPOSE: Fills the Rank 1 modifier combo box 
-------------------------------------------------------------------]]
function COEOptionOverrideRankInit()

	local i;
	for i = 1, #COEUI_OVERRIDERANK do
		UIDropDownMenu_AddButton( { text = COEUI_OVERRIDERANK[i]; func = COEOptionOverrideRankClick } );
	end
	UIDropDownMenu_SetSelectedID( COE_OptionOverrideRankCB, COE_Config:GetSaved( COEOPT_OVERRIDERANK ) );

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionOverrideRankClick()
	
	PURPOSE: Selects the clicked button and stores the option
-------------------------------------------------------------------]]
function COEOptionOverrideRankClick(self)

	UIDropDownMenu_SetSelectedID( COE_OptionOverrideRankCB, self:GetID() );
	COE_Config:SetOption( COEOPT_OVERRIDERANK, self:GetID() );

end


--[[ ----------------------------------------------------------------
	METHOD: COEOptionGroupBars()
	
	PURPOSE: Stores the relative frame positions when enabled
-------------------------------------------------------------------]]
function COEOptionGroupBars()

	if( COE_Config:GetSaved( COEOPT_GROUPBARS ) == 1 ) then
		COE_Totem:UpdateFrameCoordinates();
	end

end


--[[ =============================================================================================

									T O T E M   S E T S

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:ActivateSet
	
	PURPOSE: Activates the specified set and shows its options 
-------------------------------------------------------------------]]
function COE_Config:ActivateSet( index )

	-- save setting
	-- -------------
	COE_Config:SetOption( COEOPT_ACTIVESET, index );
	
	-- update drop down
	-- -----------------
	UIDropDownMenu_Initialize( COE_OptionActiveSetCB, COE_Config.Options[COEOPT_ACTIVESET].InitFunc );
	
	-- update cast order
	-- ------------------
	if( index <= COESET_DEFAULT ) then
		set = COE_SavedTotemSets[index];
	elseif( index >= COESET_START_MULTI)
    then
      set = COE_BlizzTotemSets[index - COESET_START_MULTI + 1];
      ChangeMultiCastActionPage(index - COESET_START_MULTI + 1);
    else
		set = COE_CustomTotemSets[index - COESET_DEFAULT];
	end
	
	if(set)
	then
		local i;
		for i = 1, 4 do
			_G[ "COE_OptionCastOrder" .. i .. "Text" ]:SetText( set.CastOrder[i] );
		end 
	end

	-- reconfigure totem bar
	-- ----------------------
	COE_Totem:Invalidate( COEEarthFrame, true, true, true );
	COE_Totem:Invalidate( COEFireFrame, true, true, true );
	COE_Totem:Invalidate( COEWaterFrame, true, true, true );
	COE_Totem:Invalidate( COEAirFrame, true, true, true );
	COETotemFrame.Reconfigure = true;	
	if(set)
	then
		if(InCombatLockdown())
        	then
          	COETotemFrame.MustConfigureSet = index;
          	COE:Message("You are in combat, Active set will be changed as soon as you leave combat mode.");
          	return;
        	end
        	COE_Config:ConfigureStateSet(index);
	end
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:SetSetButtonStates
	
	PURPOSE: Sets the availablitity of the options in the totem
		sets sup panel 
-------------------------------------------------------------------]]
function COE_Config:SetSetButtonStates()

	-- set button states
	-- ------------------
	if( UIDropDownMenu_GetSelectedValue( COE_OptionActiveSetCB ) <= COESET_DEFAULT or UIDropDownMenu_GetSelectedValue( COE_OptionActiveSetCB ) >= COESET_START_MULTI ) then
		
		-- set not removable
		-- ------------------
		COE_OptionDeleteSet:Disable();
	else
		
		-- set is removable
		-- ----------------- 
		COE_OptionDeleteSet:Enable();
	end	

  if(UIDropDownMenu_GetSelectedValue( COE_OptionActiveSetCB ) >= COESET_START_MULTI ) then
    COE_OptionCastOrder1:Hide();
    COE_OptionCastOrder2:Hide();
    COE_OptionCastOrder3:Hide();
    COE_OptionCastOrder4:Hide();
    COE_OptionCastOrderString:Hide();
  else
    COE_OptionCastOrder1:Show();
    COE_OptionCastOrder2:Show();
    COE_OptionCastOrder3:Show();
    COE_OptionCastOrder4:Show();
    COE_OptionCastOrderString:Show();
  end
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:NewSetTextChanged
	
	PURPOSE: Enabled the New Set button only if text is entered 
-------------------------------------------------------------------]]
function COE_Config:NewSetTextChanged(self)

	if( self:GetText() ~= "" ) then
		COE_OptionNewSet:Enable();
	else
		COE_OptionNewSet:Disable();
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:NewTotemSet
	
	PURPOSE: Creates a new totem set with the specified name 
-------------------------------------------------------------------]]
function COE_Config:NewTotemSet()

	COE_OptionSetName:ClearFocus();
	
	local name = COE_OptionSetName:GetText(); 
	if( name and name ~= "" ) then
		local setcount = #COE_CustomTotemSets;
		
		-- create new set
		-- ---------------
		table.insert( COE_CustomTotemSets, { Name = name, Earth = "", Fire = "", Water = "", Air = "",
			CastOrder = { COESTR_ELEMENT_EARTH, COESTR_ELEMENT_FIRE, COESTR_ELEMENT_WATER, COESTR_ELEMENT_AIR } } );
		
		-- activate set
		-- -------------
		COE_Config:ActivateSet( COESET_DEFAULT + setcount + 1 );
	
		-- rescan totem sets
		-- ------------------
		COE:InitTotemSets();
	
		-- clear the edit box
		-- -------------------
		COE_OptionSetName:SetText( "" );
	end

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:DeleteTotemSet
	
	PURPOSE: Deletes the current custom set 
-------------------------------------------------------------------]]
function COE_Config:DeleteTotemSet()

	local set = UIDropDownMenu_GetSelectedValue( COE_OptionActiveSetCB );
	
	if( set <= COESET_DEFAULT or set >= COESET_START_MULTI ) then
		return;
	end
	
	set = set - COESET_DEFAULT;

	-- delete set
	-- -----------	
	table.remove( COE_CustomTotemSets, set );
	
	-- set default set as active
	-- --------------------------
	COE_Config:ActivateSet( COESET_DEFAULT );

	-- rescan totem sets
	-- ------------------
	COE:InitTotemSets();
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:ConfigureSet
	
	PURPOSE: Switches between set configuration modes 
-------------------------------------------------------------------]]
function COE_Config:ConfigureSet( mode )

	if( mode == nil ) then
		mode = not COE.ConfigureSetsMode;
	end

	if( mode ) then
		COE_Config:ConfigureBar( false );
		COE_Config:ConfigureOrder( false );
		COE.ConfigureSetsMode = true;
		COE_OptionConfigureSet:SetText( COEUI_STRINGS["COE_OptionStopConfigureSet"] );
                COE_Config:EnterConfigurationMode();
	else
		COE.ConfigureSetsMode = false;
		COE_OptionConfigureSet:SetText( COEUI_STRINGS["COE_OptionConfigureSet"] );
                COE_Config:LeaveConfigurationMode();
	end

	-- Invalidate : Resets Frames, and OnClick handler
	COE_Totem:Invalidate( COEEarthFrame, true, true, true );
	COE_Totem:Invalidate( COEFireFrame, true, true, true );
	COE_Totem:Invalidate( COEWaterFrame, true, true, true );
	COE_Totem:Invalidate( COEAirFrame, true, true, true );
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:DoCastOrder
	
	PURPOSE: Increases or decreases the cast order of the 
		associated element in self set depending on the 
		direction parameter (up/down) 
-------------------------------------------------------------------]]
function COE_Config:DoCastOrder( self, up )

	-- get id first
	-- -------------
	local id = self:GetParent():GetID();
	
	-- already the first/last element?
	-- --------------------------------
	if( (up and id == 1) or (not up and id == 4) ) then
		return;
	end
	
	-- get the other element id
	-- -------------------------
	local otherid;
	if( up ) then
		otherid = id - 1;
	else
		otherid = id + 1;
	end  
	
	--=======================================
	-- swap element with the next one
	--=======================================
	
	local activeset = COE_Config:GetSaved( COEOPT_ACTIVESET );
	local swap;
	
	-- swap in internal set
	-- since the cast order is stored by reference
	-- in the saved set, we only need to swap it here
	-- -----------------------------------------------
	swap = COE.TotemSets[activeset].CastOrder[otherid];
	COE.TotemSets[activeset].CastOrder[otherid] = COE.TotemSets[activeset].CastOrder[id];
	COE.TotemSets[activeset].CastOrder[id] = swap;
	
	-- swap labels
	-- ------------
	local thistext = _G[ "COE_OptionCastOrder" .. id .. "Text" ]; 
	local othertext = _G[ "COE_OptionCastOrder" .. otherid .. "Text" ]; 
	
	swap = othertext:GetText();
	othertext:SetText( thistext:GetText() );
	thistext:SetText( swap ); 	  	 	

end


--[[ =============================================================================================

										L O G I C 

================================================================================================]]

--[[ ----------------------------------------------------------------
	METHOD: COE_Config:RegisterOption
	
	PURPOSE: Registers a checkbox or combobox for the configuration
		dialog along with function to be executed and saved
		variables
		
	PARAMS:	id			- id of the frame (the unique option id)
			type		- 'check', 'combo' or 'slider'
			func		- function pointer for OnClick or OnChange
			value		- initial value (saved variable)
			initfunc	- function pointer for combobox initialization 
						  / slider show
			skip		- if true, the option is not saved
-------------------------------------------------------------------]]
function COE_Config:RegisterOption( id, type, func, value, initfunc, skip )

	-- check if the type is valid
	-- ---------------------------
	if( type ~= 'check' and type ~= 'combo' and type ~= 'slider' ) then
		return;
	end
	
	-- store option
	-- -------------
	COE_Config.Options[id] = { Type = type, Func = func, InitFunc = initfunc };
	
	-- store saved variable
	-- ---------------------
	--[[if( not skip ) then
		COE_Saved[COE_ActiveTalents][id] = value;
	end]]

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:SetOption
	
	PURPOSE: Stores the new value in the options and saved
		variables table
-------------------------------------------------------------------]]
function COE_Config:SetOption( id, value )

  if(id == COEOPT_VERSION) then -- Global value
    COE_Saved["VERSION"] = value;
    return;
  end

  COE_Saved[COE_ActiveTalents][id] = value;

end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:GetSaved
	
	PURPOSE: Retrieves the value from the saved variables or uses
		the default value if it cannot find it there
-------------------------------------------------------------------]]
function COE_Config:GetSaved( id )
	if(id == COEOPT_VERSION) then -- Global value
		return COE_Saved["VERSION"] or COE_Saved[id];
	end
	if( COE_ActiveTalents ~= nil and COE_Saved[COE_ActiveTalents][id] ) then
		return COE_Saved[COE_ActiveTalents][id];
	elseif( COE_Saved_Defaults[id] ) then
		return COE_Saved_Defaults[id];
	else
		return nil;
	end
	
end


--[[ ----------------------------------------------------------------
	METHOD: COE_Config:ConfigureStateSet
	
	PURPOSE: Configures the state header for the new totem set
-------------------------------------------------------------------]]
function COE_Config_StateTotem_StartMoving(self)
  if( COE_Config:GetSaved( COEOPT_FIXBAR ) == 0 )
  then
    self:StartMoving();
  end
end

function COE_Config_StateTotem_StopMoving(self)
  if( COE_Config:GetSaved( COEOPT_FIXBAR ) == 0 )
  then
    self:StopMovingOrSizing();
  end
end

function COE_Config:ConfigureStateSet(activeset)
  local HDR = COE_SH_DropSet;
  local button;
  local icon;
  local element;
  local totem;

  -- Create the state header, the Main button, and the element buttons
  if(not COE_SH_DropSet)
  then
    HDR = CreateFrame("Button","COE_SH_DropSet",UIParent,"SecureHandlerClickTemplate");
    HDR:RegisterForClicks("LeftButtonDown");
    HDR:SetFrameStrata("DIALOG");
    HDR:SetWidth(1);
    HDR:SetHeight(1);
    HDR:SetMovable(true);
    HDR:ClearAllPoints();
    HDR:SetPoint("CENTER",UIParent,"CENTER",0,0);
    HDR:Hide();

    HDR:Execute([[
      buttons = newtable();
      shown = false;
    ]]);

    HDR:SetAttribute("_onclick",[[
      if(shown == false)
      then
        self:Show();
        for idx,button in ipairs(buttons)
        do
          self:SetBindingClick(true,tostring(idx),button);
        end
        self:SetBindingClick(true,"ESCAPE",self:GetName());
        shown = true;
      else
        for idx,button in ipairs(buttons)
        do
          self:ClearBinding(tostring(idx));
        end
        self:ClearBinding("ESCAPE");
        shown = false;
        self:Hide();
      end
    ]]);

    local key,key2 = GetBindingKey("COEDROPSET");
    if(key)
    then
      SetOverrideBindingClick(HDR,false,key,HDR:GetName());
    end
    if(key2)
    then
      SetOverrideBindingClick(HDR,false,key2,HDR:GetName());
    end
    --_G["BINDING_NAME_CLICK COE_SH_DropSet"] = "Open sub-menu";

    COEUI_CurrentScale = COE_Config:GetSaved(COEOPT_SCALING);
    -- Element buttons + Totemic Call
    for i=1,5
    do
      local button = CreateFrame("CheckButton","COE_TB_DropSet"..i,HDR,"COETotemDropSetTemplate");
      _G[button:GetName().."HotKey2"]:SetText(tostring(i));
      button:SetScale(COEUI_CurrentScale);
      button:SetFrameStrata("DIALOG");
      if(i == 1)
      then
        button:SetPoint("TOPLEFT",HDR,"TOPLEFT",0,0);
      else
        button:SetPoint("TOPLEFT","COE_TB_DropSet"..i-1,"TOPRIGHT",2,0);
      end
      button.DropTotem = true;

      HDR:SetFrameRef("kid", button);
      HDR:Execute("buttons[" .. i .. "] = self:GetFrameRef('kid');");
      HDR:WrapScript(button,"OnClick",[[
        --owner:Hide();
      ]]);
    end
    -- Init COE_ElementToSlot table
    COE_ElementToSlot = {
      ["Fire"] = FIRE_TOTEM_SLOT or 1,
      ["Earth"] = EARTH_TOTEM_SLOT or 2,
      ["Water"] = WATER_TOTEM_SLOT or 3,
      ["Air"] = AIR_TOTEM_SLOT or 4,
    };
  end

  if(COE.TotemSets[activeset] == nil or COE.TotemSets[activeset].CastOrder == nil)
  then
    return;
  end

  --TOTEM_PRIORITIES = {}; -- Disabled because of taint issue
  -- Configure buttons
  for i=1,4
  do
    button = _G["COE_TB_DropSet"..i];
    element = COE:LocalizedElement( COE.TotemSets[activeset].CastOrder[i] );
    if(element == nil or COE_ElementToSlot[element] == nil)
    then
      COE:Message("WARNING PLEASE INFORM KIKI: COE_Config:ConfigureStateSet: element='"..tostring(COE.TotemSets[activeset].CastOrder[i]).."' slot='"..tostring(COE_ElementToSlot[element]).."' count="..#COE_ElementToSlot);
    end
    --tinsert(TOTEM_PRIORITIES,COE_ElementToSlot[element]); -- Disabled because of taint issue
    totem = COE.TotemSets[activeset][element];
    icon = _G[ button:GetName().."Icon" ];
    -- Save totem
    button.totem = totem;
    button.UpdateTime = 0;
    if(totem)
    then
      -- Set Texture
      icon:SetTexture( totem.Texture );
      -- Set spell to cast
      COE_Totem:SetSpellOrTrinket(button);
      -- Set show
      HDR:Execute("buttons["..i.."]:Show()");
    else
      -- Set Texture
      icon:SetTexture( nil );
      -- Set spell to cast
      button:SetAttribute("spell",nil);
      -- Set show
      HDR:Execute("buttons["..i.."]:Hide()");
    end
  end
  -- Configure Totemic Call
  button = _G["COE_TB_DropSet5"];
  icon = _G[ button:GetName().."Icon" ];
  local tc = COE["TotemicCall"];
  if(tc)
  then
    button.tc = tc;
    tc.id = 36936;
  
    -- Set Texture
    icon:SetTexture( tc.Texture );
    -- Set spell to cast
    button:SetAttribute("type","spell");
    button:SetAttribute("spell",tc.SpellName);
    button:SetAttribute("ctrl-spell1",ATTRIBUTE_NOOP);
    button:SetAttribute("ctrl-item1",ATTRIBUTE_NOOP);
    -- Set show
    HDR:Execute("buttons[".. 5 .."]:Show()");
  else
    -- Set Texture
    icon:SetTexture( nil );
    -- Set spell to cast
    button:SetAttribute("spell",nil);
    -- Set show
    HDR:Execute("buttons[".. 5 .."]:Hide()");
  end

  TotemFrame_Update();
  COE:Message( COESTR_RESTARTINGSET );
end

function COE_Config:CheckStateInit()
  if(COE_SH_DropSet == nil)
  then
    COE_Config:ConfigureStateSet(COE_Config:GetSaved(COEOPT_ACTIVESET));
  end
end

function COE_Config:ConfigureStateSet2()
  local HDR = COE_SH_DropSet2;
  local button;
  local icon;
  local element;
  local totem;

  -- Create the state header, the Main button, and the element buttons
  if(not COE_SH_DropSet2)
  then
    HDR = CreateFrame("Button","COE_SH_DropSet2",UIParent,"SecureHandlerClickTemplate");
    HDR:RegisterForClicks("LeftButtonDown");
    HDR:SetFrameStrata("DIALOG");
    HDR:SetWidth(1);
    HDR:SetHeight(1);
    HDR:SetMovable(true);
    HDR:ClearAllPoints();
    HDR:SetPoint("CENTER",UIParent,"CENTER",0,0);
    HDR:Hide();

    HDR:Execute([[
      buttons = newtable();
      shown = false;
    ]]);

    HDR:SetAttribute("_onclick",[[
      if(shown == false)
      then
        self:Show();
        for idx,button in ipairs(buttons)
        do
          self:SetBindingClick(true,tostring(idx),button);
        end
        self:SetBindingClick(true,"ESCAPE",self:GetName());
        shown = true;
      else
        for idx,button in ipairs(buttons)
        do
          self:ClearBinding(tostring(idx));
        end
        self:ClearBinding("ESCAPE");
        shown = false;
        self:Hide();
      end
    ]]);

    local key,key2 = GetBindingKey("COEDROPSET2");
    if(key)
    then
      SetOverrideBindingClick(HDR,false,key,HDR:GetName());
    end
    if(key2)
    then
      SetOverrideBindingClick(HDR,false,key2,HDR:GetName());
    end
    --_G["BINDING_NAME_CLICK COE_SH_DropSet2"] = "Open sub-menu";

    COEUI_CurrentScale = COE_Config:GetSaved(COEOPT_SCALING);
    -- 4 Totemic Calls
    for i=1,5
    do
      local button = CreateFrame("CheckButton","COE_TB_DropSet2"..i,HDR,"COETotemDropSetTemplate");
      local icon = _G[ button:GetName().."Icon" ];
      _G[button:GetName().."HotKey2"]:SetText(tostring(i));
      button:SetScale(COEUI_CurrentScale);
      button:SetFrameStrata("DIALOG");
      if(i == 1)
      then
        button:SetPoint("TOPLEFT",HDR,"TOPLEFT",0,0);
      else
        button:SetPoint("TOPLEFT","COE_TB_DropSet2"..i-1,"TOPRIGHT",2,0);
      end
      button.DropTotem = true;

      HDR:SetFrameRef("kid", button);
      HDR:Execute("buttons[" .. i .. "] = self:GetFrameRef('kid');");
      HDR:WrapScript(button,"OnClick",[[
        for idx,button in ipairs(buttons)
        do
          owner:ClearBinding(tostring(idx));
        end
        owner:ClearBinding("ESCAPE");
        shown = false;
        owner:Hide();
      ]]);
      
      local name, rank, texture, cost, isFunnel, powerType, castTime, minRange, maxRange = GetSpellInfo(COE_TotemicCallsSpellIDs[i]);
      if(name)
      then
        -- Set Texture
        icon:SetTexture( texture );
        button.tc = { id = COE_TotemicCallsSpellIDs[i] };
        -- Set spell to cast
        button:SetAttribute("type","spell");
        button:SetAttribute("spell",name);
        button:SetAttribute("ctrl-spell1",ATTRIBUTE_NOOP);
        button:SetAttribute("ctrl-item1",ATTRIBUTE_NOOP);
        -- Set show
        HDR:Execute("buttons["..i.."]:Show()");
      else
        -- Set Texture
        icon:SetTexture( nil );
        -- Set spell to cast
        button:SetAttribute("spell",nil);
        -- Set show
        HDR:Execute("buttons["..i.."]:Hide()");
      end
    end
  end
end

function COE_Config:CheckStateInit2()
  if(COE_SH_DropSet2 == nil)
  then
    COE_Config:ConfigureStateSet2();
  end
end

