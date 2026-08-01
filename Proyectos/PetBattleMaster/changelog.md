# PetBattleMaster

## v7.0.6 - Taint Fix
- Envuelta la llamada 	ooltip:GetUnit() en una llamada segura (pcall) dentro de TooltipHook.lua.
- Esto soluciona de raíz el error rojo de LUA "Attempt to access forbidden object from code tainted by an AddOn" que ocurría al pasar el ratón por los marcos de banda o en combate.
