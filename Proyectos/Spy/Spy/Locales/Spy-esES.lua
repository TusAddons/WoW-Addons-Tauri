local L = LibStub("AceLocale-3.0"):NewLocale("Spy", "ptES")
if not L then return end


-Información Addon
L ["Spy"] = "Spy"
L ["versión"] = "Versión"
L ["LoadDescription"] = "|cff9933ffSpy addon cargado. Tipo |cffffffff/spy|cff9933ff para las opciones".
L ["SpyEnabled"] = "|cff9933ffSpy addon habilitado."
L ["SpyDisabled"] = "|cff9933ffSpy addon deshabilitado. Tipo show|cff9933ff |cffffffff/Spy a permitir".
L ["UpgradeAvailable"] = "|cff9933ffA nueva versión de Spy está disponible. Puede descargarse desde: \n| cffffffffhttps://mods.curse.com/addons/wow/spy"

--Cuerdas configuración
L ["perfiles"] = "Perfiles"

L ["GeneralSettings"] = "Configuración General"
L ["SpyDescription1"] = [[[]
Spy es un addon que le avisará de la presencia de los jugadores enemigos cercanos.
]]
L ["SpyDescription2"] = [[[]

|cffffd000Nearby list|cffffffff
La lista cercana muestra cualquier jugador enemigo que ha sido detectados cerca. Haga clic en la lista permite concentrarse en el jugador, sin embargo esto sólo funciona fuera de combate. Los jugadores se eliminan de la lista si no han sido detectadas después de un período de tiempo.
 
El botón Borrar en la barra de título puede utilizarse para borrar la lista, y sosteniendo el Control mientras limpiaba la lista le permite rápidamente habilitar/deshabilitar la Spy.
 
|cffffd000Last hora list|cffffffff
La lista de última hora muestra todos los enemigos que han sido detectados en la última hora.
 
|cffffd000Ignore list|cffffffff
Los jugadores que se agregan a la lista de ignorar no serán denunciados por Spy. Puede agregar y quitar jugadores de esta lista utilizando el menú desplegable del botón o manteniendo pulsada la tecla Control mientras hace clic en el botón.
 
|cffffd000Kill on Sight list|cffffffff
Los jugadores en su lista de matar On Sight causan una alarma que suene cuando detecta. Puede agregar y quitar jugadores de esta lista utilizando el menú desplegable del botón o manteniendo pulsada la tecla Mayús mientras hace clic en el botón.
 
El menú desplegable también puede utilizarse para establecer las razones de por qué alguien ha agregado a la lista de matar en vista. Si desea ingresar una razón específica que no está en la lista, utilice "Escriba su propia razón..." en la Otra lista.
 
 
|cffffd000Author: http://www.curse.com/users/slipjack |cffffffff
 
]]
L ["EnableSpy"] = "Habilitar Spy"
L ["EnableSpyDescription"] = "habilita o deshabilita veo tanto ahora como en Inicio de sesión".
L ["EnabledInBattlegrounds"] = "Habilitar Spy en los campos de batalla"
L ["EnabledInBattlegroundsDescription"] = "Habilita o deshabilita Spy cuando estás en un campo de batalla".
L ["EnabledInArenas"] = "Habilitar Spy en arenas"
L ["EnabledInArenasDescription"] = "Habilita o deshabilita Spy cuando estás en un escenario".
L ["EnabledInWintergrasp"] = "Habilitar Spy en zonas de combate del mundo"
L ["EnabledInWintergraspDescription"] = "Habilita o deshabilita Spy cuando estás en zonas de combate mundial como Lago conquista del invierno en Rasganorte".
L ["DisableWhenPVPUnflagged"] = "Deshabilitar Spy cuando no marcados para PVP"
L ["DisableWhenPVPUnflaggedDescription"] = "Habilita o deshabilita Spy dependiendo de su estatus PVP".
 
L ["DisplayOptions"] = "Display"
L ["DisplayOptionsDescription"] = [[[]
Spy puede ser mostrado u oculta automáticamente.
]]
L ["ShowOnDetection"] = "Programa Spy cuando se detectan los jugadores enemigos"
L ["ShowOnDetectionDescription"] = "Poner esto para mostrar la ventana Spy y la lista cercana si está oculto Spy cuando se detectan los jugadores enemigos."
L ["HideSpy"] = "Hide Spy cuando no se detectan jugadores enemigos"
L ["HideSpyDescription"] = "Set para ocultar Spy cuando se muestre la lista cercana y se convierte en vacío. Spy no se ocultará si desactiva manualmente la lista."
L ["LockSpy"] = "Cierre la ventana Spy"
L ["LockSpyDescription"] = "Bloquea la ventana Spy en su lugar para que no se mueve".
L ["InvertSpy"] = "Invertir la ventana Spy"
L ["InvertSpyDescription"] = "Cambia la ventana Spy hacia abajo".
L ["ResizeSpy"] = "Redimensionar automáticamente la ventana de Spy"
L ["ResizeSpyDescription"] = "Set para redimensionar automáticamente la ventana Spy como añadir o eliminar los jugadores enemigos."
L ["TooltipDisplayWinLoss"] = "Mostrar las estadísticas de ganancias y pérdidas en la descripción"
L ["TooltipDisplayWinLossDescription"] = "Set esto para mostrar las estadísticas de ganancias y pérdidas de un jugador en la descripción del jugador".
L ["TooltipDisplayKOSReason"] = "Razones pantalla matar a la vista en la descripción"
L ["TooltipDisplayKOSReasonDescription"] = "Set para mostrar la matanza en razones de vista de un jugador en la descripción del jugador".
L ["TooltipDisplayLastSeen"] = "Datos de pantalla por última vez en la descripción"
L ["TooltipDisplayLastSeenDescription"] = "Set esto para mostrar el último tiempo conocido y la ubicación de un jugador en la descripción del jugador".
 
L ["AlertOptions"] = "Alertas"
L ["AlertOptionsDescription"] = [[[]
Usted puede anunciar los detalles de un encuentro con una charla del canal y controlan cómo Spy le avisa cuando se detectan los jugadores enemigos.
]]
L ["anunciar"] = "anunciar que:"
L ["None"] = "None"
L ["NoneDescription"] = "No anuncian cuando se detectan los jugadores enemigos."
L ["Self"] = "Self"
L ["SelfDescription"] = "Anuncian a sí mismo cuando se detectan los jugadores enemigos."
L ["Party"] = "Party"
L ["PartyDescription"] = "Anunciar a su partido cuando se detectan los jugadores enemigos."
L ["gremio"] = "Gremio"
L ["GuildDescription"] = "Anuncian que su gremio cuando se detectan los jugadores enemigos."
L ["Raid"] = "Raid"
L ["RaidDescription"] = "Anuncian su RAID cuando se detectan los jugadores enemigos."
L ["LocalDefense"] = "Defensa Local"
L ["LocalDefenseDescription"] = "Anunciar al canal Local de defensa cuando se detectan los jugadores enemigos."
L ["OnlyAnnounceKoS"] = "Sólo anunciar los jugadores enemigos que matar a la vista"
L ["OnlyAnnounceKoSDescription"] = "Puesto que sólo anuncian jugadores enemigos que se encuentran en su muerte en lista vista."
L ["WarnOnStealth"] = "Advertir sobre detección de sigilo"
L ["WarnOnStealthDescription"] = "Set para mostrar una advertencia y sonar una alerta cuando un jugador enemigo gana sigilo".
L ["WarnOnKOS"] = "Advertir al matar en la detección de vista"
L ["WarnOnKOSDescription"] = "Set para mostrar una advertencia y sonar una alerta cuando se detecta un enemigo sobre su muerte en lista vista."
L ["WarnOnKOSGuild"] = "Advertir al matar en la detección de gremio vista"
L ["WarnOnKOSGuildDescription"] = "Set para mostrar una advertencia y sonar una alerta cuando se detecta un enemigo en el mismo gremio como alguien de su muerte en lista vista."
L ["DisplayWarningsInErrorsFrame"] = "Mostrar las advertencias en el marco de errores"
L ["DisplayWarningsInErrorsFrameDescription"] = "Set esto utilizar el marco errores para mostrar avisos en lugar de utilizar los marcos de gráficos emergente".
L ["EnableSound"] = "Habilitar las alertas de audio"
L ["EnableSoundDescription"] = "Set para habilitar las alertas de audio cuando se detectan los jugadores enemigos. Diferentes alertas de sonido si un enemigo gana sigilo o si un enemigo está en tu lista de matar en vista."
 
L ["ListOptions"] = "Cerca de lista"
L ["ListOptionsDescription"] = [[[]
Puede configurar cómo Spy agrega y elimina los jugadores enemigos de la lista de cercana.
]]
L ["RemoveUndetected"] = "quitar jugadores enemigos de la lista cercana después:"
L ["1 minuto"] = "1 minuto"
L ["1MinDescription"] = "Eliminar un enemigo que ha sido detectado por durante 1 minuto."
L ["2 minutos"] = "2 minutos"
L ["2MinDescription"] = "Elimina a un enemigo que ha sido detectado por más de 2 minutos".
L ["5min"] = "5 minutos"
L ["5MinDescription"] = "Elimina a un enemigo que ha sido detectado por más de 5 minutos."
L ["10 minutos"] = "diez minutos"
L ["10MinDescription"] = "Elimina a un enemigo que ha sido detectado por más de 10 minutos".
L ["15 minutos"] = "15 minutos"
L ["15MinDescription"] = "Elimina a un enemigo que ha sido detectado por más de 15 minutos".
L ["nunca"] = "Nunca quitar"
L ["NeverDescription"] = "Nunca retire los jugadores enemigos. La lista cercana puede todavía ser eliminada manualmente."
L ["ShowNearbyList"] = "Cambiar a la lista cercana tras la detección de enemigo"
L ["ShowNearbyListDescription"] = "Set para visualizar la lista cercana si no está visible cuando se detectan los jugadores enemigos."
L ["PrioritiseKoS"] = "Kill decidirá sobre los jugadores enemigos vista en la lista cercana"
L ["PrioritiseKoSDescription"] = "Puesto que siempre Mostrar matar jugadores enemigos vista primero en la lista cercana."
 
L ["MinimapOptions"] = "Mapa"
L ["MinimapOptionsDescription"] = [[[]
Para los jugadores que pueden rastrear a humanoides el minimapa puede utilizarse para proporcionar características adicionales.
 
Los jugadores que pueden rastrear a humanoides son cazadores, los druidas y aquellos que han recibido la capacidad a través de otros medios tales como comer un filete de huargo ennegrecido.
]]
L ["MinimapTracking"] = "Activar el seguimiento de minimapa"
L ["MinimapTrackingDescription"] = "Set este control para activar el minimapa de seguimiento y detección. Los jugadores enemigos conocidos detectados en el minimapa se añadirá a la lista cercana."
L ["MinimapDetails"] = "Mostrar datos de nivel o clase en tooltips"
L ["MinimapDetailsDescription"] = "Set para actualizar la información sobre herramientas del mapa para que se muestran detalles de nivel/clase junto a nombres de enemigos".
L ["DisplayOnMap"] = "Mostrar enemigo ubicación en mapa"
L ["DisplayOnMapDescription"] = "poner esto para mostrar en el mapa del mundo y minimapa la localización de enemigos detectados por otros usuarios de Spy en su partido, raid y Gremio".
L["SwitchToZone"] = "Switch to current zone map on enemy detection"
L["SwitchToZoneDescription"] = "If the World Map is open this will change the map to the players current zone map when enemies are detected."
L ["MapDisplayLimit"] = "límite muestra iconos del mapa para:"
L ["LimitNone"] = "En todas partes"
L ["LimitNoneDescription"] = "Muestra todos detectada enemigos en el mapa independientemente de su ubicación actual".
L ["LimitSameZone"] = "Misma zona"
L ["LimitSameZoneDescription"] = "muestra sólo detecta enemigos en el mapa si estás en la misma zona".
L ["LimitSameContinent"] = "Mismo continente"
L ["LimitSameContinentDescription"] = "muestra sólo detecta enemigos en el mapa si usted está en el mismo continente."
 
L ["DataOptions"] = "Gestión de datos"
L ["DataOptionsDescription"] = [[[]
Puede configurar cómo Spy mantiene y recoge sus datos.
]]
L ["PurgeData"] = "purga sin ser detectado datos del jugador enemigo después:"
L ["un día"] = "día 1"
L ["OneDayDescription"] = "Purgar los datos para los jugadores enemigos que han sido detectados por un día".
L ["FiveDays"] = "5 días"
L ["FiveDaysDescription"] = "Purgar los datos para los jugadores enemigos que han sido detectados durante 5 días".
L ["TenDays"] = "10 días"
L ["TenDaysDescription"] = "Purgar los datos para los jugadores enemigos que han sido detectados durante 10 días".
L ["ThirtyDays"] = "30 días"
L ["ThirtyDaysDescription"] = "Purgar los datos para los jugadores enemigos que han sido detectados por 30 días".
L ["SixtyDays"] = "60 días"
L ["SixtyDaysDescription"] = "Purgar los datos para los jugadores enemigos que han sido detectados por 60 días".
L ["NinetyDays"] = "90 días"
L ["NinetyDaysDescription"] = "Purgar los datos para los jugadores enemigos que han sido detectados durante 90 días".
L ["ShareData"] = "Compartir datos con otros usuarios de addon Spy"
L ["ShareDataDescription"] = "Set para compartir los detalles de tus enemigo encuentros con otros usuarios de Spy en su partido, raid y gremio".
L ["UseData"] = "Usar datos de otros usuarios de addon Spy"
L ["UseDataDescription"] = [[Set para usar los datos recogidos por otros usuarios de Spy en su partido, raid y Gremio.
 
Si otro usuario Spy detecta un enemigo entonces ese jugador enemigo se añadirán a la lista de cerca si hay espacio.
]]
L ["ShareKOSBetweenCharacters"] = "Share Kill en reproductores de vista entre los personajes"
L ["ShareKOSBetweenCharactersDescription"] = "Set para compartir los jugadores marque como matar a la vista entre otros personajes que juega en el mismo servidor y facción".
 
L ["SlashCommand"] = "Barra de comandos"
L ["SpySlashDescription"] = "estos botones ejecutan las mismas funciones que los de la barra comando /spy"
L ["Enable"] = "Enable"
L ["EnableDescription"] = "Permite Spy y muestra la ventana principal."
L ["Reset"] = "Reset"
L ["ResetDescription"] = "Restablece la posición y el aspecto de la ventana principal."
L ["Config"] = "Config"
L ["ConfigDescription"] = "Abrir la ventana de configuración de interfaz Addons para Spy."
L ["KOS"] = "KOS"
L ["KOSDescription"] = "Agregar o quitar un jugador desde la matanza en lista vista."
L ["Ignore"] = "Ignore"
L ["IgnoreDescription"] = "Agregar o quitar un jugador de la lista de ignorar."
 
--Listas
L ["Nearby"] "Cerca"
L ["LastHour"] = "Última hora"
L ["Ignore"] = "Ignorar"
L ["KillOnSight"] = "Matar a la vista"
 
