-- WorldBossTracker: Core.lua
local ADDON_NAME = ...
WorldBossTracker = WorldBossTracker or {}
WorldBossTrackerDB = WorldBossTrackerDB or {}
WorldBossTrackerCharDB = WorldBossTrackerCharDB or {}

-------------------------------------------------------------
-- Realm-based data separation (per-realm SavedVariables)
-------------------------------------------------------------
local currentRealm = GetRealmName() or "Unknown"
WorldBossTracker.activeRealm = GetRealmName() or "Unknown"

-- Ensure top-level SavedVariables exist
if type(WorldBossTrackerDB) ~= "table" then WorldBossTrackerDB = {} end
if type(WorldBossTrackerDB.realms) ~= "table" then WorldBossTrackerDB.realms = {} end

-- Ensure this realm’s subtable exists (never overwrite existing data)
if type(WorldBossTrackerDB.realms[currentRealm]) ~= "table" then
    WorldBossTrackerDB.realms[currentRealm] = {}
end

-- always resolve the live realm table (lag / odd load order proof)
function WorldBossTracker:RealmDB()
    local realm = WorldBossTracker.activeRealm or GetRealmName() or "Unknown"
    if type(WorldBossTrackerDB.realms) ~= "table" then
        WorldBossTrackerDB.realms = {}
    end
    if type(WorldBossTrackerDB.realms[realm]) ~= "table" then
        WorldBossTrackerDB.realms[realm] = {}
    end
    return WorldBossTrackerDB.realms[realm]
end

-- Returns whichever realm the user is viewing in the dropdown
function WorldBossTracker:ViewedRealmDB()
    local realm = WorldBossTracker.currentRealmView or WorldBossTracker.activeRealm or GetRealmName() or "Unknown"
    if type(WorldBossTrackerDB.realms) ~= "table" then return {} end
    return WorldBossTrackerDB.realms[realm] or {}
end


-------------------------------------------------------------
-- Backward compatibility shim for pre-realm data
-- (copies old flat keys into this realm table; never deletes)
-------------------------------------------------------------
for rareName in pairs(WorldBossTracker.rares or {}) do
    local oldValue = WorldBossTrackerDB[rareName]
    if type(oldValue) == "number" and not WorldBossTracker:RealmDB()[rareName] then
        WorldBossTracker:RealmDB()[rareName] = oldValue
        -- do NOT nil the old key; harmless to leave for old clients
    end
end

-------------------------------------------------------------
-- Event frame
-------------------------------------------------------------
local EF = CreateFrame("Frame")
EF:RegisterEvent("PLAYER_LOGIN")
EF:RegisterEvent("COMBAT_LOG_EVENT_UNFILTERED")
EF:RegisterEvent("LOOT_OPENED")
EF:RegisterEvent("CHAT_MSG_ADDON")
EF:RegisterEvent("PLAYER_REGEN_ENABLED")


-- alerts setting helpers (default: enabled)
function WorldBossTracker.GetAlertsEnabled()
    if WorldBossTrackerDB.alertsEnabled == nil then
        WorldBossTrackerDB.alertsEnabled = true
    end
    return WorldBossTrackerDB.alertsEnabled
end

function WorldBossTracker.SetAlertsEnabled(enabled)
    WorldBossTrackerDB.alertsEnabled = not not enabled
end


-------------------------------------------------------------
-- Per-character daily kill tracking
-------------------------------------------------------------
function WorldBossTracker.GetCharKey()
    local name, realm = UnitFullName("player")
    realm = realm or GetRealmName() or "Unknown"
    return name .. "-" .. realm
end

function WorldBossTracker.GetServerDayKey()
    local now = GetServerTime()
    return math.floor(now / 86400)
end

function WorldBossTracker.MarkCharKillToday(rareName)
    if not rareName then return end
    local realmOffset = (date("!%m") >= "03" and date("!%m") < "11") and 2 or 1
    local nowUTC = time(date("!*t"))
    local realmTime = nowUTC + (realmOffset * 3600)

    local dateTbl = date("!*t", realmTime)
    local resetHour = 6
    if dateTbl.hour < resetHour then
        local yesterday = time(date("*t", realmTime - 86400))
        dateTbl = date("!*t", yesterday)
    end

    local key = string.format("%04d-%02d-%02d", dateTbl.year, dateTbl.month, dateTbl.day)
    local charKey = UnitName("player") .. "-" .. GetRealmName()

    WorldBossTrackerDB.charKills = WorldBossTrackerDB.charKills or {}
    WorldBossTrackerDB.charKills[charKey] = WorldBossTrackerDB.charKills[charKey] or {}
    WorldBossTrackerDB.charKills[charKey][key] = WorldBossTrackerDB.charKills[charKey][key] or {}
    WorldBossTrackerDB.charKills[charKey][key][rareName] = true
