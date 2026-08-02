local initials = {"g", "kk", "n", "d", "tt", "r", "m", "b", "pp", "s", "ss", "", "j", "jj", "ch", "k", "t", "p", "h"}
local medials = {"a", "ae", "ya", "yae", "eo", "e", "yeo", "ye", "o", "wa", "wae", "oe", "yo", "u", "wo", "we", "wi", "yu", "eu", "ui", "i"}
local finals = {"", "k", "k", "ks", "n", "nj", "nh", "t", "l", "lg", "lm", "lb", "ls", "lt", "lp", "lh", "m", "p", "ps", "t", "t", "ng", "t", "t", "k", "t", "p", "t"}

local cyrillic = {
    [1040]="A", [1041]="B", [1042]="V", [1043]="G", [1044]="D", [1045]="E", [1046]="Zh", [1047]="Z", [1048]="I", [1049]="Y", [1050]="K", [1051]="L", [1052]="M", [1053]="N", [1054]="O", [1055]="P", [1056]="R", [1057]="S", [1058]="T", [1059]="U", [1060]="F", [1061]="Kh", [1062]="Ts", [1063]="Ch", [1064]="Sh", [1065]="Shch", [1066]="", [1067]="Y", [1068]="", [1069]="E", [1070]="Yu", [1071]="Ya",
    [1072]="a", [1073]="b", [1074]="v", [1075]="g", [1076]="d", [1077]="e", [1078]="zh", [1079]="z", [1080]="i", [1081]="y", [1082]="k", [1083]="l", [1084]="m", [1085]="n", [1086]="o", [1087]="p", [1088]="r", [1089]="s", [1090]="t", [1091]="u", [1092]="f", [1093]="kh", [1094]="ts", [1095]="ch", [1096]="sh", [1097]="shch", [1098]="", [1099]="y", [1100]="", [1101]="e", [1102]="yu", [1103]="ya"
}

local greek = {
    [913]="A", [914]="V", [915]="G", [916]="D", [917]="E", [918]="Z", [919]="I", [920]="Th", [921]="I", [922]="K", [923]="L", [924]="M", [925]="N", [926]="X", [927]="O", [928]="P", [929]="R", [931]="S", [932]="T", [933]="Y", [934]="F", [935]="Kh", [936]="Ps", [937]="O",
    [945]="a", [946]="v", [947]="g", [948]="d", [949]="e", [950]="z", [951]="i", [952]="th", [953]="i", [954]="k", [955]="l", [956]="m", [957]="n", [958]="x", [959]="o", [960]="p", [961]="r", [962]="s", [963]="s", [964]="t", [965]="y", [966]="f", [967]="kh", [968]="ps", [969]="o"
}

local arabic = {
    [1569]="a", [1570]="a", [1571]="a", [1572]="w", [1573]="i", [1574]="y", [1575]="a", [1576]="b", [1577]="ah", [1578]="t", [1579]="th", [1580]="j", [1581]="h", [1582]="kh", [1583]="d", [1584]="dh", [1585]="r", [1586]="z", [1587]="s", [1588]="sh", [1589]="s", [1590]="d", [1591]="t", [1592]="z", [1593]="a", [1594]="gh", [1601]="f", [1602]="q", [1603]="k", [1604]="l", [1605]="m", [1606]="n", [1607]="h", [1608]="w", [1609]="a", [1610]="y"
}

