@echo off
cd /d "%~dp0"
echo ===============================================
echo  Publicando fix de Details (spam de version desactualizada)
echo ===============================================
echo.

if not exist "Proyectos\Details\Details\core\network.lua" (
    echo No se encontro Proyectos\Details\Details\core\network.lua
    echo Ejecuta este .bat desde la raiz del repo Repo-Addons.
    pause
    exit /b 1
)

echo Anadiendo cambios a git...
git add "Proyectos\Details\Details\core\network.lua" "Proyectos\changelog.md"

echo.
echo Creando commit...
git commit -m "Details: aviso de version desactualizada desactivado por defecto, opcion de limitarlo a hermandad y mensaje personalizable"

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
