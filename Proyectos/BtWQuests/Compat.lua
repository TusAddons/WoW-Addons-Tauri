local BtWQuests = _G.BtWQuests

-----------------------------------------------------------
-- 1. CONSTANT AUTOVIVIFICATION
-----------------------------------------------------------
local function AutoTable()
    return setmetatable({}, {
        __index = function(t, k)
            local newT = AutoTable()
            t[k] = newT
            return newT
        end
    })
end

BtWQuests.Constant = AutoTable()

BtWQuests.Constant.Expansions.Classic = 1
BtWQuests.Constant.Expansions.BurningCrusade = 2
BtWQuests.Constant.Expansions.WrathOfTheLichKing = 3
BtWQuests.Constant.Expansions.Cataclysm = 4
BtWQuests.Constant.Expansions.MistsOfPandaria = 5
BtWQuests.Constant.Expansions.WarlordsOfDraenor = 6
BtWQuests.Constant.Expansions.Legion = 7
BtWQuests.Constant.Expansions.BfA = 8

-----------------------------------------------------------
-- 2. DATABASE POLYFILL (BfA API -> Legion Core Variables)
-----------------------------------------------------------
BtWQuests.Database = {}
_G.BtWQuestsDatabase = BtWQuests.Database

function BtWQuests.Database:AddQuestsTable(t)
    BtWQuests_Quests = BtWQuests_Quests or {}
    for k, v in pairs(t) do BtWQuests_Quests[k] = v end
end
function BtWQuests.Database:UpdateQuestsTable(t)
    self:AddQuestsTable(t)
end

function BtWQuests.Database:AddChain(id, data)
    BtWQuests_Chains = BtWQuests_Chains or {}
    BtWQuests_Chains[id] = data
end

function BtWQuests.Database:AddCategory(id, data)
    BtWQuests_Categories = BtWQuests_Categories or {}
    BtWQuests_Categories[id] = data
end

function BtWQuests.Database:AddExpansion(id, data)
    -- In v1.1, expansion visuals are hardcoded in BTWQUESTS_EXPANSION_DATA (BtWQuests.lua).
    -- Do not insert 'data' into BtWQuests_Expansions[id] because it expects category/chain items, not visual settings!
end

function BtWQuests.Database:AddExpansionItem(expansionId, data)
    BtWQuests_Expansions = BtWQuests_Expansions or {}
    BtWQuests_Expansions[expansionId] = BtWQuests_Expansions[expansionId] or {}
    table.insert(BtWQuests_Expansions[expansionId], data)
end

function BtWQuests.Database:AddExpansionItems(expansionId, items)
    BtWQuests_Expansions = BtWQuests_Expansions or {}
    BtWQuests_Expansions[expansionId] = BtWQuests_Expansions[expansionId] or {}
    for _, item in ipairs(items) do
        table.insert(BtWQuests_Expansions[expansionId], item)
    end
end

function BtWQuests.Database:AddMap(id, data)
    BtWQuests_MapIDToItem = BtWQuests_MapIDToItem or {}
    BtWQuests_MapIDToItem[id] = data
end

function BtWQuests.Database:AddMapRecursive(id, data)
    self:AddMap(id, data)
end

function BtWQuests.Database:AddNPCsTable(t)
    BtWQuests_NPCs = BtWQuests_NPCs or {}
    for k, v in pairs(t) do BtWQuests_NPCs[k] = v end
end
function BtWQuests.Database:UpdateNPCsTable(t)
    self:AddNPCsTable(t)
end

function BtWQuests.Database:AddObjectsTable(t)
    BtWQuests_Objects = BtWQuests_Objects or {}
    for k, v in pairs(t) do BtWQuests_Objects[k] = v end
end
function BtWQuests.Database:UpdateObjectsTable(t)
    self:AddObjectsTable(t)
end

function BtWQuests.Database:AddContinentItems(...) end
function BtWQuests.Database:AddSearchBuckets(...) end

-----------------------------------------------------------
-- 3. API COMPATIBILITY
-----------------------------------------------------------
function BtWQuests.GetMapName(id)
    if GetMapNameByID then return GetMapNameByID(id) end
    return "Unknown Map"
end

-----------------------------------------------------------
-- 4. DEBUG COMMAND
-----------------------------------------------------------
SLASH_BTWQUESTSDEBUG1 = "/btwd"
SlashCmdList["BTWQUESTSDEBUG"] = function(msg)
    print("|cff00ff00[BtWQuests Debug]|r")
    print("Current Expansion ID:", BtWQuests_GetCurrentExpansion and BtWQuests_GetCurrentExpansion() or "nil")
    if type(BtWQuests_Expansions) == "table" then
        for expId, data in pairs(BtWQuests_Expansions) do
            print("  Expansion:", expId, "Items:", #data)
        end
    else
        print("  BtWQuests_Expansions is:", type(BtWQuests_Expansions), tostring(BtWQuests_Expansions))
    end
    
    local catCount, chainCount = 0, 0
    if type(BtWQuests_Categories) == "table" then for _ in pairs(BtWQuests_Categories) do catCount = catCount + 1 end end
    if type(BtWQuests_Chains) == "table" then for _ in pairs(BtWQuests_Chains) do chainCount = chainCount + 1 end end
    print("  Categories loaded:", catCount, "| Chains loaded:", chainCount)
end
print("|cff888888[BtWQuests] Compat layer loaded. Type /btwd for debug info.|r")