local kana = {
    [12353]="a", [12354]="a", [12355]="i", [12356]="i", [12357]="u", [12358]="u", [12359]="e", [12360]="e", [12361]="o", [12362]="o", [12363]="ka", [12364]="ga", [12365]="ki", [12366]="gi", [12367]="ku", [12368]="gu", [12369]="ke", [12370]="ge", [12371]="ko", [12372]="go", [12373]="sa", [12374]="za", [12375]="shi", [12376]="ji", [12377]="su", [12378]="zu", [12379]="se", [12380]="ze", [12381]="so", [12382]="zo", [12383]="ta", [12384]="da", [12385]="chi", [12386]="ji", [12387]="tsu", [12388]="tsu", [12389]="zu", [12390]="te", [12391]="de", [12392]="to", [12393]="do", [12394]="na", [12395]="ni", [12396]="nu", [12397]="ne", [12398]="no", [12399]="ha", [12400]="ba", [12401]="pa", [12402]="hi", [12403]="bi", [12404]="pi", [12405]="fu", [12406]="bu", [12407]="pu", [12408]="he", [12409]="be", [12410]="pe", [12411]="ho", [12412]="bo", [12413]="po", [12414]="ma", [12415]="mi", [12416]="mu", [12417]="me", [12418]="mo", [12419]="ya", [12420]="ya", [12421]="yu", [12422]="yu", [12423]="yo", [12424]="yo", [12425]="ra", [12426]="ri", [12427]="ru", [12428]="re", [12429]="ro", [12430]="wa", [12431]="wa", [12432]="wi", [12433]="we", [12434]="wo", [12435]="n",
    [12449]="a", [12450]="a", [12451]="i", [12452]="i", [12453]="u", [12454]="u", [12455]="e", [12456]="e", [12457]="o", [12458]="o", [12459]="ka", [12460]="ga", [12461]="ki", [12462]="gi", [12463]="ku", [12464]="gu", [12465]="ke", [12466]="ge", [12467]="ko", [12468]="go", [12469]="sa", [12470]="za", [12471]="shi", [12472]="ji", [12473]="su", [12474]="zu", [12475]="se", [12476]="ze", [12477]="so", [12478]="zo", [12479]="ta", [12480]="da", [12481]="chi", [12482]="ji", [12483]="tsu", [12484]="tsu", [12485]="zu", [12486]="te", [12487]="de", [12488]="to", [12489]="do", [12490]="na", [12491]="ni", [12492]="nu", [12493]="ne", [12494]="no", [12495]="ha", [12496]="ba", [12497]="pa", [12498]="hi", [12499]="bi", [12500]="pi", [12501]="fu", [12502]="bu", [12503]="pu", [12504]="he", [12505]="be", [12506]="pe", [12507]="ho", [12508]="bo", [12509]="po", [12510]="ma", [12511]="mi", [12512]="mu", [12513]="me", [12514]="mo", [12515]="ya", [12516]="ya", [12517]="yu", [12518]="yu", [12519]="yo", [12520]="yo", [12521]="ra", [12522]="ri", [12523]="ru", [12524]="re", [12525]="ro", [12526]="wa", [12527]="wa", [12528]="wi", [12529]="we", [12530]="wo", [12531]="n", [12532]="vu"
}



local RealNames = {}

local function RomanizeString(str)
    if type(str) ~= "string" or not ChatFontFixDB or not ChatFontFixDB.enabled then return str end
    
    local out = {}
    local len = #str
    local i = 1
    while i <= len do
        local b1 = str:byte(i)
        if b1 < 128 then
            table.insert(out, string.char(b1))
            i = i + 1
        elseif b1 >= 192 and b1 < 224 and i + 1 <= len then
            local b2 = str:byte(i+1)
            local cp = ((b1 - 192) * 64) + (b2 - 128)
            if cyrillic[cp] then
                table.insert(out, ChatFontFixDB.romanizeRussian and cyrillic[cp] or str:sub(i, i+1))
            elseif greek[cp] then
                table.insert(out, ChatFontFixDB.romanizeGreek and greek[cp] or (ChatFontFixDB.useTags and "[GR]" or "*"))
            elseif arabic[cp] then
                table.insert(out, ChatFontFixDB.romanizeArabic and arabic[cp] or (ChatFontFixDB.useTags and "[AR]" or "*"))
            else
                table.insert(out, str:sub(i, i+1))
            end
            i = i + 2
        elseif b1 >= 224 and b1 < 240 and i + 2 <= len then
            local b2 = str:byte(i+1)
            local b3 = str:byte(i+2)
            local cp = ((b1 - 224) * 4096) + ((b2 - 128) * 64) + (b3 - 128)
            
            if cp >= 44032 and cp <= 55203 then
                if ChatFontFixDB.romanizeKorean then
                    local offset = cp - 44032
                    local init = math.floor(offset / 588)
                    local med = math.floor((offset % 588) / 28)
                    local fin = offset % 28
                    table.insert(out, initials[init+1] .. medials[med+1] .. finals[fin+1])
                else
                    table.insert(out, ChatFontFixDB.useTags and "[KR]" or "*")
                end
            elseif kana[cp] then
                table.insert(out, ChatFontFixDB.romanizeJapanese and kana[cp] or (ChatFontFixDB.useTags and "[JP]" or "*"))
            elseif ChatFontFix_ChineseDictionary and ChatFontFix_ChineseDictionary[cp] then
                table.insert(out, ChatFontFixDB.romanizeChinese and ChatFontFix_ChineseDictionary[cp] or (ChatFontFixDB.useTags and "[CN]" or "*"))
            elseif cp >= 19968 and cp <= 40959 then
                table.insert(out, ChatFontFixDB.useTags and "[CN]" or "*")
            elseif cp >= 12352 and cp <= 12543 then
                table.insert(out, ChatFontFixDB.useTags and "[JP]" or "*")
            elseif cp >= 1536 and cp <= 1791 then
                table.insert(out, ChatFontFixDB.useTags and "[AR]" or "*")
            else
                table.insert(out, "*")
            end
            i = i + 3
        elseif b1 >= 240 and b1 < 248 and i + 3 <= len then
            table.insert(out, "*")
            i = i + 4
        else
            i = i + 1
        end
    end
    
    local result = table.concat(out)
    result = result:gsub("%[CN%]+", "[CN]"):gsub("%[JP%]+", "[JP]"):gsub("%[AR%]+", "[AR]"):gsub("%[KR%]+", "[KR]"):gsub("%[GR%]+", "[GR]"):gsub("%*+", "*")
    return result
