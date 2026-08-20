
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
- CallOfElements v6.13 adaptado para Legion (7.3.5): resucitado y adaptado este clásico gestor de tótems (original de MoP) para que funcione en Legion sin errores Lua.
- Arreglo del sistema de sonido: adaptado a los requisitos de la API 7.3 que rompían el addon al pulsar en los menús.
- Limpieza de código obsoleto (Chronos): purgado y modernizado el uso de variables descontinuadas en toda su estructura, permitiendo que la configuración y las barras abran sin fallos.
- Nota: los tótems eliminados de la expansión son ignorados automáticamente por el addon, mostrando solo los que tengas en tu libro de hechizos.
- Reubicado de la raíz del repo a `Proyectos/CallOfElements` para que el workflow de release lo empaquete correctamente (antes vivía fuera de `Proyectos/` y el zip nunca se generaba).
