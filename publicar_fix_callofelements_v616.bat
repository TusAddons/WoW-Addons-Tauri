@echo off
cd /d "%~dp0"
echo ===============================================
echo  Publicando fix de CallOfElements v6.16
echo ===============================================
echo.

if not exist "Proyectos\CallOfElements\CallOfElements.lua" (
    echo No se encontro Proyectos\CallOfElements\CallOfElements.lua
    echo Ejecuta este .bat desde la raiz del repo Repo-Addons.
    pause
    exit /b 1
)

echo Anadiendo cambios a git...
git add "Proyectos\CallOfElements\CallOfElements.lua" "Proyectos\CallOfElements\CallOfElements.toc" "Proyectos\CallOfElements\COE_Config.lua" "Proyectos\changelog.md"

echo.
echo Creando commit...
git commit -m "CallOfElements v6.16: arreglar error Lua al abrir Configurar Barra"

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
