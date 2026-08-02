## [r257_v3] - 2026-08-02
### Arreglado
- Parcheado un crash en el buscador (`ACP.lua line 1426: AddOn index must be in the range of 1 to 251`) que ocurría cuando la caché interna de la cantidad de Addons se desincronizaba (por ejemplo, cuando un Addon abortaba su propia carga y el buscador intentaba acceder a él por su índice en la lista maestra).

