@echo off
cd /d "%~dp0"
echo ===============================================
echo  Publicando DragonflightUI (actualizacion, Legion 7.3.5)
echo ===============================================
echo.

set "SRC=F:\WoW\Tauri\Legion\Interface\AddOns\DragonflightUI"
set "DST=Proyectos\DragonflightUI\DragonflightUI"

if not exist "%SRC%" (
    echo No se encontro %SRC%
    echo Comprueba que el cliente de WoW esta en esa ruta.
    pause
    exit /b 1
)

echo Copiando addon desde el cliente del juego al repo...
robocopy "%SRC%" "%DST%" /E /NFL /NDL /NJH /NJS /R:2 /W:1
if %errorlevel% GEQ 8 (
    echo.
    echo ERROR: robocopy fallo al copiar el addon.
    pause
    exit /b 1
)

echo.
echo Anadiendo cambios a git...
git add "Proyectos\DragonflightUI" "Proyectos\changelog.md"

echo.
echo Creando commit...
git commit -m "DragonflightUI: fix escudo de hermandad y boton de buscar grupo, mas correcciones"

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
echo Avisando en Discord...
python "C:\Users\Artio\Desktop\Para la ia\Scripts\Scraping_y_Bots\post_dragonflightui_update2_discord.py"

echo.
echo ===============================================
echo Listo. Revisa GitHub Actions para confirmar el build del zip,
echo y el canal de Discord para confirmar el aviso.
echo ===============================================
pause
