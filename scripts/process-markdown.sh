#!/bin/bash

# Process Markdown files to add HTML wrapper
# This script creates a temporary combined file for each markdown

MD_DIR="/Users/zeeshankhan/ftgn-journalism/public/essays/en"
WRAPPER="/Users/zeeshankhan/ftgn-journalism/public/essays/markdown-wrapper.html"
TEMP_DIR="/Users/zeeshankhan/ftgn-journalism/public/essays/temp"

# Create temp directory if it doesn't exist
mkdir -p "$TEMP_DIR"

# Process each markdown file
for md_file in "$MD_DIR"/*.md; do
    filename=$(basename "$md_file")
    
    # Combine wrapper HTML with markdown content
    cat "$WRAPPER" "$md_file" > "$TEMP_DIR/$filename"
    
    # Replace original with combined file
    mv "$TEMP_DIR/$filename" "$md_file"
    
    echo "Processed $filename"
done

# Remove temp directory
rmdir "$TEMP_DIR"

echo "All markdown files processed successfully"