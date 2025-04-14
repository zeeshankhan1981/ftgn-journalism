#!/bin/bash

# Script to fix links in all Org files to use proper Org mode link syntax
# This converts links from **Source:** NAME [link](URL) to **Source:** [[URL][NAME]]

# Backup directory
BACKUP_DIR="/tmp/essays-backup-$(date +%Y%m%d%H%M%S)"
mkdir -p "$BACKUP_DIR"
echo "Created backup directory at $BACKUP_DIR"

# First, save copies of the current files
cp /Users/zeeshankhan/ftgn-journalism/content/essays/*.org "$BACKUP_DIR/"
echo "Backed up all files"

# Process each essay file one by one with a careful approach
for file in /Users/zeeshankhan/ftgn-journalism/content/essays/*.org; do
  filename=$(basename "$file")
  
  # Extract the source line with markdown-style links
  source_line=$(grep -E "^\*\*Source:\*\* .* \[link\]" "$file" || echo "")
  
  if [[ -n "$source_line" ]]; then
    # Extract the URL from [link](URL)
    url=$(echo "$source_line" | sed -E 's/.*\[link\]\(([^)]+)\).*/\1/')
    
    # Extract the source name (everything between "**Source:** " and " [link]")
    source_name=$(echo "$source_line" | sed -E 's/\*\*Source:\*\* (.*) \[link\].*/\1/')
    
    if [[ -n "$url" && -n "$source_name" ]]; then
      # Create a new Org mode format link
      new_line="**Source:** [[${url}][${source_name}]]"
      
      # Replace just this line in the file
      sed -i "" "s|${source_line}|${new_line}|" "$file"
      echo "Fixed links in $filename: $source_name"
    else
      echo "Could not extract URL or source name from $filename"
    fi
  else
    # Check if the file already has Org mode links
    has_org_link=$(grep -E "^\*\*Source:\*\* \[\[" "$file" || echo "")
    if [[ -n "$has_org_link" ]]; then
      echo "File $filename already has proper Org links"
    else
      echo "No source link found in $filename"
    fi
  fi
done

echo "Done fixing links. Original files backed up to $BACKUP_DIR"
echo "Please restart the Hugo server to see the changes."