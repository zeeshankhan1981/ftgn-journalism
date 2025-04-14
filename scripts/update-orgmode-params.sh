#!/bin/bash

# Script to fix Org mode parameters for Hugo compatibility
# This ensures the location and year are defined directly as parameters, not in custom front matter

# Configuration
ESSAYS_DIR="/Users/zeeshankhan/ftgn-journalism/content/essays"
BACKUP_DIR="/Users/zeeshankhan/ftgn-journalism/content/essays_backup_params_$(date +%Y%m%d%H%M%S)"

# Create backup directory
mkdir -p "$BACKUP_DIR"
echo "Created backup directory at $BACKUP_DIR"

# Copy all files to backup
cp -a "$ESSAYS_DIR"/*.org "$BACKUP_DIR/"
echo "Backed up all essay files"

# Process each file
for file in "$ESSAYS_DIR"/*.org; do
    filename=$(basename "$file")
    
    # Extract the location name and year from filename
    # Format: 01-42-Rouen-1944.org
    if [[ $filename =~ ([0-9]+)-([0-9]+)-([A-Za-z0-9-]+)-([0-9]+)\.org ]]; then
        file_num=${BASH_REMATCH[1]}
        location_id=${BASH_REMATCH[2]}
        location_name=${BASH_REMATCH[3]}
        year=${BASH_REMATCH[4]}
        
        # Replace hyphens with spaces and capitalize first letter of each word
        formatted_location=$(echo "$location_name" | sed 's/-/ /g' | awk '{for(i=1;i<=NF;i++) $i=toupper(substr($i,1,1)) substr($i,2)} 1')
        
        echo "Processing $filename - Location: $formatted_location, Year: $year"
        
        # Check if file already has new format parameters
        if ! grep -q "^#+LOCATION:" "$file"; then
            # Remove the HUGO_CUSTOM_FRONT_MATTER line
            sed -i "" "/#+HUGO_CUSTOM_FRONT_MATTER:/d" "$file"
            
            # Add direct parameters after EXPORT_FILE_NAME line
            sed -i "" "/#+EXPORT_FILE_NAME:/a\\
#+LOCATION: $formatted_location\\
#+YEAR: $year
" "$file"
            
            echo "  Updated to use direct Org parameters"
        else
            echo "  Already using direct parameters, skipping"
        fi
    else
        echo "Warning: Filename pattern not recognized for $filename"
    fi
done

echo "All files processed. Original files backed up in $BACKUP_DIR"
echo "Please rebuild the site with: ./scripts/rebuild-site.sh"