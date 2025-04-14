# Against The Tide - Hugo Setup Guide

This document guides you through setting up the Against The Tide project on a new machine.

## Prerequisites

1. **Emacs** with **Doom Emacs** configuration
   - Install Emacs: https://www.gnu.org/software/emacs/
   - Install Doom Emacs: https://github.com/doomemacs/doomemacs

2. **Hugo** (Extended version)
   - MacOS: `brew install hugo`
   - Linux: `sudo snap install hugo --channel=extended`
   - Windows: `choco install hugo-extended`
   - Or download from: https://github.com/gohugoio/hugo/releases

## Project Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/ftgn-journalism.git
   cd ftgn-journalism
   ```

2. **Start Hugo server for development**
   ```bash
   ./scripts/hugo-server.sh
   # or
   make serve
   ```
   This starts a development server at http://localhost:1313/

## Workflow

### Content Creation

1. **Edit Org files** directly in the `content/essays/` directory using Emacs
2. **Preview** your changes using the Hugo development server

The workflow is simplified - you don't need to export Org files to markdown. Hugo directly renders the Org files.

### Creating New Content

1. **Create a new Org file** in `content/essays/` directory
   - Follow the naming pattern: `XX-XX-Name-Year.org`
   - Include the required headers

   ```org
   #+TITLE: Location Year
   #+DATE: YYYY-MM-DD
   #+AUTHOR: TorchScribe
   #+HUGO_TAGS: tag1 tag2
   #+HUGO_CATEGORIES: category
   #+HUGO_CUSTOM_FRONT_MATTER: :location "Location" :year "Year"

   Essay content here...
   ```

### Publishing

1. **Build the site**
   ```bash
   hugo
   # or
   make build-for-upload
   ```
   This generates the static site in the `public/` directory

2. **Upload** the contents of the `public/` directory to your web host

## Project Structure

```
.
├── .doom.d/          # Doom Emacs configuration
├── .github/          # GitHub workflows and configurations
├── archetypes/       # Hugo content templates
│   └── default.md    # Default template for new content
├── cleanup-plan/     # Cleanup strategy documentation
├── config.toml       # Hugo configuration
├── content/          # Main content directory
│   ├── about.org     # About page content
│   └── essays/       # Essay files in Org format
│       ├── XX-XX-Name-Year.org
│       └── ...
├── layouts/          # Hugo templates
│   ├── _default/    # Default templates
│   │   ├── baseof.html
│   │   ├── list.html
│   │   └── single.html
│   └── partials/    # Reusable template components
│       ├── footer.html
│       ├── header.html
│       ├── nav.html
│       └── search.html
├── public/           # Generated site (for upload)
├── scripts/          # Helper scripts
│   ├── hugo-server.sh    # Start Hugo development server
│   ├── org-mode-setup.sh # Set up Org mode workflow
│   ├── stop-servers.sh   # Stop running servers
│   └── ...
├── src/              # Source code directory
├── static/           # Static assets
│   ├── css/         # Stylesheets
│   ├── js/          # JavaScript files
│   └── images/      # Static images
└── venv/            # Python virtual environment
```

## Scripts and Development Tools

The project includes several helper scripts and development tools:

### Development Scripts

- **hugo-server.sh**: Start Hugo development server with hot reloading
  - Usage: `./scripts/hugo-server.sh`
  - Features: Auto-reloads when content changes, provides detailed error messages

- **stop-servers.sh**: Safely stop any running Hugo servers
  - Usage: `./scripts/stop-servers.sh`
  - Features: Gracefully shuts down servers, cleans up temporary files

- **org-mode-setup.sh**: Set up Org mode workflow
  - Usage: `./scripts/org-mode-setup.sh`
  - Features: Configures Org mode for Hugo integration, sets up custom export settings

### Development Environment

1. **Emacs Configuration**
   - Doom Emacs is required for optimal development experience
   - Custom configuration in [.doom.d](cci:7://file:///Users/zeeshankhan/ftgn-journalism/.doom.d:0:0-0:0) directory
   - Includes specialized keybindings for Hugo workflow

2. **Python Environment**
   - Python virtual environment in `venv/` directory
   - Used for running Hugo and other development tools
   - Activate with: `source venv/bin/activate`

### Development Workflow

1. **Initial Setup**
   ```bash
   # Create and activate virtual environment
   python -m venv venv
   source venv/bin/activate
   
   # Install Hugo
   pip install hugo
   ```

2. **Starting Development**
   ```bash
   # Start development server
   ./scripts/hugo-server.sh
   
   # In another terminal, edit content
   emacs content/essays/your-essay.org
   ```

3. **Stopping Development**
   ```bash
   # Stop servers
   ./scripts/stop-servers.sh
   
   # Deactivate virtual environment
   deactivate
   ```

## Development Commands

### Hugo Commands

- **Development Server**
  ```bash
  # Start development server with drafts
  hugo server -D
  
  # Start with custom port
  hugo server -D --port 1314
  ```

- **Building Site**
  ```bash
  # Basic build
  hugo
  
  # Build with drafts
  hugo -D
  
  # Clean build
  hugo --cleanDestinationDir
  ```

### Make Commands

- **Basic Commands**
  ```bash
  # Start development server
  make serve
  
  # Build site for production
  make build-for-upload
  
  # Clean build directory
  make clean
  ```

- **Advanced Commands**
  ```bash
  # Build with specific theme
  make build THEME=your-theme
  
  # Build with custom base URL
  make build BASEURL="https://your-site.com"
  ```

## Troubleshooting

- For Hugo server issues, check the Hugo version with `hugo version`
- Clean the build directory with `rm -rf public/` before rebuilding
- If Org files aren't rendering correctly, ensure your Hugo version is 0.93.0 or later

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Org Mode Support](https://ox-hugo.scripter.co/)
- [Doom Emacs Documentation](https://github.com/doomemacs/doomemacs/blob/master/docs/index.org)