#!/bin/bash

# Cleanup script for ftgn-journalism
# Run from the project root directory

# Remove duplicate and legacy content
echo "Removing duplicate and legacy content..."
rm -f about.html
rm -rf public/essays/en
rm -rf public/essays/html
rm -f public/essays/metadata.json
rm -rf src/templates
rm -f content-org/example.org
rm -f content-org/essays/example-essay.org
rm -f CLAUDE.md
rm -f README.org

# Remove legacy scripts
echo "Removing legacy scripts..."
rm -f scripts/fix-converter.sh
rm -f scripts/generate-html-wrappers.sh
rm -f scripts/md-to-html.sh
rm -f scripts/process-markdown.sh
rm -f scripts/restore-markdown.sh
rm -f scripts/simple-converter.sh
rm -f scripts/simple-md-to-html.sh
rm -f scripts/start-server.sh

# Clean up public directory (it gets regenerated)
echo "Cleaning up public directory..."
rm -rf public/*

# Rebuild the site
echo "Rebuilding the site..."
hugo --minify

echo "Cleanup complete! The project structure is now simplified."
echo "You can now upload the 'public' directory to torchscribe.com."