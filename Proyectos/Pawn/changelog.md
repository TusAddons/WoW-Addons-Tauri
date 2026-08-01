
## Recuperado del Historial de Discord
PAWN v2.0 (Edición Rendimiento Extremo) ⚖️

Chicos, os dejo por aquí una versión optimizada del Pawn (el addon que os pone las flechitas verdes y calcula qué objeto es mejor para vuestras estadísticas).

Pawn es un addon súper útil, pero por cómo está programado originalmente, es un auténtico "devorador" de memoria RAM. Cada vez que abrís las bolsas, pasáis el ratón por encima de un objeto o despojáis a un jefe, Pawn hace miles de cálculos matemáticos de fondo. En la versión normal, esto provoca tirones de FPS (stuttering) al abrir el inventario o al lotear.

🛠️ ¿Qué mejoras incluye esta versión custom?

🚀 Reescritura de tablas (Cero Lag): He entrado en el código interno del addon y he purgado todas las funciones antiguas de recolección de datos (hemos sustituido todas las funciones lentas table.insert por indexación directa). Gracias a esto, el addon ahora calcula el peso de las estadísticas de los objetos casi a la velocidad de la luz y consumiendo una fracción minúscula de la CPU. Se acabaron los tirones al abrir las bolsas.
🔊 Compatibilidad de Sonidos (API Legion): Se ha parcheado la antigua función PlaySoundString (que a veces daba errores ocultos en la versión 7.3.5) al nuevo formato nativo de Legion.

---
