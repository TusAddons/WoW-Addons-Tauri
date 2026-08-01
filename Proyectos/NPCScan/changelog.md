
## Recuperado del Historial de Discord
NPCSCAN V7.3.5 - EDICIÓN MÁXIMA (TAURI LEGION) 🐲

¿Cansado de sobrevolar Argus o la Costa Abrupta y que el NPCScan no te avise de los rares hasta que los tienes literalmente pegándote en la cara? Hemos cogido el código del addon y lo hemos puesto a punto para Legion.

🛠️ ¿Qué le hemos hecho a este NPCScan?

⭐ Escaneo de Vignettes (Estrellitas) Turbo-Cargado: En Legion, Blizzard bloqueó la forma antigua que tenían los addons de buscar rares, obligando a NPCScan a depender del minimapa. Hemos optimizado la velocidad a la que el addon lee el minimapa para que te salte la alerta en el milisegundo exacto en que el rare aparece en tu rango de visión.

🗺️ Base de Datos de Argus Inyectada: El addon original se quedó a medias con las coordenadas y las IDs de los Rares de Mac'Aree, Baldío Antoran y Krokuun. Le hemos metido la base de datos completa a mano. Si existe, te va a pitar.

💻 Limpieza de Errores LUA: Se han purgado funciones antiguas que ya no servían y que a veces tiraban errores silenciosos de interfaz bajando los FPS mientras volabas.

---

## Recuperado del Historial de Discord
🐉 NPCSCAN v2.0 (Edición Rendimiento Extremo) 🐉

Chicos, aquí tenéis la versión optimizada del famosísimo NPCScan (el addon que os pega un susto de muerte con una alarma cuando pasáis cerca de un monstruo raro o un tesoro).

El problema del NPCScan original es que es un addon bastante pesado. Para poder avisarte de los raros, se pasa la vida escaneando en bucle la memoria caché del juego y buscando modelos 3D a tu alrededor. En su versión original, este escaneo constante provoca tirones de FPS (stuttering), sobre todo cuando vas volando rápido por el mundo o entras en zonas nuevas.

🛠️ ¿Qué mejoras incluye esta versión custom?

🚀 Reescritura de caché (Cero Lag): Hemos destripado el código de escaneo del addon y le hemos cambiado el motor. Se han purgado las funciones lentas de recolección de memoria (table.insert) por indexación directa, y le hemos desactivado una orden interna agresiva que forzaba a la memoria RAM a vaciarse a tirones. Ahora el escaneo de fondo va como la seda y podréis volar por las Islas Abruptas sin notar esos molestos bajones de frames.
🔊 Arreglo de Alarmas (API Legion): El addon original usaba una función de sonido antigua (PlaySoundString) que en la versión 7.3.5 a veces fallaba en silencio, haciendo que perdierais el bicho raro sin daros cuenta. Lo hemos actualizado al estándar nuevo de Legion para que los tambores de guerra suenen siempre altos y claros.

---
