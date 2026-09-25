@echo off
cd /d "%~dp0"
echo ===============================================
echo  Publicando fix de WorldBossTracker v3.0.1
echo ===============================================
echo.

if not exist "Proyectos\WorldBossTracker\UI_Main.lua" (
    echo No se encontro Proyectos\WorldBossTracker\UI_Main.lua
    echo Ejecuta este .bat desde la raiz del repo Repo-Addons.
    pause
    exit /b 1
)

echo Anadiendo cambios a git...
git add "Proyectos\WorldBossTracker\UI_Main.lua" "Proyectos\WorldBossTracker\WorldBossTracker.toc" "Proyectos\changelog.md"

echo.
echo Creando commit...
git commit -m "WorldBossTracker v3.0.1: no abrir la ventana sola al entrar con el personaje"

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
