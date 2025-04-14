#!/bin/bash

# Script to fix all source links to use proper Org mode format
# Converts [Text](URL) to [[URL][Text]] format for all org files

echo "Fixing all source links to use proper Org mode format..."

# Create backup
BACKUP_DIR="/tmp/essays-backup-links-$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"
cp /Users/zeeshankhan/ftgn-journalism/content/essays/*.org "$BACKUP_DIR/"
echo "Created backup at $BACKUP_DIR"

# Process each org file
for file in /Users/zeeshankhan/ftgn-journalism/content/essays/*.org; do
    # Check if the file already has org link format
    if grep -q "\*\*Source:\*\* \[\[http" "$file"; then
        echo "$(basename "$file") already has proper link format, skipping."
        continue
    fi
    
    # Check if the file has markdown link format
    if grep -q "\*\*Source:\*\* \[.*\](http" "$file"; then
        # Extract the source name and URL with sed
        source_line=$(grep "^\*\*Source:\*\* \[.*\](http" "$file")
        source_name=$(echo "$source_line" | sed -E 's/\*\*Source:\*\* \[(.*)\]\(http.*/\1/')
        source_url=$(echo "$source_line" | sed -E 's/\*\*Source:\*\* \[.*\]\((http.*)\)/\1/')
        
        # Create the new line with org-mode link format
        new_line="**Source:** [[${source_url}][${source_name}]]"
        
        # Replace the line in the file
        sed -i "" "s|${source_line}|${new_line}|" "$file"
        echo "Fixed links in $(basename "$file")"
    else
        echo "No markdown links found in $(basename "$file")"
    fi
done

echo "Finished updating all links to Org mode format."
echo "Please rebuild the site to see the changes."