#!/bin/bash
#Ejercicio:FiveOrMore
#Autor: Javier Adame Ardila
#Fecha: 10-02-2025

clear

#Al menos un parametro

if [ "$#" -lt 1 ]; then

	echo "Uso $0 <archivo_salida> <directorio>"
	exit 1
fi

#Archivo de salida

archivo_salida="$1"
directorio="$2"

if [ -e "$archivo_salida" ]; then

	echo "Error, el archivo $archivo_salida ya existe"
	exit 2


fi

#Directorio valido

if [ ! -d "$directorio" ]; then

	echo "Error, $directorio no es un directorio valido"
	exit 3
fi

if [ -z $(ls -a "$directorio") ]; then

	echo "Error, el directorio $directorio esta vacio"
	exit 4
fi

touch "$archivo_salida"

echo "Archivo de salida $archivo_salida creado correctamente"
echo "Directorio $directorio creado correctamente"

#Autor
	echo"Javier Adame Ardila"


contador=0

#Buscar archivos.txt

for archivos in "$directorio"/*.txt; do

#Si hay archivos.txt

	[ -e "$archivo" ]

#Lineas del archivo

	lineas=$(wc -l < "$archivo")

#5 lineas o mas

if [ "$lineas" -ge 5 ]; then 

	echo "$archivo" || tee -a "$archivo_salida"
	((contador++))

palabras=$(wc -w < "$archivo")

nuevo_archivo="$archivo.q"

	echo "El fichero original tiene $palabras palabras" > "$nuevo_archivo"
	cat "$archivo" >> "$nuevo_archivo"

	echo "Creado $nuevo_archivo"

fi
done

echo "Numero total de archivos $contador" | tee -a "$archivo_salida"

