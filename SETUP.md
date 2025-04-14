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
├── archetypes/       # Content templates
├── config.toml       # Hugo configuration
├── content/          # Org content files
│   └── essays/       # Essay files in Org format
├── layouts/          # Hugo templates
├── Makefile          # Build commands
├── public/           # Generated site (for upload)
├── README.md         # Documentation
├── scripts/          # Helper scripts
├── SETUP.md          # This guide
└── static/           # Static assets (CSS, JS, etc)
```

## Scripts

The project includes several helper scripts:

- **hugo-server.sh**: Start Hugo development server
- **org-mode-setup.sh**: Set up Org mode workflow if needed
- **stop-servers.sh**: Stop any running servers

## Useful Commands

- **Start Hugo server**: `hugo server -D` or `make serve`
- **Build site**: `hugo` or `make build-for-upload`
- **Create new content**: Create a new .org file in content/essays/

## Troubleshooting

- For Hugo server issues, check the Hugo version with `hugo version`
- Clean the build directory with `rm -rf public/` before rebuilding
- If Org files aren't rendering correctly, ensure your Hugo version is 0.93.0 or later

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [Hugo Org Mode Support](https://ox-hugo.scripter.co/)
- [Doom Emacs Documentation](https://github.com/doomemacs/doomemacs/blob/master/docs/index.org)