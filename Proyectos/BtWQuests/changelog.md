## [v2.2-tauri] - 2026-08-02
### Arreglado
- **Restricciones de Facción (Alianza/Horda)**: Definidas las constantes `Restrictions.Alliance` y `Restrictions.Horde` en la capa de compatibilidad. Los datos de expansiones clásicas (TBC, WotLK, etc.) ahora ocultan correctamente las cadenas de misiones de la facción contraria, eliminando las entradas duplicadas en los menús de categorías.
- **Coordenadas de Layout (UI descuadrada)**: Corregido el sistema de coordenadas X en `Compat.lua`. El sistema BfA usa un rango de `-3` a `3` (centro en 0), mientras que Legion espera `0` a `6` (centro en 3). Se aplica ahora un offset automático de +3 para centrar correctamente los nodos de misiones.
- **Conexiones entre Nodos**: Añadida generación automática de `connections = {1}` (enlace secuencial) para los ítems de cadenas que no las especifican, restaurando las líneas de flujo entre misiones. También se sanitizan las tablas de conexión con formato BfA (tablas anidadas con coordenadas fraccionarias) al formato numérico plano de Legion.
- **Crash `Invalid requirement type number`**: Parcheado `BtWQuests_EvalRequirement` en `BtWQuests.lua` para manejar graciosamente los tipos `number` y `string` como requisitos, en lugar de lanzar un `assert` fatal. Esto previene crasheos al navegar categorías con datos de expansiones que usan formatos de restricción modernos.

## [v2.1-tauri] - 2026-08-02
### Añadido / Arreglado / Modificado
- **Compatibilidad con Legion 7.3.5**: Integración total de los submódulos de expansiones clásicas (Cataclysm, Mists of Pandaria, Warlords of Draenor, Wrath of the Lich King y Legion) que originariamente estaban diseñados para clientes de juego más modernos (BfA+).
- **Capa Polyfill (`Compat.lua`)**: Inyección de una capa de compatibilidad mediante autovivification para traducir las llamadas de las bases de datos de BfA (`BtWQuests.Database` y `BtWQuests.Constant`) hacia las variables globales del core clásico (`BtWQuests_Quests`, `BtWQuests_Chains`, etc.).
- **Fix de Carga**: Se ha bloqueado la inyección de metadatos visuales de las expansiones para prevenir bugs visuales en la interfaz de usuario, permitiendo que la lista de misiones se dibuje limpiamente usando los fondos nativos del core 1.1.
- **Auto-Carga Reparada**: Se ha eliminado la instrucción `## LoadOnDemand: 1` de todos los archivos `.toc` de los submódulos para forzar su correcta inicialización al arrancar el juego.
- **Parches de Prevención de Crasheos**: Se han añadido valores predeterminados (fallbacks) a las constantes de expansiones en `Defines.lua` (`LE_EXPANSION_LEGION or 6`, etc.) para asegurar que el addon carga incluso si la API de WoW está desincronizada u oculta temporalmente.
- **Comando de Depuración**: Añadido el comando `/btwd` para consultar rápidamente el estado interno y la cantidad de misiones/cadenas cargadas en memoria.
