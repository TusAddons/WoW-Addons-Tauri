
--[[ ----------------------------------------------------------------

			繁 體 中 文

-------------------------------------------------------------------]]

if( GetLocale() == "zhTW" ) then

-- Errors
-- -------
COESTR_NOTASHAMAN = "你不是一個薩滿。無法載入COE";
COESTR_NOTOTEM = "無可用圖騰";
COESTR_UI_NOTASSIGNED = "<無賦值文本>";
COESTR_INVALIDELEMENT = "圖騰中的不完整元素: ";


-- Notifications
-- --------------
COESTR_TOTEMWARNING = "%s將在%d秒後到期";
COESTR_TOTEMEXPIRED = "%s到期了";
COESTR_TOTEMDESTROYED = "%s被摧毀了";
COESTR_SWITCHTOSET = "%s圖騰組合被啟動";
COESTR_FIXEDSETS = "你的圖騰陣施放順序已固定";
COESTR_UDATEDSAVED = "存檔變數已更新版本 ";
COESTR_FIXEDDISPLAY = "存檔變數中的錯誤已被修正。";
COESTR_TOTEMSRELOADED = "圖騰已被重置";
COESTR_RESTARTINGSET = "動態圖騰組合重置";
COESTR_RESET = "計時器已被重置";
COESTR_HEALCOOLDOWN = " 還沒有準備好！";
COESTR_NOHEALING = "不需要治療";
COESTR_HEALING = "治療%s，法術為%s(等級%d)";
COESTR_HEALLOWERRANK = "魔法不足。使用等級%d代替";
COESTR_HEALOOM = "魔法不足！";


-- String patterns
-- ----------------
COESTR_SCANTOTEMS = "圖騰";
COESTR_TOTEMTOOLS = "工具:(.*)圖騰";
COESTR_TOTEMMANA = "(%d*)法力值";
COESTR_TOTEMRANK = "等級 (%d)";
COESTR_MINUTEDURATION = "(%d%.%d%d)分鐘";
COESTR_MINUTEDURATION_INT = "(%d)分鐘";
COESTR_SECDURATION = "(%d%d?)秒";
COESTR_CASTBYNAME = "%(等級 (%d)%)";
COESTR_TOTEMDAMAGE = { ".+擊中(.+圖騰) ?%u*造成(%d+)點", ".+對(.+圖騰) ?%u*造成(%d+)的致命一擊傷害", ".+擊中(.+ 圖騰)造成(%d+)點", ".+對(.+圖騰)造成(%d+)的致命一擊傷害" };
COESTR_TOTEMHEALTH = { "生命值為(%d*)的", "生命值為(%d*)點的" };
COESTR_SHOCKSPELL = {"(%a*震擊)", "地震術" };
COESTR_HEALINGWAVE = "治療波";
COESTR_LESSERWAVE = "次級治療波";
COESTR_MINAMOUNT = "(%d*)到";
COESTR_MAXAMOUNT = "到(%d*)";
COESTR_TRINKET = "^.*%[被迷惑的水之魂%].*$"; 
COESTR_TOTEMICCALL = "圖騰的呼喚";
COESTR_RANKGSUB = "( [IVX]+)$";


-- Totem Advisor
-- --------------
COESTR_POISON = "中毒";
COESTR_DISEASE = "疾病";
COESTR_TOTEMPOISON = "清毒圖騰";
COESTR_TOTEMDISEASE = "祛病圖騰";
COESTR_TOTEMTREMOR = "戰慄圖騰";
COESTR_CLEANSINGTOTEM = "立即施放%s！";

COESTR_TREMOR = {
	"睡眠", "恐嚇", "心靈尖嘯", "精神控制", "低沉咆哮", "恐懼",
	"破膽怒吼", "恐慌", "恐嚇尖嘯", "誘惑",
	"恐懼嚎叫", "破膽怒吼", "水晶沉睡","德魯伊的睡眠"
}


-- Tools
-- ---------
COESTR_TOTEMTOOLS_EARTH = "大地";
COESTR_TOTEMTOOLS_FIRE = "火焰";
COESTR_TOTEMTOOLS_WATER = "水之";
COESTR_TOTEMTOOLS_AIR = "風之";


-- Elements
-- ---------
COESTR_ELEMENT_EARTH = "大地";
COESTR_ELEMENT_FIRE = "火焰";
COESTR_ELEMENT_WATER = "水";
COESTR_ELEMENT_AIR = "空氣";


