-- WorldBossTracker: Sync_Manual.lua
-- Adds manual on-demand sync between players or groups (/tsync)
-- Whisper sync is bidirectional (both sides exchange data)

WorldBossTracker = WorldBossTracker or {}

-------------------------------------------------
-- CONFIG
-------------------------------------------------
local SYNC_PREFIX = "TanaanTracker"
local SYNC_REPLY_INTERVAL = 0.20
local SYNC_THROTTLE = 3
local lastManualSent = {}

-------------------------------------------------
-- Utility: Safe Send (handles whisper targets properly)
-------------------------------------------------
local function SafeSend(targetType, target)
    if not SendAddonMessage then
        print("|cffff0000[WorldBossTracker]|r Addon messages unavailable.")
        return false
    end

    local myName = UnitName("player") or "Unknown"
    local payload = "REQ|" .. myName

    if targetType == "WHISPER" then
        if not target or target == "" then
            print("|cffff0000[WorldBossTracker]|r Whisper target missing or invalid.")
            return false
        end
        SendAddonMessage(SYNC_PREFIX, payload, "WHISPER", target)
    else
        SendAddonMessage(SYNC_PREFIX, payload, targetType)
    end

    return true
end

-------------------------------------------------
-- Manual Sync Command
-------------------------------------------------
SLASH_TSYNC1 = "/tsync"
SlashCmdList["TSYNC"] = function(msg)
    local cmd, arg = msg:match("^(%S*)%s*(.-)$")
    cmd = cmd:lower()

    if cmd == "" then
        print("|cff66c0f4WorldBossTracker Sync|r usage:")
        print("  /tsync party       - request sync from all party members")
        print("  /tsync raid        - request sync from all raid members")
        print("  /tsync <player>    - request sync from a specific player (bidirectional)")
        return
    end

    -- Setup sync tracking
    WorldBossTracker._manualSyncStartTime = GetTime()
    WorldBossTracker._manualSyncGotUpdate = false
    WorldBossTracker._manualSyncUpdatesCount = 0

    local function FinishCheck()
        if not WorldBossTracker._manualSyncGotUpdate then
            print("|cff66ff66[WorldBossTracker]|r No data to sync — database is already up to date!")
        else
            print(string.format("|cff66ff66[WorldBossTracker]|r %d timer%s updated via manual sync.",
                WorldBossTracker._manualSyncUpdatesCount,
                WorldBossTracker._manualSyncUpdatesCount == 1 and "" or "s"))
            if WorldBossTracker.UpdateUI then
                WorldBossTracker.UpdateUI()
            end
            if WorldBossTracker.mainFrame then
                WorldBossTracker.mainFrame:Show()
            end
        end
        WorldBossTracker._manualSyncStartTime = nil
        WorldBossTracker._manualSyncGotUpdate = nil
        WorldBossTracker._manualSyncUpdatesCount = nil
    end

    C_Timer.After(6, FinishCheck)

    if cmd == "party" then
        if IsInGroup() then
            print("|cff66ff66[WorldBossTracker]|r Requesting sync from party...")
            SafeSend("PARTY")
        else
            print("|cffff0000Not in a party.|r")
        end
        return
    elseif cmd == "raid" then
        if IsInRaid() then
            print("|cff66ff66[WorldBossTracker]|r Requesting sync from raid...")
            SafeSend("RAID")
        else
            print("|cffff0000Not in a raid.|r")
        end
        return
    else
        local playerName = cmd
        print("|cff66ff66[WorldBossTracker]|r Requesting sync from |cffffff00" .. playerName .. "|r ...")
        SafeSend("WHISPER", playerName)
    end
end

