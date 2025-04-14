#!/bin/bash

# This script converts markdown files from the public/essays/en directory to Hugo content format
# It adds necessary frontmatter for Hugo based on metadata.json

SOURCE_DIR="/Users/zeeshankhan/ftgn-journalism/public/essays/en"
TARGET_DIR="/Users/zeeshankhan/ftgn-journalism/content/essays"
METADATA_FILE="/Users/zeeshankhan/ftgn-journalism/public/essays/metadata.json"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Check if metadata file exists
if [ ! -f "$METADATA_FILE" ]; then
    echo "Metadata file not found: $METADATA_FILE"
    exit 1
fi

# Process each markdown file
echo "Converting Markdown files to Hugo format..."

for md_file in "$SOURCE_DIR"/*.md; do
    # Get filename
    filename=$(basename "$md_file")
    
    # Extract essay ID and title from filename (e.g., 01-42-Rouen-1944.md)
    id=$(echo "$filename" | cut -d'-' -f1)
    
    # Find metadata for this file
    metadata=$(grep -A 7 "\"filename\": \"$filename\"" "$METADATA_FILE")
    
    title=$(echo "$metadata" | grep "\"title\"" | cut -d'"' -f4)
    year=$(echo "$metadata" | grep "\"year\"" | cut -d'"' -f4)
    location=$(echo "$metadata" | grep "\"location\"" | cut -d'"' -f4 | sed 's/ /-/g')
    theme=$(echo "$metadata" | grep "\"theme\"" | cut -d'"' -f4)
    
    # If we couldn't extract data from metadata, try parsing from filename
    if [ -z "$title" ]; then
        # Extract parts from filename (e.g., 01-42-Rouen-1944.md)
        parts=$(echo "$filename" | sed 's/.md$//' | tr '-' ' ')
        location=$(echo "$parts" | awk '{for(i=3;i<NF;i++) printf "%s ", $i; print $NF}' | sed 's/ [0-9]*$//')
        year=$(echo "$parts" | awk '{print $NF}')
        title="$location $year"
    fi
    
    # Create new Hugo markdown file
    output_file="$TARGET_DIR/$filename"
    
    echo "Creating $output_file with frontmatter..."
    
    # Read original content
    content=$(cat "$md_file")
    
    # Write new file with Hugo frontmatter
    cat > "$output_file" << EOF
---
title: "$title"
date: ${year}-01-01
location: "$location"
year: "$year"
tags: ["$theme"]
categories: ["$theme"]
---

$content
EOF
    
    echo "Converted $filename to Hugo format"
done

echo "Conversion complete! Files are now ready for Hugo in $TARGET_DIR"