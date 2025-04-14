# Against The Tide

A series of fact-based civilian experience essays documenting U.S. military bombardments.

## Overview

Against The Tide is a collection of 250-word essays documenting civilian experiences during U.S. military bombardments. This project provides fact-based, compassionate journalism that focuses on the human impact of warfare.

## Features

### Content Management
- **Org-mode integration**: Essays written directly in Emacs Org mode
- **Direct Hugo rendering**: No need for intermediate export steps
- **Version control**: Git integration for content history
- **Metadata management**: Comprehensive front matter for essays

### User Experience
- **Responsive design**: Optimized for all devices
- **Dark/light mode**: Theme toggle for reading comfort
- **Keyboard shortcuts**: Enhanced navigation
- **Table view**: Sortable and filterable essay list
- **Print optimization**: Professional formatting for printed output
- **Search functionality**: Quick content discovery
- **Navigation**: Intuitive site structure

### Technical Features
- **Static site generation**: Hugo-powered architecture
- **Custom templates**: Tailored layouts for essays
- **Asset optimization**: Efficient handling of static resources
- **Performance optimization**: Fast loading and minimal resource usage
- **SEO optimization**: Search engine friendly
- **Accessibility**: WCAG compliance
- **Security**: Protected content delivery

## Project Structure

### Core Directories

- `content/` - Main content directory
  - `essays/` - Essay files in Org format
  - `about.org` - About page content

- `layouts/` - Hugo templates
  - `_default/` - Base templates
  - `partials/` - Reusable components

- `static/` - Static assets
  - `css/` - Stylesheets
  - `js/` - JavaScript files
  - `images/` - Static images

### Development Directories

- `archetypes/` - Content templates
- `src/` - Source code
- `.doom.d/` - Emacs configuration
- `venv/` - Python virtual environment

### Build and Deployment

- `public/` - Generated website files
- `cleanup-plan/` - Cleanup strategy documentation
- `.github/` - GitHub workflows

## Development Workflow

### Content Creation

1. **Essay Structure**
   ```org
   #+TITLE: Location Year
   #+DATE: YYYY-MM-DD
   #+AUTHOR: TorchScribe
   #+HUGO_TAGS: tag1 tag2
   #+HUGO_CATEGORIES: category
   #+HUGO_CUSTOM_FRONT_MATTER: :location "Location" :year "Year"
   
   Essay content here...
   ```

2. **File Naming Convention**
   - Format: `XX-XX-Name-Year.org`
   - Location: `content/essays/`
   - Required metadata: title, date, author, tags, categories, location, year

### Local Development

1. **Start Development Server**
   ```bash
   # Option 1: Using script
   ./scripts/hugo-server.sh
   
   # Option 2: Using Make
   make serve
   ```

2. **Development Features**
   - Hot reloading for content changes
   - Detailed error reporting
   - Draft preview capability
   - Theme preview

### Deployment Process

1. **Build Site**
   ```bash
   # Basic build
   make build-for-upload
   
   # Clean build
   make build THEME=your-theme BASEURL="https://your-site.com"
   ```

2. **Upload Process**
   - Transfer contents of `public/` directory
   - Verify static assets are included
   - Check for broken links
   - Validate HTML output

### Environment Setup

1. **Python Environment**
   ```bash
   python -m venv venv
   source venv/bin/activate
   pip install hugo
   ```

2. **Emacs Configuration**
   - Install Doom Emacs
   - Configure [.doom.d](cci:7://file:///Users/zeeshankhan/ftgn-journalism/.doom.d:0:0-0:0)
   - Set up Org mode integration
   - Customize keybindings for Hugo workflow

## User Interface

### Keyboard Navigation

- `Alt+S`: Focus search box
- `Alt+A`: Go to About page
- `Alt+Home`: Go to Home page
- `Alt+E`: Return to essays list from an essay
- `Print`: `Ctrl+P`/`⌘+P` (printer-friendly styling)

### Theme Switching

- `Dark/Light`: Toggle between themes
- `Print Preview`: View print layout
- `Table View`: Toggle essay list view

### Accessibility Features

- Screen reader support
- Keyboard-only navigation
- High contrast mode
- Text size adjustment
- Color contrast optimization

## License

© 2025 TorchScribe. All rights reserved.