-------------------------------------------------
-- Respond to Manual Sync Requests
-------------------------------------------------
function WorldBossTracker.HandleManualSyncRequest(prefix, message, channel, sender)
    if prefix ~= SYNC_PREFIX or not message or not channel or sender == UnitName("player") then return end
    if not sender or sender == "" then return end

    -- Prevent duplicate REQ triggers from the same sender
    WorldBossTracker._recentReqs = WorldBossTracker._recentReqs or {}
    local now = GetTime()
    local lastReq = WorldBossTracker._recentReqs[sender] or 0
    if (now - lastReq) < 1 then return end
    WorldBossTracker._recentReqs[sender] = now

    local msgType, reqSender = strsplit("|", message)
    if msgType ~= "REQ" then return end

    -- Only reply to valid channels
    if channel ~= "PARTY" and channel ~= "RAID" and channel ~= "WHISPER" then return end

    local myName = UnitName("player") or "Unknown"
    local total = 0

    print(string.format("|cff66ff66[WorldBossTracker]|r Manual sync request from |cffffff00%s|r — sending timers...", reqSender or sender))

    -- Send all known realm data
    if WorldBossTrackerDB and WorldBossTrackerDB.realms then
        for realmName, db in pairs(WorldBossTrackerDB.realms) do
            if type(db) == "table" then
                for rareName, t in pairs(db) do
                    if type(t) == "number" then
                        total = total + 1
                        local msg = string.format("SYNC|%s|%d|%s|%s|%s", rareName, t, myName, realmName, reqSender or sender)
                        C_Timer.After(SYNC_REPLY_INTERVAL * total, function()
                            if channel == "WHISPER" then
                                SendAddonMessage(SYNC_PREFIX, msg, "WHISPER", sender)
                            else
                                SendAddonMessage(SYNC_PREFIX, msg, channel)
                            end
                        end)
                    end
                end
            end
        end
    end

    if total > 0 then
        print(string.format("|cff66ff66[WorldBossTracker]|r Sent %d timer(s) to %s.", total, reqSender or sender))
    else
        print(string.format("|cff66ff66[WorldBossTracker]|r No data available to send to %s (DB empty or up to date).", reqSender or sender))
    end

    -------------------------------------------------
    -- Safe bidirectional whisper sync (no ping-pong)
    -------------------------------------------------
    if strupper(channel) == "WHISPER" then
        local targetPlayer = sender
        if targetPlayer and targetPlayer ~= "" and targetPlayer ~= UnitName("player") then
            WorldBossTracker._lastWhisperSync = WorldBossTracker._lastWhisperSync or {}
            local last = WorldBossTracker._lastWhisperSync[targetPlayer] or 0
            if (now - last) < 8 then return end
            WorldBossTracker._lastWhisperSync[targetPlayer] = now

            C_Timer.After(2.0, function()
                if targetPlayer and targetPlayer ~= "" and targetPlayer ~= UnitName("player") then
                    SendAddonMessage(SYNC_PREFIX, "REQ|" .. (UnitName("player") or "Unknown"), "WHISPER", targetPlayer)
                end
            end)
        end
    end
end

-------------------------------------------------
-- Hook into main addon handler
-------------------------------------------------
hooksecurefunc(WorldBossTracker, "OnAddonMessage", function(prefix, message, channel, sender)
    WorldBossTracker.HandleManualSyncRequest(prefix, message, channel, sender)

    if prefix == SYNC_PREFIX and message:find("^SYNC|") and sender ~= UnitName("player") then
        local _, rareName, ts, origin, realmName, targetName = strsplit("|", message)
        if targetName and targetName ~= "" and targetName ~= UnitName("player") then
            return -- message meant for someone else
        end
        local tnum = tonumber(ts)
        local rares = WorldBossTracker.rares
        local targetRealm = realmName or GetRealmName() or "Unknown"

        if rareName and tnum and rares and rares[rareName] then
            WorldBossTrackerDB.realms = WorldBossTrackerDB.realms or {}
            WorldBossTrackerDB.realms[targetRealm] = WorldBossTrackerDB.realms[targetRealm] or {}
            local db = WorldBossTrackerDB.realms[targetRealm]
            local myTs = db[rareName]

            if not myTs or tnum > myTs then
                db[rareName] = tnum
                if WorldBossTracker._manualSyncStartTime then
                    WorldBossTracker._manualSyncGotUpdate = true
                    WorldBossTracker._manualSyncUpdatesCount = (WorldBossTracker._manualSyncUpdatesCount or 0) + 1
                end
                if WorldBossTracker.currentRealmView == targetRealm and WorldBossTracker.UpdateUI then
                    WorldBossTracker.UpdateUI()
                end
            end
        end
    end
end)
