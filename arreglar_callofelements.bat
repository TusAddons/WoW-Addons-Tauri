@echo off
cd /d "%~dp0"
echo ===============================================
echo  Arreglando ubicacion de CallOfElements
echo ===============================================
echo.

if not exist "CallOfElements" (
    echo No se encontro la carpeta CallOfElements en la raiz del repo.
    echo Puede que ya se haya movido antes. Revisa Proyectos\CallOfElements.
    pause
    exit /b 1
)

echo Moviendo CallOfElements -> Proyectos\CallOfElements ...
move "CallOfElements" "Proyectos\CallOfElements"
if errorlevel 1 (
    echo.
    echo ERROR moviendo la carpeta. Revisa el mensaje de arriba.
    pause
    exit /b 1
)

echo.
echo Anadiendo cambios a git (incluye el changelog.md actualizado)...
git add -A
git commit -m "Reubicar CallOfElements en Proyectos/ para que el workflow lo empaquete; changelog"
if errorlevel 1 (
    echo.
    echo Aviso: git commit no genero un commit nuevo (puede que no hubiera cambios pendientes ademas del movimiento).
)

echo.
echo Subiendo a GitHub (esto dispara el workflow que genera CallOfElements.zip)...
git push

echo.
echo ===============================================
echo Listo. En unos 20-30 segundos revisa:
echo https://github.com/TusAddons/WoW-Addons-Tauri/actions
echo para confirmar que el workflow "Deploy Addons to GitHub Releases" termino en verde.
echo Luego prueba: https://github.com/TusAddons/WoW-Addons-Tauri/releases/latest/download/CallOfElements.zip
echo ===============================================
pause
