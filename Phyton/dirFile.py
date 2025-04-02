import os
import shutil

def leer_rutas(archivo):
    archivos, directorios = [], []
    try:
        with open(archivo, "r") as f:
            for linea in f:
                ruta = linea.strip()
                if os.path.isfile(ruta):
                    archivos.append(ruta)
                elif os.path.isdir(ruta):
                    directorios.append(ruta)
    except FileNotFoundError:
        print(f"Error: El archivo {archivo} no existe.")
    return archivos, directorios

def eliminar_fichero():
    fichero = input("Introduce el nombre del fichero a eliminar: ")
    if os.path.isfile(fichero):
        os.remove(fichero)
        print("Fichero eliminado correctamente.")
    else:
        print("El fichero no existe.")

def mostrar_info_directorio():
    directorio = input("Introduce el nombre del directorio: ")
    if os.path.isdir(directorio):
        print(f"Contenido de {directorio}:")
        for item in os.listdir(directorio):
            print(item)
    else:
        print("El directorio no existe.")

def copiar_fichero():
    origen = input("Introduce el nombre del fichero a copiar: ")
    destino = input("Introduce el destino: ")
    if os.path.isfile(origen):
        try:
            shutil.copy(origen, destino)
            print("Fichero copiado correctamente.")
        except Exception as e:
            print(f"Error al copiar el fichero: {e}")
    else:
        print("El fichero no existe.")

def mostrar_lista(lista, tipo):
    print(f"\nLista de {tipo}:")
    if lista:
        for item in lista:
            print(item)
    else:
        print(f"No hay {tipo} registrados.")

def menu():
    archivos, directorios = leer_rutas("rutas.txt")
    while True:
        print("\n--- Menú ---")
        print("A. Eliminar fichero")
        print("B. Mostrar información de directorio")
        print("C. Copiar fichero")
        print("D. Mostrar lista (Ficheros/Directorios)")
        print("E. Salir")
        opcion = input("Elige una opción: ").upper()
        
        if opcion == "A":
            eliminar_fichero()
        elif opcion == "B":
            mostrar_info_directorio()
        elif opcion == "C":
            copiar_fichero()
        elif opcion == "D":
            tipo = input("¿Qué lista quieres ver? (F/D): ").upper()
            if tipo == "F":
                mostrar_lista(archivos, "ficheros")
            elif tipo == "D":
                mostrar_lista(directorios, "directorios")
            else:
                print("Opción no válida.")
        elif opcion == "E":
            print("Saliendo del programa...")
            break
        else:
            print("Opción no válida. Inténtalo de nuevo.")

if __name__ == "__main__":
    menu()
