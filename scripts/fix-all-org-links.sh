#!/bin/bash

# Script to fix all source links in Org files
# This script handles special characters properly

echo "Fixing all source links to use proper Org mode format..."

# Create backup
BACKUP_DIR="/tmp/essays-backup-links-$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"
cp /Users/zeeshankhan/ftgn-journalism/content/essays/*.org "$BACKUP_DIR/"
echo "Created backup at $BACKUP_DIR"

# Process each file one by one
for file in /Users/zeeshankhan/ftgn-journalism/content/essays/*.org; do
    filename=$(basename "$file")
    
    # Skip files that already have org mode links
    if grep -q "\*\*Source:\*\* \[\[" "$file"; then
        echo "$filename already has proper Org mode links, skipping."
        continue
    fi
    
    # Process files with markdown links
    if grep -q "\*\*Source:\*\* \[.*\](http" "$file"; then
        # Get the source line 
        source_line=$(grep -m 1 "^\*\*Source:\*\* \[.*\](http" "$file")
        
        # Extract source name - everything between [ and ]
        source_name=$(echo "$source_line" | grep -o "\[.*\](" | sed 's/\[\(.*\)\](.*/\1/')
        
        # Extract URL - everything between ( and )
        url=$(echo "$source_line" | grep -o "(http[^)]*)" | sed 's/(\(.*\))/\1/')
        
        # Create new line with org link format
        new_line="**Source:** [[$url][$source_name]]"
        
        # Write to a temporary file
        temp_file=$(mktemp)
        
        # Replace the source line
        awk -v old="$source_line" -v new="$new_line" '{gsub(old, new); print}' "$file" > "$temp_file"
        
        # Move back to original file
        mv "$temp_file" "$file"
        
        echo "Fixed links in $filename"
    else
        echo "No markdown links found in $filename"
    fi
done

echo "All essays processed. Please rebuild the site to see changes."