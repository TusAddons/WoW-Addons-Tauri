@echo off
cd /d "%~dp0"
echo ===============================================
echo  Publicando OPie (Vanilla 4-Artiom97es)
echo ===============================================
echo.

if not exist "Proyectos\OPie\OPie.toc" (
    echo No se encontro Proyectos\OPie\OPie.toc
    echo Ejecuta este .bat desde la raiz del repo Repo-Addons.
    pause
    exit /b 1
)

echo Anadiendo cambios a git...
git add "Proyectos\OPie" "Proyectos\changelog.md"

echo.
echo Creando commit...
git commit -m "OPie: primera publicacion, fix GetTime en hint de cargas y 3 ventanas que se mostraban al cargar"

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
