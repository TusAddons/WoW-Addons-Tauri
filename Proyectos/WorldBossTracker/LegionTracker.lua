local WorldBossTracker = WorldBossTracker or {}

local locale = GetLocale()
local function GetL(en, es)
    if locale == "esES" or locale == "esMX" then return es else return en end
end

-- Lista de misiones de Jefes de Mundo en Legion y Argus
WorldBossTracker.legionBosses = {
    -- Islas Abruptas (Semanal)
    { id = 43193, name = GetL("Calamir", "Calamir") },
    { id = 43448, name = GetL("The Soultakers", "Cazadores de Almas") },
    { id = 42270, name = GetL("Levantus", "Levantus") },
    { id = 43512, name = GetL("Ana-Mouz", "Ana-Mouz") },
    { id = 42269, name = GetL("Nithogg", "Nithogg") },
    { id = 43152, name = GetL("Na'zak the Fiend", "Naz'ak el Maligno") },
    { id = 43451, name = GetL("Shar'thos", "Shar'thos") },
    { id = 42779, name = GetL("Shivermaw", "Escarcha") },
    { id = 43985, name = GetL("Drugon the Frostblood", "Drugon el Sangrehielo") },
    { id = 43450, name = GetL("Humongris", "Humongris") },
    { id = 42819, name = GetL("Withered J'im", "Withered J'im") },
    
    -- Jefes de Mundo de Argus (Invasiones Mayores)
    { id = 49202, name = GetL("Matron Folnuna", "Matrona Folnuna") },
    { id = 49203, name = GetL("Mistress Alluradel", "Señora Alluradel") },
    { id = 49204, name = GetL("Inquisitor Meto", "Inquisidor Meto") },
    { id = 49205, name = GetL("Ocularus", "Ocularus") },
    { id = 49206, name = GetL("Pit Lord Vilemus", "Señor del foso Vilemus") },
    { id = 49207, name = GetL("Sotanathor", "Sotanathor") }
}

function WorldBossTracker.GetActiveLegionBosses()
    local active = {}
    -- En WoW 7.3.5, C_TaskQuest no siempre devuelve la info si no estás en el mapa.
    -- Pero podemos iterar las misiones de mundo, o simplemente comprobar el estado.
    -- Al ser Jefes de mundo, podemos comprobar IsQuestFlaggedCompleted y C_TaskQuest.GetQuestInfoByQuestID
    
    for i, boss in ipairs(WorldBossTracker.legionBosses) do
        -- Si la misión está activa (aunque no la tengamos completada) a veces no se puede saber
        -- sin escanear el mapa. Como solución elegante para el parche 7.3.5, mostramos
        -- todos los jefes de Legion, y marcamos si tienen Lock (lo hemos matado).
        -- Podríamos ocultar los que no están activos si tuviéramos un servidor que enviara el activo,
        -- pero mostraremos una lista con su estado de Kill.
        
        local isDead = IsQuestFlaggedCompleted(boss.id)
        table.insert(active, {
            name = boss.name,
            isDead = isDead,
            id = boss.id
        })
    end
    return active
end
