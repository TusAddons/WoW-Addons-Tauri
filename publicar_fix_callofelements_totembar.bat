@echo off
cd /d "%~dp0"
echo ===============================================
echo  Publicando fix de CallOfElements
echo ===============================================
echo.

if not exist "Proyectos\CallOfElements\CallOfElements.lua" (
    echo No se encontro Proyectos\CallOfElements\CallOfElements.lua
    echo Ejecuta este .bat desde la raiz del repo Repo-Addons.
    pause
    exit /b 1
)

echo Anadiendo cambios a git...
git add "Proyectos\CallOfElements\CallOfElements.lua" "Proyectos\CallOfElements\CallOfElements.toc" "Proyectos\CallOfElements\COE_TotemLogic.lua" "Proyectos\changelog.md"
git commit -m "CallOfElements v6.15: arreglar error del asesor de totems (GetNumPartyMembers)"

echo.
echo Subiendo a GitHub - esto dispara el workflow que genera CallOfElements.zip...
git push
if errorlevel 1 (
    echo.
    echo ERROR: git push fallo. Revisa el mensaje de arriba, o ejecuta git push a mano.
    pause
    exit /b 1
)

echo.
echo ===============================================
echo Listo. En unos 20-30 segundos revisa:
echo https://github.com/TusAddons/WoW-Addons-Tauri/actions
echo para confirmar que el workflow termino en verde.
echo Luego el zip actualizado estara en:
echo https://github.com/TusAddons/WoW-Addons-Tauri/releases/latest/download/CallOfElements.zip
echo ===============================================
pause
