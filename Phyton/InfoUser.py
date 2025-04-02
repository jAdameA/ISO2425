import os
import sys
import platform
import psutil

# Verificar si el script se ejecuta como root
def verificar_root():
    if os.geteuid() != 0:
        print("Este script debe ejecutarse como root.")
        sys.exit(1)

def mostrar_info_sistema():
    print(f"\n--- Información del Sistema ---\n"
          f"Sistema Operativo: {platform.system()} {platform.release()}\n"
          f"Arquitectura: {platform.architecture()[0]}\n"
          f"Procesador: {platform.processor()}\n"
          f"Núcleos CPU: {psutil.cpu_count(logical=False)}\n"
          f"Hilos CPU: {psutil.cpu_count(logical=True)}")

def gestionar_usuario():
    usuario = input("Introduce el nombre de usuario: ")
    if os.system(f"id {usuario} > /dev/null 2>&1") == 0:
        print(os.popen(f"id {usuario}").read())
    else:
        os.system(f"useradd {usuario}")
        print(f"Usuario '{usuario}' creado correctamente.")

def gestionar_directorio():
    directorio = input("Introduce el directorio: ")
    if os.path.isdir(directorio):
        print("El directorio ya existe y es válido.")
    elif os.path.exists(directorio):
        print("Existe un archivo con ese nombre, pero no es un directorio.")
    else:
        os.makedirs(directorio)
        print(f"Directorio '{directorio}' creado correctamente.")

def menu():
    opciones = {"1": mostrar_info_sistema, "2": gestionar_usuario, "3": gestionar_directorio}
    while True:
        opcion = input("\n--- Menú ---\n1. Mostrar información del sistema y CPU\n2. Gestionar usuario\n3. Gestionar directorio\n4. Salir\nElige una opción: ")
        if opcion == "4":
            print("Saliendo del programa...")
            break
        opciones.get(opcion, lambda: print("Opción no válida. Inténtalo de nuevo."))()

if __name__ == "__main__":
    verificar_root()
    menu()