end

function WorldBossTracker.CharKilledToday(rareName)
    if not rareName then return false end
    local realmOffset = (date("!%m") >= "03" and date("!%m") < "11") and 2 or 1
    local nowUTC = time(date("!*t"))
    local realmTime = nowUTC + (realmOffset * 3600)

    local dateTbl = date("!*t", realmTime)
    local resetHour = 6
    if dateTbl.hour < resetHour then
        local yesterday = time(date("*t", realmTime - 86400))
        dateTbl = date("!*t", yesterday)
    end

    local key = string.format("%04d-%02d-%02d", dateTbl.year, dateTbl.month, dateTbl.day)
    local charKey = UnitName("player") .. "-" .. GetRealmName()

    local kills = WorldBossTrackerDB.charKills and WorldBossTrackerDB.charKills[charKey] and WorldBossTrackerDB.charKills[charKey][key]
    return kills and kills[rareName] or false
end

-------------------------------------------------------------
-- Locals / State
-------------------------------------------------------------
local WRITE_THROTTLE = 5
local lastWrite = {}
local alerted = {}
local bit = bit
local taggedByMe = {}  -- [destGUID] = { rareName=..., ts=... }

local function IsMine(sourceGUID, sourceFlags)
    return bit.band(sourceFlags or 0, COMBATLOG_OBJECT_AFFILIATION_MINE or 0) ~= 0
        or sourceGUID == UnitGUID("player")
        or sourceGUID == UnitGUID("pet")
end

-------------------------------------------------------------
-- Alerts (5m warning text and sound + 1m local)
-------------------------------------------------------------
local function MaybeAlert(rareName, remaining)

    -- master toggle: bail if alerts are disabled
    if not WorldBossTracker.GetAlertsEnabled() then return end

    if not remaining or remaining <= 0 then
        alerted[rareName] = nil
        return
    end

    local lastAlert = alerted[rareName]

    -- only track within 5 min window
    if remaining > 300 then
        alerted[rareName] = nil
        return
    end

    local minutes = math.floor(remaining / 60)

    local function ColoredName(name)
        return string.format("|cffffd100%s|r", name)
    end

function WorldBossTracker.InitAlertFrame()
    if WorldBossTrackerAlertFrame then return end
    local f = CreateFrame("Frame", "WorldBossTrackerAlertFrame", UIParent)
    f:SetSize(800, 100)
    f:SetPoint("CENTER", UIParent, "CENTER", 0, 150)

    local text = f:CreateFontString(nil, "OVERLAY", "GameFontNormalHuge")
    text:SetAllPoints()
    text:SetJustifyH("CENTER")
    text:SetTextColor(1, 0.5, 0, 1)
    text:SetFont("Fonts\\FRIZQT__.TTF", 26, "OUTLINE")
    f.text = text

    f.fade = f:CreateAnimationGroup()
    local fade = f.fade:CreateAnimation("Alpha")
    fade:SetFromAlpha(1)
    fade:SetToAlpha(0)
    fade:SetDuration(2.5)
    fade:SetStartDelay(4)
    fade:SetSmoothing("OUT")
    f.fade:SetScript("OnFinished", function() f:Hide() end)
    f:Hide()
    WorldBossTrackerAlertFrame = f
