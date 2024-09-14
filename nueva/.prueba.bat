@echo off
title Script de Windows

rem Mostrar mensaje de inicio
echo Iniciando el script...
echo.

rem Ver la fecha del sistema
echo Fecha actual: %date%
echo.

rem Ver la hora del sistema
echo Hora actual: %time%
echo.

rem Crear una carpeta llamada nueva en el directorio actual
set "nuevaDir=%cd%\nueva"
set "pruebaDir=%cd%\prueba"
echo Directorio actual: %cd%
echo Directorio creado: %nuevaDir%
if not exist "%nuevaDir%" mkdir "%nuevaDir%"
if not exist "%pruebaDir%" mkdir "%pruebaDir%"
echo Carpeta creada: nueva
echo.

rem Copiar todos los archivos de la carpeta prueba a la carpeta nueva
if exist "%pruebaDir%\*" (
    xcopy /s /i "%pruebaDir%\*" "%nuevaDir%\"
    echo Archivos copiados a nueva
) else (
    echo Carpeta prueba no encontrada
)
echo.

rem Ocultar todos los archivos de la carpeta nueva y restringirlos a solo lectura
for %%F in ("%nuevaDir%\*") do (
    attrib +h +r "%%F"
)
echo Archivos ocultos y restringidos
echo.

rem Comparar los archivos prueba.txt de ambas carpetas
if exist "%pruebaDir%\prueba.txt" (
    fc "%pruebaDir%\prueba.txt" "%nuevaDir%\prueba.txt"
    echo Comparación de archivos realizada
) else (
    echo prueba.txt no encontrado en una de las carpetas
)
echo.

rem Borrar todos los archivos de la carpeta nueva
del /f /q "%nuevaDir%\*"
echo Archivos borrados en la carpeta nueva
echo.

rem Crear una carpeta oculta llamada temporal en la carpeta nueva
mkdir "%nuevaDir%\temporal"
attrib +h "%nuevaDir%\temporal"
echo Carpeta oculta temporal creada
echo.

rem Crear un archivo oculto llamado fin.txt en la carpeta nueva
echo Nombre del usuario: %USERNAME% > "%nuevaDir%\fin.txt"
attrib +h "%nuevaDir%\fin.txt"
echo Archivo oculto fin.txt creado
echo.

rem Fin del script
echo Fin del script y el trabajo :D
pause
