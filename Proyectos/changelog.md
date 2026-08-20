
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
- v6.15 - Arreglado un error Lua del asesor de tótems ("attempt to call global 'GetNumPartyMembers' (a nil value)"): esa API también fue eliminada de WoW y el addon la llamaba directamente al escanear al grupo en busca de venenos/enfermedades/atascos. Sustituida por un wrapper compatible (`COE_GetNumPartyMembers`) que usa `GetNumGroupMembers()` en Legion.
- v6.14 - Arreglado el bug que impedía ver las barras de tótems: el addon llamaba a `GetActiveTalentGroup()`, una API del sistema de dual-spec eliminada en Legion, en cada `PLAYER_ENTERING_WORLD`. Esto lanzaba un error Lua que abortaba la inicialización antes de fijar la especialización activa, y con ese dato en `nil` el addon volvía a fallar en cada frame al intentar mostrar la barra (por eso nunca aparecía) y también al abrir la pestaña "Totem Sets" del panel de configuración (por eso se quedaba superpuesta al cambiar de pestaña). Sustituido por un wrapper compatible (`COE_GetTalentGroup`) que usa `GetSpecialization()` en Legion.
- CallOfElements v6.13 adaptado para Legion (7.3.5): resucitado y adaptado este clásico gestor de tótems (original de MoP) para que funcione en Legion sin errores Lua.
- Arreglo del sistema de sonido: adaptado a los requisitos de la API 7.3 que rompían el addon al pulsar en los menús.
- Limpieza de código obsoleto (Chronos): purgado y modernizado el uso de variables descontinuadas en toda su estructura, permitiendo que la configuración y las barras abran sin fallos.
- Nota: los tótems eliminados de la expansión son ignorados automáticamente por el addon, mostrando solo los que tengas en tu libro de hechizos.
- Reubicado de la raíz del repo a `Proyectos/CallOfElements` para que el workflow de release lo empaquete correctamente (antes vivía fuera de `Proyectos/` y el zip nunca se generaba).
