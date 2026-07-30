local addon, ns = ...

local f = ns.f
local db = ns.db
local L = ns.L

local scans = 1
local firstScan = true
local firstFrameScan = true

-- /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////// --

function f:GUILDBANK_UPDATE_TABS(event, Addon, ...)
	if db.Settings.AutoScan and scans == GetNumGuildBankTabs() then
		C_Timer.After(1, function()
			f:Scan(1)
		end)
	end
	
	scans = scans + 1
end

function f:GUILDBANKFRAME_OPENED(event, Addon, ...)
	if db.Settings.AutoScan and not firstFrameScan then
		C_Timer.After(1, function()
			f:Scan(1)
		end)
	end
	firstFrameScan = false
	if f.menuButtons and f.menuButtons["ScanBank"] then -- Comprobación añadida
		f.menuButtons["ScanBank"]:Enable()
	end
end

function f:GUILDBANKFRAME_CLOSED(event, Addon, ...)
    if f.menuButtons and f.menuButtons["ScanBank"] then
        f.menuButtons["ScanBank"]:Disable()	
    end
end

function f:Scan(auto, prevAuto)
    if not f.menuButtons then
        f:CreateFrame()
        f:CreateFrame()        
    end

    if f.menuButtons["ScanBank"]:GetButtonState() == "DISABLED" and auto ~=1 and auto ~= 2 then
        f:print(L["The guild bank frame must be open to use this command."])
        return
	elseif db.Settings.AutoScan and (auto == 1 or prevAuto == 1) and db.Transactions[GetRealmName()] and db.Transactions[GetRealmName()][strsub(UnitFactionGroup("player"), 1, 1)] and db.Transactions[GetRealmName()][strsub(UnitFactionGroup("player"), 1, 1)][GetGuildInfo("player")] then
		for k, v in pairs(db.Transactions[GetRealmName()][strsub(UnitFactionGroup("player"), 1, 1)][GetGuildInfo("player")]) do
			local dateSplt, timeSplt = strsplit(" ", k)
			if date("%m/%d/%Y") == dateSplt then
				return
			end
		end
	end
    
    f.menuButtons["ScanBank"]:Disable()	
	if auto ~= 2 then
		f:print(auto == 1 and L["Auto scanning in progress..."] or L["Scanning in progress..."])
	end
    f:ClearExports()

    for i = 1, MAX_GUILDBANK_TABS + 1 do
        QueryGuildBankLog(i)
    end
    
	local realm = GetRealmName()
	local faction = strsub(UnitFactionGroup("player"), 1, 1)
	local guild = GetGuildInfo("player")
	local datetime = date("%m/%d/%Y %H:%M:%S")

    C_Timer.After(1, function()
        local tabs = GetNumGuildBankTabs() + 1
        local num_transactions, item_type, name, amount, itemLink, count, tab1, tab2, year, month, day, hour
        local export_line = ""

        db.Transactions[realm] = db.Transactions[realm] or {}
        db.Transactions[realm][faction] = db.Transactions[realm][faction] or {}
        db.Transactions[realm][faction][guild] = db.Transactions[realm][faction][guild] or {}
        db.Transactions[realm][faction][guild][datetime] = {}
		
        local log_table = db.Transactions[realm][faction][guild][datetime]
        log_table["Transactions"] = {}
        log_table["Money"] = {}
        log_table.MaxTabs = tabs
        log_table.MoneyTotal = 0

        local transactions_table = log_table["Transactions"]
        local money_table = log_table["Money"]

        for tab = 1, tabs do
            num_transactions = tab < tabs and GetNumGuildBankTransactions(tab) or GetNumGuildBankMoneyTransactions()

            transactions_table["Tab" .. tab] = {
                ["Name"] = GetGuildBankTabInfo(tab)            
            }

            local tab_table = transactions_table["Tab" .. tab]

            for i = num_transactions, 1, -1 do
                if tab < tabs then
                    item_type, name, itemLink, count, tab1, tab2, year, month, day, hour = GetGuildBankTransaction(tab, i)

                    local tab1_name = tab1 and GetGuildBankTabInfo(tab1) or ""
                    local tab2_name = tab2 and GetGuildBankTabInfo(tab2) or ""

                    name = name or (UNKNOWN or "Unknown")
                    tab1 = tab1 and {tab1, tab1_name} or 0
                    tab2 = tab2 and {tab2, tab2_name} or 0
					
					local transDate = f:CalculateDate(year, month, day, hour)
					
					local _, _, _, itemLvl, _, itemType = GetItemInfo(itemLink)
					
                    table.insert(tab_table, {item_type, name, itemLink, (itemType == "Armor" or itemType == "Weapon") and itemLvl or "", count, tab1, tab2, year, month, day, hour, transDate})

                    local line = string.format("%s,%s,%s,%s,%s (Tab %d),%s,%s,%s,%s,%d,%s (Tab %d),%s (Tab %d),%d,%d,%d,%d, %s", realm, faction, guild, datetime, tab_table.Name, tab, item_type, name, itemLink, (itemType == "Armor" or itemType == "Weapon") and itemLvl or "", count, tab1_name, tab1 ~= 0 and tab1[1] or 0, tab2_name, tab2 ~= 0 and tab2[1] or 0, year, month, day, hour, transDate)
                    export_line = export_line ~= "" and export_line .. line .. "**#**" or line .. "**#**"
                else
                    item_type, name, amount, year, month, day, hour = GetGuildBankMoneyTransaction(i)

                    name = name or (UNKNOWN or "Unknown")
					
					local transDate = f:CalculateDate(year, month, day, hour)

                    table.insert(money_table, {item_type, name, amount, year, month, day, hour})

                    log_table.MoneyTotal = GetGuildBankMoney()
					
                    local line = string.format("%s,%s,%s,%s,Money Log,%s,%s,%s,%s,%s,%s,%s,%d,%d,%d,%d, %s", realm, faction, guild, datetime, item_type, name, f:getMoneyString(amount), "", "", "", "", year, month, day, hour, transDate)
                    export_line = export_line ~= "" and export_line .. line .. "**#**" or line .. "**#**"
                end
            end
        end

        log_table.ExportLine = export_line
		
		if auto == 1 and db.Settings.ShowOnAuto and not f.frame:IsVisible() then
			f:SelectLogs(realm, faction, guild, datetime)
			f:LoadActiveTransactions()
			f:ShowTab(3, "Transactions")
			
			f:CreateFrame()
		elseif auto ~= 1 and db.Settings.ShowOnScan and not f.frame:IsVisible() then
			f:SelectLogs(realm, faction, guild, datetime)
			f:LoadActiveTransactions()
			f:ShowTab(3, "Transactions")
		
			f:CreateFrame()
		elseif f.frame:IsVisible() then
			f:SelectLogs(realm, faction, guild, datetime)
			f:LoadActiveTransactions()
			f:ShowTab(3, "Transactions")
		end
		
        f.menuButtons["ScanBank"]:Enable()
		scans = 1
    end)
	
	if firstScan and not auto == 2 then
		firstScan = false
		f:Delete()
		f.deleteActive:GetScript("OnClick")
		C_Timer.After(1, function()
			f:Scan(2, auto)	
		end)
	else
		f:print((auto == 1 or prevAuto ==1) and L["Auto scan finished."] or L["Scan finished."])
	end
end
