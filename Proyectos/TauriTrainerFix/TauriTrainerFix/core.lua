local orig_GetTrainerServiceLevelReq = GetTrainerServiceLevelReq
if orig_GetTrainerServiceLevelReq then
    GetTrainerServiceLevelReq = function(index)
        local reqLevel = orig_GetTrainerServiceLevelReq(index)
        return reqLevel or 0
    end
end

local orig_GetTrainerServiceInfo = GetTrainerServiceInfo
if orig_GetTrainerServiceInfo then
    GetTrainerServiceInfo = function(index)
        local name, subText, category, texture, reqLevel = orig_GetTrainerServiceInfo(index)
        return name, subText, category, texture, reqLevel or 0
    end
end
