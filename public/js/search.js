// Search functionality
document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.getElementById('search-input');
    const essaysList = document.querySelector('.essays-list');
    const filtersContainer = document.querySelector('.filters-container');

    let essays = [];
    let categories = new Set();
    let activeFilter = null;
    
    // Current sort state
    let currentSort = {
        column: 'year',  // Default sort by year
        ascending: true  // Default ascending order
    };

    // Load essays metadata
    fetch('/essays/metadata.json')
        .then(response => response.json())
        .then(data => {
            // Handle both array and object formats
            essays = Array.isArray(data) ? data : (data.essays || []);
            
            console.log("Loaded essays:", essays);
            
            // Extract unique categories
            essays.forEach(essay => {
                if (essay.theme) {
                    categories.add(essay.theme);
                }
            });

            // Create category filters
            const filterAll = document.createElement('button');
            filterAll.className = 'category-filter active';
            filterAll.textContent = 'All';
            filterAll.onclick = () => {
                resetActiveFilter(filterAll);
                displayEssays(essays);
            };
            filtersContainer.appendChild(filterAll);
            
            // Set initial active filter
            activeFilter = filterAll;

            // Add remaining category filters
            Array.from(categories).sort().forEach(category => {
                const filter = document.createElement('button');
                filter.className = 'category-filter';
                filter.textContent = category;
                filter.onclick = () => {
                    resetActiveFilter(filter);
                    filterEssays(category);
                };
                filtersContainer.appendChild(filter);
            });

            // Display all essays initially
            displayEssays(essays);
        })
        .catch(error => {
            console.error('Error loading metadata:', error);
            // Try alternative path
            fetch('/public/essays/metadata.json')
                .then(response => response.json())
                .then(data => {
                    essays = Array.isArray(data) ? data : (data.essays || []);
                    displayEssays(essays);
                })
                .catch(altError => console.error('Alternative path failed too:', altError));
        });

    // Search functionality
    searchInput.addEventListener('input', (e) => {
        const query = e.target.value.toLowerCase();
        const filteredEssays = essays.filter(essay => 
            (essay.title && essay.title.toLowerCase().includes(query)) ||
            (essay.location && essay.location.toLowerCase().includes(query)) ||
            (essay.year && essay.year.toString().includes(query)) ||
            (essay.theme && essay.theme.toLowerCase().includes(query))
        );
        displayEssays(filteredEssays);
        
        // Reset active filter when searching
        if (query.length > 0) {
            resetActiveFilter(null);
        } else if (activeFilter) {
            resetActiveFilter(activeFilter);
        }
    });

    // Reset active filter
    function resetActiveFilter(newActive) {
        if (activeFilter) {
            activeFilter.classList.remove('active');
        }
        
        activeFilter = newActive;
        
        if (activeFilter) {
            activeFilter.classList.add('active');
        }
    }

    // Filter by category
    function filterEssays(category) {
        const filteredEssays = essays.filter(essay => 
            essay.theme === category
        );
        displayEssays(filteredEssays);
    }

    // Sort essays based on current sort state
    function sortEssays(essays, sortBy, ascending) {
        return [...essays].sort((a, b) => {
            let valueA, valueB;
            
            // Get the values to compare based on sortBy column
            switch(sortBy) {
                case 'title':
                    valueA = a.title || '';
                    valueB = b.title || '';
                    break;
                case 'location':
                    valueA = a.location || '';
                    valueB = b.location || '';
                    break;
                case 'year':
                    valueA = typeof a.year === 'string' ? parseInt(a.year) : a.year;
                    valueB = typeof b.year === 'string' ? parseInt(b.year) : b.year;
                    break;
                case 'theme':
                    valueA = a.theme || '';
                    valueB = b.theme || '';
                    break;
                default:
                    valueA = a.year || 0;
                    valueB = b.year || 0;
            }
            
            // Sort based on values and direction
            if (sortBy === 'year') {
                // Numeric sort for years
                return ascending ? valueA - valueB : valueB - valueA;
            } else {
                // String sort for other columns
                return ascending 
                    ? valueA.toString().localeCompare(valueB.toString()) 
                    : valueB.toString().localeCompare(valueA.toString());
            }
        });
    }
    
    // Display essays in list view
    function displayEssays(essaysToDisplay) {
        essaysList.innerHTML = '';
        
        if (!essaysToDisplay || essaysToDisplay.length === 0) {
            const noResults = document.createElement('div');
            noResults.className = 'no-results';
            noResults.textContent = 'No essays found matching your search criteria.';
            essaysList.appendChild(noResults);
            return;
        }
        
        // Create the table container
        const table = document.createElement('table');
        table.className = 'essays-table';
        
        // Create table header with sort functionality
        const thead = document.createElement('thead');
        const headerRow = document.createElement('tr');
        
        // Column definitions with sort capabilities
        const columns = [
            { name: 'title', label: 'Title' },
            { name: 'location', label: 'Location' },
            { name: 'year', label: 'Year' },
            { name: 'theme', label: 'Theme' },
            { name: 'action', label: '', sortable: false }
        ];
        
        // Create header cells with sort indicators
        columns.forEach(column => {
            const th = document.createElement('th');
            
            if (column.sortable !== false) {
                th.innerHTML = `${column.label} <span class="sort-indicator">${
                    currentSort.column === column.name 
                        ? (currentSort.ascending ? '↑' : '↓') 
                        : ''
                }</span>`;
                
                th.addEventListener('click', () => {
                    // Update sort state
                    if (currentSort.column === column.name) {
                        // Toggle sort direction if same column
                        currentSort.ascending = !currentSort.ascending;
                    } else {
                        // Set new sort column
                        currentSort.column = column.name;
                        currentSort.ascending = true;
                    }
                    
                    // Re-display with new sort
                    displayEssays(essaysToDisplay);
                });
                
                th.style.cursor = 'pointer';
                th.title = `Sort by ${column.label}`;
            } else {
                th.textContent = column.label;
            }
            
            headerRow.appendChild(th);
        });
        
        thead.appendChild(headerRow);
        table.appendChild(thead);
        
        // Create table body with sorted data
        const tbody = document.createElement('tbody');
        
        // Apply current sort
        const sortedEssays = sortEssays(
            essaysToDisplay, 
            currentSort.column, 
            currentSort.ascending
        );
        
        sortedEssays.forEach(essay => {
            const row = document.createElement('tr');
            
            // Direct link to the markdown file
            const essayLink = `/essays/en/${essay.filename}`;
            
            row.innerHTML = `
                <td class="essay-title">${essay.title}</td>
                <td>${essay.location}</td>
                <td>${essay.year}</td>
                <td>${essay.theme || 'Unspecified'}</td>
                <td><a href="${essayLink}" class="read-link">Read →</a></td>
            `;
            tbody.appendChild(row);
        });
        
        table.appendChild(tbody);
        essaysList.appendChild(table);
    }

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