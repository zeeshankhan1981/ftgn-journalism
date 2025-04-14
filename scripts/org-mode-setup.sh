#!/bin/bash

# Script to set up a simplified Org Mode workflow with Hugo
# This script:
# 1. Moves content-org files to content directory
# 2. Removes duplicate Markdown files
# 3. Updates directory structure

# Backup first
echo "Backing up content..."
mkdir -p /tmp/ftgn-backup-$(date +%Y%m%d)
cp -r content/essays/* /tmp/ftgn-backup-$(date +%Y%m%d)/

# Move Org files to content/essays (replacing md files)
echo "Setting up simplified Org workflow..."
mkdir -p content/essays

# Create cleanup flag to check if we need to convert
NEED_CONVERSION=true

# Check if we have org files
if [ -d "content-org/essays" ] && [ "$(ls -A content-org/essays)" ]; then
    # Move Org files to content/essays
    echo "Moving Org files to content/essays..."
    cp content-org/essays/*.org content/essays/
    
    # Remove .md files in content/essays that have corresponding .org files
    echo "Removing duplicate .md files..."
    for org_file in content/essays/*.org; do
        base_name=$(basename "$org_file" .org)
        if [ -f "content/essays/$base_name.md" ]; then
            rm "content/essays/$base_name.md"
        fi
    done
    
    NEED_CONVERSION=false
else
    echo "No Org files found in content-org/essays."
    
    # Create an example Org file if content/essays is empty
    if [ ! "$(ls -A content/essays)" ]; then
        echo "Creating example Org file..."
        cat > content/essays/example-essay.org << EOL
#+TITLE: Example Essay
#+DATE: $(date +%Y-%m-%d)
#+AUTHOR: TorchScribe
#+HUGO_TAGS: example
#+HUGO_CATEGORIES: example

This is an example essay. Replace this content with your own.

* First Section

Content of first section.

* Second Section

Content of second section.
EOL
    fi
fi

# Convert existing .md files to .org if needed
if [ "$NEED_CONVERSION" = true ] && [ "$(ls -A content/essays/*.md 2>/dev/null)" ]; then
    echo "Converting Markdown files to Org files..."
    for md_file in content/essays/*.md; do
        base_name=$(basename "$md_file" .md)
        org_file="content/essays/$base_name.org"
        
        # Extract frontmatter and content
        title=$(grep -m 1 "title:" "$md_file" | cut -d'"' -f2)
        date=$(grep -m 1 "date:" "$md_file" | cut -d':' -f2- | xargs)
        location=$(grep -m 1 "location:" "$md_file" | cut -d'"' -f2)
        year=$(grep -m 1 "year:" "$md_file" | cut -d'"' -f2)
        tags=$(grep -m 1 "tags:" "$md_file" | sed 's/tags: \[\|\]//g' | sed 's/"//g')
        categories=$(grep -m 1 "categories:" "$md_file" | sed 's/categories: \[\|\]//g' | sed 's/"//g')
        
        # Get content (skip frontmatter)
        content=$(sed '1,/---/d' "$md_file" | sed '1d')
        
        # Create org file
        cat > "$org_file" << EOL
#+TITLE: $title
#+DATE: $date
#+AUTHOR: TorchScribe
#+HUGO_TAGS: $tags
#+HUGO_CATEGORIES: $categories
#+HUGO_CUSTOM_FRONT_MATTER: :location "$location" :year "$year"

$content
EOL
        
        # Remove original md file
        rm "$md_file"
        
        echo "Converted $md_file to $org_file"
    done
fi

# Clean up content-org (no longer needed)
if [ -d "content-org" ]; then
    echo "Cleaning up content-org directory..."
    rm -rf content-org
fi

# Update .gitignore to ignore generated markdown files by Hugo
echo "Updating .gitignore..."
if [ ! -f ".gitignore" ]; then
    touch .gitignore
fi

# Add Hugo-specific ignores if not already present
if ! grep -q "public/" .gitignore; then
    echo "public/" >> .gitignore
fi
if ! grep -q ".hugo_build.lock" .gitignore; then
    echo ".hugo_build.lock" >> .gitignore
fi
if ! grep -q "resources/" .gitignore; then
    echo "resources/" >> .gitignore
fi

echo "Org mode setup complete! Your workflow is now simplified:"
echo "1. Edit .org files directly in the content/essays/ directory"
echo "2. Hugo will render them directly without needing ox-hugo exports"
echo "3. Run 'hugo server' to preview or 'make build-for-upload' to build for deployment"