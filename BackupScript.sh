#!/bin/bash

# Define destination directories
backup_dir="write/backupFolder"

# Date for backup (optional, for organizing backups)
dBackup=$(date +"%Y%m%d")

# Log file to record the backup process
log_file="$backup_dir/backup_$dBackup.log"

# Create backup directory if it doesn't exist
if [ ! -d "$backup_dir" ]; then
    mkdir -p "$backup_dir"
    echo "Backup directory created: $backup_dir"
fi

# Function to handle copying of files and directories
backup() {
    local src="$1"
    local dest="$2"
    local base_dir=$(basename "$src")
    local dest_path="$backup_dir/$dest"

    if [ -d "$src" ]; then
        # Handle directories
        # If directory exists, update files inside it
        if [ ! -d "$dest_path" ]; then
                mkdir -p "$dest_path" # Creates the directory if it doesn't exist
        fi 
        if [ ! -f "$dest_path" ]; then
            touch "$dest_path" # Creates the file if it doesn't exist
        fi

        if [ -d "$dest_path" ]; then
            cp -rup "$src/"* "$dest_path"
            echo "Directory updated: $base_dir" | tee -a "$log_file"
        else
            cp -rup "$src" "$dest_path"
            echo "Directory copied: $base_dir" | tee -a "$log_file"
        fi
    elif [ -f "$src" ]; then
        # Handle files
        cp -up "$src" "$dest_path"
        echo "File copied: $base_dir" | tee -a "$log_file"
    else
        echo "Invalid path: $src" | tee -a "$log_file"
    fi
}

# Loop through the files and directories to back up
while IFS=' ' read -r path name; do
    # Use $path and $name in your commands
    # For example:
    backup "$path" "$name"
done < "write/backupFile"


# End of script
echo "Backup completed on $dBackup" | tee -a "$log_file"