-- UI elements
-- ------------
COEUI_STRINGS = {
COE_ConfigClose = "關閉";
COE_ConfigTotemTabPanel = "圖騰設定";
COE_ConfigHealingTabPanel = "治療設定";
COE_ConfigDebuffTabPanel = "Debuff設定";
COE_ConfigTotemTotemBar = "圖騰欄";
COE_ConfigTotemTotemOptions = "設定";
COE_ConfigTotemTotemSets = "圖騰組合";
COE_OptionEnableTotemBar = "開啟圖騰欄";
COE_OptionHideBackdrop = "不活動時隱藏背景";
COE_OptionEnableTimers = "開啟圖騰計時器";
COE_OptionEnableTimerNotifications = "開啟資訊通知";
COE_OptionTTAlignment = "圖騰注釋定位";
COE_OptionDisplayMode = "圖騰欄默認圖騰";
COE_OptionDisplayAlignment = "計時器框體形狀";
COE_OptionAdvisor = "開啟圖騰顧問";
COE_OptionEnableSets = "開啟圖騰組合";
COE_OptionEnableAutoSwitch = "PVP時自動啟動圖騰組合";
COE_OptionActiveSet = "動態圖騰組合";
COE_OptionNewSet = "新組合";
COE_OptionDeleteSet = "刪除組合";
COE_OptionConfigureSet = "配置組合";
COE_OptionStopConfigureSet = "決定";
COE_OptionCastOrderString = "施放順序";
COE_OptionConfigureBar = "配置所需圖騰";
COE_OptionFixBar = "固定圖騰欄";
COE_OptionConfigureOrder = "配置圖騰順序";
COE_OptionScanTotems = "重新掃描圖騰";
COE_OptionCurrentFrame = "選擇要配製的圖騰系";
COE_OptionDirection = "該系圖騰欄彈出方向";
COE_OptionFrameMode = "該系圖騰欄模式";
COE_OptionFlexCount = "該系靜態按鈕數量";
COE_OptionScaling = "放縮比例";
COE_OptionEnableTimerFrame = "使用單獨的計時器框體";
COE_OptionGroupBars = "移動全部圖騰欄";
COE_OptionOverrideRank = "設定1級圖騰組合鍵";
COE_OptionFrameTimersOnly = "只在計時器框體中顯示圖騰計時";
COE_OptionScalingTimers = "計時器縮放比例";
COE_OptionDisableTTCombat = "Disable tooltips in combat";
}


-- Tooltips
-- ---------
COEUI_TOOLTIPS = {
COE_ConfigTotemTab = "顯示圖騰設定";
COE_ConfigHealingTab = "顯示治療設定";
COE_ConfigDebuffTab = "顯示debuff設定";
COE_OptionEnableTotemBar = "開啟並顯示你的圖騰欄";
COE_OptionHideBackdrop = "當滑鼠不在圖騰欄上時隱藏背景";
COE_OptionEnableTimers = "在圖騰按鈕中顯示圖騰殘餘時間";
COE_OptionEnableTimerNotifications = "當圖騰到期或被摧毀時顯示警告";
COE_OptionAdvisor = "當你或你的隊友有一個可被圖騰解除的debuff時提示你";
COE_OptionEnableAutoSwitch = "當目標轉向一個敵方玩家時自動啟動相應職業的圖騰組合";
COE_OptionFixBar = "固定圖騰欄以防止意外移動";
COE_OptionGroupBars = "當你移動一個圖騰欄的時候，其他圖騰欄也一起移動";
COE_OptionDisableTTCombat = "Disable tooltips in combat";
}

COESTR_TRINKET_TOOLTIP = "被迷惑的水之魂"; 
COESTR_TRINKET_TOTEM = "上古法力之泉圖騰";

-- Combo boxes
-- ------------
COEUI_TTALIGN = {
{ "ANCHOR_TOPLEFT"; "左上" };
{ "ANCHOR_LEFT"; "左" };
{ "ANCHOR_BOTTOMLEFT"; "左下" }; 
{ "ANCHOR_TOPRIGHT"; "右上" };
{ "ANCHOR_RIGHT"; "右" };
{ "ANCHOR_BOTTOMRIGHT"; "右下" };
{ "DISABLED"; "不可用" };
}

COEUI_DISPLAYMODE = { "自定義", "最新施放的", "動態圖騰組合" }
 
COEUI_DISPLAYALIGN = { "方形", "垂直", "水平" }

COEUI_PVPSETS = { "[PVP] 德魯伊", "[PVP] 獵人", "[PVP] 法師", "[PVP] 聖騎士", "[PVP] 牧師", 
	"[PVP] 盜賊", "[PVP] 薩滿", "[PVP] 術士", "[PVP] 戰士" }
COEUI_DEFAULTSET = "默認";

COEUI_OVERRIDERANK = { "無按鍵", "使用SHIFT", "使用ALT", "使用CTRL" };

