#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Arguments
FOLDER_ONE=$1
FOLDER_TWO=$2

# Timestamp
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

# Create backup directory if not exists
BACKUP_DIR=~/backups
mkdir -p "$BACKUP_DIR"

# Function to backup a folder
backup_folder() {
  local FOLDER=$1
  local BASENAME=$(basename "$FOLDER")
  local ARCHIVE_NAME="backup_${BASENAME}_${TIMESTAMP}.tar.gz"

  echo "Checking folder: $FOLDER"

  if [ -d "$FOLDER" ]; then
tar -czf "/home/scripts/$ARCHIVE_NAME" "$FOLDER"
    mv "/home/scripts/$ARCHIVE_NAME" "$BACKUP_DIR"
    echo -e "${GREEN}Backup successful for $FOLDER → $BACKUP_DIR/$ARCHIVE_NAME${NC}"
  else
    echo -e "${RED}Folder not found: $FOLDER${NC}"
  fi
}

# Run backup for both folders
backup_folder "$FOLDER_ONE"
backup_folder "$FOLDER_TWO"