--Stats
--L["Last"] = "Last"
L["Time"] = "Time"	
L["List"] = "List"	
L["Show Only"] = "Show Only"
L["Won/Lost"] = "Won/Lost"
L["Reason"] = "Reason"	 
L["HonorKills"] = "Honor Kills"
L["PvPDeatchs"] = "PvP Deaths"

--++ Descripciones de clase
L ["DEATHKNIGHT"] = "caballero de la muerte"
L ["DRUID"] = "Druida"
L ["HUNTER"] = "Cazador"
L ["MAGE"] = "Mago"
L ["MONK"] = "Monk"
L ["PALADIN"] = "Paladín"
L ["PRIEST"] = "Sacerdote"
L ["ROGUE"] = "Pícaro"
L ["SHAMAN"] = "Shaman"
L ["WARLOCK"] = "Brujo"
L ["WARRIOR"] = "Guerrero"
L ["UNKNOWN"] = "Desconocido"
 
: Habilidades sigilosa
L ["Stealth"] = "Stealth"
L ["Acechar"] = "Acechar"
 
--Nombres de canales
L ["LocalDefenseChannelName"] = "LocalDefense"
 
--++ Los códigos de color minimapa
L ["MinimapClassTextDEATHKNIGHT"] = "|cffc41e3a"
L ["MinimapClassTextDRUID"] = "|cffff7c0a"
L ["MinimapClassTextHUNTER"] = "|cffaad372"
L ["MinimapClassTextMAGE"] = "|cff68ccef"
L ["MinimapClassTextMONK"] = "|cff00ff96"
L ["MinimapClassTextPALADIN"] = "|cfff48cba"
L ["MinimapClassTextPRIEST"] = "|cffffffff"
L ["MinimapClassTextROGUE"] = "|cfffff468"
L ["MinimapClassTextSHAMAN"] = "|cff2359ff"
L ["MinimapClassTextWARLOCK"] = "|cff9382c9"
L ["MinimapClassTextWARRIOR"] = "|cffc69b6d"
L ["MinimapClassTextUNKNOWN"] = "|cff191919"
L ["MinimapGuildText"] = "|cffffffff"
 
--Los mensajes de salida
L ["AlertStealthTitle"] = "Jugador en sigilo detectado!"
L ["AlertKOSTitle"] = "Matar el jugador vista detectado!"
L ["AlertKOSGuildTitle"] = "Mata en gremio de jugador vista detectado!"
L ["AlertTitle_kosaway"] = "mata On Sight jugador situado por"
L ["AlertTitle_kosguildaway"] = "gremio jugador matar On Sight ubicado por"
L ["StealthWarning"] = "|cff9933ffStealthed jugador detectado: |cffffffff"
L ["KOSWarning"] = "|cffff0000Kill reproductor de vista detectados: |cffffffff"
L ["KOSGuildWarning"] = "|cffff0000Kill en gremio de jugador vista detectado: |cffffffff"
L ["SpySignatureColored"] = "|cff9933ff [Spy]"
L ["PlayerDetectedColored"] = "jugador detectado: |cffffffff"
L ["PlayersDetectedColored"] = "jugadores detectados: |cffffffff"
L ["KillOnSightDetectedColored"] = "matar el jugador vista detectada: |cffffffff"
L ["PlayerAddedToIgnoreColored"] = "jugador añadido a la lista de ignorar: |cffffffff"
L ["PlayerRemovedFromIgnoreColored"] = "jugador eliminado de la lista de ignorar: |cffffffff"
L ["PlayerAddedToKOSColored"] = "jugador añadido a matar en lista vista: |cffffffff"
L ["PlayerRemovedFromKOSColored"] = "jugador eliminado de matar en lista vista: |cffffffff"
L ["PlayerDetected"] = "[Spy] reproductor detectada:"
L ["KillOnSightDetected"] = "jugador matar [Spy] On Sight detectada:"
L ["nivel"] = "Llano"
L ["LastSeen"] = "Visto por última vez"
L ["LessThanOneMinuteAgo"] = "hace menos de un minuto"
L ["MinutesAgo"] = "minutos"
L ["creiamos"] = "horas"
L ["hace días"] = "hace días"
L ["cerrar"] = "Cerrar"
L ["CloseDescription"] = "|cffffffffHides la ventana Spy. Por defecto mostrará otra vez cuando se detecta el siguiente jugador enemigo."
L ["Left/Right"] = "Left/Right"
L ["izquierda/RightDescription"] = "|cffffffffNavigates entre cercana, última hora, ignorar y matar en las listas de la vista."
L ["Clear"] = "Clear"
L ["cleardescripción"] = "|cffffffffClears la lista de jugadores que han sido detectados. CTRL clic será habilitar/deshabilitar la Spy mientras muestra".
L ["NearbyCount"] = "Cercanas"Conteo"
L ["NearbyCountDescription"] = "|cffffffffSends la cuenta de los jugadores cercanos a charlar".
L ["AddToIgnoreList"] = "Añadir a la lista de ignorar"
L ["AddToKOSList"] = "Add to Kill en lista vista"
L ["RemoveFromIgnoreList"] = "Eliminar de la lista de ignorar"
L ["RemoveFromKOSList"] = "Retire de matar en lista vista"
L ["AnnounceDropDownMenu"] = "Anunciar"
L ["KOSReasonDropDownMenu"] = "Set Kill en razón de la vista"
L ["PartyDropDownMenu"] = "Party"
L ["RaidDropDownMenu"] = "Raid"
L ["GuildDropDownMenu"] = "Gremio"
L ["LocalDefenseDropDownMenu"] = "Defensa Local"
L ["Player"] = "(jugador)"
L ["KOSReason"] = "Matar a la vista"
L ["KOSReasonIndent"] = ""
L ["KOSReasonOther"] = "Escriba su propia razón..."
L ["KOSReasonClear"] = "Clear"
L ["StatsWins"] = "|cff40ff00Wins:"
L ["StatsSeparator"] = ""
L ["StatsLoses"] = "|cff0070ddLoses:"
L ["ubicado"] = "situado:"
L ["yardas"] = "m"
 