end

local function ChatFilter(self, event, msg, sender, ...)
    if not ChatFontFixDB or not ChatFontFixDB.enabled then
        return false, msg, sender, ...
    end

    local newMsg = msg and RomanizeString(msg) or msg
    local newSender = sender and RomanizeString(sender) or sender
    
    if sender and newSender ~= sender then
        RealNames[newSender] = sender
        RealNames[newSender:lower()] = sender
    end
    
    return false, newMsg, newSender, ...
end

local events = {
    "CHAT_MSG_SAY", "CHAT_MSG_YELL", "CHAT_MSG_GUILD", "CHAT_MSG_OFFICER",
    "CHAT_MSG_PARTY", "CHAT_MSG_PARTY_LEADER", "CHAT_MSG_RAID", "CHAT_MSG_RAID_LEADER",
    "CHAT_MSG_INSTANCE_CHAT", "CHAT_MSG_INSTANCE_CHAT_LEADER", "CHAT_MSG_CHANNEL",
    "CHAT_MSG_WHISPER", "CHAT_MSG_WHISPER_INFORM", "CHAT_MSG_SYSTEM",
    "CHAT_MSG_GUILD_ACHIEVEMENT", "CHAT_MSG_ACHIEVEMENT"
}

for _, event in ipairs(events) do
    ChatFrame_AddMessageEventFilter(event, ChatFilter)
end

local orig_SendChatMessage = SendChatMessage

local messageQueue = {}
local lastSendTime = 0
local THROTTLE_DELAY = 1.25 -- 4 messages in 5 seconds to be safe

local throttleTypes = {
    ["SAY"] = true,
    ["YELL"] = true,
    ["PARTY"] = true,
    ["RAID"] = true,
    ["INSTANCE_CHAT"] = true,
    ["GUILD"] = true,
    ["OFFICER"] = true,
    ["CHANNEL"] = true,
}

local throttleFrame = CreateFrame("Frame")
throttleFrame:SetScript("OnUpdate", function(self, elapsed)
    if #messageQueue > 0 then
        if GetTime() - lastSendTime >= THROTTLE_DELAY then
            local q = table.remove(messageQueue, 1)
            lastSendTime = GetTime()
            orig_SendChatMessage(q.msg, q.chatType, q.language, q.target)
        end
    end
end)

SendChatMessage = function(msg, chatType, language, target, ...)
    if ChatFontFixDB and ChatFontFixDB.enabled and chatType == "WHISPER" and target then
        local realTarget = RealNames[target] or RealNames[tostring(target):lower()]
        if realTarget then target = realTarget end
    end
    
    local cType = chatType or "SAY"
    if throttleTypes[cType] then
        -- Bypass throttle for DBM
        local stack = debugstack()
        if stack and (stack:find("DBM%-") or stack:find("DBMCore")) then
            return orig_SendChatMessage(msg, chatType, language, target, ...)
        end

        if GetTime() - lastSendTime >= THROTTLE_DELAY and #messageQueue == 0 then
            lastSendTime = GetTime()
            return orig_SendChatMessage(msg, chatType, language, target, ...)
        else
            table.insert(messageQueue, {msg=msg, chatType=chatType, language=language, target=target})
            return
        end
    end

    return orig_SendChatMessage(msg, chatType, language, target, ...)
end

local orig_InviteUnit = InviteUnit
if orig_InviteUnit then
    InviteUnit = function(name, ...)
        if ChatFontFixDB and ChatFontFixDB.enabled and name then
            local realName = RealNames[name] or RealNames[tostring(name):lower()]
            if realName then name = realName end
        end
        return orig_InviteUnit(name, ...)
    end
end

local orig_AddFriend = AddFriend
if orig_AddFriend then
    AddFriend = function(name, ...)
        if ChatFontFixDB and ChatFontFixDB.enabled and name then
            local realName = RealNames[name] or RealNames[tostring(name):lower()]
            if realName then name = realName end
        end
        return orig_AddFriend(name, ...)
    end
end

if C_FriendList and C_FriendList.AddFriend then
    local orig_CAddFriend = C_FriendList.AddFriend
    C_FriendList.AddFriend = function(name, ...)
        if ChatFontFixDB and ChatFontFixDB.enabled and name then
            local realName = RealNames[name] or RealNames[tostring(name):lower()]
            if realName then name = realName end
        end
        return orig_CAddFriend(name, ...)
    end
