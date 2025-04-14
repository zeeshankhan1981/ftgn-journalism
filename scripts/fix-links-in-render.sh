#!/bin/bash

# Script to fix the appearance of links in Org files
# Goal: Make links display properly in Hugo rendering

# Configuration
ESSAYS_DIR="/Users/zeeshankhan/ftgn-journalism/content/essays"
BACKUP_DIR="/Users/zeeshankhan/ftgn-journalism/content/essays_backup_render_$(date +%Y%m%d%H%M%S)"

# Create backup directory
mkdir -p "$BACKUP_DIR"
echo "Created backup directory at $BACKUP_DIR"

# Copy all files to backup
cp -a "$ESSAYS_DIR"/*.org "$BACKUP_DIR/"
echo "Backed up all essay files"

# Process each file using sed for direct substitution
for file in "$ESSAYS_DIR"/*.org; do
    filename=$(basename "$file")
    echo "Processing $filename"
    
    # Fix the source links using Org mode link syntax
    # From: **Source:** NAME [link](URL)
    # To:   **Source:** [[URL][NAME]]
    
    # First, create a temporary file
    tempfile=$(mktemp)
    
    # Extract the source line
    source_line=$(grep -E "\*\*Source:\*\* .* \[link\]\(" "$file")
    
    if [[ ! -z "$source_line" ]]; then
        # Extract URL from the source line
        url=$(echo "$source_line" | sed -E 's/.*\[link\]\(([^)]+)\).*/\1/')
        
        # Extract name from the source line (everything between "**Source:** " and " [link]")
        name=$(echo "$source_line" | sed -E 's/\*\*Source:\*\* (.*) \[link\].*/\1/')
        
        if [[ ! -z "$url" && ! -z "$name" ]]; then
            # Create the new source line with Org mode link syntax
            new_source_line="**Source:** [[${url}][${name}]]"
            
            # Replace the source line in the file
            sed "s#${source_line}#${new_source_line}#g" "$file" > "$tempfile"
            mv "$tempfile" "$file"
            echo "  Updated link format for $name"
        else
            echo "  Could not extract URL or name from source line"
        fi
    else
        echo "  No source line found with [link] format"
    fi
done

echo "All files processed. Original files backed up in $BACKUP_DIR"
echo "Please rebuild the site with: ./scripts/rebuild-site.sh"