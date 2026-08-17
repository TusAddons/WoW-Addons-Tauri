--[[--------------------------------------------------------------------------
    LoboExporter 3.0 — Data
    Tablas estáticas: ranuras, reputaciones, dificultades y transfiguraciones.
----------------------------------------------------------------------------]]

local ADDON_NAME, LE = ...

--=============================================================================
-- RANURAS DE EQUIPO
-- En 7.3.5 la ranura 18 (a distancia) ya no se usa; 4 (camisa) y 19 (tabardo)
-- sí existen y se exportan porque afectan a la transfiguración.
--=============================================================================
LE.SLOT_NAMES = {
    [1]  = "Cabeza",        [2]  = "Cuello",        [3]  = "Hombros",
    [4]  = "Camisa",        [5]  = "Pecho",         [6]  = "Cintura",
    [7]  = "Piernas",       [8]  = "Pies",          [9]  = "Muñecas",
    [10] = "Manos",         [11] = "Anillo 1",      [12] = "Anillo 2",
    [13] = "Abalorio 1",    [14] = "Abalorio 2",    [15] = "Espalda",
    [16] = "Arma Principal",[17] = "Arma Secundaria",
    [19] = "Tabardo",
}

-- Orden estable para recorrer las ranuras (pairs() no garantiza orden).
LE.SLOT_ORDER = { 1, 2, 3, 15, 5, 4, 19, 9, 10, 6, 7, 8, 11, 12, 13, 14, 16, 17 }

--=============================================================================
-- NIVELES DE REPUTACIÓN
-- GetFactionInfo devuelve standingId 1..8. Los IDs de amistad (Nomi, etc.)
-- se leen aparte con GetFriendshipReputation.
--=============================================================================
LE.STANDING_NAMES = {
    [1] = "Odiado",   [2] = "Hostil",    [3] = "Adverso",  [4] = "Neutral",
    [5] = "Amistoso", [6] = "Honorable", [7] = "Venerado", [8] = "Exaltado",
}

--=============================================================================
-- DIFICULTADES DE LA GUÍA DE AVENTURAS (Encounter Journal)
-- Los IDs de banda y mazmorra son distintos; usarlos cruzados hace que
-- EJ_GetNumLoot() devuelva 0 en silencio.
--=============================================================================
LE.RAID_DIFFICULTIES = {
    { id = 17, name = "Buscador" },
    { id = 14, name = "Normal"   },
    { id = 15, name = "Heroico"  },
    { id = 16, name = "Mítico"   },
}

LE.DUNGEON_DIFFICULTIES = {
    { id = 1,  name = "Normal"  },
    { id = 2,  name = "Heroico" },
    { id = 23, name = "Mítico"  },
}

-- Nivel (tier) de la Guía de Aventuras correspondiente a Legion en 7.3.5.
LE.LEGION_TIER = 7

--=============================================================================
-- TIPOS DE ARMADURA (para descartarlos al leer el botín)
--=============================================================================
LE.ARMOR_TYPES = {
    ["Tela"] = true, ["Cuero"] = true, ["Malla"] = true, ["Placas"] = true,
    ["Reliquia"] = true, ["Escudo"] = true, ["Varios"] = true,
    ["Cloth"] = true, ["Leather"] = true, ["Mail"] = true, ["Plate"] = true,
    ["Relic"] = true, ["Shield"] = true, ["Miscellaneous"] = true,
}

