
## DragonflightUI (actualización — arreglos visuales del micromenú + más fixes)
- **Escudo de hermandad descuadrado**: Blizzard mete un frame hijo (`GuildMicroButtonTabard`) encima del botón con su propio anclaje interno cuando estás en una hermandad, y no había forma limpia de recolocarlo bien. Se esconde ese frame para que se vea el icono plano del addon, consistente con el resto de botones del micromenú (antes se veía el tabardo real pero desplazado hacia abajo).
- **Botón de "Buscar grupo" sin estilizar**: el addon buscaba el global `LFGMicroButton` (nombre usado en clientes más modernos) pero en este cliente se llama `LFDMicroButton` — como no lo encontraba, nunca lo tocaba y se quedaba con el aspecto nativo de Blizzard (con marco, sin pegar con el resto). Corregidas las 5 referencias.
- Marcos de personaje/objetivo/mascota, Darkmode y EditmodePreview: varias protecciones más contra campos y sub-elementos que no existen en este cliente (incluye un `hooksecurefunc` que fallaba al intentar enganchar una tabla nula).
- Sigue en pruebas: `/console scriptErrors 1` y pega el error tal cual si te sale alguno.

## DragonflightUI (actualización — muchos más fixes de compatibilidad)
- Segunda tanda grande de correcciones sobre el port a Legion 7.3.5, a partir de decenas de errores reportados jugando en directo tras la versión inicial experimental.
- Barras de recurso de clase (Paladín, Druida, Brujo, Monje, Sacerdote, Caballero de la Muerte) y sus globals asociados (`PaladinPowerBar`, `EclipseBarFrame`, `ShardBarFrame`, etc.) protegidos: en este cliente algunos existen como "stubs" sin los métodos reales, no solo como nil.
- Micromenú: botones que no existen en este cliente (PvP, Ayuda, extensor de la barra principal) ya no tumban el addon al cargar.
- Marcos de personalización (probador de ropa, misiones, gremio/gossip, taxi) protegidos frente a sub-elementos que no existen en este cliente (`DressUpModelFrame`, `QuestFrameCancelButton`, `GossipFrame.GreetingPanel`, `TaxiMerchant`, etc.).
- Minimapa: reloj, correo, calendario, brújula y el icono de rastreo (`GetTrackingTexture`) corregidos — mezcla de texturas sin `SetScale` en este cliente y de CVars/funciones que no existen aquí.
- Marco de mascota: texto de vida/maná protegido igual que los demás FontStrings sin `SetScale`.
- Tótems del chamán: se evita un crash cuando un tótem concreto no tiene icono en este cliente.
- Barra de acción: `SetAttributeNoHandler` (con fallback a `SetAttribute`) y una llamada nativa de Blizzard (`ActionButton_ShowGrid`) que a veces recibía un botón mal formado, ahora protegida con `pcall`.
- **Nuevo addon recomendado junto a este**: `!LegionBackdropShim` (ver más abajo) — soluciona un error de `BackdropTemplate` que puede afectar a DragonflightUI o a otros addons en este cliente.
- Sigue en fase de pruebas: si te sale algún error, `/console scriptErrors 1` y pega el texto en el canal.

## LegionBackdropShim (nuevo)
- Addon nuevo, mínimo e independiente: define un `BackdropTemplate` virtual vacío para este cliente Legion 7.3.5, que no lo trae porque en esta versión `SetBackdrop` ya es nativo en todos los frames (ese template solo se volvió necesario a partir de Battle for Azeroth 8.0, cuando Blizzard sacó el sistema de backdrop de los frames normales).
- Soluciona el error `CreateFrame(): Couldn't find inherited node "BackdropTemplate"` que salta en cualquier addon o librería escrita pensando en clientes modernos (por ejemplo, la copia de AceGUI-3.0 que trae **GarrisonCommander**, que crasheaba al abrir su menú del Shipyard).
- Solo hace falta tenerlo instalado y activado; no requiere configuración ni interfiere con ningún otro addon.

## DragonflightUI (nuevo, versión inicial experimental — Legion 7.3.5)
- Primer port no oficial de **DragonflightUI** (interfaz moderna estilo Dragonflight, de Karl-Heinz Schneider) a clientes Legion 7.3.5 — el addon original solo da soporte oficial a Cata Classic/Wrath. Se publica en fase experimental porque en la comunidad de Discord lo pidieron para probarlo.
- Docenas de errores de compatibilidad corregidos: texturas/objetos de UI que existen en este cliente pero sin ciertos métodos modernos (guardas defensivas), atlas de Dragonflight que no existen aquí y que sin arreglo se veían como un cuadrado verde sólido, y varias funciones que se ejecutaban por una mala detección de versión (`DF.Cata`/`DF.Wrath`) propia de este cliente.
- El panel de opciones (categorías + lista de ajustes) estaba completamente vacío porque dependía del framework moderno de Blizzard (ScrollBox/TreeDataProvider) que no existe en 7.3.5 — reescrito desde cero con widgets clásicos (checkboxes, sliders, dropdowns, color picker) manteniendo el mismo comportamiento.
- Los botones propios del addon en el menú de escape se superponían con los nativos del cliente — desactivados por ahora; usa `/dfedit` para abrir/cerrar el modo edición en su lugar.
- El "Quick Keybind" rápido está desactivado (dependía de APIs de keybinding modernas que no existen en este cliente).
- **Sigue en pruebas**: es posible que aparezcan errores puntuales al usarlo — si te sale alguno, avisa en el canal con `/console scriptErrors 1` activado y el texto del error.

