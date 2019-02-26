#!/bin/bash
#EJECUTAR EL ARCHIVO EN EL DIRECTORIO RAIZ CON #
#PERMISOS DE SUPERUSUARIO                      #

#carpeta donde copiar los archivos
mkdir FOLDER_BACKUP
#fecha del backup
FECHA=`date "+%d_%m_%y_%H-%M-%S"`;
#nombre del archivo
NOMBRE_ARCHIVO="Backup_$FECHA.tgz";
#buscando todos los archivos ".log"
archivoslog=$(find . -name "*.log");
#copiando los archivos encontrados en la carpeta del backup
for l in $archivoslog;do
	cp $l FOLDER_BACKUP;
done;
#se comprime la carpeta en un archivo .tar
tar cfvz $NOMBRE_ARCHIVO FOLDER_BACKUP;

echo "....................................................";
#eliminacion de la carpeta con los archivos ".log"
rm -r FOLDER_BACKUP;
echo Los archivos fueron respaldados exitosamente;
