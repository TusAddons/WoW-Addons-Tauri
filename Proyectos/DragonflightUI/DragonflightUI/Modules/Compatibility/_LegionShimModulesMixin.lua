-- _LegionShimModulesMixin.lua
-- Copia de seguridad de Mixin/Modules.mixin.lua (que define el global DragonflightUIModulesMixin).
--
-- En este cliente Tauri Legion 7.3.5, el <Include file="Mixin/Modules.mixin.lua" /> dentro de
-- XML\Includes.xml no está dejando el global DragonflightUIModulesMixin definido (mismo tipo de
-- problema que ya vimos con Modules\LoadModules.xml: un <Include> que en este cliente concreto
-- no ejecuta su contenido). Sin ese global, Modules\Core\Config.lua (y Compatibility.lua y
-- Actionbar.lua) revientan en su primera línea útil (`Mixin(Module, DragonflightUIModulesMixin)`)
-- y nunca llegan a definir OnInitialize/OnEnable/ApplySettings - que es lo que activa de verdad
-- Actionbar/Unitframe/Minimap/etc. según los defaults.
--
-- Este archivo se carga DESPUÉS de Core.lua y API.xml (para que DF/L/API.Version ya existan)
-- pero ANTES que los módulos que lo necesitan (Config.lua, Compatibility.lua, Actionbar.lua).
-- Es una copia funcional del mixin original; si el Include real SÍ llega a funcionar en algún
-- momento (parche del server, etc.), simplemente sobreescribe este global sin problema.

if type(DragonflightUIModulesMixin) ~= 'table' then
    local DF = LibStub('AceAddon-3.0'):GetAddon('DragonflightUI')
    local L = LibStub("AceLocale-3.0"):GetLocale("DragonflightUI")
    ---@type API
    local API = DF.API;
    ---@type VersionAPI
    local Version = API and API.Version;

    DragonflightUIModulesMixin = {}

    function DragonflightUIModulesMixin:SetDefaults(data)
        self.defaults = data
        self.wasEnabled = false
    end

    function DragonflightUIModulesMixin:GetDefaultStr(key, sub, extra)
        local obj
        if sub then
            obj = self.defaults.profile[sub]
        else
            obj = self.defaults.profile
        end

        local value = obj[key]

        local defaultFormat = L and L["SettingsDefaultStringFormat"]
        if not defaultFormat then
            -- fallback por si la localización no trae esta cadena
            defaultFormat = '\n(Default: %s)'
        end
        return string.format(defaultFormat, (extra or '') .. tostring(value))
    end

    function DragonflightUIModulesMixin:SetDefaultValues()
        for k, v in pairs(self.defaults.profile) do
            if type(v) == 'table' then
                local obj = self.db.profile[k]
                for kSub, vSub in pairs(v) do obj[kSub] = vSub end
            else
                self.db.profile[k] = v
            end
        end
        self:ApplySettings()
    end

    function DragonflightUIModulesMixin:SetDefaultSubValues(sub)
        local db = self.db.profile

        if db[sub] then
            for k, v in pairs(self.defaults.profile[sub]) do db[sub][k] = v end
            self:ApplySettings(sub)
        end
    end

    function DragonflightUIModulesMixin:GetOption(info)
        local key = info[1]
        local sub = info[2]

        if sub then
            local t = self.db.profile[key]
            return t[sub]
        else
            return self.db.profile[key]
        end
    end

    function DragonflightUIModulesMixin:SetOption(info, value)
        local key = info[1]
        local sub = info[2]

        if sub then
            local t = self.db.profile[key]
            t[sub] = value
            self:ApplySettings(key, sub)
        else
            self.db.profile[key] = value
            self:ApplySettings(nil, key)
        end
    end

    function DragonflightUIModulesMixin:SetWasEnabled(state)
        if state then self.wasEnabled = true end
    end

    function DragonflightUIModulesMixin:GetWasEnabled()
        return self.wasEnabled
    end

    function DragonflightUIModulesMixin:ConditionalOption(cond, sub, displayName, func, message)
        local state = self.db.profile[sub]

        local shouldDo = state[cond]
        local hookName = cond .. 'Hooked'

        if shouldDo then
            if self[hookName] then
                -- ya enganchado, no hacer nada
            else
                self[hookName] = true;
                func()
            end
        else
            if self[hookName] then
                if message then
                    DF:Print(message);
                    return;
                end

                local m = L and L["ModuleConditionalMessage"]
                if m then DF:Print(m:format(displayName)) end
            end
        end
    end

    function DragonflightUIModulesMixin:FuncOrWaitframe(addon, func)
        if DF:IsAddOnLoaded(addon) then
            func()
        else
            local waitFrame = CreateFrame("FRAME")
            waitFrame:RegisterEvent("ADDON_LOADED")
            waitFrame:SetScript("OnEvent", function(self, event, arg1)
                if arg1 == addon then
                    func()
                    waitFrame:UnregisterAllEvents()
                end
            end)
        end
    end

    function DragonflightUIModulesMixin:EnableAddonSpecific()
        if not Version then return end

        local versionTable = {
            {'IsClassic', 'Era'}, {'IsTBC', 'TBC'}, {'IsWotlk', 'Wrath'}, {'IsCata', 'Cata'}, {'IsMoP', 'Mists'}
        }

        for k, v in ipairs(versionTable) do
            local versionName = v[1]
            local versionFunc = v[2]
            if Version[versionName] then
                if self[versionFunc] then
                    self[versionFunc](self);
                else
                    DF:Debug(self, 'No self.' .. versionFunc);
                end
                return;
            end
        end
    end
end