--=============================================================================
-- BIKINI PLATE — conjuntos de placas "ligeras" clásicas
-- Cada clave es "conjunto_Nombre de la pieza - Ranura" y la lista son todos los
-- itemID que comparten esa apariencia (basta con tener uno).
--=============================================================================
LE.BIKINI_PLATES = {
    ["glorious_Ornato glorioso - Cabeza"]                    = { 14969 },
    ["glorious_Hombreras gloriosas - Hombros"]                = { 14972 },
    ["glorious_Coraza gloriosa - Pecho"]                      = { 14966 },
    ["glorious_Ataduras gloriosas - Muñecas"]                 = { 14965 },
    ["glorious_Guanteletes gloriosos - Manos"]                = { 14967 },
    ["glorious_Cinturón glorioso - Cinturón"]                 = { 14968 },
    ["glorious_Musleras gloriosas - Piernas"]                 = { 14970 },
    ["glorious_Escarpes gloriosos - Pies"]                    = { 14971 },

    ["bloodscale_Yelmo de Escama de sangre - Cabeza"]         = { 24949 },
    ["bloodscale_Hombreras de Escama de sangre - Hombros"]    = { 24951, 27898 },
    ["bloodscale_Coraza de Escama de sangre - Pecho"]         = { 24943, 27897 },
    ["bloodscale_Brazales de Escama de sangre - Muñecas"]     = { 24944 },
    ["bloodscale_Guanteletes de Escama de sangre - Manos"]    = { 24945 },
    ["bloodscale_Cinturón de Escama de sangre - Cinturón"]    = { 24946 },
    ["bloodscale_Musleras de Escama de sangre - Piernas"]     = { 24947, 27896 },
    ["bloodscale_Escarpes de Escama de sangre - Pies"]        = { 24948 },

    ["vanguard_Ornato de vanguardia - Cabeza"]                = { 14867 },
    ["vanguard_Hombreras de vanguardia - Hombros"]            = { 14869 },
    ["vanguard_Coraza de vanguardia - Pecho"]                 = { 14864 },
    ["vanguard_Avambrazos de vanguardia - Muñecas"]           = { 14862 },
    ["vanguard_Guanteletes de vanguardia - Manos"]            = { 14863 },
    ["vanguard_Faja de vanguardia - Cinturón"]                = { 14865 },
    ["vanguard_Musleras de vanguardia - Piernas"]             = { 14866 },
    ["vanguard_Escarpes de vanguardia - Pies"]                = { 14868 },

    ["saltstone_Yelmo Piedra de sal - Cabeza"]                = { 14860 },
    ["saltstone_Hombreras Piedra de sal - Hombros"]           = { 14861 },
    ["saltstone_Sobrevesta Piedra de sal - Pecho"]            = { 14854 },
    ["saltstone_Férulas Piedra de sal - Muñecas"]             = { 14855 },
    ["saltstone_Guanteletes Piedra de sal - Manos"]           = { 14856 },
    ["saltstone_Faja Piedra de sal - Cinturón"]               = { 14858 },
    ["saltstone_Musleras Piedra de sal - Piernas"]            = { 14859 },
    ["saltstone_Escarpes Piedra de sal - Pies"]               = { 14857 },

    ["tyrant_Yelmo de tirano - Cabeza"]                       = { 14843 },
    ["tyrant_Hombreras de tirano - Hombros"]                  = { 14845 },
    ["tyrant_Pectoral de tirano - Pecho"]                     = { 14839 },
    ["tyrant_Avambrazos de tirano - Muñecas"]                 = { 14838 },
    ["tyrant_Guanteletes de tirano - Manos"]                  = { 14840 },
    ["tyrant_Cinturón de tirano - Cinturón"]                  = { 14841 },
    ["tyrant_Musleras de tirano - Piernas"]                   = { 14842 },
    ["tyrant_Grebas de tirano - Pies"]                        = { 14844 },
}

--=============================================================================
-- ICONOS DISPONIBLES PARA LOS PINES DEL MAPA
--=============================================================================
LE.PIN_ICONS = {
    { key = "missing",   path = "Interface\\RAIDFRAME\\ReadyCheck-NotReady", label = "Pendiente" },
    { key = "done",      path = "Interface\\RAIDFRAME\\ReadyCheck-Ready",    label = "Completado" },
    { key = "treasure",  path = "Interface\\Icons\\INV_Box_01",              label = "Tesoro" },
    { key = "rare",      path = "Interface\\Icons\\Ability_Hunter_MarkedForDeath", label = "Raro" },
    { key = "quest",     path = "Interface\\Icons\\INV_Misc_Note_01",        label = "Misión" },
    { key = "explore",   path = "Interface\\Icons\\INV_Misc_Map_01",         label = "Exploración" },
}

LE.PIN_ICON_BY_KEY = {}
for _, entry in ipairs(LE.PIN_ICONS) do
    LE.PIN_ICON_BY_KEY[entry.key] = entry.path
end
