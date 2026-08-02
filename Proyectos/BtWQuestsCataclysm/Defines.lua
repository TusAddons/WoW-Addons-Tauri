local BtWQuests = BtWQuests;
BtWQuests.Constant.Expansions.Cataclysm = LE_EXPANSION_CATACLYSM or 3;
BtWQuests.Constant.Category.Cataclysm = BtWQuests.Constant.Category.Cataclysm or {};
BtWQuests.Constant.Chain.Cataclysm = BtWQuests.Constant.Chain.Cataclysm or {};
local Category = BtWQuests.Constant.Category.Cataclysm;
local Chain = BtWQuests.Constant.Chain.Cataclysm;

Category.MountHyjal = 401
Category.Vashjir = 402
Category.Deepholm = 403
Category.Uldum = 404
Category.TwilightHighlands = 405

Chain.MountHyjal = {}
Chain.Vashjir = {}
Chain.Deepholm = {}
Chain.Uldum = {}
Chain.TwilightHighlands = {}

BtWQuests.Database:AddExpansion(BtWQuests.Constant.Expansions.Cataclysm, {
    background = {
        texture = "Interface\\EncounterJournal\\UI-EJ-CATACLYSM"
    },
    image = {
        texture = "Interface\\AddOns\\BtWQuestsCataclysm\\UI-Expansion",
        texCoords = {0, 0.90625, 0, 0.8125}
    }
})