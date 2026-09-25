@echo off
cd /d "%~dp0"
echo ===============================================
echo  Publicando fix de Prat-3.0 (PlayerNames.lua)
echo ===============================================
echo.

if not exist "Proyectos\Prat\Prat-3.0\modules\PlayerNames.lua" (
    echo No se encontro Proyectos\Prat\Prat-3.0\modules\PlayerNames.lua
    echo Ejecuta este .bat desde la raiz del repo Repo-Addons.
    pause
    exit /b 1
)

echo Anadiendo cambios a git...
git add "Proyectos\Prat\Prat-3.0\modules\PlayerNames.lua" "Proyectos\changelog.md"

echo.
echo Creando commit...
git commit -m "Prat-3.0: arreglar error Lua al escanear la hermandad (PlayerNames.lua)"

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
