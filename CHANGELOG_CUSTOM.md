# Registro de Cambios Personalizados (WoW Legion 7.3.5 Addons)

## Resumen Ejecutivo del Repositorio

El presente documento constituye el informe técnico y funcional consolidado sobre las modificaciones, integraciones y nuevas creaciones desarrolladas en la plataforma de addons para World of Warcraft: Legion (versión 7.3.5, `Interface: 70300`). El proyecto abarca la transición completa entre la versión base original del repositorio y el estado actual optimizado para servidores como Tauri Legion 7.3.5.

### Métricas y Estadísticas Globales de Git
- **Rango de Commits**: Commit Inicial `d9060e9` (*"Versión original 7.3.5"*) al HEAD actual `d878149` (*"Mejoras de la IA (Tracking y arreglos de interfaz)"*).
- **Estadísticas Globales de Diferencias**:
  - **Archivos Modificados/Añadidos**: 2,813 archivos cambiados en total.
  - **Inserciones de Líneas**: +468,968 líneas de código, metadatos y recursos.
  - **Eliminaciones de Líneas**: -11,063 líneas refactorizadas o sustituidas.
  - **Desglose por Tipo de Archivo**: 1,842 archivos nuevos agregados (`A`), 971 archivos modificados (`M`), 0 archivos eliminados (`D`).
- **Estructura Global de Carpetas**:
  - **Total de Entradas Principales**: 332 entradas (331 directorios de addons/librerías y 1 archivo `README.md`).
  - **Addons Nuevos Agregados**: 86 directorios principales.
  - **Addons Existentes Modificados**: 211 directorios principales.
  - **Addons Eliminados**: 0 directorios.
  - **Addons Sin Cambios (Invariables)**: 35 directorios/archivos.

---

## Addons Personalizados y Nuevas Creaciones

### WoWDiscordRPC
- **Ubicación de Archivos**: `WoWDiscordRPC/WoWDiscordRPC.toc`, `WoWDiscordRPC/WoWDiscordRPC.lua`
- **Autoría y Versión**: Teamwork (v1.0.0, Interface `70300`)
- **Propósito Funcional**: Permite la transmisión de estado en vivo desde el cliente WoW Legion 7.3.5 hacia aplicaciones externas de Discord Rich Presence sin requerir inyección de DLLs ni lectura de memoria externa del proceso.
- **Arquitectura de IPC de Telemetría RGB 16x4**:
  - **Marcos de Renderizado Doble**: Crea dos marcos invisibles en pantalla (`WoWDiscordRPC_IPCAnchor1` en `BOTTOMLEFT` y `WoWDiscordRPC_IPCAnchor2` en `BOTTOMRIGHT`) escalados dinámicamente mediante `1 / UIParent:GetEffectiveScale()` para garantizar renderizado exacto 1:1 pixel a pixel.
  - **Protocolo de 4 Píxeles RGB**:
    - **Píxel 1 (Cabecera Mágica)**: RGB `(87, 79, 87)` codificando los caracteres ASCII `'W'`, `'O'`, `'W'`.
    - **Píxel 2 (Clase, Privacidad y Estado de Actividad)**:
      - *Canal Rojo*: ID Numérico de Clase (1 a 12: Guerrero, Paladín, Cazador, Pícaro, Sacerdote, Caballero de la Muerte, Chamán, Mago, Brujo, Monje, Druida, Cazador de Demonios).
      - *Canal Verde*: Máscara de Privacidad por bits (Bit 0: Ocultar Nombre, Bit 1: Ocultar Nivel, Bit 2: Ocultar Zona, Bit 3: Ocultar Estado).
      - *Canal Azul*: Código de Actividad (0: En Solitario, 1: En Combate, 2: En Grupo, 3: AFK, 4: Muerto/Muerto viviente, 5: En Banda).
    - **Píxel 3 (Nivel y Zone ID de 16 bits)**:
      - *Canal Rojo*: Nivel de personaje (1 a 255).
      - *Canal Verde*: Byte alto de la ID de Zona (`math.floor(zoneID / 256)`).
      - *Canal Azul*: Byte bajo de la ID de Zona (`zoneID % 256`).
    - **Píxel 4 (Versión, Suma de Comprobación y Especialización)**:
      - *Canal Rojo*: Versión de protocolo (`1`).
      - *Canal Verde*: Suma de comprobación Módulo 256 (`(P2_R + P2_G + P2_B + P3_R + P3_G + P3_B) % 256`).
      - *Canal Azul*: Índice de Especialización activa (0 a 4).