## Details
- El aviso automático de "versión desactualizada" que se susurra a otros jugadores ahora está **desactivado por defecto** — antes se enviaba a todo el mundo salvo que lo desactivaras a mano.
- Nuevo `/detailspam guild` (o `/detailspam hermandad`): limita el aviso a que solo se les envíe a jugadores de tu propia hermandad, en vez de a cualquiera.
- Nuevo `/detailspam msg <texto>` (o `/detailspam mensaje <texto>`): permite personalizar el mensaje que se envía; usado sin texto restaura el mensaje predeterminado en español e inglés.
- El toggle original `/detailspam` (sin argumentos) se mantiene igual, activando/desactivando el envío del aviso.

## Auditoría de commits (varios addons)
- **OiLvl**: `Oilvl.lua` tenía un error de sintaxis (un `end` de más en `ORfbIlvl()`, de un intento anterior de filtrar "Entidad Desconocida" en escaneos agresivos) que impedía cargar el addon entero. Corregido manteniendo el filtro: ahora compila y sigue evitando que se guarde "Entidad Desconocida"/"Unknown" como nombre.
- **ChatFontFix**: restaurado el hook de `AddMessage` sobre los `ChatFrame` (atrapa mensajes reformateados por Prat/ElvUI antes de imprimirse) que se había perdido sin querer al simplificar `ChatFilter` en un commit posterior — la romanización dejaba de aplicarse a los mensajes que pasan por esos addons.
- **LoboExporter**: en la exportación de mazmorras/bandas, el campo `"dungeon"` del JSON salía siempre vacío por un typo (`dungeonName` en vez de la variable real `instanceName`). Además, se restauró el checkbox "Logros Pendientes", que seguía en la UI pero había dejado de incluirse en la exportación normal desde que se añadió el botón de token para IA.
- **WorldBossTracker**: recuperado el jefe de Islas Abruptas "Cosechador de almas" (id 43192), que se perdió al añadir localización a la lista de jefes de Legion.

## GarrisonCommander & OrderHallCommander
- Arreglado que el botón "Calculate" del Shipyard (control de misiones navales) avisara de "demasiados seguidores activos" sin relación con tu flota: `ShipControl.lua` comprobaba `IsAboveFollowerSoftCap` con el tipo de guarnición TERRESTRE (copiado tal cual de `MissionControl.lua`) en vez del tipo de la FLOTA NAVAL, así que el aviso se disparaba según tus seguidores terrestres ocupados, no tus barcos.

## OPie
- Arreglado un error Lua en el hint del Botón de Acción Adicional con cargas: `extrabuttonHint()` (en `Handlers.lua`) usaba la función global `time` en vez de `GetTime()` para calcular el cooldown restante de cargas, lanzando "attempt to perform arithmetic on a global 'time' (a function value)" cada vez que la acción del botón extra tenía cargas por debajo del máximo y estaba fuera de cooldown.
- Arregladas tres ventanas que aparecían vacías en pantalla nada más cargar el addon en vez de quedarse ocultas hasta abrirse: el editor de combinación alternativa de teclas y el prompt genérico de confirmación (`OPieConfig.lua`), y la ventana de "nuevo ring" del gestor de rings (`RingKeeperConfig.lua`) — a las tres les faltaba el `:Hide()` inicial tras crearse con `CreateFrame()`.

## WorldBossTracker
- v3.0.1 - Arreglado que la ventana se abriera sola cada vez que entrabas con el personaje: `CreateMainFrame()` se llama en cada `PLAYER_LOGIN` para tener el frame listo, pero un frame creado con `CreateFrame()` empieza visible por defecto y nunca se ocultaba. Ahora se oculta al terminar de crearse; se sigue abriendo normal con el icono del minimapa o `/tan`.

