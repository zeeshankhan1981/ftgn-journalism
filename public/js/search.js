// Search functionality
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('search-input');
    const essays = document.querySelectorAll('.essay-card');
    const categories = new Set();
    const essaysData = [];

    // Load metadata and create categories
    fetch('/essays/metadata.json')
        .then(response => response.json())
        .then(data => {
            data.forEach(essay => {
                categories.add(essay.theme);
                essaysData.push({
                    title: essay.title,
                    content: essay.title.toLowerCase(),
                    element: document.querySelector(`[data-title="${essay.title}"]`)
                });
            });

            // Create category filters
            const categoryFilter = document.createElement('div');
            categoryFilter.className = 'category-filter';
            categoryFilter.innerHTML = `
                <h3>Filter by Theme</h3>
                <div class="filters">
                    ${[...categories].map(cat => `
                        <button class="filter-btn" data-category="${cat}">${cat}</button>
                    `).join('')}
                </div>
            `;
            document.querySelector('.filters-container').appendChild(categoryFilter);

            // Add event listeners for category filters
            document.querySelectorAll('.filter-btn').forEach(button => {
                button.addEventListener('click', () => {
                    const category = button.dataset.category;
                    essays.forEach(essay => {
                        const card = essay.closest('.essay-card');
                        if (card.dataset.theme === category || category === 'all') {
                            card.style.display = 'block';
                        } else {
                            card.style.display = 'none';
                        }
                    });
                });
            });
        });

    // Search functionality
    searchInput.addEventListener('input', function(e) {
        const searchTerm = e.target.value.toLowerCase();
        essays.forEach(essay => {
            const title = essay.querySelector('h2').textContent.toLowerCase();
            const content = essay.querySelector('p').textContent.toLowerCase();
            if (title.includes(searchTerm) || content.includes(searchTerm)) {
                essay.style.display = 'block';
            } else {
                essay.style.display = 'none';
            }
        });
    });

    // Add smooth scrolling for anchor links
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({
                behavior: 'smooth'
            });
        });
    });
});
