/**
 * Markdown parser for Against The Tide
 * This script parses and renders markdown content with proper styling
 */

document.addEventListener('DOMContentLoaded', function() {
    const contentElement = document.getElementById('content');
    const markdownPath = contentElement.getAttribute('data-markdown-path');
    
    if (markdownPath) {
        loadMarkdown(markdownPath);
    }
});

function loadMarkdown(path) {
    // Create loading indicator
    const loadingElement = document.getElementById('loading');
    
    // Load marked.js library dynamically
    const script = document.createElement('script');
    script.src = 'https://cdn.jsdelivr.net/npm/marked@4.3.0/marked.min.js';
    script.onload = function() {
        // Configure marked.js
        marked.use({
            gfm: true,
            breaks: true,
            smartLists: true,
            smartypants: true
        });
        
        // Fetch the markdown file
        fetch(path)
            .then(response => {
                if (!response.ok) {
                    throw new Error('Failed to load markdown file');
                }
                return response.text();
            })
            .then(markdown => {
                // Process and render the markdown
                renderMarkdown(markdown);
                if (loadingElement) {
                    loadingElement.style.display = 'none';
                }
            })
            .catch(error => {
                console.error('Error loading markdown:', error);
                document.getElementById('content').innerHTML = `
                    <div class="error-message">
                        <h2>Error Loading Content</h2>
                        <p>Sorry, we couldn't load the requested essay. Please try again later.</p>
                        <p><a href="/">← Return to Home</a></p>
                    </div>
                `;
                if (loadingElement) {
                    loadingElement.style.display = 'none';
                }
            });
    };
    
    document.head.appendChild(script);
}

function renderMarkdown(markdown) {
    const contentElement = document.getElementById('content');
    
    // Extract title and metadata
    let title = '';
    let location = '';
    let year = '';
    
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
                <p><strong>Theme:</strong> civilian</p>
            </div>
        `;
    }
    
    // Create styled title
    let titleHtml = title ? `<h1>${title}</h1>` : '';
    
    // Process the markdown to handle the content better
    
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
    
    // Combine everything into the final HTML
    contentElement.innerHTML = `
        ${titleHtml}
        ${metadataHtml}
        <article class="essay-article">
            ${enhancedContent}
        </article>
    `;
    
    // Add styling for source links
    const sourceLinks = document.querySelectorAll('a[href^="http"]');
    sourceLinks.forEach(link => {
        link.setAttribute('target', '_blank');
        link.setAttribute('rel', 'noopener noreferrer');
    });
}