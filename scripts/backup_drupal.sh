#!/bin/bash

# ==========================================
# Script de Backup Automático para Drupal
# ==========================================

# 1. Configuración
DB_NAME="drupal_db"
NFS_DIR="/var/nfs/drupal_archivos"
BACKUP_DIR="/backups"
FECHA=$(date +"%Y-%m-%d_%H-%M-%S")

echo "Iniciando copia de seguridad: $FECHA"

# 2. Backup BBDD MariaDB
echo "Respaldando base de datos..."
mysqldump $DB_NAME > $BACKUP_DIR/db_$FECHA.sql

# 3. Backup Archivos (NFS)
echo "Comprimiendo archivos NFS..."
tar -czf $BACKUP_DIR/archivos_$FECHA.tar.gz $NFS_DIR

# 4. Limpieza: Borrar backups con más de 7 días de antigüedad
echo "Borrando copias antiguas..."
find $BACKUP_DIR -type f -name "*.sql" -mtime +7 -exec rm {} \;
find $BACKUP_DIR -type f -name "*.tar.gz" -mtime +7 -exec rm {} \;

# 5. Enviar copia de seguridad al servidor Monitor (.40)
echo "Enviando copias al servidor externo..."
scp $BACKUP_DIR/db_$FECHA.sql aitor@192.168.50.40:/home/aitor/backups_drupal/
scp $BACKUP_DIR/archivos_$FECHA.tar.gz aitor@192.168.50.40:/home/aitor/backups_drupal/

echo "¡Backup completado con éxito!"