- **Panel Nativo de Opciones**: Registra `WoWDiscordRPCOptionsPanel` en el menú nativo de Opciones de Interfaz de Blizzard con controles para `hide_level`, `hide_zone` y `hide_status`.
- **Caché de Mapas en Español**: Al evento `ADDON_LOADED`, escanea e indexa los nombres de mapa traducidos (`GetMapNameByID`) para los IDs 1..2000 almacenándolos en `WoWDiscordRPC_DB.Mapas`.
- **Gestión de Eventos**: Escucha 9 eventos de juego (`PLAYER_LOGIN`, `ZONE_CHANGED_NEW_AREA`, `PLAYER_REGEN_DISABLED`, `PLAYER_REGEN_ENABLED`, etc.) impulsado por un temporizador `OnUpdate` de 1.0 segundos.

### TauriTrainerFix
- **Ubicación de Archivos**: `TauriTrainerFix/TauriTrainerFix.toc`, `TauriTrainerFix/core.lua`
- **Autoría y Versión**: Artiom97es (v1.1-Artiom97es, Interface `70300`)
- **Propósito Funcional**: Corrige los errores críticos y cuelgues recurrentes de interfaz (`attempt to compare number with nil`) al interactuar con instructores de clase o profesión en el servidor Tauri WoW Legion 7.3.5.
- **Mecanismo de Intercepción de API**:
  - **Hook a `GetTrainerServiceLevelReq(index)`**: Envuelve la llamada nativa de Blizzard devolviendo de manera segura `0` en lugar de `nil` cuando el servidor no retorna un nivel requerido válido.
  - **Hook a `GetTrainerServiceInfo(index)`**: Garantiza que el 5º valor devuelto (`reqLevel`) sea por defecto `0` si la API devuelve `nil`.
  - Evita fallos en `Blizzard_TrainerUI` al evaluar la condición interna `reqLevel > UnitLevel("player")`.

### LoboExporter & LoboTracker
- **Ubicación de Archivos**: `LoboExporter/LoboExporter.toc`, `LoboExporter/LoboExporter.lua`
- **Autoría y Versión**: Artiom97es (v1.0.1-Artiom97es, Interface `70300`)
- **Propósito Funcional**: Suite dual que combina un exportador gráfico completo de datos de personaje para análisis externo/IA y un sistema interactivo de rastreo e inspección de logros sobre el mapa de los continentes (`LoboTracker`).
- **Exportador de Datos de Personaje**:
  - Recopila datos de personaje (Nombre, Reino, Clase, Nivel), nivel de objeto medio e equipado (`GetAverageItemLevel`), monedas y oro, reputaciones de facciones, seguidores de la Sede de Clase/Ciudadela (desglosando facultades y rasgos mediante enlaces `garrfollower:`), y estado detallado de logros.
  - Formato Dual Seleccionable: Salida estructurada en JSON (`formatJSON = true`) o Texto Plano legible.
  - Motor de búsqueda interactivo (`PerformSearch`) con filtrado de texto plano que previene errores de sintaxis de patrones regex en Lua.
- **Rastreador Interactivo en Mapas Continente (`LoboTracker`)**:
  - Dibuja botones interactivos (`LoboMapPin`) anclados directamente sobre los visores de mapa continental (`WorldMapDetailFrame` / `WorldMapButton`) en 9 continentes de WoW (Kaldorei/Kalimdor, Reinos del Este, Terrallende, Rasganorte, La Vorágine/Infralar, Pandaria, Draenor, Islas abruptas de Legion y Argus).
  - Estado Gráfico de Logros: Icono verde `ReadyCheck-Ready` para logros completados y cruz roja `ReadyCheck-NotReady` para logros pendientes.
  - Al pasar el cursor muestra tooltips contextuales con el estado de avance (`completado / total`), y al hacer clic reproduce sonidos y emite un informe al chat.