end

    local function ShowCenterMessage(msg)
        if InCombatLockdown() then return end
        if not WorldBossTrackerAlertFrame then
            WorldBossTracker.InitAlertFrame()
        end
        if not WorldBossTrackerAlertFrame then return end
        local f = WorldBossTrackerAlertFrame
        f.text:SetText(msg)
        f:SetAlpha(1)
        f:Show()
        f.fade:Stop()
        f.fade:Play()
    end

    -------------------------------------------------
    -- helper: Are we in combat with a known rare?
    -------------------------------------------------
    local function IsFightingRare()
        if not UnitAffectingCombat("player") then return false end
        local rares = WorldBossTracker.rares
        if not rares then return false end

        local function checkUnit(u)
            local n = UnitName(u)
            return n and rares[n]
        end

        if checkUnit("target") or checkUnit("focus") then return true end
        for i = 1, 4 do
            if checkUnit("boss" .. i) then return true end
        end
        return false
    end

    -------------------------------------------------
    -- 5-minute warning: only fire once, only if not in rare combat
    -------------------------------------------------
    if not lastAlert and remaining <= 300 and remaining > 240 then
        alerted[rareName] = 5

        local msg = string.format("%s respawns in ~5 minutes!", ColoredName(rareName))
        ShowCenterMessage(msg)
        print("|cffffd200[WorldBossTracker]|r " .. msg)

        if not IsFightingRare() then
            PlaySoundFile("Sound\\interface\\alarmclockwarning2.ogg", "Master")
        end

    -------------------------------------------------
    -- 1-minute warning: once only, no sound
    -------------------------------------------------
    elseif lastAlert ~= 1 and remaining <= 60 and remaining > 0 then
        alerted[rareName] = 1
        local msg = string.format("%s respawns in ~1 minute!", ColoredName(rareName))
        print("|cffffd200[WorldBossTracker]|r " .. msg)
    end
end

WorldBossTracker._MaybeAlert = MaybeAlert

-------------------------------------------------------------
-- Background Alert Runner (UI-independent)
-------------------------------------------------------------
local bgAlertFrame = CreateFrame("Frame")
local elapsed = 0
bgAlertFrame:SetScript("OnUpdate", function(_, delta)
    elapsed = elapsed + delta
    if elapsed < 60 then return end
    elapsed = 0
    -- Master toggle: don't scan if alerts are disabled
    if not WorldBossTracker.GetAlertsEnabled() then return end

    if not WorldBossTracker.rares then return end
    local now = GetServerTime()

    for rareName, data in pairs(WorldBossTracker.rares) do
        local lastKill = WorldBossTracker:RealmDB()[rareName]
        if lastKill and type(lastKill) == "number" then
            local remaining = (lastKill + (data.respawn or 3600)) - now
            if remaining > 0 and remaining <= 300 then
                if WorldBossTracker._MaybeAlert then
                    WorldBossTracker._MaybeAlert(rareName, remaining)
                end
            end
        end
    end
end)

-------------------------------------------------------------
-- Debug & Utility
-------------------------------------------------------------
function WorldBossTracker:DebugPrint(...)
    if WorldBossTrackerDB.debug then print("|cFF00FFFF[WorldBossTracker DEBUG]|r", ...) end
end

function WorldBossTracker:GetServerNow() return GetServerTime() end

local function safeTimeAgo(sec)
    if not sec or type(sec) ~= "number" then return "?" end
    local diff = WorldBossTracker:GetServerNow() - sec
    if diff < 60 then return string.format("%ds ago", diff)
    elseif diff < 3600 then return string.format("%dm ago", math.floor(diff/60))
    else return string.format("%dh %dm ago", math.floor(diff/3600), math.floor((diff%3600)/60)) end
end

local function formatCountdown(sec)
    if not sec or sec <= 0 then return "0s" end
    local h = math.floor(sec/3600)
    local m = math.floor((sec%3600)/60)
    local s = sec % 60
    if h > 0 then return string.format("%dh %dm %ds", h, m, s)
    elseif m > 0 then return string.format("%dm %ds", m, s)
    else return string.format("%ds", s) end
end

local function safeFormatTime(t)
    if not t or type(t) ~= "number" or t <= 0 then return "?" end
    local utc = date("!*t", t)
    local function lastSunday(year, month)
        local d = time({year = year, month = month + 1, day = 0, hour = 12})
        local wd = tonumber(date("!%w", d))
        return d - (wd * 86400)
    end

    local year = utc.year
    local dstStart = lastSunday(year, 3) + 2 * 3600
    local dstEnd   = lastSunday(year, 10) + 3 * 3600
    local isDST = (t >= dstStart and t < dstEnd)
    local offset = isDST and 2 * 3600 or 1 * 3600
    local cetTime = t + offset
    local ct = date("!*t", cetTime)
    local hour = ct.hour
    local ampm = "AM"
    if hour >= 12 then ampm = "PM"; if hour > 12 then hour = hour - 12 end
    elseif hour == 0 then hour = 12 end
    return string.format("%d:%02d%s", hour, ct.min, ampm)
