
## Recuperado del Historial de Discord
🛠️ GATHERER V2.1 (HOTFIX) - EDICIÓN MÁXIMA 🛠️


🐛 ¿Qué pasaba? Al parchear la base de datos en la V2, algunos caracteres con tildes (como la "ó" de Depósito) se corrompieron internamente con una doble codificación rara. Esto hacía que, al pasar el ratón por encima de un "Depósito rico en pizarra vil" (si no tenías minería), el addon no reconociera la palabra y no te lo guardara en el mapa.

✅ Solución (Fix de Encoding): Hemos pasado un script que ha limpiado y recodificado absolutamente todas las tildes y eñes (ó, í, á, ñ) corruptas de la base de datos de Gatherer, devolviéndolas al formato español nativo.

---

## Recuperado del Historial de Discord
⚒️ GATHERER V2.0 - EDICIÓN MÁXIMA (CORREGIDO PARA ES/MX - TAURI LEGION) ⚒️

La versión original de este addon está rotísima en los clientes de WoW en español y en servidores privados. Le hemos dado la vuelta al código por completo y hemos creado esta V2 Definitiva.

Todos los bugs arreglados en esta versión:

⛏️ 1. Fix de Menas Base de Legion: El addon fallaba al distinguir mayúsculas de minúsculas (buscaba "Depósito de Pizarra vil" con P mayúscula). Ahora rastrea a la perfección todos los depósitos y vetas de Piedra ley y Pizarra vil.

💎 2. Fix de Filones "Ricos" Antiguos: Se ha corregido un error de traducción literal. Vuelve a detectar sin problema todas las menas ricas de expansiones pasadas (Pirita, Saronita, Cobalto, Elementium...).

🌍 3. Arreglo del Frondasueño (Fix de formato UTF-8): Hemos re-codificado la base de datos al formato moderno. El addon por fin lee la "ñ" del Frondasueño y guarda la planta en tu mapa sin dar errores.

🇬🇧 4. Mega-Inyección de Argus y Anti-Spanglish: En Tauri, a veces los nodos aparecen bugueados en inglés (ej: "Leystone Seam"). Hemos inyectado un diccionario bilingüe con absolutamente TODAS las plantas y menas de Legion y Argus (Empirio, Gloria Astral, Azufre...). Hable inglés o español, el addon te las registrará todas.

🛑 5. Fix de Recolección con Alters sin Profesión: Si usas un alter sin minería o herboristería, el juego salta un error de "Requiere...". El addon original ignoraba esto en Tauri por culpa de unos códigos internos. Hemos reescrito los eventos: ahora detecta la palabra "Requiere" en pantalla y te guarda el nodo en el mapa sin importar tu nivel de profesión.

---

## Recuperado del Historial de Discord
🛠️ GATHERER (VERSIÓN CORREGIDA PARA ES/MX - TAURI LEGION) 🛠️

He estado arreglando y modificando el código interno del addon Gatherer porque la versión original tiene bastantes fallos de traducción que hacían que ignorase muchísimas menas en los clientes en español. Además, le he metido una herramienta súper útil.

Aquí tenéis la lista de cambios y mejoras que lleva esta versión:

⛏️ 1. Arreglado el rastreo de menas de Legion (Sensibilidad a Mayúsculas) Los creadores del addon pusieron en su base de datos "Depósito de Pizarra vil" (con la P mayúscula). Como el juego te lo muestra con p minúscula, el addon se volvía loco y no te guardaba la mena en el mapa al intentar picarla.

Solución: Se ha corregido la capitalización añadiendo las variantes en minúsculas para el Depósito de pizarra vil y el Depósito de piedra ley, tanto para el cliente de España (esES) como para el Latino (esMX). Ahora las pilla siempre a la primera.
💎 2. Arreglado el rastreo de Filones "Ricos" (Cataclysm y Pandaria) Originalmente, el equipo de Gatherer tradujo literalmente "Rich Elementium Vein" como "Filón de elementium rico". El problema es que Blizzard España lo tradujo oficialmente como "Filón rico en elementium". Esto causaba que Gatherer no registrara ninguna mena rica de expansiones pasadas.

Solución: Se han añadido y emparejado las traducciones oficiales ("rico en...") para que vuelva a detectar correctamente todas estas menas al hacerles clic:
Filón rico en elementium
Depósito rico en obsidium
Depósito rico en pirita
Depósito rico en cobalto
Depósito rico en saronita
Depósito rico en hierro fantasma
Depósito rico en kyparita

---