- **Módulo de Transfiguración Bikini Plate**:
  - Incluye la tabla `BIKINI_PLATES_IDS` para rastrear la recolección de sets raros de placas (Gloriosa, Escamadesangre, Vanguardia, Sal de piedra, Tirana) usando `C_TransmogCollection.PlayerHasTransmog`.
- **Comandos de Consola**: `/loboexport`, `/lex`, `/exportar`, `/lex debug`, `/lex progreso`, `/lex bikini`, `/lex search`.

### RaidAchievement Suite (RaidAchievement, RaidAchievement_LegionHeroics, RaidAchievement_LegionRaids)
- **Ubicación de Archivos**:
  - `RaidAchievement/` (Core, UI, `RaBroker.lua`, efectos de sonido `Alert.ogg`, `applause.ogg`, etc.).
  - `RaidAchievement_LegionHeroics/` (`RaidAchievement_LegionHeroicsbosses.lua`, `RaidAchievement_LegionHeroics.xml`, `.toc`).
  - `RaidAchievement_LegionRaids/` (`RaidAchievement_LegionRaidsbosses.lua`, `RaidAchievement_LegionRaids.xml`, `.toc`).
- **Autoría y Versión**: Artiom97es (v1.1-Artiom97es, Interface `70300`)
- **Propósito Funcional**: Detección automatizada, seguimiento de criterios y alertas sonoras/mensajes de fallo o éxito para logros de mazmorras heroicas y bandas de Legion.
- **Monitoreo de Eventos y Módulos**:
  - Registra `COMBAT_LOG_EVENT_UNFILTERED`, `CHAT_MSG_MONSTER_YELL`, `CHAT_MSG_MONSTER_SAY`, `PLAYER_REGEN_DISABLED` y `PLAYER_REGEN_ENABLED` al entrar en instancias (`GetInstanceInfo`).
  - **Mazmorras Heroicas de Legion**: Rastrea 13 logros específicos (ej. 10710 Lamento del Torreón Oscuro, 10544 Fiesta de ciervos, 10875 No se puede comer solo uno, 10456 ¡Pero si dices que solo es un amigo!, 10457 Consérvate salado, 10458 Listos para la ráfaga V, 10766 Huevocracia, 10769 Fuego a la casa, 10413 Karma instantáneo, 10543 Protector contra sobretensiones, 10773 Contacto arcánico, 10776 No hay tiempo que perder, 10680 ¿Quién teme a la oscuridad?).
  - **Bandas de Legion**: Cobertura completa para Pesadilla Esmeralda, Bastión Nocturno, Tumba de Sargeras y Antorus el Trono Ardiente.
  - Alertas sonoras personalizadas (`Alert.ogg`, `Xylo.ogg`, `applause.ogg`, `mario.ogg`, `cat.ogg`) y canalización de anuncios a banda, grupo o ventana privada (`wherereportpartyach`).

### ChatFontFix
- **Ubicación de Archivos**: `ChatFontFix/ChatFontFix.toc`, `ChatFontFix/core.lua`, `ChatFontFix/dictionary.lua`
- **Autoría y Versión**: Artiom97es (v1.2-Artiom97es, Interface `70300`)
- **Propósito Funcional**: Soluciona el error clásico del cliente de WoW donde la presencia de caracteres no latinos (cirílico, asiático CJK, griego, árabe) distorsiona o agiganta descontroladamente las fuentes de chat.
- **Motor de Transliteración Unicode (`RomanizeString`)**:
  - **Cirílico (Unicode 1040..1103)**: Transliteración fonética a caracteres latinos (ej. `Privet`).
  - **Griego (913..969) y Árabe (1569..1610)**: Conversión a representación latina equivalente.
  - **Japonés (Kana 12353..12532)**: Mapeo directo a Romaji.
  - **Coreano (Hangul 44032..55203)**: Algoritmo de descomposición de sílabas Jamo (tablas de consonantes iniciales, vocales medias y finales).
  - **Chino CJK**: Diccionario en `dictionary.lua` con más de 40,000 ideogramas mapeados individualmente a Pinyin.
  - **Etiquetas de Respaldo**: En caso de desactivar transliteración, inserta marcadores de origen (`[CN]`, `[KR]`, `[JP]`, `[AR]`, `[GR]`).
