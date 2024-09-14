#!/bin/bash

cowsay -f tux "Iniciando el script..." | lolcat

# Ver la fecha del sistema
echo "Fecha actual: $(date +%Y-%m-%d)" | figlet | lolcat

# Ver la hora del sistema
echo "Hora actual: $(date +%H:%M:%S)" | figlet 

# Crear una carpeta llamada nueva en el directorio actual
nuevaDir="$(pwd)/nueva"
pruebaDir="$(pwd)/prueba"
echo "Directorio actual: $(pwd)"
echo "Directorio creado: $nuevaDir"
echo "Archivos: $(ls)"
mkdir -p "$nuevaDir"
mkdir -p "$pruebaDir"
cowsay -f alpaca "Carpeta creada: nueva" | lolcat

# Copiar todos los archivos de la carpeta prueba a la carpeta nueva
if [ -d "./prueba" ]; then
    sudo cp -r ./prueba* "$nuevaDir"
    cowsay "Archivos copiados a nueva" | lolcat
else
    cowsay "Carpeta prueba no encontrada" | lolcat
fi

# Ocultar todos los archivos de la carpeta nueva y restringirlos a solo lectura
for file in "$nuevaDir"/*; do
    sudo mv "$file" "$nuevaDir/.$(basename "$file")"  # Ocultar archivos (agregar un punto al nombre)
    sudo chmod -R 400 "$nuevaDir"
done
cowsay "Archivos ocultos y restringidos" | lolcat

# Comparar los archivos prueba.txt de ambas carpetas
if [ -f "./prueba/prueba.txt" ] && [ -f "$nuevaDir/.prueba.txt" ]; then
    diff ./prueba/prueba.txt "$nuevaDir/.prueba.txt"
    cowsay -f cupcake "Comparación de archivos realizada" | lolcat
else
    cowsay -f bunny "prueba.txt no encontrado en una de las carpetas" | lolcat
fi

# Borrar todos los archivos de la carpeta nueva
sudo rm -f "$nuevaDir/.*"
cowsay "Archivos borrados en la carpeta nueva" | lolcat

# Crear una carpeta oculta llamada temporal en la carpeta nueva
sudo mkdir "$nuevaDir/.temporal"
cowsay -f skeleton "Carpeta oculta temporal creada" | lolcat

# Crear un archivo oculto llamado fin.txt en la carpeta nueva
echo "Nombre del usuario: $USER" | sudo tee "$nuevaDir/.fin.txt" > /dev/null
cowsay -f llama "Archivo oculto fin.txt creado" | lolcat

cowsay -f dragon "Fin del script y el trabajo :D " | lolcat