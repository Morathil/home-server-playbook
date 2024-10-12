#!/bin/bash

# Source the configuration file
source ~/backup.conf

echo ""
echo "--------------------"
echo "Start Backup: $(date)"

for FOLDER in "${FOLDERS[@]}"; do
  echo "$SOURCE_PATH/$FOLDER/ =>  $BACKUP_DIR/$FOLDER"
  rsync -avu --delete "$SOURCE_PATH/$FOLDER/" "$BACKUP_DIR/$FOLDER"
done

echo "Backup completed successfully: $(date)"