- **Control de Frecuencia de Chat (Rate-Limiting)**:
  - Intercepta `SendChatMessage` aplicando un acelerador de cola de 1.25 segundos para evitar desconexiones por spam en el servidor, omitiendo automáticamente las alertas emitidas por DBM (`DBM-` / `DBMCore`).
  - Intercepta 16 eventos de chat nativos y proporciona panel de configuración en la interfaz (`ChatFontFixOptionsPanel`) junto con el comando `/cff`.

---

## Mejoras y Optimizaciones en Addons Existentes

### WorldQuestTracker
- **Archivos Modificados**: `WorldQuestTracker/WorldQuestTracker.lua`, `WorldQuestTracker/WorldQuestTracker.toc`, `libs/LG/LibGraph-2.0.lua`, `libs/DF/LibDFramework-1.0.toc`
- **Mejoras Aplicadas**:
  - **Sincronización de Grupo (`CreatePartySharer`)**: Corrige la sincronización de misiones en grupo validando el número de datos recibidos contra `#group`. Maneja la transferencia de liderazgo cuando proviene de jugadores desconectados y programa actualizaciones con retraso de 10s para evitar saturación de mensajes.
  - **Rastreo Directo con 1 Clic**: Los controladores `OnClick` en iconos de misiones del mapa de zona y mapa del mundo añaden la misión directamente al rastreador activo sin requerir menús contextuales.
  - **Renderizado de Poder de Artefacto (AP)**: Fuerza la evaluación `if (true or artifactPower >= 250)` para asegurar el dibujo uniforme del icono de recompensa de AP independientemente del multiplicador de conocimiento de artefacto.
  - **Soporte Monetario Asiático**: Formateo de monedas con símbolos de miles/millones para Coreano (`천`, `만`, `억`), Chino Simplificado (`千`, `万`, `亿`) y Chino Tradicional (`千`, `萬`, `億`).
  - **Corrección Gráfica de Mapas**: Oculta widgets del mapa mundial al hacer zoom en mapas de zona estándar y resuelve el fallo gráfico de bordes verdes en misiones de profesión (`circleBorder`).

### ZPerl UnitFrames
- **Archivos Modificados**: 23 archivos en la suite `ZPerl`, `ZPerl_Player`, `ZPerl_Target`, `ZPerl_PartyPet`, `ZPerl_PlayerPet`, `ZPerl_TargetTarget`, `ZPerl_Options`.
- **Mejoras Aplicadas**:
  - **Eliminación de Recolección de Basura Forzada**: Se eliminaron las llamadas explícitas `collectgarbage()` en `ZPerl.lua` y `ZPerl_FrameOptions.lua`, erradicando tirones (*stuttering*) en bandas y combates intensos.
  - **Protección de Combate y Cola de Desbloqueo (`InCombatLockdown`)**: Se agregaron comprobaciones `InCombatLockdown()` en la actualización de atributos de marcos (`extendedPortrait`, `noDruidBar`, `xpBar`, `repBar`, `showRunes`, `dockRunes`). Las modificaciones solicitadas durante combate se posponen de forma segura en `XPerl_OutOfCombatQueue` para evitar *taints* de marcos protegidos.
  - **Optimización de Sintaxis Lua**: Reemplazo de inserciones antiguas por sintaxis de índice rápido `self.FlashFrames[#self.FlashFrames+1] = self.runes`.

### Spy (PvP Tracker)
- **Archivos Modificados**: `Spy/Spy.lua`, `Spy/List.lua`, `Spy/MainWindow.lua`, `Spy/SpyStats.lua`, `Spy/Locales/Spy-esMX.lua`, etc.
- **Mejoras Aplicadas**:
  - **Actualización a HereBeDragons 2.0**: Integración de `HereBeDragons-2.0.lua` y `HereBeDragons-Pins-2.0.lua` para cálculo exacto de coordenadas y dibujado de pines en zonas de Legion 7.3.5.
  - **Compatibilidad SoundKit 7.3.5**: Sustitución de llamadas de sonido tipo cadena `PlaySound("igMainMenuOption")` por la ID numérica de SoundKit `PlaySound(856)`.
  - **Integración AceGUI SharedMediaWidgets**: Suite completa de selectores visuales para fuentes, bordes, fondos y sonidos en el menú de configuración de Spy.
  - **Localización al Español Latino (`esMX`)**: Adición de `Spy-esMX.lua` para tradución completa de la interfaz de detección de enemigos. Optimización de tablas mediante `#list+1`.

