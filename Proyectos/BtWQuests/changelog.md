## [v2.1-tauri] - 2026-08-02
### Añadido / Arreglado / Modificado
- **Compatibilidad con Legion 7.3.5**: Integración total de los submódulos de expansiones clásicas (Cataclysm, Mists of Pandaria, Warlords of Draenor, Wrath of the Lich King y Legion) que originariamente estaban diseñados para clientes de juego más modernos (BfA+).
- **Capa Polyfill (`Compat.lua`)**: Inyección de una capa de compatibilidad mediante autovivification para traducir las llamadas de las bases de datos de BfA (`BtWQuests.Database` y `BtWQuests.Constant`) hacia las variables globales del core clásico (`BtWQuests_Quests`, `BtWQuests_Chains`, etc.).
- **Fix de Carga**: Se ha bloqueado la inyección de metadatos visuales de las expansiones para prevenir bugs visuales en la interfaz de usuario, permitiendo que la lista de misiones se dibuje limpiamente usando los fondos nativos del core 1.1.
- **Auto-Carga Reparada**: Se ha eliminado la instrucción `## LoadOnDemand: 1` de todos los archivos `.toc` de los submódulos para forzar su correcta inicialización al arrancar el juego.
- **Parches de Prevención de Crasheos**: Se han añadido valores predeterminados (fallbacks) a las constantes de expansiones en `Defines.lua` (`LE_EXPANSION_LEGION or 6`, etc.) para asegurar que el addon carga incluso si la API de WoW está desincronizada u oculta temporalmente.
- **Comando de Depuración**: Añadido el comando `/btwd` para consultar rápidamente el estado interno y la cantidad de misiones/cadenas cargadas en memoria.
