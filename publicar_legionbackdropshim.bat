@echo off
cd /d "%~dp0"
echo ===============================================
echo  Publicando LegionBackdropShim (addon nuevo)
echo ===============================================
echo.

set "SRC=F:\WoW\Tauri\Legion\Interface\AddOns\!LegionBackdropShim"
set "DST=Proyectos\LegionBackdropShim\!LegionBackdropShim"

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
git add "Proyectos\LegionBackdropShim" "Proyectos\changelog.md"

echo.
echo Creando commit...
git commit -m "LegionBackdropShim: addon nuevo - shim de compatibilidad para BackdropTemplate en Legion 7.3.5"

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
python "C:\Users\Artio\Desktop\Para la ia\Scripts\Scraping_y_Bots\post_legionbackdropshim_discord.py"

echo.
echo ===============================================
echo Listo. Revisa GitHub Actions para confirmar el build del zip,
echo y el canal de Discord para confirmar el aviso.
echo ===============================================
pause