### TanaanTracker
- **Archivos Modificados**: `TanaanTracker/TanaanTracker.lua`, `TanaanTracker/Sync_Manual.lua`, `UI_Main.lua`, `UI_Minimap.lua`
- **Mejoras Aplicadas**:
  - **Eliminación de Taints de Interfaz**: Reemplazo completo del menú desplegable nativo `UIDropDownMenuTemplate` por un botón personalizado `UIPanelButtonTemplate` (`realmBtn`) que rota de manera segura por `SortedRealmNames()`, integrado con ElvUI (`S:HandleButton`).
  - **Sincronización Manual de Cronómetros (`Sync_Manual.lua`)**: Sistema de solicitud de temporizadores de rares entre miembros de grupo/banda con confirmaciones formateadas en chat (`|cff66ff66[TanaanTracker]|r`).
  - **Banner Flotante Animado**: Creación de `TanaanTrackerAlertFrame` centrado en pantalla con fuente Friz Quadrata de 26pt, texto en contorno naranja brillante (`1, 0.5, 0`) y desvanecimiento progresivo al detectar un rare.
  - **Seguridad en Combate**: Registro de `PLAYER_REGEN_ENABLED` para posponer refrescos de interfaz (`_pendingUpdateUI`) tras salir de combate.

### PetTracker
- **Archivos Modificados**: `PetTracker/Features/Objectives.lua`, `PetTracker/Features/WorldMap.lua`, `PetTracker/PetTracker.lua`
- **Mejoras Aplicadas**:
  - **Eliminación de Hooks en ObjectiveTracker**: Eliminación de `HeaderButton:HookScript('OnHide')` y `HeaderButton:SetShown` en el marco de objetivos de Blizzard para evitar bloqueos de acción protegida en combate.
  - **Actualización Diferida de Mapas**: Protección con `InCombatLockdown()` en `SetMapToCurrentZone()` y `TrackingChanged()`, difiriendo la actualización hasta el evento `PLAYER_REGEN_ENABLED` (`pendingZoneUpdate` y `pendingTrackingUpdate`).
  - **Verificación de Seguridad**: Guardas `issecurevariable(frame, "PreClick")` en manejadores de clics.

### AllTheThings
- **Archivos Modificados**: `AllTheThings/AllTheThings.lua`, `AllTheThings/Settings.lua`, `AllTheThings/locales/esES.lua`
- **Mejoras Aplicadas**:
  - **Desactivación de Recolección de Basura**: Desactivación de llamadas a `collectgarbage()` para prevenir micro-congelamientos al procesar bases de datos masivas de coleccionables.
  - **Protección de Marcos Prohibidos**: Adición de verificaciones `self.IsForbidden and self:IsForbidden()` y envoltorios protegidos (`SafeHide`, `SafeClearPoints`) con `pcall` sobre `GameTooltip`, `GameTooltipIcon` y `GameTooltipModel`.
  - **Compatibilidad API 7.3.5**: Integración de `C_MountJournal.GetMountInfoByID` mediante `MOUNT_SPELLID_TO_MOUNTID` y verificaciones en `C_PetJournal.GetNumCollectedInfo`. Actualización de descripciones en `esES.lua`.

### Altoholic & DataStore
- **Archivos Modificados**: Más de 70 archivos en las suites `Altoholic` y `DataStore`.
- **Mejoras Aplicadas**:
  - **Optimización Masiva de Inserción en Tablas**: Sustitución sistemática de llamadas a `table.insert(t, v)` por la asignación directa por índice `t[#t+1] = v` en todos los módulos de inventario, misiones diarias, resumen de personajes, correo y monedas.
  - **Actualización de Librerías LibBabble**: Actualización de referencias a `LibBabble-Boss-3.0` y `LibBabble-Faction-3.0`.
  - **Manejo Multirreino**: Agregación optimizada de personajes entre reinos conectados (`nameList[#nameList+1] = character`).

