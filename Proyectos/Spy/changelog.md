
## Recuperado del Historial de Discord
👁️ SPY V2.1 (HOTFIX) - EDICIÓN MÁXIMA 👁️

Hemos cazado un bug muy molesto que traía el addon original de fábrica y que estaba destrozando el rendimiento (y la paciencia) a más de uno en JcJ.

🐛 ¿Qué pasaba? (El Bug del Mapa / Stuttering): El Spy original tenía una función oculta y mal programada que intentaba calcular tus coordenadas exactas cada vez que detectaba a un enemigo. Para hacerlo, forzaba al juego a ejecutar el comando SetMapToCurrentZone() en segundo plano. ¿El resultado? Si estabas mirando el mapa de otro sitio, te lo cerraba de golpe. Y lo que es peor: aunque no tuvieras el mapa abierto, obligaba al juego a "redibujar" todos los iconos de todos tus addons (tesoros, menas, misiones) 10 veces por segundo en campos de batalla. Esto provocaba unos tirones horribles y parpadeos en la interfaz.

✅ Solución (Amputación de Código): Le hemos metido el bisturí al código fuente (List.lua) y hemos extirpado por completo toda la lógica que le daba permiso al Spy para manipular el mapa. También hemos purgado las opciones fantasma del menú de configuración.

👉 Ahora las detecciones de enemigos son 100% silenciosas a nivel de interfaz. Cero tirones, cero parpadeos de iconos y puedes mirar el mapa que te dé la gana en paz sin que el addon te lo quite.

---

## Recuperado del Historial de Discord
👁️ SPY V2.0 - EDICIÓN MÁXIMA (CORREGIDO PARA ES/MX - TAURI LEGION) 👁️

La versión original de este addon es vital para el PvP en mundo abierto y BGs, pero estaba plagada de errores de código obsoletos que destrozaban el rendimiento en Legion. Le hemos metido mano al código fuente y hemos creado esta V2 Definitiva superligera.

Todos los bugs arreglados y optimizaciones en esta versión (20 archivos reescritos):

🔊 1. Fix Crítico del Sistema de Sonidos (PlaySoundString): El addon original usaba código de versiones antiguas para reproducir la alerta de audio cuando detectaba a un enemigo en sigilo o cerca, lo que provocaba una lluvia de Errores LUA en Legion y hacía que las alertas dejasen de sonar. Hemos actualizado toda la librería de sonido al nuevo formato de Blizzard. Las alertas de asesinato y detección vuelven a funcionar 100% limpias.

🚀 2. Mega-Optimización de CPU y RAM (Fix de Tablas): Spy escanea de forma muy agresiva el registro de combate y a los jugadores de alrededor, lo que en campos de batalla masivos provocaba micro-tirones (stuttering). Hemos parcheado sus motores de bases de datos (List.lua y SpyStats.lua) eliminando el obsoleto table.insert. Ahora el addon procesa a los enemigos muchísimo más rápido y sin sobrecargar tu RAM.

🛠️ 3. Parcheo del Minimapa y Librerías (AceGUI / Astrolabe): Las librerías internas que usa Spy para colocar las calaveras enemigas en tu minimapa también estaban consumiendo memoria de más. Hemos inyectado mejoras de rendimiento en 16 de estos archivos gráficos para que rastrear a la facción contraria en el mundo abierto sea fluido.

---