end

local function announce(msg, where)
    where = (where or ""):lower()
    if where == "say" then SendChatMessage(msg, "SAY")
    elseif where == "yell" then SendChatMessage(msg, "YELL")
    elseif where == "guild" then SendChatMessage(msg, "GUILD")
    elseif where == "party" then SendChatMessage(msg, "PARTY")
    elseif where == "raid" then SendChatMessage(msg, "RAID")
    else print("|cffffd200[WorldBossTracker]|r " .. msg) end
end

function WorldBossTracker:RunSlash(text)
    local editBox = ChatEdit_ChooseBoxForSend(DEFAULT_CHAT_FRAME)
    if not editBox then return end
    ChatEdit_ActivateChat(editBox)
    editBox:SetText(text)
    ChatEdit_OnEnterPressed(editBox)
end

WorldBossTracker.safeTimeAgo = safeTimeAgo
WorldBossTracker.formatCountdown = formatCountdown
WorldBossTracker.safeFormatTime = safeFormatTime
WorldBossTracker.announce = announce

-------------------------------------------------------------
-- UI updater ticker
-------------------------------------------------------------
local uiTicker = 0
local updater = CreateFrame("Frame")
updater:SetScript("OnUpdate", function(_, elapsed)
    uiTicker = uiTicker + elapsed
    if uiTicker >= (WorldBossTracker.UI_UPDATE_INTERVAL or 1) then
        uiTicker = 0
        if WorldBossTracker.mainFrame and WorldBossTracker.mainFrame:IsShown() and WorldBossTracker.UpdateUI then
            if not InCombatLockdown() then
                WorldBossTracker.UpdateUI()
            end
        end
    end
end)