### DBM (Deadly Boss Mods)
- **Archivos Modificados/Añadidos**: 841 archivos en `DBM-Core`, `DBM-GUI`, `DBM-AntorusBurningThrone`, `DBM-Party-Legion`, `DBM-SMGEventsPack`, `DBM-VPJoluSpanish`.
- **Mejoras Aplicadas**:
  - **Ajustes en Antorus el Trono Ardiente y Mazmorras**: Actualización de temporizadores, fases e IDs de hechizos para Aggramar, Argus, Eonar, Garothi, Hasabel, Imonar, Kin'garoth, Cónclave de las Shivarra y Varimathras.
  - **Paquete de Audio Chiptune (`DBM-SMGEventsPack`)**: Incorporación de victorias y música de encuentro acapella/chiptune de SmoothMcGroove (Chrono Trigger, Final Fantasy, Mega Man, Mario, Zelda).
  - **Paquete de Voces en Español (`DBM-VPJoluSpanish`)**: Añadido paquete completo con más de 460 archivos de audio `.ogg` en español (`bloodlust.ogg`, `bombyou.ogg`, `deffensife_now.ogg`).

### OrderHallCommander
- **Archivos Modificados**: `OrderHallCommander/localization.lua`, `OrderHallCommander.toc`
- **Mejoras Aplicadas**:
  - **Traducción Completa al Español (`esES`/`esMX`)**: Traducción integral de todas las opciones de despacho estratégico de misiones en la Sede de Clase:
    - `"Probabilidad base"`, `"Probabilidad extra"`, `"Evitar muerte de tropas"`, `"No usar tropas"`, `"Mantener coste bajo"`, `"Inicio rápido de la 1ª misión"`, `"Misiones vacías al final"`, `"Ignorar seguidores ocupados"`.

### HandyNotes Suite
- **Archivos Modificados**: 91 archivos en `HandyNotes`, `HandyNotes_Argus`, `HandyNotes_LegionClassOrderHalls`, `HandyNotes_LegionRaresTreasures`.
- **Mejoras Aplicadas**:
  - **Actualización de API de Mapas**: Migración del motor de coordenadas a `HereBeDragons-1.0` y `HereBeDragons-Pins-1.0`.
  - **Manejador de Llamadas Seguras (`Safecall Dispatcher`)**: Implementación de envoltorios `xpcall` extraídos de AceAddon-3.0 en `HandyNotes.lua` para evitar que un fallo en un pin anule el renderizado de los demás.
  - **Nuevos Pines de Argus y Sedes**: Incorporación de tesoros, rares y portales para las zonas de Argus (7.3) y Sedes de Clase.

### Leatrix_Plus
- **Archivos Modificados**: `Leatrix_Plus/Leatrix_Plus.lua`, `Leatrix_Plus/Leatrix_Plus.toc`
- **Mejoras Aplicadas**:
  - **Optimización de Memoria**: Desactivación de llamadas pesadas a `UpdateAddOnMemoryUsage()` durante la navegación por menús.
  - **Control de Teclado y Tecla Escape**: Habilitación de entrada por teclado (`EnableKeyboard(true)`) y vinculación de `OnEscapePressed` a `ClearFocus()` en cuadros de búsqueda e introducción de texto (`aEB`, `eEB`, `mEB`), permitiendo cerrar el foco limpiamente al pulsar Escape.
  - **Diccionario Multilingüe**: Adición de traducciones de niveles de unidad, títulos de jefes, élites y rares para Español, Ruso, Francés, Alemán, Italiano, Coreano y Chino.

### Oilvl (Overall Item Level)
- **Archivos Modificados**: `Oilvl/Oilvl.lua`, `Oilvl/Oilvl.toc`
- **Mejoras Aplicadas**:
  - **Prevención de Bloqueos de Inspección**: Adición de `ClearInspectPlayer()` tras el evento `INSPECT_READY` y tras un tiempo límite de 2.0 segundos, evitando que el modelo 3D inspeccionado quede atascado en memoria.
  - **Desactivación de Garbage Collection**: Eliminación de llamadas forzadas a `collectgarbage()`.
  - **Verificación Bagnon**: Verificación de seguridad `if Bagnon and BagnonFrameinventory then` y actualización a SoundKit ID 856.

