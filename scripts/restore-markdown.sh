#!/bin/bash

# This script restores the original markdown files by removing the HTML wrapper

MD_DIR="/Users/zeeshankhan/ftgn-journalism/public/essays/en"

# Process each markdown file
for md_file in "$MD_DIR"/*.md; do
    # Check if the file has the HTML wrapper
    if grep -q "<!DOCTYPE html>" "$md_file"; then
        # Extract just the markdown content (after the HTML wrapper)
        sed -n '/^<\/html>/,$p' "$md_file" | tail -n +2 > "$md_file.new"
        mv "$md_file.new" "$md_file"
        echo "Restored $md_file"
    fi
done

echo "All markdown files restored successfully"