end

local initFrame = CreateFrame("Frame")
initFrame:RegisterEvent("ADDON_LOADED")
initFrame:SetScript("OnEvent", function(self, event, addon)
    if addon == "ChatFontFix" then
        ChatFontFixDB = ChatFontFixDB or {
            enabled = true,
            romanizeKorean = true,
            romanizeRussian = true,
            romanizeChinese = true,
            romanizeJapanese = true,
            romanizeArabic = true,
            romanizeGreek = true,
            useTags = true
        }
        self:UnregisterEvent("ADDON_LOADED")
    end
end)

local panel = CreateFrame("Frame", "ChatFontFixOptionsPanel", InterfaceOptionsFramePanelContainer)
panel.name = "ChatFontFix"

local title = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
title:SetPoint("TOPLEFT", 16, -16)
title:SetText("Configuración de ChatFontFix")

local desc = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
desc:SetPoint("TOPLEFT", title, "BOTTOMLEFT", 0, -8)
desc:SetWidth(560)
desc:SetJustifyH("LEFT")
desc:SetText("Activa o desactiva la transcripción fonética de cada idioma de forma independiente.")

local function CreateCheckbox(name, label, tooltip, varKey, yOffset)
    local cb = CreateFrame("CheckButton", name, panel, "InterfaceOptionsCheckButtonTemplate")
    cb:SetPoint("TOPLEFT", desc, "BOTTOMLEFT", 0, yOffset)
    _G[cb:GetName() .. "Text"]:SetText(label)
    cb.tooltipText = tooltip
    cb:SetScript("OnClick", function(self)
        ChatFontFixDB[varKey] = self:GetChecked()
    end)
    return cb
end

local cbEnabled  = CreateCheckbox("ChatFontFixCB_Enabled",  "Activar filtro maestro ChatFontFix", "Interruptor general del addon.", "enabled", -16)
local cbKorean   = CreateCheckbox("ChatFontFixCB_Korean",   "Transcribir Coreano (Hangul -> koha)", "Convierte sílabas coreanas en letras inglesas legibles.", "romanizeKorean", -44)
local cbRussian  = CreateCheckbox("ChatFontFixCB_Russian",  "Transcribir Ruso (Cirílico -> Privet)", "Convierte caracteres rusos a su fonética occidental.", "romanizeRussian", -70)
local cbChinese  = CreateCheckbox("ChatFontFixCB_Chinese",  "Transcribir Chino común (Ideogramas -> Pinyin)", "Traduce los caracteres chinos gamer más populares del WoW.", "romanizeChinese", -96)
local cbJapanese = CreateCheckbox("ChatFontFixCB_Japanese", "Transcribir Japonés (Kana -> Romaji)", "Traduce sílabas japonesas Hiragana y Katakana.", "romanizeJapanese", -122)
local cbArabic   = CreateCheckbox("ChatFontFixCB_Arabic",   "Transcribir Árabe", "Convierte caracteres árabes en sus consonantes/vocales latinas.", "romanizeArabic", -148)
local cbGreek    = CreateCheckbox("ChatFontFixCB_Greek",    "Transcribir Griego", "Convierte el alfabeto griego al latino.", "romanizeGreek", -174)
local cbTags     = CreateCheckbox("ChatFontFixCB_Tags",     "Mostrar etiquetas [CN], [KR], [AR] si se desactiva", "Muestra etiquetas de país si desactivas la transcripción o ante signos indescifrables.", "useTags", -206)

panel.refresh = function()
    if not ChatFontFixDB then return end
    cbEnabled:SetChecked(ChatFontFixDB.enabled)
    cbKorean:SetChecked(ChatFontFixDB.romanizeKorean)
    cbRussian:SetChecked(ChatFontFixDB.romanizeRussian)
    cbChinese:SetChecked(ChatFontFixDB.romanizeChinese)
    cbJapanese:SetChecked(ChatFontFixDB.romanizeJapanese)
    cbArabic:SetChecked(ChatFontFixDB.romanizeArabic)
    cbGreek:SetChecked(ChatFontFixDB.romanizeGreek)
    cbTags:SetChecked(ChatFontFixDB.useTags)
end

InterfaceOptions_AddCategory(panel)

SLASH_CHATFONTFIX1 = "/cff"
SLASH_CHATFONTFIX2 = "/chatfontfix"
SlashCmdList["CHATFONTFIX"] = function()
    InterfaceOptionsFrame_OpenToCategory("ChatFontFix")
    InterfaceOptionsFrame_OpenToCategory("ChatFontFix")
end