## Prat-3.0
- Arreglado un error Lua en `PlayerNames.lua` ("attempt to index local 'Name' (a nil value)") que saltaba al escanear la lista de hermandad: `GetGuildRosterInfo` puede devolver el nombre en `nil` para un miembro cuyos datos aún no han llegado del servidor justo tras `GuildRoster()`/al entrar al juego, y esa función no comprobaba el valor antes de usarlo (a diferencia de `updateBG`, que ya hace esa comprobación un poco más abajo en el mismo archivo). Añadido el mismo guardado.

## Recuperado del Historial de Discord
veeeenganza

---

## Recuperado del Historial de Discord
ahi ta la wea aesar

---

## Overachiever
- Parche de Localización y Optimización Legion (7.3.5). Se han traducido 75 líneas al español (esES y esMX).

## GarrisonCommander & OrderHallCommander
- Hotfix Crítico: Se ha eliminado el parche interno de botones fantasma que provocaba los errores LUA de 'C stack overflow', 'Font not set' y que marcaba erróneamente todos los edificios de la Ciudadela como 'Planos Necesarios'.

## Gatherer
- Parche de traducción: Añadido el nombre 'Epilobio' junto a 'Adelfilla' en las tablas esES/esMX para asegurar que el addon registre correctamente la recolección de esta planta en Warlords of Draenor.

## Gatherer
- Parche de compatibilidad (Minería): Añadidos los nombres en inglés ('True Iron Deposit', 'Blackrock Deposit') como *fallback* en la traducción española (esES/esMX) para compensar la falta de traducción de estos objetos por parte del servidor Tauri. Gatherer ahora los registrará correctamente.

## Gatherer
- Parche Anti-Taint: Modificados los hooks inseguros de LibSwag.lua (SetText) a hooksecurefunc para evitar la propagación de errores de Taint a otros addons durante el combate.

## CallOfElements
- v6.17 - Build de diagnóstico: la barra de tótems seguía sin aparecer aunque ya no salte ningún error Lua. La sospecha es que `GetMultiCastTotemSpells()` (la API con la que el addon detecta qué tótems tienes disponibles) ya no devuelve resultados en Legion, aunque siga existiendo sin dar error — así que la detección de tótems se queda vacía en silencio. Añadidos dos mensajes de chat temporales (`[Diagnostico v6.17]`) que muestran cuántos tótems candidatos encuentra esa API y cuántos pasan el filtro, para confirmarlo antes de reescribir la detección. Se quitarán en la próxima versión.
- v6.16 - Arreglado otro error Lua relacionado ("attempt to index field '?' (a nil value)" en `COE_Config.lua:1019`), al abrir la pestaña "Configurar Barra" del panel de configuración: las funciones de esa pestaña (Dirección, Modo de barra, Cantidad Flex) leían directamente `COE_TotemBars[COE_ActiveTalents][...]` sin comprobar que esa tabla ya existiera, así que si se abrían antes de que el addon terminara de fijar la especialización activa (o tras quedar datos desincronizados) fallaban. Añadido un guardado (`COE_EnsureTotemBars`) que se asegura de inicializar esos datos antes de usarlos.
- v6.15 - Arreglado un error Lua del asesor de tótems ("attempt to call global 'GetNumPartyMembers' (a nil value)"): esa API también fue eliminada de WoW y el addon la llamaba directamente al escanear al grupo en busca de venenos/enfermedades/atascos. Sustituida por un wrapper compatible (`COE_GetNumPartyMembers`) que usa `GetNumGroupMembers()` en Legion.
- v6.14 - Arreglado el bug que impedía ver las barras de tótems: el addon llamaba a `GetActiveTalentGroup()`, una API del sistema de dual-spec eliminada en Legion, en cada `PLAYER_ENTERING_WORLD`. Esto lanzaba un error Lua que abortaba la inicialización antes de fijar la especialización activa, y con ese dato en `nil` el addon volvía a fallar en cada frame al intentar mostrar la barra (por eso nunca aparecía) y también al abrir la pestaña "Totem Sets" del panel de configuración (por eso se quedaba superpuesta al cambiar de pestaña). Sustituido por un wrapper compatible (`COE_GetTalentGroup`) que usa `GetSpecialization()` en Legion.
- CallOfElements v6.13 adaptado para Legion (7.3.5): resucitado y adaptado este clásico gestor de tótems (original de MoP) para que funcione en Legion sin errores Lua.
- Arreglo del sistema de sonido: adaptado a los requisitos de la API 7.3 que rompían el addon al pulsar en los menús.
- Limpieza de código obsoleto (Chronos): purgado y modernizado el uso de variables descontinuadas en toda su estructura, permitiendo que la configuración y las barras abran sin fallos.
- Nota: los tótems eliminados de la expansión son ignorados automáticamente por el addon, mostrando solo los que tengas en tu libro de hechizos.
- Reubicado de la raíz del repo a `Proyectos/CallOfElements` para que el workflow de release lo empaquete correctamente (antes vivía fuera de `Proyectos/` y el zip nunca se generaba).
