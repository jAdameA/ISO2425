@echo off
rem create Files
rem Autor: Javier Adame
rem fecha:20-11-2024

echo Pulsa 1 para archivo.txt
echo Pulsa 2 para archivo.bat

set /p opcion=" opcion 1: txt opcion 2: bat"

if %opcion% EQU 1 goto txt
if %opcion% EQU 2 goto bat

:txt

set /P nombre="Introduzca nombre fichero"
echo > %nombre%.txt
pause


:bat

set /P nombre="Introduzca nombre fichero"
echo > %nombre%.bat