--Spy_KOSReasonListLength = 13
Spy_KOSReasonListLength = 6
Spy_KOSReasonList = {
[1] = {
["title"] = "Empezar combate";
["contenido"] = {
--"Me detuvo,"
--"Siempre me ataca a la vista",
"Me atacó sin motivo",
"Me atacó en un PNJ,"--++
"Me atacaron mientras luchaba NPCs",
"Me atacaron mientras estaba entrar/salir una instancia",
"Me atacaron mientras estaba AFK",
--"Me atacaron mientras yo estaba en una batalla para mascotas",--++
"Me atacaron mientras estaba montado/volando",
"Me atacaron mientras tenía poca salud/maná",
--"Aplanó con un grupo de enemigos",
--"No ataca sin respaldo",
--"Se atrevió a desafiarme",
                                };
                },
[2] = {
["title"] = "Estilo de combate";
["contenido"] = {
"Me detuvo"
"Siempre me ataca a la vista",
"Me mató con un personaje de nivel superior",--++
"Aplanó con un grupo de enemigos",
"No ataca sin respaldo",
"Siempre pide ayuda",
--"Me empujó a un precipicio",
--"Utiliza trucos de ingeniería",
"Usos demasiado control de multitudes",
--"Spams una habilidad todo el tiempo",
--"Me forzó a tomar daño durabilidad",
--"Me mató y escapó de mis amigos",
--"Ran lejos entonces me detuvo",
--"Siempre se las arregla para escapar",
--"Hogares de burbuja para escapar",
--"Logra permanecer en el rango de cuerpo a cuerpo",
--"Logra alojarte en Kite gama",
--"Absorbe mucho daño",
--"Demasiado sana",
--"DPS es demasiado",
                                };
                },
-- [3] = {
--["title"] = "Conducta General";
--["contenido"] = {
--"Molesto",
--"Grosería",
--"Cobardía",
--"Arrogancia",
--"Exceso de confianza",
--"No confiables",
--"Emociones demasiado",
--"Me acosó / amigos",
--"Pretende ser buena",
--"Emotes 'no va a pasar'",
--"Adiós las ondas con poca vida",
--"Trató de mantenerme con una ola",
--"Realizados actos malos sobre mi cadáver",
--"Se rieron de mí",
--"Escupieron",
--                             };
--             },
[3] = {
["title"] = "Camping";
["contenido"] = {
"Me acampados",
"Acampado una alternativa",
"Acampaban lowbies",
"Acampado de sigilo",
"Los miembros del gremio acampados",
"Acampado juegos NPCs y objetivos",
"Acampado un ciudad/del sitio",
--"Llamado en ayuda al campamento me",
--"Hecho una pesadilla de nivelación",
--"Me obligó a salir",
--"No luchar contra mi principal",
                                };
                },
[4] = {
["title"] = "Questing";
["contenido"] = {
"Me atacaron mientras yo estaba buscada",
"Me atacó después ayudé con una misión",
"Interfirió con los objetivos de la misión",
"Comenzó una búsqueda que quería hacer",
Muertos CPN de mi facción,
Muertos una búsqueda NPC,
                                };
                },
[5] = {
["title"] = "Robar recursos";
["contenido"] = {
"Las hierbas recogidas quería",
"Minerales reunidos quería",
"Los recursos reunidos quería",
--"Gas extraído de una nube que quería",
"Me mató y robó mi destino/rara NPC"
"Mi mata de piel",
"Salvar mi mata",
"Pescaban en mi piscina",
                                };
                },
--[[ [7] = {
["title"] = "Campos de batalla";
["contenido"] = {
"Siempre los cadáveres saquea",
"Corredor de la bandera muy buena",
"Backcaps banderas o bases",
"Stealth tapas banderas o bases",
"Me mató y tomó la bandera",
"Interfiere con los objetivos del campo de batalla",
"Tomó un power-up que quería",
"Tanque forzado a perder agro",
"Causó un trapo",
"Destruye el asedio",
"Gotas de bombas",
"Desarma bombas",
"Bombardero del miedo",
                                };
                },
[8] = {
["title"] = "Vida Real";
["contenido"] = {
"Amigo en la vida real",
"El enemigo en la vida real",
"Se propaga rumores sobre mí",
"Se queja en los foros",
"Spy para la otra facción",
"Traidor a mi facción",
"Incumplido un acuerdo",
"Nub pretencioso",
"Otro sabelotodo",
"Otro Fortachón llegaste tarde",
"Cruz facción hablador de basura",
                                };
                },
[9] = {
["title"] = "Dificultad";
["contenido"] = {
"Imposible de matar",
"Gana la mayor parte del tiempo",
"Parece un partido justo",
"Pierde la mayor parte del tiempo",
"Divertido matar",
"Fácil de honor",
                                };
                },
[10] = {
["title"] = "Raza";
["contenido"] = {
"Odio la carrera del jugador",
"Elfos de sangre son narcisistas",
"Los Draenei son calamares fangoso espacio",
"Los enanos son doorstops peludos cortos",
"Los duendes vendería a sus madres para obtener ganancias",
"Los gnomos son en un jardín",
"Los seres humanos son entrometidos justos",
"Elfos de la noche abrazan demasiados árboles",
"Los orcos son bárbaros belicista",
"Pandarens sigue diciéndome que más despacio",--++
"Tauren debería ser mi hamburguesa",
"Los trolls deberían quedarse en los foros del web",
"Undead son abominaciones antinaturales",
"Huargen tiene demasiadas pulgas",
                                };
                },
[11] = {
["title"] = "Class";
["contenido"] = {
"Odio de clase del jugador",
"Caballeros de la muerte se superó",
"Los druidas son animales sucios",
"Los cazadores son modo fácil",
"Magos son ilusos intelectos",
"Los monjes chi es débil",--++
"Los paladines son tontos moralista",
"Los sacerdotes son predicadores piadosos",
"Los pícaros no tienen honor",
"Los chamanes hablan con los animales imaginarios",
"Los brujos son nigrománticos sádicos",
"Guerreros tienen problemas de ira",
                                };
                },
[12] = {
["title"] = "Nombre";
["contenido"] = {
"Tiene un nombre ridículo",
"Nombre pretencioso",
"Variante de Legolas",
"El nombre tiene caracteres extraños",
"Nombre del gremio es ridícula",
"El nombre del gremio usa sólo letras mayúsculas",
"Nombre del gremio utiliza mayúsculas y espacios",
"Nombre del gremio afirma que odian a mi facción",
                                };
                },]]--
-- [13] = {
[6] = {
["title"] = "Otro";
["contenido"] = {
--"Karma",
--"Rojo está muerto",
--"Porque",
--"Falla en PvP",
"Marcado para PvP",
--"No quiere PvP",
--"Los desechos tanto nuestro tiempo",
--"Este jugador es un noob",
--"¡ Odio este jugador",
--"No nivel lo suficientemente rápido",
"Me empujó a un precipicio",
"Utiliza trucos de ingeniería",
"Siempre se las arregla escapar",
"Utiliza elementos y habilidades para escapar",
"Hazañas mecánica de juego",
--"Presunto hacker",
--"Agricultor",
--"Otros..."
"Escriba su propia razón...",
                                };
                },
}
 
StaticPopupDialogs ["Spy_SetKOSReasonOther"] = {
	preferredIndex = STATICPOPUPS_NUMDIALOGS,--http://forums.wowace.com/showthread.php?p=320956
	text = "Enter the Kill en razón de la vista de % s:",
	button1 = "Set",
	button2 = "Cancelar",
	timeout = 20,
	hasEditBox = 1,
	whileDead = 1,
	hideOnEscape = 1,
	OnShow = function(self)
		self.editBox:SetText("");
	end,
		OnAccept = function(self)
		local reason = self.editBox:GetText()
--		Spy:SetKOSReason(self.playerName, "Other...", reason)
		Spy:SetKOSReason(self.playerName, "Escriba su propia razón...", reason)
	end,
};
 
Spy_AbilityList = {
 
-----------------------------------------------------------
--Permite una estimación de la raza, la clase y el nivel de un
--jugador ser determinado de qué habilidades se observan
--en el registro de combate.
-----------------------------------------------------------
 
--++ Racials ++
["Stoneform"] = {race = "Dwarf", level = 1},
["Escapista"] = {race = "Gnome", level = 1},
["Every Man for Himself"] = {race = "Human", level = 1},
["Fusión de las sombras"] = {race = "Night Elf", level = 1},
["Regalo de los Naaru"] = {race = "Draenei", level = 1},
["Darkflight"] = {race = "Worgen", level = 1},
["Dos formas"] = {race = "Worgen", level = 1},
["Corriendo salvaje"] = {race = "Worgen", level = 1},
["Furia sangrienta"] = {race = "Orc", level = 1},
["Guerra Stomp"] = {race = "Tauren", level = 1},
["Rabiar"] = {race = "Troll", level = 1},
["Voluntad de los Renegados"] = {race = "Undeead", level = 1},
["Canibalizar"] = {race = "Undead", level = 1},
["Torrente Arcano"] = {race = "Blood Elf", level = 1},
["Rocket Jump"] = {race = "Goblin", level = 1},
["Andanada de cohetes"] = {race = "Goblin", level = 1},
["Pack duende"] = {race = "Goblin", level = 1},
["Palma temblorosos"] = {race = "Pandaren", level = 1},
 
--++ Las habilidades del caballero de la muerte ++
["Peste de sangre"] = {class = "DEATHKNIGHT", level = 55,},
["Sangre Strike"] = {class = "DEATHKNIGHT", level = 55,},
["Espiral de la muerte"] = {class = "DEATHKNIGHT", level = 55,}, 
["Puerta de la muerte"] = {class = "DEATHKNIGHT", level = 55,}, 
["Death Grip"] = {class = "DEATHKNIGHT", level = 55,},
["Fiebre de escarcha"] = {class = "DEATHKNIGHT", level = 55,},
["Presencia de escarcha"] = {class = "DEATHKNIGHT", level = 55,}, 
["Toque helado"] = {class = "DEATHKNIGHT", level = 55,}, 
["Plaga huelga"] = {class = "DEATHKNIGHT", level = 55,}, 
["Runas"] = {class = "DEATHKNIGHT", level = 55,}, 
["Hervor de sangre"] = {class = "DEATHKNIGHT", level = 56,},
["La muerte del Strike"] = {class = "DEATHKNIGHT", level = 56,},
["Pestilencia"] = {class = "DEATHKNIGHT", level = 56,}, 
["Levantar a muerto"] = {class = "DEATHKNIGHT", level = 56,}, 
["Presencia de sangre"] = {class = "DEATHKNIGHT", level = 57,},
["Mente Freeze"] = {class = "DEATHKNIGHT", level = 57,}, 
["Cadenas de hielo"] = {class = "DEATHKNIGHT", level = 58,}, 
["Estrangular"] = {class = "DEATHKNIGHT", level = 58,}, 
["Muerte y descomposición"] = {class = "DEATHKNIGHT", level = 60,}, 
["Sobre un caballo pálido"] = {class = "DEATHKNIGHT", level = 61,}, 
["Entereza"] = {class = "DEATHKNIGHT", level = 62,},
["Presencia profana"] = {class = "DEATHKNIGHT", level = 64,},
["Cuerno de invierno"] = {class = "DEATHKNIGHT", level = 65,}, 
["Path of Frost"] = {class = "DEATHKNIGHT", level = 66,}, 
["Golpe de escarcha"] = {class = "DEATHKNIGHT", level = 69,},
["Control Undead"] = {class = "DEATHKNIGHT", level = 69,}, 
["Levantar a aliado"] = {class = "DEATHKNIGHT", level = 72,}, 
["Potenciar arma de runas"] = {class = "DEATHKNIGHT", level = 76,}, 
["Army of the Dead"] = {class = "DEATHKNIGHT", level = 80,}, 
["Outbreak"] = {class = "DEATHKNIGHT", level = 81,}, 
["Huelga necrótica"] = {class = "DEATHKNIGHT", level = 83,}, 
["Simulacro oscuro"] = {class = "DEATHKNIGHT", level = 85,}, 
["Soul Reaper"] = {class = "DEATHKNIGHT", level = 87,}, 
["Runa de escarcha"] = {class = "DEATHKNIGHT", level = 55,},
["Runa del cruzado caído"] = {class = "DEATHKNIGHT", level = 70,}, 
["Rune de necrófago"] = {class = "DEATHKNIGHT", level = 60,},
["Runa de cuchilla de"] = {class = "DEATHKNIGHT", level = 55,},
["Rune de hechizos"] = {class = "DEATHKNIGHT", level = 57,},
["Rune of Spellshattering"] = {class = "DEATHKNIGHT", level = 57,},
["Rune de runas"] = {class = "DEATHKNIGHT", level = 63,},
["Rune of Swordshattering"] = {class = "DEATHKNIGHT", level = 63,},
["Rune del caparazón nerubianos"] = {class = "DEATHKNIGHT", level = 72,},
["Runa de la gárgola Stoneskin"] = {class = "DEATHKNIGHT", level = 72,},
--++ Glifo habilidades ++
["Explosión de cadáver"] = {class = "DEATHKNIGHT", level = 25,}, 
--++ Caballero de la muerte especialización ++
--++ Blood/Frost/Unholy ++
["Soul Reaper"] = 			{ class = "DEATHKNIGHT", level = 87, },
--++ Frost/profano ++
["Aura impía"] = {class = "DEATHKNIGHT", level = 60,},
--++ Sangre ++
["Ritos de sangre"] = {class = "DEATHKNIGHT", level = 55,}, 
["Venganza"] = {class = "DEATHKNIGHT", level = 55,}, 
["Veterano de la tercera guerra"] = {class = "DEATHKNIGHT", level = 55,}, 
["Comando de oscuro"] = {class = "DEATHKNIGHT", level = 58,}, 
["Corazón huelga"] = {class = "DEATHKNIGHT", level = 60,}, 
["Olor de la sangre"] = {class = "DEATHKNIGHT", level = 62,}, 
["Presencia de sangre mejorado"] = {class = "DEATHKNIGHT", level = 64,}, 
["Rune Tap"] = {class = "DEATHKNIGHT", level = 64,}, 
["Golpe con runa"] = {class = "DEATHKNIGHT", level = 65,}, 
["Parásito de la sangre"] = {class = "DEATHKNIGHT", level = 66,}, 
["Escarlatina"] = {class = "DEATHKNIGHT", level = 68,}, 
["Voluntad de la necrópolis"] = {class = "DEATHKNIGHT", level = 70,}, 
["Fortaleza sanguina"] = {class = "DEATHKNIGHT", level = 72,}, 
["Arma de runas bailando"] = {class = "DEATHKNIGHT", level = 74,}, 
--["Ripsote"] = {class = "DEATHKNIGHT", level = 76,},--añadió en 5.4 parche pero no activado desde guerreros también tienen esta capacidad 
["Sangre vampírica"] = {class = "DEATHKNIGHT", level = 76,}, 
["Escudo óseo"] = {class = "DEATHKNIGHT", level = 78,},
["Escudo de sangre"] = {class = "DEATHKNIGHT", level = 80,},
["Crimson azote"] = {class = "DEATHKNIGHT", level = 84,},
--++ Hielo ++ 
["Sangre del Norte"] = {class = "DEATHKNIGHT", level = 55,}, 
["Golpe de escarcha"] = {class = "DEATHKNIGHT", level = 55,}, 
["Blast gritando"] = {class = "DEATHKNIGHT", level = 55,}, 
["Garras heladas"] = {class = "DEATHKNIGHT", level = 55,}, 
["Borrar"] = {class = "DEATHKNIGHT", level = 58,}, 
["Máquina de matar"] = {class = "DEATHKNIGHT", level = 63,}, 
["Presencia de escarcha mejorada"] = {class = "DEATHKNIGHT", level = 65,}, 
["Huesos quebradizos"] = {class = "DEATHKNIGHT", level = 66,}, 
["Pilar de las heladas"] = {class = "DEATHKNIGHT", level = 68,}, 
["Rime"] = {class = "DEATHKNIGHT", level = 70,}, 
["Tal vez de las basuras congeladas"] = {class = "DEATHKNIGHT", level = 74,}, 
["Amenaza de Thassarian"] = {class = "DEATHKNIGHT", level = 74,}, 
["Corazón congelado"] = {class = "DEATHKNIGHT", level = 80,}, 
--++ Profano ++ 
["Maestro de Ghouls"] = {class = "DEATHKNIGHT", level = 55,}, 
["Cosechando"] = {class = "DEATHKNIGHT", level = 55,}, 
["Profano puede"] = {class = "DEATHKNIGHT", level = 55,}, 
["Plaga huelga"] = {class = "DEATHKNIGHT", level = 58,}, 
["En la sombrainfusión"] = {class = "DEATHKNIGHT", level = 60,}, 
["Huelga festering"] = {class = "DEATHKNIGHT", level = 62,}, 
["Muerte súbita"] = {class = "DEATHKNIGHT", level = 64,}, 
["Unholy Frenzy"] = {class = "DEATHKNIGHT", level = 66,}, 
["Ébano Plaguebringer"] = {class = "DEATHKNIGHT", level = 68,}, 
["Transformación oscura"] = {class = "DEATHKNIGHT", level = 70,}, 
["Invocar gárgola"] = {class = "DEATHKNIGHT", level = 74,}, 
["Mejorado presencia profana"] = {class = "DEATHKNIGHT", level = 75,}, 
["Dreadblade"] = {class = "DEATHKNIGHT", level = 80,}, 
--++ Caballero de la muerte talentos ++
["Sangre rodando"] = {class = "DEATHKNIGHT", level = 56,}, 
["Plaga sanguijuela"] = {class = "DEATHKNIGHT", level = 56,}, 
["Añublo profano"] = {class = "DEATHKNIGHT", level = 56,}, 
["Lichborne"] = {class = "DEATHKNIGHT", level = 57,}, 
["Zona antimagia"] = {class = "DEATHKNIGHT", level = 57,}, 
["El Purgatorio"] = {class = "DEATHKNIGHT", level = 57,}, 
["Avance de la muerte"] = {class = "DEATHKNIGHT", level = 58,}, 
["Sabañones"] = {class = "DEATHKNIGHT", level = 58,}, 
["Asfixiar"] = {class = "DEATHKNIGHT", level = 58,}, 
["Pacto de muerte"] = {class = "DEATHKNIGHT", level = 60,}, 
["Muerte sifón"] = {class = "DEATHKNIGHT", level = 60,}, 
["Conversión"] = {class = "DEATHKNIGHT", level = 60,}, 
["Sangre Tap"] = {class = "DEATHKNIGHT", level = 75,}, 
["Poder rúnico"] = {class = "DEATHKNIGHT", level = 75,}, 
["Corrupción rúnica"] = {class = "DEATHKNIGHT", level = 75,}, 
["Del Gorefiend asimiento"] = {class = "DEATHKNIGHT", level = 90,}, 
["Invierno sin remordimientos"] = {class = "DEATHKNIGHT", level = 90,}, 
["Suelo profanado"] = {class = "DEATHKNIGHT", level = 90,}, 
 
--++ Druida habilidades ++
["La ira"] = {class = "DRUID", level = 1}, 
["Fuego lunar"] = {class = "DRUID", level = 3},
["Rejuvenecimiento"] = {class = "DRUID", level = 4,},
["Gato forma"] = {class = "DRUID", level = 6},
["Gracia felina"] = {class = "DRUID", level = 6},
["Destrozar"] = {class = "DRUID", level = 6},
["Acechar"] = {class = "DRUID", level = 6},
["Rastrillo"] = {class = "DRUID", level = 6},
["Mordedura feroz"] = {class = "DRUID", level = 6},
["Dar forma"] = {class = "DRUID", level = 8,},
["Gruñido"] = {class = "DRUID", level = 8,},
["Maul"] = {class = "DRUID", level = 8,},
["Augurio"] = {class = "DRUID", level = 10,},
["Raíces enredadoras"] = {class = "DRUID", level = 10,},
["Revive"] = {class = "DRUID", level = 12,},
["Teleport: claro de luna"] = {class = "DRUID", level = 14,},
["Forma de viajar"] = {class = "DRUID", level = 16,},
["Forma acuática"] = {class = "DRUID", level = 18,},
["Devastar!"] = {class = "DRUID", level = 22,},
["Swipe"] = {class = "DRUID", level = 22,}, 
["Dash"] = {class = "DRUID", level = 24,},
["Toque sanador"] = {class = "DRUID", level = 26,},
["Fuego feérico"] = {class = "DRUID", level = 28,},
["Thrash"] = {class = "DRUID", level = 28,},
["Primal Fury"] = {class = "DRUID", level = 30,},
["Pounce"] = {class = "DRUID", level = 32,},
["Rastrear humanoides"] = {class = "DRUID", level = 36,},
["Lacerar"] = {class = "DRUID", level = 38,},
["Tormenta astral"] = {class = "DRUID", level = 42,},
["Huracán"] = {class = "DRUID", level = 42,},
["Corteza"] = {class = "DRUID", level = 44,},
["Trabazón con la naturaleza"] = {class = "DRUID", level = 52,},
["Estimular"] = {class = "DRUID", level = 54,},
["Rebirth"] = {class = "DRUID", level = 56,},
["Vuelo forma"] = {class = "DRUID", level = 58,},
["Calmar"] = {class = "DRUID", level = 60,},
["Mark of the Wild"] = {class = "DRUID", level = 62,},
["Hibernar"] = {class = "DRUID", level = 66,},
["Regeneración frenética"] = {class = "DRUID", level = 68,},
["Swift vuelo forma"] = {class = "DRUID", level = 70,},
["Poderío de Ursoc"] = {class = "DRUID", level = 72,},
["La tranquilidad"] = {class = "DRUID", level = 74,},
["Ciclón"] = {class = "DRUID", level = 78,},
["Mutilar"] = {class = "DRUID", level = 82,},
["Rugido de estampida"] = {class = "DRUID", level = 84,},
["Simbiosis"] = {class = "DRUID", level = 87,}, 
--++ Glifo habilidades ++
["Encantar criatura Woodland"] = {class = "DRUID", level = 25,},
["Formulario de ENT"] = {class = "DRUID", level = 25,}, 
--++ DRUID especialización ++
--++ Balance/restauración ++
["Insight natural"] = {class = "DRUID", level = 10,},
["Presteza de la naturaleza"] = {class ="DRUID", level = 30,}, 
["Instinto asesino"] = {class = "DRUID", level = 34,},
["Setas"] = {class = "DRUID", level = 84,},
--++ Balance/salvaje/tutor ++
["Eliminar la corrupción"] = {class = "DRUID", level = 22,},
--++ Salvaje/tutor ++
["Rip"] = {class = "DRUID", level = 20,},
["Nutriendo el instinto"] = {class = "DRUID", level = 34,},
["Heridas infectadas"] = {class = "DRUID", level = 40,},
["Leader of the Pack"] = {class = "DRUID", level = 46,},
["Locos"] = {class = "DRUID", level = 48,},
["Arrasan"] = {class = "DRUID", level = 54,},
["Instinto de supervivencia"] = {class = "DRUID", level = 56,},
["Skull Bash"] = {class = "DRUID", level = 64,},
--++ Salvaje/recuperación ++
["Augurio de claridad"] = {class = "DRUID", level = 38,},
--++ Balance ++
["Equilibrio de poder"] = {class = "DRUID", level = 10,},
["Starfire"] = {class = "DRUID", level = 10,},
["Oleada"] = {class = "DRUID", level = 12,},
["Lechúcico"] = {class = "DRUID", level = 16,},
["Sunfire"] = {class = "DRUID", level = 18,},
["Comunión astral"] = {class = "DRUID", level = 20,},
["Estrellas fugaces"] = {class = "DRUID", level = 26,},
["Rayo solar"] = {class = "DRUID", level = 28,},
["Euforia"] = {class = "DRUID", level = 38,},
["Frenesí de lechúcicos lunares"] = {class = "DRUID", level = 48,},
["Alineación Celeste"] = {class = "DRUID", level = 68,},
["Starfall"] = {class = "DRUID", level = 76,},
["Eclipse Total"] = {class = "DRUID", level = 80,},
["Ducha lunar"] = {class = "DRUID", level = 82,},
["Setas: detonar"] = {class = "DRUID", level = 84,},
--++ Feral ++
["La furia del tigre"] = {class = "DRUID", level = 10,},
["Purgar"] = {class = "DRUID", level = 16,},
["Savage Roar"] = {class = "DRUID", level = 18,},
["Rapidez depredadora"] = {class = "DRUID", level = 26,},
["Maquinilla de afeitar garras"] = {class = "DRUID", level = 80,},
--++ Guardian ++ 
["Defensa salvaje"] = {class = "DRUID", level = 10,},
["Venganza"] = {class = "DRUID", level = 10,},
["Piel gruesa"] = {class = "DRUID", level = 14,},
["Abrazo de oso"] = {class = "DRUID", level = 18,},
["Dientes y garras"] = {class = "DRUID", level = 32,},
["Enfurecidos"] = {class = "DRUID", level = 76,},
["Guardián de la naturaleza"] = {class = "DRUID", level = 80,},
--++ Restauración ++ 
["Naturalista"] = {class = "DRUID", level = 10,},
["Presto"] = {class = "DRUID", level = 10,},
["Nutrir"] = {class = "DRUID", level = 12,},
["Meditación"] = {class = "DRUID", level = 14,},
["Enfoque de la naturaleza"] = {class = "DRUID", level = 16,},
["Rebrote"] = {class = "DRUID", level = 18,},
["De la naturaleza cura"] = {class = "DRUID", level = 22,},
["Semilla de vida"] = {class = "DRUID", level = 28,},
["Flor"] = {class = "DRUID", level = 36,},
["Swift rejuvenecimiento"] = {class = "DRUID", level = 46,},
["Ironbark"] = {class = "DRUID", level = 64,},
["Crecimiento salvaje"] = {class = "DRUID", level = 76,},
["Armonía"] = {class = "DRUID", level = 80,},
["Regalo de Malfurion"] = {class = "DRUID", level = 82,},
["Setas: Bloom"] = {class = "DRUID", level = 84,},
["Génesis"] = {class = "DRUID", level = 88,}, 
--++ Talentos druida ++
["Presteza felina"] = {class = "DRUID", level = 15,},
["Displacer Beast"] = {class = "DRUID", level = 15,},
["Carga de salvaje"] = {class = "DRUID", level = 15,}, 
["Regalo de Ysera"] = {class = "DRUID", level = 30,},
["Renovación"] = {class = "DRUID", level = 30,},
["Cenarion Ward"] = {class = "DRUID", level = 30,}, 
["Enjambre faerie"] = {class = "DRUID", level = 45,},
["Enredo de masa"] = {class = "DRUID", level = 45,},
["Tifón"] = {class = "DRUID", level = 45,}, 
["El alma del bosque"] = {class = "DRUID", level = 60,},
["Encarnación"] = {class = "DRUID", level = 60,},
["Fuerza de la naturaleza"] = {class = "DRUID", level = 60,},
["Desorientar rugido"] = {class = "DRUID", level = 75,},
["Vórtice de Ursol"] = {class = "DRUID", level = 75,},
["Mighty Bash"] = {class = "DRUID", level = 75,}, 
["Corazón salvaje"] = {class = "DRUID", level = 90,},
["El sueño de Cenarius"] = {class = "DRUID", level = 90,},
["Vigilia de la naturaleza"] = {class = "DRUID", level = 90,}, 
 
--++ Cazador habilidades ++
["Disparo arcano"] = {class = "HUNTER", level = 1},
["Auto golpe"] = {class = "HUNTER", level = 1},
["Llamada Pet 1"] = {class = "HUNTER", level = 1},
["Revive Pet"] = {class = "HUNTER", level = 1},
["Steady Shot"] = {class = "HUNTER", level = 3},
["Tracking"] = {class = "HUNTER", level = 4,},
["Concussive Shot"] = {class = "HUNTER", level = 8,},
["Bestia Lore"] = {class = "HUNTER", level = 10,},
["Despedir mascota"] = {class = "HUNTER", level = 10,},
["Picadura de serpiente"] = {class = "HUNTER", level = 10,},
["Domesticar bestia"] = {class = "HUNTER", level = 10,},
["Control Pet"] = {class = "HUNTER", level = 10,},
["Alimentos para mascotas"] = {class = "HUNTER", level = 11,},
["Aspecto del Halcón"] = {class = "HUNTER", level = 12,},
["Desenganchar"] = {class = "HUNTER", level = 14,},
["La marca del HUNTER"] = {class = "HUNTER", level = 14,},
["Scatter Shot"] = {class = "HUNTER", level = 15,},
["Eagle Eye"] = {class = "HUNTER", level = 16,},
["Reparar Pet"] = {class = "HUNTER", level = 16,},
["Llamada Pet 2"] = {class = "HUNTER", level = 18,},
["Counter Shot"] = {clase = "HUNTER", level = 22,}, 
["Aspecto del guepardo"] = {class = "HUNTER", level = 24,},
["Multi-Shot"] = {class = "HUNTER", level = 24,},
["Trampa de congelación"] = {class = "HUNTER", level = 28,},
["Fingir la muerte"] = {class = "HUNTER", level = 32,},
["Kill Shot"] = {class = "HUNTER", level = 35,},
["Disparo tranquilizante"] = {class = "HUNTER", level = 35,},
["Asustar bestia"] = {class = "HUNTER", level = 36,},
["Trampa explosiva"] = {class = "HUNTER", level = 38,},
["Flare"] = {class = "HUNTER", level = 38,},
["Aura de disparo certero"] = {class = "HUNTER", level = 39,},
["Veneno de la viuda"] = {class = "HUNTER", level = 40,},
["Pet 3 llamada"] = {class = "HUNTER", level = 42,},
["Trampa de hielo"] = {class = "HUNTER", level = 46,},
["Trampa Launcher"] = {class = "HUNTER", level = 48,},
["Distraer a tiro"] = {class = "HUNTER", level = 52,},
["Rapid Fire"] = {class = "HUNTER", level = 54,},
["Aspecto del paquete"] = {class = "HUNTER", level = 56,},
["Llamada Pet 4"] = {class = "HUNTER", level = 62,},
["Trampa de la serpiente"] = {class = "HUNTER", level = 66,},
["Del maestro llamado"] = {class = "HUNTER", level = 74,},
["Redirección"] = {class = "HUNTER", level = 76,},
["Disuasión"] = {class = "HUNTER", level = 78,},
["Llamada Pet 5"] = {class = "HUNTER", level = 82,},
["Camuflaje"] = {class = "HUNTER", level = 85,},
["Estampida"] = {class = "HUNTER", level = 87,}, 
--++ Glifo habilidades ++
["Aspecto de la bestia"] = {class = "HUNTER", level = 25,}, 
["Fetch"] = {class = "HUNTER", level = 25,}, 
["Fuegos artificiales"] = {class = "HUNTER", level = 25,}, 
--++ Cazador especialización ++
--++ Bestia maestría/supervivencia ++
["Cobra tiro"] = {class = "HUNTER", level = 81,},
--++ Beast Mastery ++
["Comando kill"] = {class = "HUNTER", level = 10,},
["Ir a la garganta"] = {class = "HUNTER", level = 20,},
["Bestia Cleave"] = {class = "HUNTER", level = 24,},
["Frenesí"] = {class = "HUNTER", level = 30,},
["Foco de fuego"] = {class = "HUNTER", level = 32,},
["Ira bestial"] = {class = "HUNTER", level = 40,},
["Cobra huelgas"] = {class = "HUNTER", level = 43,},
["La bestia dentro"] = {class = "HUNTER", level = 50,},
["Kindred Spirits"] = {class = "HUNTER", level = 58,},
["Dinamización"] = {class = "HUNTER", level = 63,},
["Animales exóticos"] = {class = "HUNTER", level = 69,},
["Maestro de bestias"] = {class = "HUNTER", level = 80,},
--++ Puntería ++ 
["Tiro dirigido"] = {class = "HUNTER", level = 10,},
["Cuidado objetivo"] = {class = "HUNTER", level = 20,},
["Silenciando Shot"] = {clase = "HUNTER", level = 30,}, añadidos en el parche 5.4
["Barrage conmocionante"] = {class = "HUNTER", level = 30,},
["Bombardeo"] = {class = "HUNTER", level = 45,},
["Rápida recuperación"] = {class = "HUNTER", level = 54,},
["Maestro tirador"] = {class = "HUNTER", level = 58,},
["Quimera Shot"] = {class = "HUNTER", level = 60,},
["Constante foco"] = {class = "HUNTER", level = 63,},
["Piercing tiros"] = {class = "HUNTER", level = 72,},
["Carcajada salvaje"] = {class = "HUNTER", level = 80,},
--++ Supervivencia ++ 
["Disparo explosivo"] = {class = "HUNTER", level = 10,},
["Bloquear y cargar"] = {class = "HUNTER", level = 43,},
["La flecha negra"] = {class = "HUNTER", level = 50,},
["Atrapamiento"] = {class = "HUNTER", level = 55,},
["Veneno de la víbora"] = {class = "HUNTER", level = 63,},
["Trampa maestría"] = {class = "HUNTER", level = 64,},
["Serpiente Spread"] = {class = "HUNTER", level = 68,},
["Picadura de serpiente mejorado"] = {class = "HUNTER", level = 70,},
["Esencia de la víbora"] = {class = "HUNTER", level = 80,},
--++ Cazador talentos ++
["Con presteza"] = {class = "HUNTER", level = 15,},
["Escape estrecho"] = {class = "HUNTER", level = 15,},
["Crouching Tiger, Hidden Chimera"] = {class = "HUNTER", level = 15,}, 
["Shot encuadernación"] = {clase = "HUNTER", level = 30,}, añadidos en el parche 5.4
["Picadura de dracoleón"] = {class = "HUNTER", level = 30,},
["Intimidación"] = {class = "HUNTER", level = 30,},
["Euforia"] = {class = "HUNTER", level = 45,},
["Aspecto del halcón de hierro"] = {class = "HUNTER", level = 45,},
["Espíritu Bond"] = {class = "HUNTER", level = 45,}, 
["Fervor"] = {class = "HUNTER", level = 60,},
["Bestia dire"] = {class = "HUNTER", level = 60,},
["Emoción de la caza"] = {class = "HUNTER", level = 60,}, 
["Un asesinato de cuervos"] = {class = "HUNTER", level = 75,},
["Parpadeará huelgas"] = {class = "HUNTER", level = 75,},
["Lynx Rush"] = {class = "HUNTER", level = 75,}, 
["Glaive Toss"] = {class = "HUNTER", level = 90,},
["Powershot"] = {class = "HUNTER", level = 90,},
["Andanada"] = {class = "HUNTER", level = 90,}, 
 
--++ Habilidades de mago ++
["Pirofrío"] = {class = "MAGE", level = 1},
["Nova de escarcha"] = {class = "MAGE", level = 3},
["Ráfaga de fuego"] = {class = "MAGE", level = 5},
["Blink"] = {class = "MAGE", level = 7,},
["Contrahechizo"] = {class = "MAGE", level = 8,},
["Polimorfo"] = {class = "MAGE", level = 14,},
["Destrozar"] = {class = "MAGE", level = 16,},
["Explosión arcana"] = {class = "MAGE", level = 18,},
["Lanza de hielo"] = {class = "MAGE", level = 22,},
["Bloque de hielo que"] = {class ="MAGE", level = 26,},
["Cono de frío"] = {class = "MAGE", level = 28,},
["Eliminar maldición"] = {class = "MAGE", level = 29,},
["Lenta caída"] = {class = "MAGE", level = 32,},
["Armadura de arrabio"] = {class = "MAGE", level = 34,},
["Conjurar el refresco"] = {class = "MAGE", level = 38,},
["Evocación"] = {class = "MAGE", level = 40,},
["Fogonazo"] = {class = "MAGE", level = 44,},
["Conjure Mana Gem"] = {class = "MAGE", level = 47,},
["Imagen espejo"] = {class = "MAGE", level = 49,},
["Hechicería"] = {class = "MAGE", level = 50,},
["Blizzard"] = {class = "MAGE", level = 52,},
["Armadura de escarcha"] = {class = "MAGE", level = 54,},
["Frost Bolt"] = {class = "MAGE", level = 54,},
["Invisibilidad"] = {class = "MAGE", level = 56,},
["Brillantez Arcana"] = {class = "MAGE", level = 58,},
["Spellsteal"] = {class = "MAGE", level = 64,},
["Deep Freeze"] = {class = "MAGE", level = 66,},
["Contrahechizo mejorado"] = {class = "MAGE", level = 70,},
["Conjurar mesa de refresco"] = {class = "MAGE", level = 72,}, 
["Sintonía abisal"] = {class = "MAGE", level = 74,},
["Mage Bomb"] = {class = "MAGE", level = 75,},
["Dalaran brillantez"] = {class = "MAGE", level = 80,}, 
["Armadura de MAGE"] = {class = "MAGE", level = 80,},
["Burning Soul"] = {class = "MAGE", level = 82,},
["Time Warp"] = {class = "MAGE", level = 84,},
["Time Alter"] = {class = "MAGE", level = 87,}, 
["Polimorfo: cerdo"] = {class = "MAGE", level = 60,},
["Polimorfo: conejo"] = {class = "MAGE", level = 60,},
["Polimorfo: tortuga"] = {class = "MAGE", level = 60,},
["Polimorfo: gato negro"] = {class = "MAGE", level = 60,}, 
["Polimorfo: Turquía"] = {class = "MAGE", level = 60,}, 
["Antiguo Portal: Dalaran"] = {class = "MAGE", level = 74,},
["Portal: Dalaran"] = {class = "MAGE", level = 74,},
["Portal: Darnassus"] = {class = "MAGE", level = 42,},
["Portal: Exodar"] = {class = "MAGE", level = 42,},
["Portal: Forjaz"] = {class = "MAGE", level = 42,},
["Portal: Orgrimmar"] = {class = "MAGE", level = 42,},
["Portal: Shattrath"] = {class = "MAGE", level = 66,},
["Portal: Lunargenta"] = {class = "MAGE", level = 42,},
["Portal: Rocal"] = {class = "MAGE", level = 52,},
["Portal: Ventormenta"] = {class = "MAGE", level = 42,},
["Portal: Theramore"] = {class = "MAGE", level = 42,},
["Portal: Thunder Bluff"] = {class = "MAGE", level = 42,},
["Portal: Tol Barad"] = {class = "MAGE", level = 85,},
["Portal: entrañas"] = {class = "MAGE", level = 42,},
["Portal: Vale de flor eterna"] = {class = "MAGE", level = 90,}, 
["Antigua telepuerto: Dalaran"] = {class = "MAGE", level = 71,},
["Teleport: Dalaran"] = {class = "MAGE", level = 71,},
["Teleport: Darnassus"] = {class = "MAGE", level = 17,},
["Teleport: Exodar"] = {class = "MAGE", level = 17,},
["Teleport: Forjaz"] = {class = "MAGE", level = 17,},
["Teleport: Orgrimmar"] = {class = "MAGE", level = 17,},
["Teleport: Shattrath"] = {class = "MAGE", level = 62,},
["Teleport: Lunargenta"] = {class = "MAGE", level = 17,},
["Teleport: Rocal"] = {class = "MAGE", level = 52,},
["Teleport: Ventormenta"] = {class = "MAGE", level = 17,},
["Teleport: Theramore"] = {class = "MAGE", level = 17,},
["Teleport: Thunder Bluff"] = {class = "MAGE", level = 17,},
["Teleport: Tol Barad"] = {class = "MAGE", level = 85,},
["Teleport: entrañas"] = {class = "MAGE", level = 17,},
["Teleport: Vale de flor eterna"] = {class = "MAGE", level = 90,},
--++ Glifo habilidades ++
["Conjurar Familiar"] = {class = "MAGE", level = 25,},
["Illusion"] = {class = "MAGE", level = 25,},
--++ Mage especialización ++
--++ Arcana ++
["Explosión arcana"] = {class = "MAGE", level = 10,},
["Carga Arcana"] = {class = "MAGE", level = 10,},
["Tromba Arcana"] = {class = "MAGE", level = 12,},
["Misiles Arcanos"] = {class = "MAGE", level = 24,},
["Lento"] = {class = "MAGE", level = 36,},
["Poder arcano"] = {class = "MAGE", level = 62,},
["Adepto de mana"] = {class = "MAGE", level = 80,}, 
--++ Fuego ++ 
["Pyroblast"] = {class = "MAGE", level = 10,},
["Fireball"] = {class = "MAGE", level = 12,},
["Inferno Blast"] = {class = "MAGE", level = 24,},
["Critical Mass"] = {class = "MAGE", level = 36,},
["Quemarse"] = {class = "MAGE", level = 48,},
["Aliento de dragón"] = {class = "MAGE", level = 62,},
["Combustión"] = {class = "MAGE", level = 77,},
["Ignite"] = {class = "MAGE", level = 80,},
["Pirómano"] = {class = "MAGE", level = 85,},
--++ Hielo ++ 
["Invocar Elemental de agua"] = {class = "MAGE", level = 10,},
["Escarcha" = {class = "MAGE", level = 12,},
["Dedos de escarcha"] = {class = "MAGE", level = 24,},
["Venas heladas"] = {class = "MAGE", level = 36,},
["Orbe congelado"] = {class = "MAGE", level = 62,},
["Brain Freeze"] = {class = "MAGE", level = 77,},
["Carámbanos"] = {class = "MAGE", level = 80,}, añadidos en el parche 5.4
--++ Mage talentos ++
["Presencia de ánimo"] = {class = "MAGE", level = 15,},
["Velocidad de vértigo"] = {class = "MAGE", level = 15,},
["Témpano de hielo"] = {class = "MAGE", level = 15,}, 
["Flameglow"] = {class = "MAGE", level = 30,},
["Escudo temporal"] = {class = "MAGE", level = 30,},
["Barrera de hielo"] = {class = "MAGE", level = 30,}, 
["Anillo de escarcha"] = {class = "MAGE", level = 45,},
["Hielo Ward"] = {class = "MAGE", level = 45,},
["Frostjaw"] = {class = "MAGE", level = 45,}, 
["Invisibilidad mayor"] = {class ="MAGE", level = 60,},
["Cauterizar"] = {class = "MAGE", level = 60,},
["Cold Snap"] = {class = "MAGE", level = 60,}, 
["Tormenta Abisal"] = {class = "MAGE", level = 75,},
["Living Bomb"] = {class = "MAGE", level = 75,},
["Bomba helada"] = {class = "MAGE", level = 75,}, 
["Invocation"] = { class = "MAGE", level = 90, },
["Rune of Power"] = { class = "MAGE", level = 90, },
["Incanter's Ward"] = { class = "MAGE", level = 90, }, 
 
--++ Monk Abilities ++
["Jab"] = { class = "MONK", level = 1, },
["Stance of the Fierce Tiger"] = { class = "MONK", level = 1, }, 
["Way of the Monk"] = { class = "MONK", level = 1, }, 
["Tiger Palm"] = { class = "MONK", level = 3, }, 
["Roll"] = { class = "MONK", level = 5, }, 
["Blackout Kick"] = { class = "MONK", level = 7, }, 
["Provoke"] = { class = "MONK", level = 14, }, 
["Resuscitate"] = { class = "MONK", level = 18, }, 
["Detox"] = { class = "MONK", level = 20, }, 
["Zen Pilgrimage"] = { class = "MONK", level = 20, }, 
["Legacy of the Emperor"] = { class = "MONK", level = 22, }, 
["Touch of Death"] = { class = "MONK", level = 22, }, 
["Swift Reflexes"] = { class = "MONK", level = 23, }, 
["Fortifying Brew"] = { class = "MONK", level = 24, }, 
["Expel Harm"] = { class = "MONK", level = 26, }, 
["Disable"] = { class = "MONK", level = 28, },
["Nimble Brew"] = { class = "MONK", level = 30, }, 
["Zen Pilgrimage: Return"] = { class = "MONK", level = 30, }, 
["Spear Hand Strike"] = { class = "MONK", level = 32, }, 
["Paralysis"] = { class = "MONK", level = 44, }, 
["Spinning Crane Kick"] = { class = "MONK", level = 46, }, 
["Crackling Jade Lightning"] = { class = "MONK", level = 54, }, 
["Healing Sphere"] = { class = "MONK", level = 64, }, 
["Grapple Weapon"] = { class = "MONK", level = 68, }, 
["Zen Meditation"] = { class = "MONK", level = 82, }, 
["Transcendence"] = { class = "MONK", level = 87, }, 
["Transcendence: Transfer"] = { class = "MONK", level = 87, },
--++ Glyph Abilities ++
["Leer of the Ox"] = { class = "MONK", level = 25, },
["Zen Flight"] = { class = "MONK", level = 25, }, 
--++ Monk Specialization ++
--++ Mistweaver/Windwalker ++ 
["Tiger Strikes"] = { class = "MONK", level = 10, }, 
--++ Brewmaster ++ 
["Stance of the Sturdy Ox"] = { class = "MONK", level = 10, }, 
["Dizzying Haze"] = { class = "MONK", level = 10, }, 
["Vengeance"] = { class = "MONK", level = 10, }, 
["Keg Smash"] = { class = "MONK", level = 11, }, 
["Clash"] = { class = "MONK", level = 18, }, 
["Breath of Fire"] = { class = "MONK", level = 18, }, 
["Guard"] = { class = "MONK", level = 26, }, 
["Brewmaster Training"] = { class = "MONK", level = 34, }, 
["Elusive Brew"] = { class = "MONK", level = 36, }, 
["Brewing: Elusive Brew"] = { class = "MONK", level = 36, }, 
["Desperate Measures"] = { class = "MONK", level = 45, }, 
["Avert Harm"] = { class = "MONK", level = 48, }, 
["Gift of the Ox"] = { class = "MONK", level = 56, }, 
["Convocar a estatua de buey negro"] = {class = "MONK", level = 70,}, 
["Purificación Brew"] = {class = "MONK", level = 75,}, 
["Peleador elusivo"] = {class = "MONK", level = 80,},
--++ Mistweaver ++ 
["Postura de la serpiente sabio"] = {class = "MONK", level = 10,}, 
["Neblina calmantes"] = {class = "MONK", level = 10,}, 
["Meditación de mana"] = {class = "MONK", level = 10,},
["Envolvente niebla"] = {class = "MONK", level = 16,}, 
["Medicina interna"] = {class = "MONK", level = 20,}, 
["Memoria muscular"] = {class = "MONK", level = 20,},
["Mist enardecida"] = {class = "MONK", level = 32,}, 
["Enseñanzas del monasterio"] = {class = "MONK", level = 34,}, 
["Renovación de niebla"] = {class = "MONK", level = 42,}, 
["Demateralize"] = {class = "MONK", level = 45,}, 
["Capullo de la vida"] = {class = "MONK", level = 50,}, 
["Té de mana"] = {class = "MONK", level = 56,}, 
["Elaboración de la cerveza: té de Mana"] = {clase = "MONK", level = 56,}, 
["Elevar"] = {class = "MONK", level = 62,}, 
["Enfoque té thunder"] = {class = "MONK", level = 66,}, 
["Convocar a Jade serpiente estatua"] = {class = "MONK", level = 70,}, 
["Revival"] = {class = "MONK", level = 78,}, 
["Don de la serpiente"] = {class = "MONK", level = 80,}, 
--++ Windwalker ++ 
["Fists of Fury"] = {class = "MONK", level = 10,}, 
["Combo Breaker"] = {class = "MONK", level = 15,}, 
["Flying Serpent Kick"] = { class = "MONK", level = 18, }, 
["Combat Conditioning"] = { class = "MONK", level = 20, }, 
["Touch of Karma"] = { class = "MONK", level = 22, }, 
["Afterlife"] = { class = "MONK", level = 26, }, 
["Energizing Brew"] = { class = "MONK", level = 36, }, 
["Sparring"] = { class = "MONK", level = 42, }, 
["Adaptation"] = { class = "MONK", level = 45, }, 
["Spinning Fire Blossom"] = { class = "MONK", level = 48, }, 
["Rising Sun Kick"] = { class = "MONK", level = 56, }, 
["Tigereye Brew"] = { class = "MONK", level = 56, }, 
["Brewing: Tigereye Brew"] = { class = "MONK", level = 56, }, 
["Storm, Earth and Fire"] = { class = "MONK", level = 75, }, 
["Bottled Fury"] = { class = "MONK", level = 80, }, 
["Legacy of the White Tiger"] = { class = "MONK", level = 81, }, 
--++ Monk Talents ++
["Celerity"] = { class = "MONK", level = 15, }, 
["Tiger's Lust"] = { class = "MONK", level = 15, }, 
["Momentum"] = { class = "MONK", level = 15, }, 
["Chi Wave"] = { class = "MONK", level = 30, }, 
["Zen Sphere"] = { class = "MONK", level = 30, }, 
["Chi Burst"] = { class = "MONK", level = 30, }, 
["Power Strikes"] = { class = "MONK", level = 45, }, 
["Ascension"] = { class = "MONK", level = 45, }, 
["Chi Brew"] = { class = "MONK", level = 45, }, 
["Ring of Peace"] = { class = "MONK", level = 60, },
["Charging Ox Wave"]  =               { class = "MONK", level = 60, },  
["Leg Sweep"]  =                                              { class = "MONK", level = 60, }, 
                ["Healing Elixirs"]  =                         { class = "MONK", level = 75, },  
                ["Dampen Harm"]  =                                       { class = "MONK", level = 75, },  
                ["Diffuse Magic"]  =                        { class = "MONK", level = 75, }, 
                ["Rushing Jade Wind"]  =              { class = "MONK", level = 90, },  
                ["Invoke Xuen, the White Tiger"] = { class = "MONK", level = 90, },  
                ["Chi Torpedo"] =                                            { class = "MONK", level = 90, },  
 
--++ Paladin Abilities ++
                ["Crusader Strike"] =                      { class = "PALADIN", level = 1, },
                ["Seal of Command"] =                                 { class = "PALADIN", level = 3, },
                ["Judgment"] =                                                                 { class = "PALADIN", level = 5, },
                ["Hammer of Justice"] =               { class = "PALADIN", level = 7, },
                ["Harsh Word"] =                                             { class = "PALADIN", level = 9, },
                ["Word of Glory"] =                        { class = "PALADIN", level = 9, },
                ["Righteous Fury"] =                       { class = "PALADIN", level = 12, },
                ["Redemption"] =                                            { class = "PALADIN", level = 13, },
                ["Flash of Light"] =                           { class = "PALADIN", level = 14, },
                ["Reckoning"] =                                                { class = "PALADIN", level = 15, }, --Changed
                ["Lay on Hands"] =                                          { class = "PALADIN", level = 16, },
                ["Divine Shield"] =                           { class = "PALADIN", level = 18, },
                ["Cleanse"] =                                                     { class = "PALADIN", level = 20, },
                ["Seal of Truth"] =                           { class = "PALADIN", level = 24, },
                ["Divine Protection"] = { class = "PALADIN", level = 26, },
                ["Blessing of Kings"] =    { class = "PALADIN", level = 30, },
                ["Seal of Insight"] =                         { class = "PALADIN", level = 32, },
                ["Supplication"] =                                            { class = "PALADIN", level = 34, },
                ["Rebuke"] =                                                     { class = "PALADIN", level = 36, },
                ["Hammer of Wrath"] =                                { class = "PALADIN", level = 38, },
                ["Seal of Righteousness"] = { class = "PALADIN", level = 42, },
                ["Heart of the Crusader"] = { class = "PALADIN", level = 44, },
                ["Turn Evil"] =                                    { class = "PALADIN", level = 46, },
                ["Hand of Protection"] =               { class = "PALADIN", level = 48, },
                ["Hand of Freedom"] =                                 { class = "PALADIN", level = 52, },
                ["Sanctity of Battle"] =   { class = "PALADIN", level = 58, },
                ["Devotion Aura"] =                        { class = "PALADIN", level = 60, },
                ["Hand of Salvation"] = { class = "PALADIN", level = 66, },
                ["Avenging Wrath"] =                    { class = "PALADIN", level = 72, },
                ["Hand of Sacrifice"] =   { class = "PALADIN", level = 80, },
                ["Blessing of Might"] = { class = "PALADIN", level = 81, },
                ["Boundless Conviction"] =          { class = "PALADIN", level = 85, },
                ["Blinding Light"] =                          { class = "PALADIN", level = 87, },
                --++ Glyph Abilities ++
                ["Contemplation"] =                       { class = "PALADIN", level = 25, },
--++ Paladin Specialization ++
                --++ Protection/Retribution ++ 
                ["Hammer of the Righteous"] = { class = "PALADIN", level = 20, },
                --++ Holy/Protection/Retribution ++       
                ["Guardian of the Ancient Kings"] = { class = "PALADIN", level = 75, },      --++
                --++ Holy ++
                ["Holy Shock"] =                                               { class = "PALADIN", level = 10, },
                ["Holy Insight"] =                                             { class = "PALADIN", level = 10, },
                ["Denounce"] =                                                                { class = "PALADIN", level = 20, },
                ["Sacred Cleansing"] =                   { class = "PALADIN", level = 20, }, --changed
                ["Holy Radiance"] =                         { class = "PALADIN", level = 28, },
                ["Holy Light"] =                                                 { class = "PALADIN", level = 34, },
                ["Beacon of Light"] =                      { class = "PALADIN", level = 39, },
                ["Divine Plea"] =                                               { class = "PALADIN", level = 46, },
                ["Infusion of Light"] =    { class = "PALADIN", level = 50, },
                ["Divine Light"] =                                              { class = "PALADIN", level = 54, },
                ["Daybreak"] =                                                  { class = "PALADIN", level = 56, },
                ["Divine Favor"] =                                            { class = "PALADIN", level = 62, },
                ["Tower of Radiance"] =               { class = "PALADIN", level = 64, },
                ["Light of Dawn"] =                         { class = "PALADIN", level = 70, },
                ["Illuminated Healing"] =              { class = "PALADIN", level = 80, }, 
                --++ Protection ++ 
                ["Avenger's Shield"] =                   { class = "PALADIN", level = 10, },
                ["Guarded by the Light"] =          { class = "PALADIN", level = 10, },
                ["Vengeance"] =                                              { class = "PALADIN", level = 10, },
                ["Holy Wrath"] =                                              { class = "PALADIN", level = 20, },
                ["Judgments of the Wise"] = { class = "PALADIN", level = 28, },
                ["Consecration"] =                                          { class = "PALADIN", level = 34, },
                ["Shield of the Righteous"] = { class = "PALADIN", level = 40, },
                ["Grand Crusader"] =                     { class = "PALADIN", level = 50, },
                ["Sanctuary"] =                                                 { class = "PALADIN", level = 64, },
                ["Ardent Defender"] =                  { class = "PALADIN", level = 70, },
                ["Divine Bulwark"] =                       { class = "PALADIN", level = 80, },
                --++ Retribution ++  
                ["Templar's Verdict"] = { class = "PALADIN", level = 10, },
                ["Sword of Light"] =                        { class = "PALADIN", level = 10, },
                ["Judgments of the Bold"] = { class = "PALADIN", level = 28, },
                ["Divine Storm"] =                                           { class = "PALADIN", level = 34, },
                ["Exorcism"] =                                                   { class = "PALADIN", level = 46, },
                ["The Art of War"] =                       { class = "PALADIN", level = 50, },
                ["Emancipate"] =                                             { class = "PALADIN", level = 54, },
                ["Seal of Justice"] =                         { class = "PALADIN", level = 70, },
                ["Absolve"] =                                                     { class = "PALADIN", level = 80, },              --++
                ["Hand of Light"] =                          { class = "PALADIN", level = 80, },
                ["Inquisition"] =                                                { class = "PALADIN", level = 81, }, 
--++ Paladin Talents ++
                ["Speed of Light"] =                        { class = "PALADIN", level = 15, },
                ["Long Arm of the Law"] =           { class = "PALADIN", level = 15, },
                ["Pursuit of Justice"] =   { class = "PALADIN", level = 15, }, 
                ["Fist of Justice"] =                          { class = "PALADIN", level = 30, },
                ["Repentance"] =                                            { class = "PALADIN", level = 30, },
                ["Evil is a Point of View"] = { class = "PALADIN", level = 30, }, 
                ["Selfless Healer"] =                       { class = "PALADIN", level = 45, },
                ["Eternal Flame"] =                         { class = "PALADIN", level = 45, },
                ["Sacred Shield"] =                          { class = "PALADIN", level = 45, }, 
                ["Hand of Purity"] =                        { class = "PALADIN", level = 60, },
                ["Unbreakable Spirit"] =               { class = "PALADIN", level = 60, },
                ["Clemency"] =                                                                 { class = "PALADIN", level = 60, }, 
                ["Holy Avenger"] =                                          { class = "PALADIN", level = 75, },
                ["Sanctified Wrath"] =                   { class = "PALADIN", level = 75, },
                ["Divine Purpose"] =                      { class = "PALADIN", level = 75, }, 
                ["Holy Prism"] =                                                { class = "PALADIN", level = 90, },
                ["Light's Hammer"] =                      { class = "PALADIN", level = 90, },
                ["Execution Sentence"] =             { class = "PALADIN", level = 90, },
 
--++ Priest Abilities ++
                ["Smite"] =                                                         { class = "PRIEST", level = 1, },
                ["Shadow Word: Pain"] =             { class = "PRIEST", level = 3, },
                ["Power Word: Shield"] =             { class = "PRIEST", level = 5, },
                ["Flash Heal"] =                                                 { class = "PRIEST", level = 7, },
                ["Inner Fire"] =                                                 { class = "PRIEST", level = 9, },
                ["Divine Focus"] =                                            { class = "PRIEST", level = 10, },
                ["Psychic Scream"] =                      { class = "PRIEST", level = 12, },
                ["Resurrection"] =                                           { class = "PRIEST", level = 18, },
                ["Power Word: Fortitude"] = { class = "PRIEST", level = 22, },
                ["Fade"] =                                                                           { class = "PRIEST", level = 24, },
                ["Dispel Magic"] =                                            { class = "PRIEST", level = 26, },
                ["Renew"] =                                                       { class = "PRIEST", level = 26, },
                ["Shackle Undead"] =                    { class = "PRIEST", level = 32, },
                ["Levitate"] =                                                     { class = "PRIEST", level = 34, },
                ["Mind Vision"] =                                             { class = "PRIEST", level = 42, },
                ["Shadowfiend"] =                                          { class = "PRIEST", level = 42, },
                ["Shadow Word: Death"] =          { class = "PRIEST", level = 46, },
                ["Binding Heal"] =                                            { class = "PRIEST", level = 48, },
                ["Mysticism"] =                                                 { class = "PRIEST", level = 50, },
                ["Fear Ward"] =                                                { class = "PRIEST", level = 54, },
                ["Hymn of Hope"] =                                        { class = "PRIEST", level = 66, },
                ["Prayer of Mending"] =               { class = "PRIEST", level = 68, },
                ["Mass Dispel"] =                                             { class = "PRIEST", level = 72, },
                ["Mind Sear"] =                                                { class = "PRIEST", level = 76, },
                ["Inner Will"] =                                  { class = "PRIEST", level = 80, },
                ["Leap of Faith"] =                           { class = "PRIEST", level = 84, },
                ["Void Shift"] =                                                 { class = "PRIEST", level = 87, },
	--++ Glyph Abilities ++
                ["Holy Nova"] =                                                { class = "PRIEST", level = 25, },
                ["Confession"] =                                              { class = "PRIEST", level = 25, },
--++ Priest Specialization ++
                --++ Discipline/Holy ++
                ["Meditation"] =                                              { class = "PRIEST", level = 10, },
                ["Spiritual Healing"] =     { class = "PRIEST", level = 10, }, 
                ["Holy Fire"] =                                   { class = "PRIEST", level = 18, },
                ["Purify"] =                                                         { class = "PRIEST", level = 22, },
                ["Heal"] =                                                                            { class = "PRIEST", level = 28, },
                ["Focused Will"] =                                            { class = "PRIEST", level = 28, }, --++
                ["Greater Heal"] =                                           { class = "PRIEST", level = 34, },
                ["Evangelism"] =                                              { class = "PRIEST", level = 44, },
                ["Prayer of Healing"] = { class = "PRIEST", level = 46, },
                --++ Discipline ++
                ["Rapture"] =                                                     { class = "PRIEST", level = 10, },
                ["Penance"] =                                                   { class = "PRIEST", level = 10, },
                ["Divine Aegis"] =                                            { class = "PRIEST", level = 24, },
                ["Spirit Shell"] =                                                { class = "PRIEST", level = 28, },
                ["Inner Focus"] =                                             { class = "PRIEST", level = 36, },
                ["Atonement"] =                                             { class = "PRIEST", level = 38, }, --changed
                ["Grace"] =                                                         { class = "PRIEST", level = 45, },
                ["Archangel"] =                                                 { class = "PRIEST", level = 50, },
                ["Strength of Soul"] =                    { class = "PRIEST", level = 52, },
                ["Pain Suppression"] =                  { class = "PRIEST", level = 58, },
                ["Borrowed Time"] =                      { class = "PRIEST", level = 62, },
                ["Power Word: Barrier"] =           { class = "PRIEST", level = 70, },
                ["Train of Thought"] =                    { class = "PRIEST", level = 78, },
                ["Shield Discipline"] =     { class = "PRIEST", level = 80, },
                --++ Holy ++
                ["Holy Word: Chastise"] =            { class = "PRIEST", level = 10, },
                ["Spirit of Redemption"] =           { class = "PRIEST", level = 30, },
                ["Serendipity"] =                                              { class = "PRIEST", level = 34, },
                ["Lightwell"] =                                   { class = "PRIEST", level = 36, }, 
                ["Circle of Healing"] =     { class = "PRIEST", level = 50, },
                ["Chakra: Chastise"] =                    { class = "PRIEST", level = 56, },
                ["Chakra: Sanctuary"] =                 { class = "PRIEST", level = 56, },
                ["Chakra: Serenity"] =                    { class = "PRIEST", level = 56, },
                ["Rapid Renewal"] =                       { class = "PRIEST", level = 64, },
                ["Guardian Spirit"] =                       { class = "PRIEST", level = 70, },
                ["Divine Hymn"] =                                           { class = "PRIEST", level = 78, },
                ["Echo of Light"] =                           { class = "PRIEST", level = 80, },
                --++ Shadow ++
                ["Mind Flay"] =                                                 { class = "PRIEST", level = 10, },
                ["Spiritual Precision"] =                 { class = "PRIEST", level = 10, }, 
                ["Devouring Plague"] =                                 { class = "PRIEST", level = 21, },
                ["Mind Blast"] =                                                { class = "PRIEST", level = 21, },
                ["Shadow Orbs"] =                                          { class = "PRIEST", level = 21, },
                ["Shadowform"] =                                           { class = "PRIEST", level = 24, },
                ["Vampiric Touch"] =                      { class = "PRIEST", level = 28, },
                ["Shadowy Apparitions"] =          { class = "PRIEST", level = 42, },
                ["Mind Spike"] =                                              { class = "PRIEST", level = 44, },
                ["Silence"] =                                                       { class = "PRIEST", level = 52, },
                ["Dispersion"] =                                                { class = "PRIEST", level = 60, },
                ["Psychic Horror"] =                        { class = "PRIEST", level = 74, },
                ["Vampiric Embrace"] =                                 { class = "PRIEST", level = 78, },
                ["Shadowy Recall"] =                      { class = "PRIEST", level = 80, },
--++ Priest Talents ++
                ["Void Tendrils"] =                           { class = "PRIEST", level = 15, },
                ["Psyfiend"] =                                                   { class = "PRIEST", level = 15, },
                ["Dominate Mind"] =                     { class = "PRIEST", level = 15, }, 
                ["Body and Soul"] =                        { class = "PRIEST", level = 30, },
                ["Angelic Feather"] =                     { class = "PRIEST", level = 30, },
                ["Phantasm"] =                                                                 { class = "PRIEST", level = 30, }, 
                ["From Darkness, Comes Light"] = { class = "PRIEST", level = 45, },
                ["Mindbender"] =                                           { class = "PRIEST", level = 45, },
                ["Solace and Insanity"] =              { class = "PRIEST", level = 45, }, 
                ["Desperate Prayer"] =                                 { class = "PRIEST", level = 60, },
                ["Spectral Guise"] =                        { class = "PRIEST", level = 60, },
                ["Angelic Bulwark"] =                     { class = "PRIEST", level = 60, }, 
                ["Twist of Fate"] =                           { class = "PRIEST", level = 75, },
                ["Power Infusion"] =                      { class = "PRIEST", level = 75, },
                ["Divine Insight"] =                          { class = "PRIEST", level = 75, }, 
                ["Cascade"] =                                                    { class = "PRIEST", level = 90, },
                ["Divine Star"] =                                               { class = "PRIEST", level = 90, },
                ["Halo"] =                                                                            { class = "PRIEST", level = 90, },
 
--++ Rogue Abilities ++
                ["Sinister Strike"] =                         { class = "ROGUE", level = 1, },
                ["Eviscerate"] =                                                { class = "ROGUE", level = 3, },
                ["Stealth"] =                                                       { class = "ROGUE", level = 5, },
                ["Ambush"] =                                                    { class = "ROGUE", level = 6, },
                ["Evasion"] =                                                      { class = "ROGUE", level = 8, },
                ["Deadly Poison"] =                        { class = "ROGUE", level = 10, },
                ["Sap"] =                                                                              { class = "ROGUE", level = 12, },
                ["Slice and Dice"] =                          { class = "ROGUE", level = 14, },
                ["Pick Pocket"] =                                              { class = "ROGUE", level = 15, },
                ["Recuperate"] =                                             { class = "ROGUE", level = 16, },
                ["Kick"] =                                                                             { class = "ROGUE", level = 18, },
                ["Crippling Poison"] =                     { class = "ROGUE", level = 20, },
                ["Gouge"] =                                                       { class = "ROGUE", level = 22, },
                ["Pick Lock"] =                                   { class = "ROGUE", level = 24, },
                ["Sprint"] =                                                         { class = "ROGUE", level = 26, },
                ["Distract"] =                                                      { class = "ROGUE", level = 28, },
                ["Mind-numbing Poison"] =        { class = "ROGUE", level = 28, },
                ["Cheap Shot"] =                                              { class = "ROGUE", level = 30, },
                ["Wound Poison"] =                                       { class = "ROGUE", level = 30, },
                ["Swiftblade's Cunning"] =           { class = "ROGUE", level = 30, },
                ["Vanish"] =                                                       { class = "ROGUE", level = 34, },
                ["Expose Armor"] =                                        { class = "ROGUE", level = 36, },
                ["Blind"] =                                                           { class = "ROGUE", level = 38, },
                ["Kidney Shot"] =                                             { class = "ROGUE", level = 40, },
                ["Detect Traps"] =                                           { class = "ROGUE", level = 42, },
                ["Feint"] =                                                           { class = "ROGUE", level = 44, },
                ["Rupture"] =                                                    { class = "ROGUE", level = 46, },
                ["Garrote"] =                                                     { class = "ROGUE", level = 48, },
                ["Safe Fall"] =                                    { class = "ROGUE", level = 48, },
                ["Dismantle"] =                                                 { class = "ROGUE", level = 52, },
                ["Relentless Strikes"] =                 { class = "ROGUE", level = 54, },
                ["Disarm Trap"] =                                             { class = "ROGUE", level = 56, },
                ["Cloak of Shadows"] =                                 { class = "ROGUE", level = 58, },
                ["Fleet Footed"] =                                           { class = "ROGUE", level = 62, },
                ["Master Poisoner"] =                   { class = "ROGUE", level = 64, },
                ["Fan of Knives"] =                          { class = "ROGUE", level = 66, },
                ["Preparation"] =                                             { class = "ROGUE", level = 68, },
                ["Shadow Walk"] =                                          { class = "ROGUE", level = 72, },
                ["Shiv"] =                                                                             { class = "ROGUE", level = 74, },
--             ["Shroud of Concealment"] = { class = "ROGUE", level = 76, },
                ["Tricks of the Trade"] =                { class = "ROGUE", level = 78, },
                ["Redirect"] =                                                    { class = "ROGUE", level = 81, },
                ["Crimson Tempest"] =                                 { class = "ROGUE", level = 83, },
                ["Smoke Bomb"] =                                          { class = "ROGUE", level = 85, },
                ["Shadow Blades"] =                      { class = "ROGUE", level = 87, },
                --++ Glyph Abilities ++
                ["Detection"] =                                                 { class = "ROGUE", level = 25, },  
--++ Rogue Specialization ++
                --++ Assassination ++  
                ["Assassin's Resolve"] =                { class = "ROGUE", level = 10, },
                ["Improved Poisons"] =                                { class = "ROGUE", level = 10, },
                ["Mutilate"] =                                                    { class = "ROGUE", level = 10, },
                ["Envenom"] =                                                  { class = "ROGUE", level = 20, },
                ["Seal Fate"] =                                   { class = "ROGUE", level = 30, },
                ["Dispatch"] =                                                    { class = "ROGUE", level = 40, },
                ["Venomous Wounds"] =                             { class = "ROGUE", level = 50, },
                ["Cut to the Chase"] =                   { class = "ROGUE", level = 60, },
                ["Blindside"] =                                   { class = "ROGUE", level = 70, },
                ["Vendetta"] =                                                  { class = "ROGUE", level = 80, },
                ["Potent Poisons"] =                      { class = "ROGUE", level = 80, },
                --++ Combat ++  
                ["Ambidexterity"] =                        { class = "ROGUE", level = 10, },
                ["Vitality"] =                                                       { class = "ROGUE", level = 10, },
                ["Blade Flurry"] =                                             { class = "ROGUE", level = 10, },
                ["Revealing Strike"] =                     { class = "ROGUE", level = 20, },
                ["Combat Potency"] =                   { class = "ROGUE", level = 30, },
                ["Ruthlessness"] =                                          { class = "ROGUE", level = 32, }, -- Added in Patch 5.4
                ["Adrenaline Rush"] =                    { class = "ROGUE", level = 40, },
                ["Restless Blades"] =                      { class = "ROGUE", level = 50, },
                ["Bandit's Guile"] =                         { class = "ROGUE", level = 60, },
                ["Killing Spree"] =                            { class = "ROGUE", level = 80, },
                ["Main Gauche"] =                                          { class = "ROGUE", level = 80, },
                --++ Subtlety ++
                ["Hemorrhage"] =                                           { class = "ROGUE", level = 10, },
                ["Master of Subtlety"] =               { class = "ROGUE", level = 10, },
                ["Sinister Calling"] =                        { class = "ROGUE", level = 10, },
                ["Find Weakness"] =                      { class = "ROGUE", level = 20, },
                ["Premeditation"] =                        { class = "ROGUE", level = 30, },
                ["Backstab"] =                                                   { class = "ROGUE", level = 40, },
                ["Honor Among Thieves"] =        { class = "ROGUE", level = 50, },
                ["Sanguinary Vein"] =                    { class = "ROGUE", level = 60, },
                ["Energetic Recovery"] =              { class = "ROGUE", level = 70, },
                ["Shadow Dance"] =                                       { class = "ROGUE", level = 80, },
                ["Executioner"] =                                             { class = "ROGUE", level = 80, }, 
--++ Rogue Talents ++
                ["Nightstalker"] =                                            { class = "ROGUE", level = 15, },
                ["Subterfuge"] =                                              { class = "ROGUE", level = 15, },
                ["Shadow Focus"] =                                        { class = "ROGUE", level = 15, },
                ["Deadly Throw"] =                                         { class = "ROGUE", level = 30, },
                ["Nerve Strike"] =                                            { class = "ROGUE", level = 30, },
                ["Combat Readiness"] =                               { class = "ROGUE", level = 30, }, 
                ["Cheat Death"] =                                            { class = "ROGUE", level = 45, },
                ["Leeching Poison"] =                    { class = "ROGUE", level = 45, },
                ["Elusiveness"] =                                              { class = "ROGUE", level = 45, }, 
                ["Shadowstep"] =                                            { class = "ROGUE", level = 60, },
                ["Burst of Speed"] =                       { class = "ROGUE", level = 60, }, 
                ["Cloak and Dagger"] =                  { class = "ROGUE", level = 60, }, 
                ["Prey on the Weak"] =                                 { class = "ROGUE", level = 75, },
                ["Paralytic Poison"] =                     { class = "ROGUE", level = 75, },
                ["Dirty Tricks"] =                                               { class = "ROGUE", level = 75, }, 
                ["Shuriken Toss"] =                         { class = "ROGUE", level = 90, },
                ["Marked for Death"] =                 { class = "ROGUE", level = 90, },
                ["Anticipation"] =                                             { class = "ROGUE", level = 90, },
 
--++ Shaman Abilities ++
                ["Lightning Bolt"] =                          { class = "SHAMAN", level = 1, },
                ["Primal Strike"] =                            { class = "SHAMAN", level = 3, },
                ["Earth Shock"] =                                             { class = "SHAMAN", level = 6, },
                ["Healing Surge"] =                         { class = "SHAMAN", level = 7, },
                ["Lightning Shield"] =                     { class = "SHAMAN", level = 8, },
                ["Flametongue Weapon"] =        { class = "SHAMAN", level = 10, },
                ["Flame Shock"] =                                            { class = "SHAMAN", level = 12, },
                ["Purge"] =                                                         { class = "SHAMAN", level = 12, },
                ["Ancestral Spirit"] =                       { class = "SHAMAN", level = 14, },
                ["Ghost Wolf"] =                                              { class = "SHAMAN", level = 15, },
                ["Searing Totem"] =                        { class = "SHAMAN", level = 16, },
                ["Wind Shear"] =                                              { class = "SHAMAN", level = 16, },
                ["Cleanse Spirit"] =                          { class = "SHAMAN", level = 18, },
                ["Water Shield"] =                                           { class = "SHAMAN", level = 20, },
                ["Frost Shock"] =                                              { class = "SHAMAN", level = 22, },
                ["Water Walking"] =                       { class = "SHAMAN", level = 24, },
                ["Earthbind Totem"] =                   { class = "SHAMAN", level = 26, },
                ["Chain Lightning"] =                      { class = "SHAMAN", level = 28, },
                ["Healing Stream Totem"] =        { class = "SHAMAN", level = 30, }, 
                ["Totemic Recall"] =                        { class = "SHAMAN", level = 30, },
                ["Reincarnation"] =                         { class = "SHAMAN", level = 32, },
                ["Astral Recall"] =                             { class = "SHAMAN", level = 34, },
                ["Far Sight"] =                                    { class = "SHAMAN", level = 36, },
                ["Magma Totem"] =                                       { class = "SHAMAN", level = 36, },
                ["Grounding Totem"] =                                 { class = "SHAMAN", level = 38, },
                ["Burning Wrath"] =                        { class = "SHAMAN", level = 40, },
                ["Chain Heal"] =                                                { class = "SHAMAN", level = 44, },
                ["Frostbrand Weapon"] =            { class = "SHAMAN", level = 46, },
                ["Tremor Totem"] =                                        { class = "SHAMAN", level = 54, },
                ["Earth Elemental Totem"] = { class = "SHAMAN", level = 58, },
                ["Healing Rain"] =                                            { class = "SHAMAN", level = 60, },
                ["Capacitor Totem"] =                    { class = "SHAMAN", level = 63, },
                ["Healing Tide Totem"] =              { class = "SHAMAN", level = 65, }, --++
                ["Fire Elemental Totem"] =          { class = "SHAMAN", level = 66, },
                ["Heroism"] =                                                    { class = "SHAMAN", level = 70, },
                ["Bloodlust"] =                                  { class = "SHAMAN", level = 70, },
                ["Bind Elemental"] =                       { class = "SHAMAN", level = 72, },
                ["Hex"] =                                                                             { class = "SHAMAN", level = 75, },
                ["Rockbiter Weapon"] =                               { class = "SHAMAN", level = 75, },
                ["Stormlash Totem"] =                  { class = "SHAMAN", level = 78, },
                ["Grace of Air"] =                                             { class = "SHAMAN", level = 80, },
                ["Unleash Elements"] =                                { class = "SHAMAN", level = 81, },
                ["Spiritwalker's Grace"] =             { class = "SHAMAN", level = 85, },
                ["Ascendance"] =                                            { class = "SHAMAN", level = 87, },
--++ Shaman Specialization ++
                --++ Elemental/Restoration ++ 
                ["Spiritual Insight"] =      { class = "SHAMAN", level = 10, },
                ["Lava Burst"] =                                                { class = "SHAMAN", level = 34, },
                --++ Elemental/Enhancement ++
                ["Shamanistic Rage"] =                  { class = "SHAMAN", level = 65, },              
                --++ Elemental ++ 
                ["Elemental Fury"] =                       { class = "SHAMAN", level = 10, },
                ["Elemental Precision"] =             { class = "SHAMAN", level = 10, },
                ["Elemental Reach"] =                   { class = "SHAMAN", level = 10, },
                ["Shamanism"] =                                              { class = "SHAMAN", level = 10, },
                ["Thunderstorm"] =                                        { class = "SHAMAN", level = 10, },
                ["Rolling Thunder"] =                     { class = "SHAMAN", level = 20, },
                ["Fulmination"] =                                             { class = "SHAMAN", level = 20, }, --changed
                ["Elemental Focus"] =                    { class = "SHAMAN", level = 40, },
                ["Lava Surge"] =                                               { class = "SHAMAN", level = 50, },
                ["Elemental Oath"] =                      { class = "SHAMAN", level = 55, },
                ["Earthquake"] =                                              { class = "SHAMAN", level = 60, },
                ["Elemental Overload"] =             { class = "SHAMAN", level = 80, },
                --++ Enhancement ++
                ["Lava Lash"] =                                  { class = "SHAMAN", level = 10, },
                ["Mental Quickness"] =                                 { class = "SHAMAN", level = 10, },
                ["Primal Wisdom"] =                       { class = "SHAMAN", level = 10, }, --++
                ["Flurry"] =                                                         { class = "SHAMAN", level = 20, },
                ["Stormstrike"] =                                             { class = "SHAMAN", level = 26, },
                ["Windfury Weapon"] =                                { class = "SHAMAN", level = 30, },
                ["Searing Flames"] =                       { class = "SHAMAN", level = 34, },
                ["Static Shock"] =                                             { class = "SHAMAN", level = 40, },
                ["Fire Nova"] =                                  { class = "SHAMAN", level = 44, },
                ["Maelstrom Weapon"] =                            { class = "SHAMAN", level = 50, },
                ["Unleashed Rage"] =                    { class = "SHAMAN", level = 55, },
                ["Feral Spirit"] =                                                { class = "SHAMAN", level = 60, },
                ["Spirit Walk"] =                                                { class = "SHAMAN", level = 60, },
                ["Enhanced Elements"] =             { class = "SHAMAN", level = 80, },
                --++ Restoration ++
                ["Meditation"] =                                              { class = "SHAMAN", level = 10, },
                ["Purification"] =                                              { class = "SHAMAN", level = 10, },
                ["Riptide"] =                                                       { class = "SHAMAN", level = 10, },
                ["Purify Spirit"] =                              { class = "SHAMAN", level = 18, },              --++
                ["Healing Wave"] =                                         { class = "SHAMAN", level = 20, },
                ["Earth Shield"] =                                             { class = "SHAMAN", level = 26, },
                ["Earthliving Weapon"] =              { class = "SHAMAN", level = 30, },
                ["Ancestral Awakening"] =          { class = "SHAMAN", level = 34, },
                ["Resurgence"] =                                             { class = "SHAMAN", level = 40, },
                ["Tidal Waves"] =                                             { class = "SHAMAN", level = 50, },
                ["Mana Tide Totem"] =                                 { class = "SHAMAN", level = 56, },
                ["Greater Healing Wave"] =        { class = "SHAMAN", level = 60, },
                ["Spirit Link Totem"] =   { class = "SHAMAN", level = 70, },
                ["Deep Healing"] =                                          { class = "SHAMAN", level = 80, }, 
--++ Shaman Talents ++
                ["Nature's Guardian"] =                { class = "SHAMAN", level = 15, },
                ["Stone Bulwark Totem"] =         { class = "SHAMAN", level = 15, },
                ["Astral Shift"] =                                               { class = "SHAMAN", level = 15, }, 
                ["Frozen Power"] =                                         { class = "SHAMAN", level = 30, },
                ["Earthgrab Totem"] =                   { class = "SHAMAN", level = 30, },
                ["Windwalk Totem"] =                   { class = "SHAMAN", level = 30, }, 
                ["Call of the Elements"] =             { class = "SHAMAN", level = 45, },
                ["Totemic Persistence"] =            { class = "SHAMAN", level = 45, }, --Added in Patch 5.4
                ["Totemic Projection"] =               { class = "SHAMAN", level = 45, }, 
                ["Elemental Mastery"] =               { class = "SHAMAN", level = 60, },
                ["Ancestral Swiftness"] =             { class = "SHAMAN", level = 60, },
                ["Echo of the Elements"] =          { class = "SHAMAN", level = 60, }, 
                ["Rushing Streams"] =                   { class = "SHAMAN", level = 75, }, --changed
                ["Ancestral Guidance"] =              { class = "SHAMAN", level = 75, },
                ["Conductivity"] =                                            { class = "SHAMAN", level = 75, }, 
                ["Unleashed Fury"] =                     { class = "SHAMAN", level = 90, },
                ["Primal Elementalist"] =              { class = "SHAMAN", level = 90, },
                ["Elemental Blast"] =                      { class = "SHAMAN", level = 90, },
 
--++ Warlock Abilities ++
                ["Shadow Bolt"] =                                            { class = "WARLOCK", level = 1, },
                ["Demonic Slash"] =                        { class = "WARLOCK", level = 1, }, -- Dark Apotheosis Ability
                ["Siphon Life"] =                                               { class = "WARLOCK", level = 1, }, --++
                ["Summon Imp"] =                                          { class = "WARLOCK", level = 1, },
                ["Corruption"] =                                               { class = "WARLOCK", level = 3, },
                ["Drain Life"] =                                  { class = "WARLOCK", level = 7, },
                ["Summon Voidwalker"] =           { class = "WARLOCK", level = 8, },
                ["Create Healthstone"] =             { class = "WARLOCK", level = 9, },
                ["Control Demon"] =                      { class = "WARLOCK", level = 10, },
                ["Health Funnel"] =                         { class = "WARLOCK", level = 11, },
                ["Fear"] =                                                                            { class = "WARLOCK", level = 14, },
                ["Sleep"] =                                                          { class = "WARLOCK", level = 14, }, -- Dark Apotheosis Ability
                ["Life Tap"] =                                                     { class = "WARLOCK", level = 16, },
                ["Curse of Enfeeblement"] = { class = "WARLOCK", level = 17, },
                ["Soulstone"] =                                                 { class = "WARLOCK", level = 18, },
                ["Summon Succubus"] =                               { class = "WARLOCK", level = 20, },
                ["Eye of Kilrogg"] =                          { class = "WARLOCK", level = 22, },
                ["Unending Breath"] =                  { class = "WARLOCK", level = 24, },
                ["Soul Harvest"] =                                            { class = "WARLOCK", level = 27, },
                ["Summon Felhunter"] =                              { class = "WARLOCK", level = 29, },
                ["Howl of Terror"] =                        { class = "WARLOCK", level = 30, }, --Added in Patch 5.4 
                ["Enslave Demon"] =                      { class = "WARLOCK", level = 31, },
                ["Banish"] =                                                        { class = "WARLOCK", level = 32, },
                ["Twilight Ward"] =                         { class = "WARLOCK", level = 34, },
                ["Fury Ward"] =                                                { class = "WARLOCK", level = 34, }, -- Dark Apotheosis Ability
                ["Fel Armor"] =                                                 { class = "WARLOCK", level = 38, },
                ["Ritual of Summoning"] =           { class = "WARLOCK", level = 42, },
                ["Summon Infernal"] =                  { class = "WARLOCK", level = 49, },
                ["Nethermancy"] =                                         { class = "WARLOCK", level = 50, },
                ["Curse of the Elements"] = { class = "WARLOCK", level = 51, },
                ["Command Demon"] =                                { class = "WARLOCK", level = 56, },
                ["Summon Doomguard"] =                          { class = "WARLOCK", level = 58, },
                ["Unending Resolve"] =                                { class = "WARLOCK", level = 64, },
                ["Soulshatter"] =                                              { class = "WARLOCK", level = 66, },
                ["Provocation"] =                                             { class = "WARLOCK", level = 66, }, -- Dark Apotheosis Ability
                ["Create Soulwell"] =                     { class = "WARLOCK", level = 68, },
                ["Demonic Circle: Summon"] = { class = "WARLOCK", level = 76, },
                ["Demonic Circle: Teleport"] = { class = "WARLOCK", level = 76, },
                ["Fel Flame"] =                                  { class = "WARLOCK", level = 77, },
                ["Dark Intent"] =                                              { class = "WARLOCK", level = 82, },
                ["Demonic Gateway"] =                                { class = "WARLOCK", level = 87, },
                ["Pandemic"] =                                                                 { class = "WARLOCK", level = 90, }, 
                --++ Glyph Abilities ++
                ["Dark Apotheosis"] =                    { class = "WARLOCK", level = 25, },
                ["Imp Swarm"] =                                              { class = "WARLOCK", level = 25, },
--++ Warlock Specialization ++
                --++ Affliction/Destruction ++
                ["Rain of Fire"] =                                              { class = "WARLOCK", level = 21, },
                --++ Affliction ++
                ["Unstable Affliction"] =               { class = "WARLOCK", level = 10, },
                ["Drain Soul"] =                                                 { class = "WARLOCK", level = 19, },
                ["Soulburn"] =                                                   { class = "WARLOCK", level = 19, },
                ["Soulburn: Health Funnel"] = { class = "WARLOCK", level = 27, },
                ["Curse of Exhaustion"] =             { class = "WARLOCK", level = 32, },
                ["Agony"] =                                                        { class = "WARLOCK", level = 36, },
                ["Malefic Grasp"] =                         { class = "WARLOCK", level = 42, },
                ["Nightfall"] =                                    { class = "WARLOCK", level = 54, },
                ["Seed of Corruption"] =              { class = "WARLOCK", level = 60, },
                ["Haunt"] =                                                         { class = "WARLOCK", level = 62, },
                ["Soulburn: Seed of Corruption"] = { class = "WARLOCK", level = 62, },
                ["Improved Fear"] =                       { class = "WARLOCK", level = 69, },
                ["Soulburn: Curse"] =                     { class = "WARLOCK", level = 73, },
                ["Soul Swap"] =                                                { class = "WARLOCK", level = 79, },
                ["Soulburn: Soul Swap"] =            { class = "WARLOCK", level = 79, },            --++
                ["Potent Afflictions"] = { class = "WARLOCK", level = 80, },
                ["Dark Soul: Misery"] = { class = "WARLOCK", level = 84, },
                ["Soulburn: Demonic Circle: Teleport"] = { class = "WARLOCK", level = 86, },
                --++ Demonology ++
                ["Demonic Fury"] =                                         { class = "WARLOCK", level = 10, },
                ["Metamorphosis"] =                     { class = "WARLOCK", level = 10, },
                ["Demonic Leap"] =                                        { class = "WARLOCK", level = 12, },
                ["Soul Fire"] =                                    { class = "WARLOCK", level = 13, },
                ["Hand of Gul'dan"] =                    { class = "WARLOCK", level = 19, },
                ["Hellfire"] =                                                      { class = "WARLOCK", level = 22, },
                ["Metamorphosis: Touch of Chaos"] = { class = "WARLOCK", level = 25, }, --changed
                ["Nether Plating"] =                        { class = "WARLOCK", level = 27, },
                ["Wild Imps"] =                                                 { class = "WARLOCK", level = 32, },
                ["Metamorphosis: Doom"] =      { class = "WARLOCK", level = 36, }, --changed
                ["Summon Felguard"] =                                { class = "WARLOCK", level = 42, },
                ["Carrion Swarm"] =                       { class = "WARLOCK", level = 47, },
                ["Demonic Rebirth"] =                   { class = "WARLOCK", level = 54, },
                ["Metamorphosis: Immolation Aura"] = { class = "WARLOCK", level = 62, }, --changed
                ["Metamorphosis: Cursed Auras"] = { class = "WARLOCK", level = 67, }, --changed
                ["Molten Core"] =                                           { class = "WARLOCK", level = 69, },
                ["Decimation"] =                                              { class = "WARLOCK", level = 73, },
                ["Metamorphosis: Chaos Wave"] = { class = "WARLOCK", level = 79, },
                ["Master Demonologist"] =         { class = "WARLOCK", level = 80, },
                ["Dark Soul: Knowledge"] =         { class = "WARLOCK", level = 84, },
                ["Metamorphosis: Void Ray"] = { class = "WARLOCK", level = 85, }, --changed
                --++ Destruction ++
                ["Chaotic Energy"] =                       { class = "WARLOCK", level = 10, },
                ["Conflagrate"] =                                             { class = "WARLOCK", level = 10, },
                ["Incinerate"] =                                                { class = "WARLOCK", level = 10, },
                ["Immolate"] =                                                                 { class = "WARLOCK", level = 12, },
                ["Backlash"] =                                                    { class = "WARLOCK", level = 32, },
                ["Havoc"] =                                                         { class = "WARLOCK", level = 36, },
                ["Chaos Bolt"] =                                                { class = "WARLOCK", level = 42, },
                ["Ember Tap"] =                                               { class = "WARLOCK", level = 42, },
                ["Burning Embers"] =                     { class = "WARLOCK", level = 42, },
                ["Shadowburn"] =                                           { class = "WARLOCK", level = 47, },
                ["Fire and Brimstone"] =               { class = "WARLOCK", level = 54, },
                ["Aftermath"] =                                                { class = "WARLOCK", level = 54, },
                ["Backdraft"] =                                  { class = "WARLOCK", level = 69, },
                ["Flames of Xoroth"] =                  { class = "WARLOCK", level = 79, },
                ["Emberstorm"] =                                            { class = "WARLOCK", level = 80, },
                ["Dark Soul: Instability"] = { class = "WARLOCK", level = 84, },
                ["Pyroclasm"] =                                                { class = "WARLOCK", level = 86, },
--++ Warlock Talents ++
                ["Dark Regeneration"] =               { class = "WARLOCK", level = 15, },
                ["Soul Leech"] =                                               { class = "WARLOCK", level = 15, },
                ["Harvest Life"] =                                             { class = "WARLOCK", level = 15, }, .4
                ["Demonic Breath"] =                    { class = "WARLOCK", level = 30, }, --Added in Patch 5.4
                ["Mortal Coil"] =                                               { class = "WARLOCK", level = 30, },
                ["Shadowfury"] =                                            { class = "WARLOCK", level = 30, }, 
                ["Soul Link"] =                                   { class = "WARLOCK", level = 45, },
                ["Sacrificial Pact"] =                         { class = "WARLOCK", level = 45, },
                ["Dark Bargain"] =                                            { class = "WARLOCK", level = 45, }, 
                ["Blood Horror"] =                                           { class = "WARLOCK", level = 60, }, --changed
                ["Burning Rush"] =                                          { class = "WARLOCK", level = 60, },
                ["Unbound Will"] =                                         { class = "WARLOCK", level = 60, }, 
                ["Grimoire of Supremacy"] = { class = "WARLOCK", level = 75, },
                ["Grimoire of Service"] =              { class = "WARLOCK", level = 75, },
                ["Grimoire of Sacrifice"] = { class = "WARLOCK", level = 75, }, 
                ["Kil'jaeden's Cunning"] =            { class = "WARLOCK", level = 90, },
                ["Mannoroth's Fury"] =                                 { class = "WARLOCK", level = 90, }, 
 
--++ Warrior Abilities ++
                ["Battle Stance"] =                          { class = "WARRIOR", level = 1, },
                ["Heroic Strike"] =                           { class = "WARRIOR", level = 1, },
                ["Charge"] =                                                       { class = "WARRIOR", level = 3, },
                ["Victory Rush"] =                                            { class = "WARRIOR", level = 5, },
                ["Execute"] =                                                     { class = "WARRIOR", level = 7, },
                ["Defensive Stance"] =                  { class = "WARRIOR", level = 9, },
                ["Taunt"] =                                                         { class = "WARRIOR", level = 12, },
                ["Enrage"] =                                                       { class = "WARRIOR", level = 14, },
                ["Sunder Armor"] =                                        { class = "WARRIOR", level = 16, },
                ["Thunder Clap"] =                                          { class = "WARRIOR", level = 20, },
                ["Heroic Throw"] =                                          { class = "WARRIOR", level = 22, },
                ["Pummel"] =                                                    { class = "WARRIOR", level = 24, },
                ["Disarm"] =                                                       { class = "WARRIOR", level = 28, },
                ["Deep Wounds"] =                                        { class = "WARRIOR", level = 32, },
                ["Berserker Stance"] =                  { class = "WARRIOR", level = 34, },
                ["Hamstring"] =                                                { class = "WARRIOR", level = 36, },
                ["Battle Shout"] =                                            { class = "WARRIOR", level = 42, },
                ["Cleave"] =                                                       { class = "WARRIOR", level = 44, },
                ["Shield Wall"] =                                               { class = "WARRIOR", level = 48, },
                ["Intimidating Shout"] =                { class = "WARRIOR", level = 52, },
                ["Berserker Rage"] =                      { class = "WARRIOR", level = 54, },
                ["Recklessness"] =                                          { class = "WARRIOR", level = 62, },
                ["Spell Reflection"] =                      { class = "WARRIOR", level = 66, },
                ["Commanding Shout"] =                             { class = "WARRIOR", level = 68, },
                ["Intervene"] =                                                 { class = "WARRIOR", level = 72, },
                ["Shattering Throw"] =                  { class = "WARRIOR", level = 74, },
--             ["Ripsote"] =                                                      { class = "WARRIOR", level = 76, }, --Added in Patch 5.4 but not activated since Death Knights also have this ability
                ["Rallying Cry"] =                                              { class = "WARRIOR", level = 83, },
                ["Heroic Leap"] =                                             { class = "WARRIOR", level = 85, },
                ["Demoralizing Banner"] =           { class = "WARRIOR", level = 87, },
                ["Mocking Banner"] =                    { class = "WARRIOR", level = 87, },
                ["Skull Banner"] =                                            { class = "WARRIOR", level = 87, },
--++ Warrior Specialization ++
                --++ Arms/Fury ++
                ["Whirlwind"] =                                                { class = "WARRIOR", level = 26, },
                ["Die by the Sword"] =                  { class = "WARRIOR", level = 56, },
                ["Unbridled Wrath"] =                   { class = "WARRIOR", level = 56, }, --++
                ["Colossus Smash"] =                     { class = "WARRIOR", level = 81, },
                --++ Arms/Protection ++              
                ["Blood and Thunder"] =              { class = "WARRIOR", level = 46, },
                --++ Arms ++
                ["Mortal Strike"] =                           { class = "WARRIOR", level = 10, },
                ["Seasoned Soldier"] =                  { class = "WARRIOR", level = 10, },
                ["Slam"] =                                                                           { class = "WARRIOR", level = 18, },
                ["Overpower"] =                                              { class = "WARRIOR", level = 30, },
                ["Taste for Blood"] =                      { class = "WARRIOR", level = 30, },
                ["Sweeping Strikes"] =                  { class = "WARRIOR", level = 60, },
                ["Strikes of Opportunity"] = { class = "WARRIOR", level = 80, },
                ["Sudden Death"] =                                        { class = "WARRIOR", level = 81, },
                --++ Fury ++
                ["Bloodthirst"] =                                               { class = "WARRIOR", level = 10, },
                ["Crazed Berserker"] =                  { class = "WARRIOR", level = 10, },
                ["Wild Strike"] =                                               { class = "WARRIOR", level = 18, },
                ["Raging Blow"] =                                             { class = "WARRIOR", level = 30, },
                ["Titan's Grip"] =                                              { class = "WARRIOR", level = 38, },
                ["Single-Minded Fury"] =             { class = "WARRIOR", level = 38, },
                ["Bloodsurge"] =                                              { class = "WARRIOR", level = 50, },
                ["Meat Cleaver"] =                                          { class = "WARRIOR", level = 58, },
                ["Flurry"] =                                                         { class = "WARRIOR", level = 60, },
                ["Unshackled Fury"] =                   { class = "WARRIOR", level = 80, },
                --++ Protection ++  
                ["Shield Slam"] =                                              { class = "WARRIOR", level = 10, },
                ["Unwavering Sentinel"] =           { class = "WARRIOR", level = 10, },
                ["Vengeance"] =                                              { class = "WARRIOR", level = 10, },
                ["Shield Block"] =                                             { class = "WARRIOR", level = 18, },
                ["Devastate"] =                                                { class = "WARRIOR", level = 26, },
                ["Revenge"] =                                                   { class = "WARRIOR", level = 30, },
                ["Last Stand"] =                                                { class = "WARRIOR", level = 38, },
                ["Sword and Board"] =                  { class = "WARRIOR", level = 50, },
                ["Demoralizing Shout"] =              { class = "WARRIOR", level = 56, },
                ["Ultimatum"] =                                               { class = "WARRIOR", level = 58, },
                ["Bastion of Defense"] =              { class = "WARRIOR", level = 60, },
                ["Critical Block"] =                            { class = "WARRIOR", level = 80, },
                ["Shield Barrier"] =                          { class = "WARRIOR", level = 81, },
                --++ Warrior Talents ++
                ["Juggernaut"] =                                              { class = "WARRIOR", level = 15, },
                ["Double Time"] =                                           { class = "WARRIOR", level = 15, },
                ["Warbringer"] =                                              { class = "WARRIOR", level = 15, }, 
                ["Enraged Regeneration"] =        { class = "WARRIOR", level = 30, },
                ["Second Wind"] =                                          { class = "WARRIOR", level = 30, },
                ["Impending Victory"] =                { class = "WARRIOR", level = 30, }, 
                ["Staggering Shout"] =                   { class = "WARRIOR", level = 45, },
                ["Piercing Howl"] =                          { class = "WARRIOR", level = 45, },
                ["Disrupting Shout"] =                   { class = "WARRIOR", level = 45, },
                ["Bladestorm"] =                                              { class = "WARRIOR", level = 60, },
                ["Shockwave"] =                                              { class = "WARRIOR", level = 60, },
                ["Dragon Roar"] =                                            { class = "WARRIOR", level = 60, }, 
                ["Mass Spell Reflection"] = { class = "WARRIOR", level = 75, },
                ["Safeguard"] =                                                { class = "WARRIOR", level = 75, },
                ["Vigilance"] =                                   { class = "WARRIOR", level = 75, }, 
                ["Avatar"] =                                                        { class = "WARRIOR", level = 90, },
                ["Bloodbath"] =                                                { class = "WARRIOR", level = 90, },
                ["Storm Bolt"] =                                                { class = "WARRIOR", level = 90, }, 
};
