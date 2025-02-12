#!/bin/bash
#Ejercicio: Usuarios
#Autor: Javier Adame Ardila
#Fecha: 12-02-2025

clear

uid_min=1000

#Si se pasa un parametro,pasar uid

if [ $# -eq 1 ]; then
	uid_min=$1
fi

#Fecha y hora
fecha=$(date "+%d-%m-%Y - %H:%M")

#Contar usuarios
contador=0

#Encabezado
	echo"===================="
	echo"Informe de usuarios el dia $fecha"
	echo

#Leer archivos

while IFS=: read -r usuario x uid gid d h shell; do

	if [ "$uid" -ge "$uid_min" ]; then

		echo "$usuario - $uid"
		((contador++))
	fi
done < /etc/passwd

#Total usuarios
	echo
	echo"Total $contador usuarios"
	echo"=================="

#Ejecucion

log_file="/tmp/logeventos"
auditor=$(whoami)

	echo"$fecha - El usuario $auditor ha solicitado un informe de usuario" >> "$log_file"


