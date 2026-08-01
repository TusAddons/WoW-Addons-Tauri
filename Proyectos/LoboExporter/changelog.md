
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
