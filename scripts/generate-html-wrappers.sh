#!/bin/bash

# This script generates HTML wrappers for all markdown files

MD_DIR="/Users/zeeshankhan/ftgn-journalism/public/essays/en"
HTML_DIR="/Users/zeeshankhan/ftgn-journalism/public/essays/html"

# Create HTML directory if it doesn't exist
mkdir -p "$HTML_DIR"

# Process each markdown file
for md_file in "$MD_DIR"/*.md; do
    filename=$(basename "$md_file")
    html_filename="${filename%.md}.html"
    
    # Get the relative path to the markdown file
    md_relative_path="en/${filename}"
    
    # Create HTML wrapper
    cat > "$HTML_DIR/$html_filename" << EOL
<!DOCTYPE html>
<html lang="en" data-theme="light">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Against The Tide</title>
    
    <!-- SEO Meta Tags -->
    <meta name="description" content="A series of fact-based civilian experiences under U.S. military bombardment">
    <meta name="keywords" content="journalism, civilian, military, bombardment, essays, history">
    <meta name="author" content="TorchScribe">
    
    <!-- Open Graph / Social Media -->
    <meta property="og:type" content="article">
    <meta property="og:title" content="Against The Tide">
    <meta property="og:description" content="A series of fact-based civilian experiences under U.S. military bombardment">
    <meta property="og:url" content="https://torchscribe.com/">
    
    <!-- Fonts and Styles -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    
    <!-- Favicon -->
    <link rel="icon" type="image/svg+xml" href="/img/favicon.svg">
    <link rel="icon" type="image/png" href="/img/favicon.png">
    
    <!-- Markdown Parser -->
    <script src="/js/md-parser.js"></script>
</head>
<body>
    <div class="container">
        <header>
            <div class="logo">Against <span>The</span> Tide</div>
            <nav>
                <a href="/">Home</a>
                <a href="/#essays">Essays</a>
                <button id="theme-toggle" aria-label="Toggle dark mode">
                    <span class="theme-toggle-icon">◐</span>
                </button>
            </nav>
        </header>

        <main class="essay-content markdown-content">
            <div id="loading" class="loading">
                <span class="loading-text">Loading essay...</span>
            </div>
            
            <div id="content" data-markdown-path="/essays/${md_relative_path}"></div>
            
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
            const themeToggle = document.getElementById('theme-toggle');
            
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
            themeToggle.addEventListener('click', () => {
                const currentTheme = document.documentElement.getAttribute('data-theme');
                const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
                
                setTheme(newTheme);
            });
            
            // Keyboard navigation
            document.addEventListener('keydown', (e) => {
                // Alt+S focuses search
                if (e.altKey && e.key === 's') {
                    e.preventDefault();
                    window.location.href = '/#essays';
                }
                
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
    
    echo "Created HTML wrapper for $filename"
done

echo "All HTML wrappers generated successfully"