COEUI_CURRENTFRAME = { "大地", "火焰", "水", "空氣" };

COEUI_DIRECTION = { "上", "下", "左", "右" };

COEUI_FRAMEMODE = { "關閉", "打開", "彈出", "隱藏" };


-- Key bindings
-- -------------
BINDING_HEADER_CALLOFELEMENTS = "Call Of Elements";
BINDING_NAME_COESHOWCONFIG = "顯示設置功能表";
BINDING_NAME_COEBESTHEAL = "最佳等級治療波";
BINDING_NAME_COEBATTLEHEAL = "最佳等級次級治療波";
BINDING_NAME_COETHROWADVISED = "施放下一個建議圖騰";
BINDING_NAME_COENEXTSET = "啟動下一組圖騰組合";
BINDING_NAME_COETHROWSET = "施放動態圖騰組合";
BINDING_NAME_COERESTARTSET = "重啟動態圖騰組合";
BINDING_NAME_TOTEMEARTH1 = "大地圖騰#1";
BINDING_NAME_TOTEMEARTH2 = "大地圖騰#2";
BINDING_NAME_TOTEMEARTH3 = "大地圖騰#3";
BINDING_NAME_TOTEMEARTH4 = "大地圖騰#4";
BINDING_NAME_TOTEMEARTH5 = "大地圖騰#5";
BINDING_NAME_TOTEMFIRE1 = "火焰圖騰#1";
BINDING_NAME_TOTEMFIRE2 = "火焰圖騰#2";
BINDING_NAME_TOTEMFIRE3 = "火焰圖騰#3";
BINDING_NAME_TOTEMFIRE4 = "火焰圖騰#4";
BINDING_NAME_TOTEMFIRE5 = "火焰圖騰#5";
BINDING_NAME_TOTEMWATER1 = "水之圖騰#1";
BINDING_NAME_TOTEMWATER2 = "水之圖騰#2";
BINDING_NAME_TOTEMWATER3 = "水之圖騰#3";
BINDING_NAME_TOTEMWATER4 = "水之圖騰#4";
BINDING_NAME_TOTEMWATER5 = "水之圖騰#5";
BINDING_NAME_TOTEMWATER6 = "水之圖騰#6";
BINDING_NAME_TOTEMAIR1 = "空氣圖騰#1";
BINDING_NAME_TOTEMAIR2 = "空氣圖騰#2";
BINDING_NAME_TOTEMAIR3 = "空氣圖騰#3";
BINDING_NAME_TOTEMAIR4 = "空氣圖騰#4";
BINDING_NAME_TOTEMAIR5 = "空氣圖騰#5";
BINDING_NAME_TOTEMAIR6 = "空氣圖騰#6";
BINDING_NAME_TOTEMAIR7 = "空氣圖騰#7";


-- Key modifiers
-- --------------
COEMODIFIER_ALT = "ALT";
COEMODIFIER_ALT_SHORT = "A";
COEMODIFIER_CTRL = "CTRL";
COEMODIFIER_CTRL_SHORT = "C";
COEMODIFIER_SHIFT = "SHIFT";
COEMODIFIER_SHIFT_SHORT = "S";
COEMODIFIER_NUMPAD = "Num Pad";
COEMODIFIER_NUMPAD_SHORT = "NP";


-- Shell commands
-- ---------------
COESHELL_INTRO = "Call Of Elements的命令行指令:";
COESHELL_CONFIG = "'/coe' or '/coe config' - 顯示設置視窗";
COESHELL_LIST = "'/coe list' - 顯示這份列表";
COESHELL_NEXTSET = "'/coe nexset' - 切換到下一組自定義圖騰組合或默認圖騰組合";
COESHELL_PRIORSET = "'/coe priorset' - 切換到前一組自定義圖騰組合或默認圖騰組合";
COESHELL_SET = "'/coe set <名字>' - 切換到指定名字的圖騰組合。";
COESHELL_RESTARTSET = "'/coe restartset' - 你下次施放圖騰組合時重置所有圖騰";
COESHELL_RESET = "'/coe reset' - 重置所有計時器和動態圖騰組合";
COESHELL_RESETFRAMES = "'/coe resetframes' - 移動各系圖騰欄到螢幕中央";
COESHELL_RESETORDERING = "'/coe resetordering' - 重置你的圖騰欄順序";
COESHELL_RELOAD = "'/coe reload' - 重置所有圖騰和圖騰組合";
COESHELL_MACRONOTE = "下面的命令只有當你把它作為巨集拖曳到動作條上時才會起作用:";
COESHELL_THROWSET = "'/coe throwset' - 施放動態圖騰組合";
COESHELL_ADVISED = "'/coe advised' - 施放下一個建議圖騰";

end
