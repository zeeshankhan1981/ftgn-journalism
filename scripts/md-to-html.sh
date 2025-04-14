#!/bin/bash

# Convert Markdown files to HTML directly
# This approach doesn't rely on JavaScript to render markdown

MD_DIR="/Users/zeeshankhan/ftgn-journalism/public/essays/en"
HTML_DIR="/Users/zeeshankhan/ftgn-journalism/public/essays/html"

# Create HTML directory if it doesn't exist
mkdir -p "$HTML_DIR"

# Check for pandoc
if ! command -v pandoc &> /dev/null; then
    echo "Pandoc is required but not installed. Please install pandoc first."
    exit 1
fi

# Process each markdown file
for md_file in "$MD_DIR"/*.md; do
    filename=$(basename "$md_file")
    html_filename="${filename%.md}.html"
    
    # Get the title from markdown
    title=$(head -n 1 "$md_file" | sed 's/^# //')
    
    # Create HTML file
    echo "Converting $filename to HTML..."
    
    # Create a temporary file for the HTML content
    temp_file=$(mktemp)
    
    # Convert markdown to HTML using pandoc
    pandoc "$md_file" -o "$temp_file" --standalone --metadata title="$title - Against The Tide"
    
    # Create the final HTML file with the site template
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
            <div class="essay-article">
                $(cat "$temp_file")
            </div>
            
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
    
    # Remove temporary file
    rm "$temp_file"
    
    echo "Created HTML for $filename"
done

echo "All markdown files converted to HTML successfully"