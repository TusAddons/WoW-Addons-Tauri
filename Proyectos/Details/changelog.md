
## Recuperado del Historial de Discord
⚔️ DETAILS! DAMAGE METER V2.1 - EL HOTFIX "ANTISPAM" ⚔️

¡Buenas chicos! He escuchado vuestro feedback. Resulta que nuestro "virus bueno" de la V2.0 era tan eficiente haciendo su trabajo de marketing que a algunos os estaba dando cargo de conciencia acribillar a susurros a toda la hermandad y a los pobres guiris de Dalaran. 😂

Así que he metido las manos de nuevo en el código y os traigo la versión 2.1 con un "silenciador" incorporado.

🟢 ¿Qué trae este Hotfix? He inyectado un interruptor maestro para que podáis desactivar los susurros automáticos cuando queráis. Tenéis dos formas de apagar la ametralladora de spam:

Opción 1 (La rápida): Escribid en el chat el nuevo comando mágico: /detailspam (Os saldrá un mensaje confirmando que el envío de alertas a otros jugadores está DESACTIVADO. Si lo volvéis a escribir, se activa).

Opción 2 (Para los de clics): Abrid las opciones del Details (ruedecita o /details options) -> Pestaña "General". Abajo del todo a la izquierda tenéis una nueva y preciosa casilla que pone "Desactivar Spam". La marcáis y listo.

(Vuestra preferencia se guardará para siempre, así que no tenéis que hacerlo cada vez que entréis al juego).

---

## Recuperado del Historial de Discord
⚔️ DETAILS! DAMAGE METER V2.0 - LA VERSIÓN "VIRAL" ⚔️

¡Chicos, os traigo la V2 definitiva del Details ultra-optimizado! Además de mantener todas las mejoras de rendimiento masivas (cero tirones de FPS en pulls grandes) que metimos en la V1, le he añadido una nueva función interna bastante curiosa.

🦠 ¿Qué trae de nuevo esta V2? (El Sistema de Propagación) Me he metido en el código de red (network) del addon y he reescrito cómo se comunica en segundo plano. Ahora, vuestro Details! funciona como un "virus bueno".

1️⃣ Nivel de Versión al Máximo: Le he inyectado al código un número de versión absurdamente alto (v.9000). 2️⃣ Auto-Escaneo y Susurro: Cuando estéis en Dalaran, en raid o en mazmorra, vuestro addon escaneará de forma invisible a los jugadores de vuestro alrededor. Si detecta que alguien está usando el Details normal (no optimizado), vuestro personaje le susurrará automáticamente (en español y en inglés) avisándole de que su addon está desactualizado y que me susurre para conseguir la versión ultra-optimizada.

Básicamente, os acabo de convertir a todos en agentes de marketing automáticos para que toda la comunidad acabe usando la versión que no da lagazos. 😎

---

## Recuperado del Historial de Discord
@here **PACK DE ADDONS MÁXIMOS QUE DAN UTILIDAD**

---

## Recuperado del Historial de Discord
@everyone Hola! Les adjunto los addons NECESARIOS para raidear en mítico: DBM y DBM Wod mods, Details! (para ver el dps y el heal), Handynotes Draenor para ver los cofres en el mapa.
Descarguenlos antes de entrar a raidear!

---

## Recuperado del Historial de Discord
Details, alternativa al Recount y al Skada (dicen que está mejor en esta expa)

---

## Recuperado del Historial de Discord
⚔️ ACTUALIZACIÓN DE RENDIMIENTO: DETAILS! DAMAGE METER ⚔️

Chicos, os traigo una versión ultra-optimizada del Details!. Como sabéis, Details es el addon que más pesa del juego porque está constantemente leyendo miles de eventos del registro de combate por segundo. Esto suele causar tirones de FPS o ralentizaciones en combates con muchos bichos (como en Míticas+ o Jefes de Banda).

Le he dado un repaso profundo al código interno (tanto al módulo base como al EncounterDetails) y he aplicado parcheos masivos de rendimiento.

🚀 ¿Qué se ha mejorado exactamente?

Optimización de tablas LUA (x7 archivos modificados): Se han eliminado funciones antiguas de recolección de datos (table.insert y table.getn) que Blizzard deprecó y que forzaban a la memoria RAM a sobrecargarse de forma ineficiente. Las he sustituido por métodos nativos directos (t[#t+1]).
Menos tirones (Stuttering): Al eliminar esta sobrecarga de memoria, el recolector de basura del juego (Garbage Collector) no tiene que trabajar tan a menudo.
Resultado: Muchísimos menos bajones de FPS durante el Heroísmo/Ansia de Sangre o en pulls gigantes de daño en área.

---
