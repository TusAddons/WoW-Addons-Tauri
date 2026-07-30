local myname, ns = ...
local ns = ns -- scope

ns.defaults = {
    profile = {
        icon_scale = 1.4,
        icon_alpha = 1.0,
        show_looted = false,
    },
}

ns.options = {
    type = "group",
    name = "Old World",
    get = function(info) return ns.db[info[#info]] end,
    set = function(info, v)
        ns.db[info[#info]] = v
        local HandyNotes = LibStub("AceAddon-3.0"):GetAddon("HandyNotes")
        HandyNotes:SendMessage("HandyNotes_NotifyUpdate", "OldWorld")
    end,
    args = {
        icon = {
            type = "group",
            name = "Configuración de Iconos",
            inline = true,
            args = {
                icon_scale = {
                    type = "range",
                    name = "Tamaño",
                    min = 0.5, max = 3, step = 0.1,
                    order = 1,
                },
                icon_alpha = {
                    type = "range",
                    name = "Opacidad",
                    min = 0.1, max = 1, step = 0.1,
                    order = 2,
                },
                show_looted = {
                    type = "toggle",
                    name = "Mostrar tesoros ya recogidos",
                    desc = "Si está activado, los tesoros que ya has despojado seguirán apareciendo en el mapa.",
                    order = 3,
                },
            },
        },
    },
}