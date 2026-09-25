@echo off
cd /d "%~dp0"
echo ===============================================
echo  Publicando fixes de la auditoria (OiLvl, ChatFontFix, LoboExporter, WorldBossTracker)
echo ===============================================
echo.

if not exist "Proyectos\Oilvl\Oilvl\Oilvl.lua" (
    echo No se encontro Proyectos\Oilvl\Oilvl\Oilvl.lua
    echo Ejecuta este .bat desde la raiz del repo Repo-Addons.
    pause
    exit /b 1
)

echo Anadiendo cambios a git...
git add "Proyectos\Oilvl\Oilvl\Oilvl.lua" "Proyectos\ChatFontFix\ChatFontFix\core.lua" "Proyectos\LoboExporter\LoboExporter.lua" "Proyectos\WorldBossTracker\LegionTracker.lua" "Proyectos\changelog.md"

echo.
echo Creando commit...
git commit -m "Auditoria: fix OiLvl (crash de carga), ChatFontFix (regresion hook Prat), LoboExporter (dungeon vacio y logros pendientes), WorldBossTracker (jefe 43192 perdido)"

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
