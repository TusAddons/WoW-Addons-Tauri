
## Recuperado del Historial de Discord
📊 O ITEM LEVEL (OiLvl) v2.1 (Hotfix Bagnon) 📊

¡Hola de nuevo, gente! Os traigo una actualización rápida (Hotfix) para nuestro OiLvl optimizado.

Varios habéis reportado que al iniciar sesión por primera vez en el día os saltaba un error de Lua amarillo en medio de la pantalla que decía algo sobre BagnonFrameinventory (a nil value).

¿Qué pasaba exactamente? Al meterle el turbo al addon en la v2.0 para que escaneara súper rápido, el OiLvl intentaba conectarse a vuestras mochilas (Bagnon) para mostraros el nivel de objeto tan sumamente rápido al entrar al juego, que la mochila ni siquiera existía todavía en la memoria, provocando ese "crasheo" de texto.

🛠️ Corrección aplicada (v2.1): Le hemos inyectado una línea de código de seguridad (un nil check) al motor de arranque. Ahora el addon es lo bastante inteligente como para esperar pacientemente a que vuestra mochila exista físicamente antes de intentar conectarse a ella.

Resultado: Cero errores LUA al conectar. Funciona fino como la seda y se sigue llevando de maravilla con el Bagnon.

---

## Recuperado del Historial de Discord
📊 O ITEM LEVEL (OIlvl) v2.0 (Escaneo Instantáneo) 📊

Chicos, os dejo por aquí una versión completamente reprogramada del OItemLevel (el addon imprescindible para los líderes de banda que os permite ver el iLvl real, las estadísticas y el progreso de raid de todo el grupo de un solo vistazo).

La versión que todos usamos normalmente tiene un fallo de diseño bastante molesto: para no saturar al servidor, el creador original le puso unos "tiempos de espera" artificiales enormes entre cada inspección. ¿El resultado? Te metes en una banda de 20 personas, abres la ventana del addon y tienes que quedarte mirando a la pared durante un par de minutos hasta que termina de cargar los datos de todo el mundo uno por uno.

🛠️ ¿Qué mejoras incluye esta versión custom?

🚀 Escaneo a la Velocidad de la Luz: Le hemos extirpado al código esos tiempos de espera artificiales absurdos. El addon ahora procesa las inspecciones del grupo de forma paralela y muchísimo más agresiva. Al abrir la ventana, cargaréis la información de iLvl y avance de todo vuestro grupo o banda prácticamente al instante. ¡Se acabó el esperar minutos para ver si alguien va equipado!
🔧 Corrección de Bugs y Cero Lag: Como parte de nuestro parche global, también hemos sustituido sus librerías de guardado antiguas por código moderno (cero table.insert lentos). Ya no notaréis bajones de FPS (stuttering) cuando el addon se ponga a guardar los datos de 40 personas de golpe tras un combate.

---

## Recuperado del Historial de Discord
@here **PACK DE ADDONS MÁXIMOS QUE DAN UTILIDAD**

---