-------------------------------------------------------------
-- Slash Command /tan
-------------------------------------------------------------
SLASH_TAN1 = "/tan"
SlashCmdList["TAN"] = function(msg)
    local cmd, arg = msg:match("^(%S*)%s*(.-)$")
    cmd = (cmd or ""):lower()

    -------------------------------------------------
    -- HELP COMMAND
    -------------------------------------------------
    if cmd == "help" or cmd == "?" then
        print("|cff66c0f4WorldBossTracker|r |cffffff00Available Commands:|r")
        print("  |cff66c0f4/tan|r - Toggle the UI")
        print("  |cff66c0f4/tan <rare name>|r - Print spawn for a specific rare")
        print("  |cff66c0f4/tan <channel>|r - Announce all timers to: say, yell, guild, party, raid")
        print("  |cff66c0f4/tan ver or version|r - Show the addon version")
        print("  |cff66c0f4/tsync|r - Manual on-demand sync (guild/party/whisper)")
        print(" ")
        print("|cffaaaaaaTip:|r Type |cffffff00/tan reset confirm|r to safely clear all data.")
        return
    end

    -------------------------------------------------
    -- VERSION COMMAND
    -------------------------------------------------
    if cmd == "ver" or cmd == "version" then
        local ver = GetAddOnMetadata("WorldBossTracker", "Version") or "unknown"
        print(string.format("|cff66ff66[WorldBossTracker]|r version: |cffffff00%s|r", ver))
        return
    end

    -------------------------------------------------
    -- RESET COMMAND (with confirmation)
    -------------------------------------------------
    if cmd == "reset" then
        if arg ~= "confirm" then
            print("|cffffd200Tanaan Tracker|r: This will |cffff0000DELETE ALL TIMER DATA|r across all realms!")
            print("Type |cff66c0f4/tan reset confirm|r to proceed.")
            return
        end

        local keepAuto = WorldBossTrackerDB and WorldBossTrackerDB.autoAnnounce or false
        WorldBossTrackerDB = {
            realms = {},
            autoAnnounce = keepAuto,
            debug = false,
        }

        print("|cffffd200Tanaan Tracker|r: All timer data has been fully reset.")
        if keepAuto then
            print("|cffaaaaaa(auto-announce setting preserved)|r")
        end

        if WorldBossTracker.mainFrame then
            WorldBossTracker.mainFrame:Hide()
            C_Timer.After(0.1, function()
                WorldBossTracker.mainFrame:Show()
                if WorldBossTracker.UpdateUI then
                    WorldBossTracker.UpdateUI()
                end
            end)
        elseif WorldBossTracker.UpdateUI then
            WorldBossTracker.UpdateUI()
        end
        return
    end

    -------------------------------------------------
    -- RARE LOOKUP
    -------------------------------------------------
    local rares = WorldBossTracker.rares
    local raresOrder = WorldBossTracker.raresOrder
    local rareName
    for name, data in pairs(rares) do
        if cmd == name:lower() then rareName = name; break end
        if data.aliases then
            for _, alias in ipairs(data.aliases) do
                if cmd == alias:lower() then rareName = name; break end
            end
        end
        if rareName then break end
    end

    if rareName then
        local t = WorldBossTracker:RealmDB()[rareName]
        if t and type(t) == "number" then
            local remaining = (t + rares[rareName].respawn) - WorldBossTracker:GetServerNow()
            if remaining < 0 then remaining = 0 end
            local msgOut = string.format("%s: in ~%s (killed %s)",
                rareName, WorldBossTracker.formatCountdown(remaining), WorldBossTracker.safeFormatTime(t))
            if arg ~= "" then WorldBossTracker.announce(msgOut, arg) else print(msgOut) end
        else
            print(rareName .. ": no data yet")
        end
        return
    end

    -------------------------------------------------
    -- CHANNEL ANNOUNCEMENTS
    -------------------------------------------------
    local validChannels = { say=true, yell=true, guild=true, party=true, raid=true }
    if cmd ~= "" and validChannels[cmd] then
        for _, name in ipairs(raresOrder) do
            local t = WorldBossTracker:RealmDB()[name]
            if t and type(t) == "number" then
                local remaining = (t + rares[name].respawn) - WorldBossTracker:GetServerNow()
                if remaining < 0 then remaining = 0 end
                local msgOut = string.format("%s: next respawn ~%s", name, WorldBossTracker.formatCountdown(remaining))
                WorldBossTracker.announce(msgOut, cmd)
            end
        end
        return
    end

    -------------------------------------------------
    -- DEFAULT: TOGGLE WINDOW (no argument)
    -------------------------------------------------
    if cmd == "" then
        if InCombatLockdown() then
            print("|cffff0000[WorldBossTracker]|r Cannot toggle UI during combat lockdown.")
            return
        end
        if WorldBossTracker.ToggleMainFrame then
            WorldBossTracker.ToggleMainFrame()
        elseif not WorldBossTracker.mainFrame and WorldBossTracker.CreateMainFrame then
            WorldBossTracker.CreateMainFrame()
        end
        return
    end

    -------------------------------------------------
    -- UNKNOWN COMMAND HANDLER
    -------------------------------------------------
    print("|cffff0000Unknown command:|r " .. cmd)
    print("Type |cff66c0f4/tan help|r for a list of available commands.")
end



