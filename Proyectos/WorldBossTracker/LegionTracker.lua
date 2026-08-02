local WorldBossTracker = WorldBossTracker or {}

-- Lista de misiones de Jefes de Mundo en Legion y Argus
WorldBossTracker.legionBosses = {
    -- Islas Abruptas (Semanal)
    { id = 43193, name = "Calamir" },
    { id = 43448, name = "Cazadores de Almas" },
    { id = 43192, name = "Cosechador de almas" },
    { id = 42270, name = "Levantus" },
    { id = 43512, name = "Ana-Mouz" },
    { id = 42269, name = "Nithogg" },
    { id = 43152, name = "Naz'ak el Maligno" },
    { id = 43451, name = "Shar'thos" },
    { id = 42779, name = "Shivermaw" },
    { id = 43985, name = "Drugon el Sangrehielo" },
    { id = 43450, name = "Humongris" },
    { id = 42819, name = "Withered J'im" },
    
    -- Jefes de Mundo de Argus (Invasiones Mayores)
    { id = 49202, name = "Matrona Folnuna" },
    { id = 49203, name = "Maestro Alluradel" },
    { id = 49204, name = "Inquisidor Meto" },
    { id = 49205, name = "Ocularus" },
    { id = 49206, name = "Pit Lord Vilemus" },
    { id = 49207, name = "Sotanathor" }
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
