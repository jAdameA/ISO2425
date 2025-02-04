#!/bin/bash
#Ejercicio:Agenda
#Autor:Javier Adame Ardila
#Fecha:04-02-2025

clear

Agenda="agenda.txt"


while true; do

	echo "a)Añadir una entrada"
	echo "b)Buscar por dni"
	echo "c)Ver la agenda completa"
	echo "d)Eliminar todas las entradas de la agenda"
	echo "e)Finalizar"

	read -p "Selecciona una opcion" opcion

case $opcion in

	a)

	read -p "Ingrese Dni:" Dni

	if grep "^$dni:" "$Agenda"; then

	echo "El Dni ya esta registrado"

	else

	read -p "Ingrese el nombre" Nombre
	read -p "Ingrese la apellido" Apellido
	read -p "Ingrese la localidad" Localidad

	echo "$Dni:$Nombre:$Apellido:$Localidad">>"$Agenda"

	echo "Contacto guardado"

	;;

	fi

	b)

	read -p "Ingrese Dni" dni_b
	resultado=$(grep "^dni_b:" "$Agenda")

	if [ -n "$Resultado" ]; then

	Nombre=$(echo "$Resultado"  | cut -d ":" f2)
	Apellido=$(echo "$Resultado" | cut -d ":" f3)
	Localidad=$(echo "Resultado" | cut -d ":" f4)

	echo "La persona con el Dni numero $dni_b es: $Nombre $Apellido y vive en $Localidad"

	else 

	echo "El Dni no se encuentra"

	fi
	;;

	c)

	if [ -s "$Agenda" ]; then

	echo "Agenda completa"
	cat "$Agenda"

	else
	echo "Agenda vacia"

	fi

	;;

	d)

	> "$Agenda"

	echo "Las entradas se han eliminado"

	;;

	e)

	echo "Saliendo.."
	exit 0

	;;

	*)

	echo "Opcion no valida, intente nuevamente"
	;;
esac

done
