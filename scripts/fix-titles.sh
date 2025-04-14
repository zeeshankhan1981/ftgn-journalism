#!/bin/bash

# Script to fix content mismatches in essay files
# Created: $(date)

# Configuration
ESSAYS_DIR="/Users/zeeshankhan/ftgn-journalism/content/essays"
BACKUP_DIR="/Users/zeeshankhan/ftgn-journalism/content/essays_backup_$(date +%Y%m%d%H%M%S)"

# Create backup directory
mkdir -p "$BACKUP_DIR"
echo "Created backup directory at $BACKUP_DIR"

# Copy all files to backup
cp -a "$ESSAYS_DIR"/*.org "$BACKUP_DIR/"
echo "Backed up all essay files"

# Process each file
for file in "$ESSAYS_DIR"/*.org; do
    filename=$(basename "$file")
    
    # Extract the numeric ID and location name from filename
    # Format: 01-42-Rouen-1944.org
    if [[ $filename =~ ([0-9]+)-([0-9]+)-([A-Za-z0-9-]+)-([0-9]+)\.org ]]; then
        file_num=${BASH_REMATCH[1]}
        location_id=${BASH_REMATCH[2]}
        location_name=${BASH_REMATCH[3]}
        year=${BASH_REMATCH[4]}
        
        # Replace hyphens with spaces and capitalize first letter of each word
        formatted_location=$(echo "$location_name" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1')
        
        # Create the correct title
        correct_title="$location_id $formatted_location $year"
        
        echo "Processing $filename - Title should be: $correct_title"
        
        # Update the TITLE line in the file
        sed -i "" "s/^#+TITLE: .*$/#+TITLE: $correct_title/" "$file"
        
        # Update the date if needed
        sed -i "" "s/^#+DATE: .*$/#+DATE: $year-01-01/" "$file"
        
        # Update HUGO_CUSTOM_FRONT_MATTER with the correct location and year
        sed -i "" "s/:location \"[^\"]*\" :year \"[^\"]*\"/:location \"$formatted_location, $year\" :year \"$year\"/" "$file"
        
        # Update EXPORT_FILE_NAME
        sed -i "" "s/^#+EXPORT_FILE_NAME: .*$/#+EXPORT_FILE_NAME: $filename/" "$file"
    else
        echo "Warning: Filename pattern not recognized for $filename"
    fi
done

echo "All files processed. Original files backed up in $BACKUP_DIR"
echo "Please review the changes before committing to git."