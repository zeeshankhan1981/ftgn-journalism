#!/bin/bash

# Script to set up the Org-mode to Hugo workflow
# This will create Org files from existing markdown content

SOURCE_DIR="/Users/zeeshankhan/ftgn-journalism/public/essays/en"
TARGET_DIR="/Users/zeeshankhan/ftgn-journalism/content-org/essays"
METADATA_FILE="/Users/zeeshankhan/ftgn-journalism/public/essays/metadata.json"

# Create target directory if it doesn't exist
mkdir -p "$TARGET_DIR"

# Check if metadata file exists
if [ ! -f "$METADATA_FILE" ]; then
    echo "Metadata file not found: $METADATA_FILE"
    exit 1
fi

# Process each markdown file
echo "Converting Markdown files to Org format..."

for md_file in "$SOURCE_DIR"/*.md; do
    # Skip test files
    if [[ "$md_file" == *"test-file"* ]]; then
        continue
    fi
    
    # Get filename
    filename=$(basename "$md_file")
    
    # Extract essay ID and title from filename (e.g., 01-42-Rouen-1944.md)
    id=$(echo "$filename" | cut -d'-' -f1)
    base_name=$(echo "$filename" | sed 's/.md$//')
    
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
    
    # Create new Org file
    output_file="$TARGET_DIR/$base_name.org"
    
    echo "Creating $output_file with Org headers..."
    
    # Read original content
    content=$(cat "$md_file")
    
    # Write new file with Org mode headers
    cat > "$output_file" << EOF
#+TITLE: $title
#+DATE: ${year}-01-01
#+HUGO_BASE_DIR: ../../
#+HUGO_SECTION: essays
#+HUGO_TAGS: civilian
#+EXPORT_FILE_NAME: $base_name
#+HUGO_CUSTOM_FRONT_MATTER: :location "$location" :year "$year"

$content

* Sources
:PROPERTIES:
:EXPORT_EXCLUDE: t
:END:
EOF
    
    echo "Converted $filename to Org format"
done

echo "Conversion complete! Files are now ready for editing in Emacs Org mode in $TARGET_DIR"
echo "Use C-c C-e H H to export them to Hugo markdown format"