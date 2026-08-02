## [v1.1.0] - 2026-08-02
### Arreglado
- Parcheado un bug crítico por el cual el addon traducía y romanizaba correctamente el texto del mensaje, pero ignoraba por completo el **nombre del autor** del mensaje (el sender). Ahora los nombres de jugadores en chino, cirílico o coreano también aparecerán con su correspondiente etiqueta o transliteración.


## Recuperado del Historial de Discord
💬 NUEVA ACTUALIZACIÓN: CHATFONTFIX v3 (Edición Anti-Muteos) 💬

Chicos, os traigo una nueva versión definitiva del addon ChatFontFix. Hasta ahora, este addon nos arreglaba el bug de los nombres asiáticos en los susurros y nos traducía los caracteres chinos al alfabeto normal. Pero hoy le he inyectado una función vital para jugar en Tauri sin dolores de cabeza.

Como muchos sabéis, el servidor de Tauri tiene un sistema Anti-Spam súper agresivo que te mutea automáticamente si mandas más de 4 mensajes de chat en menos de un segundo (algo muy típico cuando intentas compartir el daño del Details, mandar avisos de misiones con el QuestAnnounce, etc).

🛡️ ¿**Qué incluye la nueva VERSIÓN 3**? He reprogramado el núcleo del addon para convertirlo en un escudo Anti-Spam Global para vuestra interfaz.

A partir de ahora, ChatFontFix intercepta silenciosamente todos los mensajes públicos que vosotros o vuestros addons intenten enviar al chat (Hermandad, Grupo, Banda, Decir, Gritar, etc.). Si el addon detecta que estáis enviando mensajes demasiado rápido y os arriesgáis a un muteo, pondrá los mensajes en una "cola de espera" invisible y los irá escupiendo al chat fluidamente dejando **1.25 segundos de respiración entre cada línea.**

Resultado: Podéis compartir todo el daño y curación del Details!, avisar de interrupciones o enviar macros largas de reclutamiento sin miedo. El addon organizará el ritmo de los mensajes por vosotros para que el servidor nunca os mutee. (Nota: Los susurros privados no pasan por esta cola, así que seguirán siendo instantáneos).
(al unico addon que me he asegurado que **no afecte es DBM** porque bueno, ahi los tiempos exactos son importantes)

---

## Recuperado del Historial de Discord
💬 ACTUALIZACIÓN DOBLE: CHATFONTFIX 💬

Chicos, os dejo por aquí dos versiones mejoradas del addon ChatFontFix. La versión original que todos usábamos tenía un bug bastante destructivo con los nombres en el chat, así que he reescrito el código interno para parchearlo. Tenéis dos opciones para descargar:

📦 VERSIÓN 1: ChatFontFix Lite (La básica arreglada) Es el addon original de siempre, pero con el bug de los susurros y clicks arreglado. En la versión antigua, si un jugador asiático te susurraba, el addon rompía su nombre y lo cambiaba a [[CN][CN]]. Al intentar darle click derecho para invitarle a grupo, te daba error porque "el jugador no existe". En esta versión los nombres ya no se rompen: podréis interactuar con ellos, susurrarles de vuelta e invitarles sin problemas. (Los mensajes que no estén en su diccionario básico seguirán mostrándose como [CN]).

📦 VERSIÓN 2: ChatFontFix v2 (La versión Definitiva) Trae el arreglo de los susurros de la versión Lite, pero además le he inyectado una base de datos brutal generada con IA que contiene más de 20.200 caracteres chinos. A partir de ahora, absolutamente todo lo que escriba un jugador asiático en el chat se va a traducir fonéticamente (Pinyin) a nuestras letras del teclado. ¡Adiós para siempre a los corchetes [CN]! Todo se traducirá y se leerá perfectamente.

(sigue siendo compatible con addons tipo Prat3.0, y demás)

---
