# [v3.0.2] - 2026-08-18

Corrección sobre el token para la IA (botón "Obtener Token para IA" de la
pestaña "Exportar Personaje" / comando `/lex verificar`).

- **El token generaba JSON inválido y el bot lo rechazaba** ("El token
  proporcionado es inválido"). `GenerateAIToken()` anteponía una clave
  (`"currencies": `, `"reputations": `, `"followers": `,
  `"achievements_completed": `, `"achievements_incomplete": `) delante de
  cada bloque, pero esas funciones ya devuelven su propio JSON con su
  propia clave (`"wealth"`, `"reputations"`, `"followers"`,
  `"completedAchievements"`/`"incompleteAchievements"`/`"allAchievements"`),
  así que el resultado quedaba con una clave pegada a otra sin separador
  válido. Ahora cada bloque se usa tal cual lo devuelve su función. Este
  era el mismo bug ya documentado (y arreglado) en la reescritura v3.0.0
  de más abajo, pendiente de desplegar; aquí se corrige puntualmente sobre
  la versión que corre en el juego.

# [v3.0.1] - 2026-08-18

Cambio pequeño sobre la versión que corre en el juego (la reescritura
completa de más abajo, v3.0.0, sigue pendiente de desplegar sobre el
cliente — se queda para más adelante).

- **Nuevo comando `/lex verificar`**: abre el addon directamente en la
  pestaña "Exportar Personaje", donde está el botón "Obtener Token para IA
  (Discord)". No genera el token solo, únicamente lleva ahí al jugador.
  El comando del bot de Discord para vincular la cuenta sigue siendo
  `/verificar_personaje` (eso no cambia, solo se añadió el atajo dentro
  del juego).

# [v3.0.0] - 2026-08-16

Reescritura completa del AddOn. Ninguna opción de la 2.x ha desaparecido.

## Errores corregidos

- **Recursión infinita en los comandos.** `/lex debug` y `/lex progreso` se
  llamaban a sí mismos (`SlashCmdList["LOBOEXPORTER"]("debug")` dentro del
  propio manejador de `"debug"`). Los botones *Mostrar Progreso* e *Info Mapa*
  disparaban justo esos comandos, así que colgaban el cliente. Ahora cada
  subcomando ejecuta su propia función.
- **`UpdateLoboMapPins()` no existía.** Las dos casillas de la pestaña
  "Opciones y Mapa" llamaban a una función que nunca se programó: pulsarlas
  soltaba un error de Lua y la funcionalidad de pines estaba vacía. Ahora está
  implementada de verdad (ver *LoboTracker*).
- **`dungeonName` era una errata de `instanceName`.** Todo el botín de mazmorras
  se exportaba con `"dungeon": ""`. Se exportaba mal desde la v2.0.0.
- **El token para la IA generaba JSON inválido.** Concatenaba `"currencies": `
  delante de un bloque que ya traía su propia clave `"wealth":`, produciendo
  `"currencies":   "wealth": {...}`. El bot no podía parsearlo. Lo mismo con
  reputaciones y logros.
- **La casilla "Logros Pendientes" no hacía nada** en la exportación normal:
  `GenerateExport` sólo miraba `exportCompletedAchievs`. Sólo tenía efecto en el
  token.
- **La casilla "Seguidores" no se restauraba** al abrir la ventana: `OnShow`
  sincronizaba todas las casillas menos esa.
- **Las opciones nuevas nunca llegaban a los usuarios antiguos.** El patrón
  `LoboExporterDB = LoboExporterDB or {...}` conserva la tabla guardada tal
  cual, así que cualquier clave añadida después salía `nil`. Ahora hay una
  fusión de valores por defecto en `ADDON_LOADED`.
- **Botín duplicado.** `seenItems` se reiniciaba en cada dificultad, así que el
  mismo objeto se guardaba una vez por Normal, Heroico y Mítico.
- **La Guía de Aventuras se quedaba tocada.** Se restauraba el filtro de clase
  pero no el nivel (tier), la instancia ni la dificultad seleccionados.
- **Faltaba la dificultad Buscador** en el escaneo de bandas.
- **Los emoji no se ven en 7.3.5.** La fuente del cliente no los tiene y salían
  como cuadros. Sustituidos por texturas del juego (`|T...|t`).

## Novedades

- **LoboTracker: pines en el mapa del mundo.** El cliente no expone en ninguna
  API las coordenadas de un logro, así que el AddOn trae el motor completo más
  un editor dentro del juego: te colocas en el sitio y pulsas *Añadir pin en mi
  posición*, opcionalmente asociándolo a un ID de logro y a un criterio. El pin
  se oculta solo al completarlo (o se queda con el check verde, según las dos
  casillas de siempre). Clic derecho sobre un pin para borrarlo. Los pines se
  guardan en SavedVariables y se exportan en JSON para compartirlos.
- **Cancelar.** Cualquier exportación larga se puede detener a mitad.
- **Nuevas secciones de exportación:** especialización y estadísticas
  secundarias, talentos activos, profesiones y arma artefacto.
- **Campeones de la Sede de Clase** además de los seguidores de Ciudadela.
- **Datos de equipo más completos:** itemID, calidad, encantamiento y enlace.
- **Reputaciones de amistad** (Nomi y compañía) con su escala correcta.
- **La ventana se puede redimensionar** y recuerda tamaño y posición.
- **`/lex ayuda`** con todos los comandos, y `/lex pin`, `/lex pines`,
  `/lex buscar`, `/lex cancelar`, `/lex reset`.

## Cambios internos

- Dividido en 7 archivos (`Core`, `Data`, `Export_Character`, `Export_Journal`,
  `Map`, `UI`, `Commands`) en vez de un único `.lua` de 1260 líneas.
- **Los recolectores devuelven tablas Lua, no texto.** El JSON se serializa al
  final con un codificador propio, así que es imposible generar JSON roto. Las
  claves salen ordenadas, de modo que dos exportaciones iguales dan el mismo
  texto (útil para cachear en el bot).
- **Escaneo asíncrono por tiempo, no por elementos.** La corrutina cede el
  control cada ~8 ms reales en vez de "cada N objetos", así que el juego no se
  congela dé igual lo lento que sea el PC. Los logros, que antes se recorrían de
  forma síncrona, ya no bloquean el cliente.
- **Base64 reescrito** con aritmética por bytes; la versión anterior hacía
  exponenciales carácter a carácter y tardaba segundos con textos grandes.
- La lectura de `EJ_GetLootInfoByIndex` usa primero la firma posicional y sólo
  recurre a la deducción por forma cuando el cliente devuelve los campos
  descolocados, que es lo que pasa en Tauri con algunas reliquias.
- El escaneo de logros se hace **una sola vez** aunque estén marcadas las dos
  casillas de logros.

## Verificación

Se incluye un banco de pruebas (`test/`) con un simulador de la API de WoW que
ejecuta el AddOn fuera del juego: **86 comprobaciones**, incluidas la validez
del JSON generado, la decodificación del token y las regresiones de todos los
errores listados arriba.

---

## [v2.0.9] - 2026-08-02
### Ajustes
- Se ha incrementado drásticamente el límite de la paginación segura de 40.000 a 250.000 caracteres por página para reducir en gran medida el número de páginas necesarias durante exportaciones masivas, asumiendo un equilibrio entre comodidad y riesgo de bloqueo de interfaz.

## [v2.0.8] - 2026-08-02
### Añadido
- Añadida una casilla "Cargar todo (Riesgo crash)" encima de los botones de paginación. Si se activa, desactivará la división del texto en páginas.

### Arreglado
- Arreglado un problema visual (solapamiento de marcos) que impedía hacer clic en los botones de "Siguiente/Anterior" y "Seleccionar Todo" cuando se desplazaba el texto.

## [v2.0.7] - 2026-08-02
### Arreglado
- Parcheado un problema por el cual el `itemID` que se guardaba en el archivo podía ser la ID del encuentro/jefe (ej: 252172) en lugar de la ID real del objeto (ej: 147756). Ahora el sistema de extracción utiliza el enlace interno del objeto (link) como fuente de máxima prioridad y fiabilidad para extraer su ID correcta.

## [v2.0.6] - 2026-08-02
### Arreglado
- Parcheado un error provocado por la API nativa de WoW 7.3.5 al leer el botín, la cual devolvía el `itemID` disfrazado de nombre. Esto provocaba que algunos abalorios y reliquias extraños tuvieran de nombre su ID (ej. `139325`) y el `slot` estuviese ocupado erróneamente por el nombre real (`Apéndices espontáneos`). La lógica de lectura ha sido reconstruida de manera 100% robusta contra los caprichos del cliente antiguo de WoW.

## [v2.0.5] - 2026-08-02
### Modificado
- Cambiado el comportamiento de la extracción de bandas y mazmorras a petición manual. Ya no se recorrerán forzosamente las 12 clases una por una para sacar el botín de todo el mundo; ahora el Addon **únicamente extraerá los objetos de la clase que tengas seleccionada en ese momento en tu Guía de Aventuras**. Esto permite un control total y selectivo del botín que deseas exportar.

## [v2.0.4] - 2026-08-02
### Arreglado
- Parcheado un problema por el cual, al terminar de exportar los objetos, el filtro de la Guía de Aventuras se quedaba atascado en la clase "Cazador de Demonios". Ahora el AddOn recuerda tu filtro original y lo restaura al terminar.
- Solucionado un problema en el JSON exportado donde el campo `slot` aparecía vacío para objetos que no son equipables de forma convencional (Reliquias de Artefacto, Monturas, Mascotas, etc.). Ahora se extraerá correctamente su subtipo (ej. "Reliquia de artefacto de Fuego") o su tipo nativo si carecen de ranura.

## [v2.0.3] - 2026-08-02
### Arreglado
- Parcheado un cuelgue del cliente de WoW (freeze/crasheo) que ocurría al intentar imprimir más de 1 Megabyte de texto JSON de golpe en el cuadro de texto (`EditBox`) tras usar los botones de copiado de mazmorras/bandas.
- Se ha implementado un nuevo **Sistema de Paginación** interno. Ahora el AddOn dividirá automáticamente los textos gigantes en bloques seguros de 40,000 caracteres, permitiéndote navegar por ellos con los nuevos botones `<` y `>` para ir copiando las partes de manera 100% fluida y segura.

## [v2.0.2] - 2026-08-02
### Añadido
- Añadidos dos nuevos botones a la pestaña "Bases de Datos (BiS)" ("Generar Texto de BANDAS/MAZMORRAS para Copiar").
- Estos botones permiten extraer directamente el texto JSON al cuadro de resultados para poder copiarlo (`CTRL+C`) de inmediato sin necesidad de recargar la interfaz y buscar el archivo `.lua` en la carpeta WTF.

## [v2.0.1] - 2026-08-02
### Arreglado
- Solucionado un error grave que impedía la carga completa del Addon (`attempt to index local 'tab' (a nil value)`) debido a un conflicto de nombres con el sistema nativo de pestañas de la interfaz (PanelTemplates). El addon vuelve a cargar perfectamente al escribir `/lex`.

## [v2.0.0] - 2026-08-02
### Añadido
- Rediseño arquitectónico completo de la interfaz gráfica usando un sistema de pestañas (Tabs).
- Barra de progreso interactiva (0% - 100%) en tiempo real al exportar bases de datos.
- Sistema de escaneo de 12 clases por jefe para garantizar que se obtienen absolutamente todos los objetos sin saltarse ninguno.
- Panel de "Dashboard" que te dice cuándo fue la última vez que exportaste cada cosa.

### Cambiado
- El botón de extraer mazmorras y bandas ahora deshabilita los demás botones para evitar problemas de cuelgues.
- Reestructuración de la base de datos `LoboExporterDB.ExportStatus` para guardar el historial.


## Recuperado del Historial de Discord
🐺 ¡ESTRENO EXCLUSIVO: LOBOEXPORTER! 🐺

Gente, os presento un addon propio que he estado desarrollando y puliendo: LoboExporter. Es una herramienta pensada para facilitarnos la vida a todos los que nos gusta tener el control de nuestro personaje, trackear el progreso y farmear logros.

🛠️ ¿Para qué sirve LoboExporter? La idea principal del addon es exportar y trackear toda la información vital de vuestro personaje de forma limpia y rápida. Tiene varias funciones estrella:

🗺️ Marcadores de Logros en el Mapa: ¿Cansados de buscar coordenadas en WoWHead para logros de exploración o coleccionables? LoboExporter dibuja automáticamente "X" rojas en vuestro mapa del mundo indicando exactamente dónde están los objetivos de logros que os faltan, y las cambia a un "check" verde (✅) cuando los completáis. ¡Ideal para completistas!
📊 Exportación Universal: Con un solo clic, el addon recopila toda vuestra información (Logros completados e incompletos, Equipo, Monedas y Reputaciones) y os la deja lista para copiar. Muy útil si queréis guardar un registro de vuestro avance o compartir vuestro equipo/stats de forma ordenada.
⚙️ JSON o Texto Legible: Podéis elegir si queréis exportar los datos en formato código (JSON) para integrarlo con bases de datos/webs, o en formato texto limpio para leerlo cómodamente.
📈 Resumen Instantáneo: He añadido un comando rápido. Si escribís /lex progreso (o /lex stats) en el chat, el addon os soltará un resumen instantáneo de cómo va vuestro personaje sin tener que navegar por menús.
🎯 Totalmente calibrado para nuestro servidor: A diferencia de otros addons genéricos que fallan en mapas antiguos, he calibrado a mano las coordenadas de todos los Reinos del Este, Kalimdor y hasta la Vorágine para que los iconos caigan exactamente donde deben.

👇 ¡Descargadlo aquí abajo y me contáis qué os parece! Cualquier idea o logro que queráis que añada al mapa en el futuro, decídmelo.

---

## Actualización 7.3.5 - Exportador BiS y Correcciones

⚔️ **NUEVA FUNCIÓN: EXPORTADOR DE BOTÍN DE BANDA (BiS)**
¡LoboExporter ahora es capaz de extraer automáticamente toda la base de datos de botín de las bandas!
- Añadido el comando `/lex raidloot` o `/loboexport raidloot`.
- Al usarlo, el addon escaneará el Diario de Aventuras y generará un JSON masivo con todos los objetos de todas las dificultades de las bandas de Legion.
- Esta exportación alimenta directamente al planificador BiS de TusAddonsBot en Discord.

🛠️ **CORRECCIÓN DE ERRORES**
- **Fix de IDs de Objetos**: Corregido un fallo crítico donde el addon exportaba accidentalmente el ID interno del icono (textura) en lugar del ID real del objeto al extraer el botín. A partir de ahora, todas las exportaciones tendrán los ItemIDs correctos, evitando colisiones o errores en la base de datos externa.
