#!/bin/bash
#Autor: Javier Adame Ardila
#Fecha:06-02-2024

clear

echo "Autor: Javier Adame"

# Control de parámetros de entrada
if [ "$#" -ne 2 ]; then
    echo "Uso: $0 <fichero_salida> <max_operaciones>"
    exit 1
fi

fichero_salida=$1
max_operaciones=$2

# Verificar si el fichero ya existe
if [ -e "$fichero_salida" ]; then
    echo "Error: El fichero '$fichero_salida' ya existe."
    exit 1
fi

touch "$fichero_salida"

contador=0
while [ "$contador" -lt "$max_operaciones" ]; do
    echo -n "Operación Op1 Op2: "
    read -p operacion op1 op2
    
    # Verificar si la operación es X para salir
    if [ "$operacion" = "X" ]; then
        break
    fi
    
    # Verificar si la operación es válida y calcular resultado
    case "$operacion" in
        S) resultado=$((op1 + op2)) ;;
        R) resultado=$((op1 - op2)) ;;
        M) resultado=$((op1 * op2)) ;;
        D) 
            if [ "$op2" -eq 0 ]; then
                echo "Error: División por cero no permitida."
                continue
            fi
            resultado=$((op1 / op2))
            ;;
        *)
            echo "Operación no válida. Saliendo..."
            break
            ;;
    esac
    
    # Guardar en el fichero y mostrar resultado
    echo "$operacion $op1 $op2" >> "$fichero_salida"
    echo "Resultado: $resultado"
    
    contador=$((contador + 1))

done

# Mostrar ruta y contenido del fichero
echo "Fichero de salida: $(realpath "$fichero_salida")"
cat "$fichero_salida"
