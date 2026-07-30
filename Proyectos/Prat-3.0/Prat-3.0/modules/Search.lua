Prat:AddModuleToLoad(function()
    local PRAT_MODULE = Prat:RequestModuleName("Search")

    if PRAT_MODULE == nil then
        return
    end

    local module = Prat:NewModule(PRAT_MODULE)

    local PL = module.PL

    --[===[@debug@
    PL:AddLocale(PRAT_MODULE, "enUS", {
        module_name = "Search",
        module_desc = "Adds the ability to search the chatframes.",
        module_info = "This module adds the /find and /findall commands to search the chat history\n\nUsage:\n\n /find <text> \n\n /findall <text>",
        err_tooshort = "Search term is too short",
        err_notfound = "Not Found",
        find_results = "Find Results:",
    })
    --@end-debug@]===]

    -- These Localizations are auto-generated. To help with localization
    -- please go to http://www.wowace.com/projects/prat-3-0/localization/
    --@non-debug@
   do
       local L

   L=
{
	["Search"] = {
		["err_notfound"] = "Not Found",
		["err_tooshort"] = "Search term is too short",
		["find_results"] = "Find Results:",
		["module_desc"] = "Adds the ability to search the chatframes.",
		["module_info"] = [=[This module adds the /find and /findall commands to search the chat history

Usage:

 /find <text> 

 /findall <text>]=],
		["module_name"] = "Search",
	}
}

     PL:AddLocale(PRAT_MODULE, "enUS",L)

   L=
{
	["Search"] = {
		--[[Translation missing --]]
		--[[ ["err_notfound"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["err_tooshort"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["find_results"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_info"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_name"] = "",--]] 
	}
}

     PL:AddLocale(PRAT_MODULE, "frFR",L)

   L=
{
	["Search"] = {
		["err_notfound"] = "Nicht gefunden",
		["err_tooshort"] = "Suchbegriff zu kurz",
		["find_results"] = "Gefundene Ergebnisse:",
		["module_desc"] = [=[Aktiviert die Suchfunktion in Chatfenstern.

Suche]=],
		["module_info"] = [=[Aktiviert die Textbefehle /find und /findall, um die Chathistorie zu durchsuchen

Benutzung:

/find <text>

/findall <text>

Suche]=],
		["module_name"] = "Suchen",
	}
}

     PL:AddLocale(PRAT_MODULE, "deDE",L)

   L=
{
	["Search"] = {
		["err_notfound"] = "ì°¾ì„ ìˆ˜ ì—†ìŒ",
		["err_tooshort"] = "ê²€ìƒ‰ êµ¬ë¬¸ì´ ë„ˆë¬´ ì§§ìŠµë‹ˆë‹¤",
		["find_results"] = "ê²€ìƒ‰ ê²°ê³¼:",
		["module_desc"] = "ëŒ€í™”ì°½ ê²€ìƒ‰ ê¸°ëŠ¥ì„ ì¶”ê°€í•©ë‹ˆë‹¤.",
		["module_info"] = [=[ì´ ëª¨ë“ˆì€ ëŒ€í™” ê¸°ë¡ì„ ê²€ìƒ‰í•˜ëŠ” /find ì™€ /findall ëª…ë ¹ì–´ë¥¼ ì¶”ê°€í•©ë‹ˆë‹¤

ì‚¬ìš©ë²•:

/find <ë¬¸ìžì—´>

/findall <ë¬¸ìžì—´>]=],
		["module_name"] = "ê²€ìƒ‰",
	}
}

     PL:AddLocale(PRAT_MODULE, "koKR",L)

   L=
{
	["Search"] = {
		--[[Translation missing --]]
		--[[ ["err_notfound"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["err_tooshort"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["find_results"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_info"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_name"] = "",--]] 
	}
}

     PL:AddLocale(PRAT_MODULE, "esMX",L)

   L=
{
	["Search"] = {
		["err_notfound"] = "ÐÐµ ÐÐ°Ð¹Ð´ÐµÐ½Ð½Ð¾",
		["err_tooshort"] = "ÐšÑ€Ð¸Ñ‚ÐµÑ€Ð¸Ð¹ Ð¿Ð¾Ð¸ÑÐºÐ° ÑÐ»Ð¸ÑˆÐºÐ¾Ð¼ ÐºÐ¾Ñ€Ð¾Ñ‚Ð¾Ðº",
		["find_results"] = "ÐÐ°Ð¹Ñ‚Ð¸ Ð ÐµÐ·ÑƒÐ»ÑŒÑ‚Ð°Ñ‚Ñ‹:",
		["module_desc"] = "Ð”Ð¾Ð±Ð°Ð²Ð»ÑÐµÑ‚ Ð²Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ð¾ÑÑ‚ÑŒ Ð¿Ð¾Ð¸ÑÐºÐ° Ñ‚ÐµÐºÑÑ‚Ð° Ð² Ñ‡Ð°Ñ‚Ðµ.",
		["module_info"] = [=[Ð­Ñ‚Ð¾Ñ‚ Ð¼Ð¾Ð´ÑƒÐ»ÑŒ Ð´Ð¾Ð±Ð°Ð²Ð»ÑÐµÑ‚ ÐºÐ¾Ð¼Ð°Ð½Ð´Ñ‹ /find Ð¸ /findall Ð´Ð»Ñ Ð¿Ð¾Ð¸ÑÐºÐ° Ð² Ð¸ÑÑ‚Ð¾Ñ€Ð¸Ð¸ Ñ‡Ð°Ñ‚Ð°

Ð˜ÑÐ¿Ð¾Ð»ÑŒÐ·Ð¾Ð²Ð°Ð½Ð¸Ðµ:

/find <Ñ‚ÐµÐºÑÑ‚>

/findall <Ñ‚ÐµÐºÑÑ‚>]=],
		["module_name"] = "ÐŸÐ¾Ð¸ÑÐº",
	}
}

     PL:AddLocale(PRAT_MODULE, "ruRU",L)

   L=
{
	["Search"] = {
		["err_notfound"] = "æ²¡æ‰¾åˆ°",
		["err_tooshort"] = "æœç´¢æ–‡å­—å¤ªçŸ­",
		["find_results"] = "æŸ¥æ‰¾ç»“æžœï¼š",
		["module_desc"] = "å¢žåŠ æœç´¢èŠå¤©æ¡†çš„èƒ½åŠ›",
		["module_info"] = [=[æ­¤æ¨¡å—å¢žåŠ  /find å’Œ /findall å‘½ä»¤æœç´¢èŠå¤©åŽ†å²

ç”¨æ³•:

 /find <æ–‡å­—>

 /findall <æ–‡å­—>]=],
		["module_name"] = "æœç´¢",
	}
}

     PL:AddLocale(PRAT_MODULE, "zhCN",L)

   L=
{
	["Search"] = {
		--[[Translation missing --]]
		--[[ ["err_notfound"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["err_tooshort"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["find_results"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_info"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_name"] = "",--]] 
	}
}

     PL:AddLocale(PRAT_MODULE, "esES",L)

   L=
{
	["Search"] = {
		["err_notfound"] = "æ‰¾ä¸åˆ°",
		["err_tooshort"] = "å°‹æ‰¾ç‰©å“å¤ªçŸ­",
		["find_results"] = "æ‰¾åˆ°çµæžœ:",
		--[[Translation missing --]]
		--[[ ["module_desc"] = "",--]] 
		--[[Translation missing --]]
		--[[ ["module_info"] = "",--]] 
		["module_name"] = "å°‹æ‰¾",
	}
}

     PL:AddLocale(PRAT_MODULE, "zhTW",L)

   end
   --@end-non-debug@




    Prat:SetModuleDefaults(module.name, {
        profile = {
            on = true,
        }
    } )

    
    Prat:SetModuleOptions(module.name, {
        name = PL.module_name,
        desc = PL.module_desc,
        type = "group",
        args = {
            info = {
                name = PL.module_info,
                type = "description",
            }
        }
    })


    SLASH_FIND1 = "/find"
    SlashCmdList["FIND"] = function(msg) module:Find(msg, false) end

    SLASH_FINDALL1 = "/findall"
    SlashCmdList["FINDALL"] = function(msg) module:Find(msg, true) end

    local MAX_SCRAPE_TIME = 30
    local foundlines = {}
    local scrapelines = {}

    local function out(frame, msg)
        frame:print(frame, msg)
    end

    function module:Find(word, all, frame)
        if not self.db.profile.on then
            return
        end

        if frame == nil then
            frame = SELECTED_CHAT_FRAME
        end

        if not word then return end

        if #word <= 1 then
            frame:ScrollToBottom()
            out(frame, PL.err_tooshorL)
            return
        end

        if frame:GetNumMessages() == 0 then
             out(frame, PL.err_notfound)
             return
        end

        local starttime = time()
        local runtime = 0

        if not all and self.lastsearch == word then
            frame:PageUp()
        end

        if all then
            frame:ScrollToBottom()
        end

        self.lastsearch = word

        repeat
            self:ScrapeFrame(frame, nil, true)

            for _,v in ipairs(scrapelines) do
                if v.message:find(word) then
                    if all then
                        foundlines[#foundlines+1] = v
                    else
                        return
                    end
                end
            end

            frame:PageUp()
            runtime = time() - starttime
            if runtime >= MAX_SCRAPE_TIME then
                out(frame, "Frame scraping timeout exceeded, results will be incomplete.")
                break;
            end

        until frame:AtTop() or runtime >= MAX_SCRAPE_TIME

        self.lastsearch = nil

        frame:ScrollToBottom()

        if all and #foundlines > 0 then
            out(frame, PL.find_results)

            Prat.loading = true
            for _,v in ipairs(foundlines) do
                frame:AddMessage(v.message, v.r, v.g, v.b)
            end
            Prat.loading = nil

        else
            out(frame, PL.err_notfound)
        end

        wipe(foundlines)
    end

    function module:ScrapeFrame(frame)
        wipe(scrapelines)

        for _,v in ipairs(frame.visibleLines) do
            local msg = v.messageInfo
            if msg then
                table.insert(scrapelines, 1, msg)
            end
        end
    end

    return
end) -- Prat:AddModuleToLoad
