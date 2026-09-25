@echo off
cd /d "%~dp0"
echo ===============================================
echo  Publicando fix GarrisonCommander (Shipyard)
echo ===============================================
echo.

if not exist "Proyectos\GarrisonCommander + OrderHallCommander\GarrisonCommander\ShipControl.lua" (
    echo No se encontro Proyectos\GarrisonCommander + OrderHallCommander\GarrisonCommander\ShipControl.lua
    echo Ejecuta este .bat desde la raiz del repo Repo-Addons.
    pause
    exit /b 1
)

echo Anadiendo cambios a git...
git add "Proyectos\GarrisonCommander + OrderHallCommander\GarrisonCommander\ShipControl.lua" "Proyectos\changelog.md"

echo.
echo Creando commit...
git commit -m "GarrisonCommander: fix soft cap del Shipyard usando el tipo de guarnicion terrestre en vez del naval"

echo.
echo Subiendo a GitHub...
git push
if errorlevel 1 (
    echo.
    echo ERROR: git push fallo. Ejecuta git push a mano si hace falta.
    pause
    exit /b 1
)

echo.
echo ===============================================
echo Listo. Revisa GitHub Actions para confirmar el build.
echo ===============================================
pause