-------------------------------------------------------------
-- Combat Log + Loot tracking
-------------------------------------------------------------
local function handleCombatLog(...)
    -- timestamp, subevent, hideCaster,
    -- sourceGUID, sourceName, sourceFlags, sourceRaidFlags,
    -- destGUID, destName, destFlags, destRaidFlags, ...
    local _, subevent, _, sourceGUID, _, sourceFlags, _, destGUID, _, _, _ = ...

    if not subevent or not destGUID then return end

    local rares = WorldBossTracker.rares
    if not rares then return end

    -- get rareName by NPC id
    local function RareNameFromGUID(guid)
        -- extract NPC ID from creature GUID
        local npcId = tonumber(guid:match("-(%d+)-%x+$"))
        if not npcId then return nil end
        for rName, data in pairs(rares) do
            if data and data.id == npcId then
                return rName, data
            end
        end
        return nil
    end

    -- record that *you* tagged this mob (any damage event from you/your pet)
    if subevent == "SWING_DAMAGE"
        or subevent == "RANGE_DAMAGE"
        or subevent == "SPELL_DAMAGE"
        or subevent == "SPELL_PERIODIC_DAMAGE"
    then
        if sourceGUID and IsMine(sourceGUID, sourceFlags) then
            local rareName = RareNameFromGUID(destGUID)
            if rareName then
                taggedByMe[destGUID] = { rareName = rareName, ts = WorldBossTracker:GetServerNow() }
            end
        end
        return
    end

    -- on death, update timer; announce/mark only if tagged
    if subevent == "UNIT_DIED" or subevent == "PARTY_KILL" then
        local rareName, data = RareNameFromGUID(destGUID)
        if not rareName then return end

        local now = WorldBossTracker:GetServerNow()
        local last = (lastWrite and lastWrite[rareName]) or 0
        if (now - last) < WRITE_THROTTLE then return end

        -- always save the kill time
        WorldBossTracker:RealmDB()[rareName] = now
        lastWrite[rareName] = now

        -- decide if this was a confirmed kill (tagged recently)
        local tagged = taggedByMe[destGUID]
        if tagged and tagged.rareName == rareName and (now - tagged.ts) <= 600 then
            -- 10m window: safe cushion for long fights (if solo on wod)
            if WorldBossTracker.MarkCharKillToday then
                WorldBossTracker.MarkCharKillToday(rareName)
            end

            if WorldBossTrackerDB.autoAnnounce and IsInGuild() then
                local mins = (data.respawn or 3600) / 60
                SendChatMessage(string.format("%s down — respawn ~%dm", rareName, mins), "GUILD")
            end
        end

        -- UI + sync, regardless of who tagged (so timers stay correct)
        print(string.format("|cffff0000%s killed!|r Respawn timer started (%d min).", rareName, (data.respawn or 3600)/60))
        WorldBossTracker:DebugPrint("Saved time for", rareName, now)
        if WorldBossTracker.SendGuildSync then
            WorldBossTracker.SendGuildSync(rareName, now)
        end
        if WorldBossTracker.UpdateUI then
            WorldBossTracker.UpdateUI()
        end

        -- cleanup tag cache for this corpse
        taggedByMe[destGUID] = nil
    end
end


local function handleLootOpened()
    local target = UnitName("target")
    if not target or type(target) ~= "string" then return end
    local rares = WorldBossTracker.rares
    for rareName, data in pairs(rares) do
        if target:find(rareName, 1, true) then
            local now = WorldBossTracker:GetServerNow()
            local last = lastWrite[rareName] or 0
            if (now - last) < WRITE_THROTTLE then return end
            -- save kill time to DB
            WorldBossTracker:RealmDB()[rareName] = now
            lastWrite[rareName] = now
            -- mark character kill
            if WorldBossTracker.MarkCharKillToday then
                WorldBossTracker.MarkCharKillToday(rareName)
            end
            -- local message
            print(string.format("|cff00ff00Looted %s!|r Respawn timer started (%d min).", rareName, data.respawn / 60))
            -- sync and update UI
            if WorldBossTracker.SendGuildSync then
                WorldBossTracker.SendGuildSync(rareName, now)
            end
            if WorldBossTracker.UpdateUI then
                WorldBossTracker.UpdateUI()
            end

            WorldBossTracker:DebugPrint("Saved time via loot for", rareName, now)
            return
        end
    end
end


EF:SetScript("OnEvent", function(_, event, ...)
    if event == "PLAYER_LOGIN" then
        WorldBossTrackerDB.debug = WorldBossTrackerDB.debug or false
        WorldBossTracker:DebugPrint("Loaded for realm:", currentRealm)
        if WorldBossTracker.InitAlertFrame then WorldBossTracker.InitAlertFrame() end
        if WorldBossTracker.CreateMinimapButton then WorldBossTracker.CreateMinimapButton() end
        if WorldBossTracker.CreateMainFrame then WorldBossTracker.CreateMainFrame() end
        -- load alert toggle
        if WorldBossTrackerDB.alertsEnabled == nil then
            WorldBossTrackerDB.alertsEnabled = true
        end
    elseif event == "PLAYER_REGEN_ENABLED" then
        if WorldBossTracker._pendingUpdateUI and WorldBossTracker.UpdateUI then
            WorldBossTracker._pendingUpdateUI = nil
            WorldBossTracker.UpdateUI()
        end
    elseif event == "CHAT_MSG_ADDON" then
        if WorldBossTracker.OnAddonMessage then WorldBossTracker.OnAddonMessage(...) end
    elseif event == "COMBAT_LOG_EVENT_UNFILTERED" then
        handleCombatLog(...)
    elseif event == "LOOT_OPENED" then
        handleLootOpened()
    end
end)