### Prat-3.0
- **Archivos Modificados**: 42 archivos en `Prat-3.0/addon`, `Prat-3.0/modules`.
- **Mejoras Aplicadas**:
  - **Módulo Personalizado de Felicitaciones ("Grats")**: Adición de opciones `customGrats`, `customGratsText` y `grats_donthave_1..10` con traducción completa al español (`"Felicidades %s"`, `"¡Enhorabuena %s!"`, `"Usar Mensaje de Felicitación Personalizado"`).
  - **Actualización del Núcleo**: Actualización del motor Prat a la revisión r1150 (v3.5.71).

### Otros Addons Optimizados
- **TomTom**: Optimización de tablas (`t[#t+1] = v`) y actualización del transformador de mapas `HereBeDragons-1.0`.
- **Titan Panel Suite**: Modernización de índices de arrays en Lua (`TitanMovable[#TitanMovable+1]`, `TitanPluginsIndex[#TitanPluginsIndex+1]`) y reemplazo de `table.getn()` por `#tbl` en `TitanGold`, `TitanRepair` y `TitanXP`.
- **TipTac**: Corrección de la expresión regular `TT_LevelMatchPet` para hacer coincidir las cadenas traducidas de duelistas salvajes de la 7.3.5 (`TOOLTIP_WILDBATTLEPET_LEVEL_CLASS`).
- **Wholly**: Corrección de anclajes de mapas fijando los botones directamente al marco `WorldMapFrame.BorderFrame`.
- **oRA3**: Optimización de pre-asignación de cadenas de unidad (`unitstrings.raid[#unitstrings.raid+1]`), actualización de `LibGroupInSpecT-1.1` y `LibDialog-1.0`.
- **Pawn**: Actualización de la llamada de sonido `PlaySound("igMainMenuOptionCheckBoxOn")` a la ID numérica de SoundKit 856.
- **QuestAnnounce**: Actualización a SoundKit ID 856 y traducciones al español (`"Anunciar cada"`, `"terminado"`, `"progreso"`).
- **Auc-Advanced (Auctioneer)**: Desactivación de `collectgarbage()` en `CoreScan.lua` y registro de ventanas en `UISpecialFrames` para permitir el cierre con la tecla Escape.
- **SexyMap**: Reutilización y reutilización de marcos en `contentFrameCache[#contentFrameCache+1] = self`.
- **NPCScan**: Actualización de librerías compartidas (`HereBeDragons-2.0`, `LibDialog-1.0`) y registro en `UISpecialFrames`.
- **Bagnon**: Renderizado de superposición de texto en las cabeceras de cuadrículas del inventario (`C A R A M Á X I M A`) al abrir mochilas en `itemFrame.lua`.
- **Stubby & !Swatter**: Sustitución de `table.getn()` por el operador de longitud `#` (`#(SwatterData.errors)`).

### Librerías Compartidas y Metadatos TOC
- **Estandarización de Metadatos en Archivos `.toc`**:
  - **Autoría Unificada**: Adición/actualización de la etiqueta `## Author: Artiom97es` en los addons modificados del repositorio.
  - **Versión de Interfaz Garantizada**: Estandarización de `## Interface: 70300` para compatibilidad directa con el cliente World of Warcraft Legion 7.3.5.
- **Actualización de Librerías Compartidas Embebidas**:
  - **HereBeDragons 2.0 / 1.0**: Núcleo actualizado para transformación de coordenadas de zona, mapas del mundo e instancias de Legion.
  - **AceGUI-3.0-SharedMediaWidgets**: Selectores de fuentes, sonidos, bordes y texturas compartidas.
  - **LibDialog-1.0**: Gestión segura de cuadros de diálogo y modales en interfaz.
  - **LibGroupInSpecT-1.1**: Inspección avanzada de especializaciones, talentos y funciones en grupo/banda.

---
*Informe generado y sintetizado para el repositorio WoW Addon Repository (Legion 7.3.5).*
