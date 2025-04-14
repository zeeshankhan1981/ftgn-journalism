// Markdown viewer script for Against The Tide
document.addEventListener('DOMContentLoaded', function() {
    // Only run this script if we're viewing a markdown file
    if (window.location.pathname.endsWith('.md')) {
        loadMarkdownViewer();
    }
});

function loadMarkdownViewer() {
    // First, load the required library
    const markedScript = document.createElement('script');
    markedScript.src = 'https://cdn.jsdelivr.net/npm/marked@4.3.0/marked.min.js';
    document.head.appendChild(markedScript);
    
    markedScript.onload = function() {
        // Configure marked.js with better rendering options
        marked.use({
            gfm: true,
            breaks: true,
            pedantic: false,
            headerIds: true,
            mangle: false,
            smartypants: true
        });
        
        // Fetch the raw markdown
        fetch(window.location.pathname)
            .then(response => response.text())
            .then(markdown => {
                // Create the basic page structure
                document.body.innerHTML = `
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
                            <div id="rendered-markdown"></div>
                            
                            <div class="essay-navigation">
                                <a href="/#essays" class="back-to-essays">← Back to Essays</a>
                            </div>
                        </main>

                        <footer>
                            <p>&copy; 2025 Against The Tide · All rights reserved</p>
                            <p>Curated by TorchScribe</p>
                        </footer>
                    </div>
                `;
                
                // Extract title and metadata
                let title = '';
                let location = '';
                let year = '';
                let theme = 'civilian'; // Default theme
                
                // Try to extract title and location/year from first line
                // Example: "# Rouen, France – April 1944"
                const titleMatch = markdown.match(/^#\s+(.+)$/m);
                if (titleMatch && titleMatch[1]) {
                    const fullTitle = titleMatch[1];
                    
                    // Set document title
                    document.title = fullTitle + " - Against The Tide";
                    
                    // Extract location and year
                    const yearMatch = fullTitle.match(/(\d{4})/);
                    if (yearMatch) {
                        year = yearMatch[1];
                        
                        // Get location (everything before the year)
                        const beforeYear = fullTitle.split(year)[0].trim();
                        if (beforeYear) {
                            // Clean up the location
                            location = beforeYear.replace(/[,–\-—]\s*$/, ''); // Remove trailing punctuation
                        }
                    }
                    
                    // Set title without year for cleaner display
                    title = location ? location : fullTitle;
                }
                
                // Enhanced metadata with better styling
                let metadataHtml = '';
                if (location || year) {
                    metadataHtml = `
                        <div class="metadata">
                            ${location ? `<p><strong>Location:</strong> ${location}</p>` : ''}
                            ${year ? `<p><strong>Year:</strong> ${year}</p>` : ''}
                            <p><strong>Theme:</strong> ${theme}</p>
                        </div>
                    `;
                }
                
                // Create styled title
                let titleHtml = title ? `<h1>${title}</h1>` : '';
                
                // Remove the first h1 line to avoid duplication
                const contentWithoutFirstTitle = markdown.replace(/^#\s+.+$\n+/m, '');
                
                // Format source links specially
                let processedMarkdown = contentWithoutFirstTitle;
                
                // Make sure bold text (like Source) is properly rendered
                processedMarkdown = processedMarkdown.replace(/\*\*Source:\*\*/g, '<strong class="source-label">Source:</strong>');
                
                // Parse the markdown with better spacing and typography
                const parsedMarkdown = marked.parse(processedMarkdown);
                
                // Add custom class to the last paragraph (source link)
                const enhancedContent = parsedMarkdown.replace(
                    /<p><strong class="source-label">Source:<\/strong>(.+?)<\/p>$/s, 
                    '<p class="source-citation"><strong class="source-label">Source:</strong>$1</p>'
                );
                
                const renderedContent = `
                    ${titleHtml}
                    ${metadataHtml}
                    <article class="essay-article">
                        ${enhancedContent}
                    </article>
                `;
                
                document.getElementById('rendered-markdown').innerHTML = renderedContent;
                
                // Add styling for source links
                const sourceLinks = document.querySelectorAll('a[href^="http"]');
                sourceLinks.forEach(link => {
                    link.setAttribute('target', '_blank');
                    link.setAttribute('rel', 'noopener noreferrer');
                });
                
                // Load the CSS
                const cssLink = document.createElement('link');
                cssLink.rel = 'stylesheet';
                cssLink.href = '/css/style.css';
                document.head.appendChild(cssLink);
                
                // Fonts
                const fontLink = document.createElement('link');
                fontLink.rel = 'stylesheet';
                fontLink.href = 'https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=JetBrains+Mono:wght@400;700&display=swap';
                document.head.appendChild(fontLink);
                
                // Initialize the theme
                initializeTheme();
                
                // Add keyboard navigation
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
            })
            .catch(error => console.error('Error loading markdown:', error));
    };
}

// Initialize theme toggle functionality
function initializeTheme() {
    // Apply the theme
    function setTheme(theme) {
        document.documentElement.setAttribute('data-theme', theme);
        localStorage.setItem('theme', theme);
    }
    
    // Get current theme
    function getThemePreference() {
        if (localStorage.getItem('theme')) {
            return localStorage.getItem('theme');
        }
        return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
    }
    
    // Set initial theme
    setTheme(getThemePreference());
    
    // Add event listener to theme toggle
    setTimeout(() => {
        const themeToggle = document.getElementById('theme-toggle');
        if (themeToggle) {
            themeToggle.addEventListener('click', () => {
                const currentTheme = document.documentElement.getAttribute('data-theme');
                const newTheme = currentTheme === 'dark' ? 'light' : 'dark';
                setTheme(newTheme);
            });
        }
    }, 100);
}