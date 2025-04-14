#!/bin/bash

# Final fixed converter that handles headers and links properly
MD_DIR="/Users/zeeshankhan/ftgn-journalism/public/essays/en"
HTML_DIR="/Users/zeeshankhan/ftgn-journalism/public/essays/html"
METADATA="/Users/zeeshankhan/ftgn-journalism/public/essays/metadata.json"

# Create HTML directory if it doesn't exist
mkdir -p "$HTML_DIR"

# Process each markdown file
for md_file in "$MD_DIR"/*.md; do
    filename=$(basename "$md_file")
    html_filename="${filename%.md}.html"
    
    echo "Converting $filename to HTML..."
    
    # Read the markdown content
    markdown_content=$(cat "$md_file")
    
    # Get title from metadata
    title=$(grep -A 3 "\"filename\": \"$filename\"" "$METADATA" | grep "title" | cut -d '"' -f 4)
    
    # Process links more carefully
    # First convert **Source:** to <strong>Source:</strong>
    html_content=$(echo "$markdown_content" | sed 's/\*\*Source:\*\*/<strong>Source:<\/strong>/g')
    
    # Handle links - this looks for [text](url) pattern and converts to HTML links
    html_content=$(echo "$html_content" | sed -E 's/\[([^]]+)\]\(([^)]+)\)/<a href="\2" target="_blank" rel="noopener noreferrer">\1<\/a>/g')
    
    # Handle paragraphs - split by blank lines
    paragraph_content=""
    while IFS= read -r line || [ -n "$line" ]; do
        if [[ -z "$line" ]]; then
            if [[ -n "$paragraph_content" ]]; then
                paragraph_content+="</p><p>"
            fi
        else
            paragraph_content+="$line "
        fi
    done <<< "$html_content"
    
    # Wrap in paragraphs
    if [[ -n "$paragraph_content" ]]; then
        final_content="<p>$paragraph_content</p>"
        # Clean up any empty paragraphs
        final_content=$(echo "$final_content" | sed 's/<p>\s*<\/p>//g')
    else
        final_content="<p>$html_content</p>"
    fi
    
    # Create the HTML file with site template
    cat > "$HTML_DIR/$html_filename" << EOL
<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$title - Against The Tide</title>
    
    <!-- SEO Meta Tags -->
    <meta name="description" content="$title - Against The Tide">
    <meta name="keywords" content="journalism, civilian, military, bombardment, essays, history">
    <meta name="author" content="TorchScribe">
    
    <!-- Open Graph / Social Media -->
    <meta property="og:type" content="article">
    <meta property="og:title" content="$title - Against The Tide">
    <meta property="og:description" content="$title - Against The Tide">
    <meta property="og:url" content="https://torchscribe.com/essays/html/$html_filename">
    
    <!-- Fonts and Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    
    <!-- Favicon -->
    <link rel="icon" type="image/svg+xml" href="/img/favicon.svg">
    <link rel="icon" type="image/png" href="/img/favicon.png">
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">Against <span>The</span> Tide</div>
            <nav>
                <a href="/">Home</a>
                <a href="/#essays">Essays</a>
                <a href="/about.html">About</a>
                <button id="theme-toggle" aria-label="Toggle dark mode">
                    <span class="theme-toggle-icon">◐</span>
                </button>
            </nav>
        </header>

        <main class="essay-content markdown-content">
            <header class="essay-header">
                <h1>$title</h1>
            </header>
            
            <article class="essay-article">
                $final_content
            </article>
            
            <div class="essay-navigation">
                <a href="/#essays" class="back-to-essays">← Back to Essays</a>
            </div>
        </main>

        <footer>
            <p>&copy; 2025 Against The Tide · All rights reserved</p>
            <p>Curated by TorchScribe</p>
        </footer>
    </div>
    
    <script>
        // Dark mode toggle functionality
        document.addEventListener('DOMContentLoaded', () => {
            // Get theme preference
            const getThemePreference = () => {
                if (localStorage.getItem('theme')) {
                    return localStorage.getItem('theme');
                }
                return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
            };
            
            // Apply the theme
            const setTheme = (theme) => {
                document.documentElement.setAttribute('data-theme', theme);
                localStorage.setItem('theme', theme);
            };
            
            // Set initial theme
            setTheme(getThemePreference());
            
            // Toggle theme on click
            const themeToggle = document.getElementById('theme-toggle');
            themeToggle.addEventListener('click', () => {
                const currentTheme = document.documentElement.getAttribute('data-theme');
                const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
                
                setTheme(newTheme);
            });
            
            // Keyboard navigation
            document.addEventListener('keydown', (e) => {
                // Alt+Home goes to home page
                if (e.altKey && e.key === 'Home') {
                    e.preventDefault();
                    window.location.href = '/';
                }
                
                // Alt+E returns to essay list
                if (e.altKey && e.key === 'e') {
                    e.preventDefault();
                    window.location.href = '/#essays';
                }
            });
        });
    </script>
</body>
</html>
EOL
    
    echo "Created HTML for $filename"
done

echo "All markdown files converted to HTML successfully"