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

3. **ox-hugo** package for Org to Hugo markdown export
   - Add to your Doom Emacs config in `~/.doom.d/packages.el`:
   ```elisp
   (package! ox-hugo)
   ```
   - Run `doom sync` to install the package

## Project Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/ftgn-journalism.git
   cd ftgn-journalism
   ```

2. **Convert existing content** (if needed)
   ```bash
   # Convert markdown to Hugo format
   ./scripts/convert-md-to-hugo.sh
   
   # Convert markdown to Org format
   ./scripts/setup-org-workflow.sh
   ```

3. **Start Hugo server for development**
   ```bash
   ./scripts/hugo-server.sh
   # or
   make serve
   ```
   This starts a development server at http://localhost:1313/

## Workflow

### Content Creation

1. **Create or edit Org files** in the `content-org/essays/` directory using Emacs
2. **Export to Hugo markdown** using ox-hugo in Emacs
   - Open the Org file in Emacs
   - Press `C-c C-e` to open the export menu
   - Select `H H` for Hugo export
   - Or modify directly in the Hugo markdown files in `content/essays/`

3. **Preview** your changes using the Hugo development server

### Troubleshooting Common Issues

If your Org file changes aren't appearing in the site:

1. Ensure proper frontmatter in your Org file:
   ```org
   #+TITLE: Essay Title
   #+DATE: YYYY-MM-DD
   #+HUGO_BASE_DIR: ../../
   #+HUGO_SECTION: essays
   #+HUGO_TAGS: tag1 tag2
   #+EXPORT_FILE_NAME: file-name
   #+HUGO_CATEGORIES: category1
   #+HUGO_CUSTOM_FRONT_MATTER: :location "Location" :year "Year"
   ```

2. Manual export fallback:
   - You can directly edit the Hugo markdown files in `content/essays/`
   - Ensure the frontmatter is formatted properly:
   ```yaml
   ---
   title: "Essay Title"
   date: YYYY-MM-DD
   location: "Location"
   year: "Year"
   tags: ["tag1", "tag2"]
   categories: ["category1"]
   ---
   ```

3. Rebuild the site:
   ```bash
   hugo
   # or
   make build-for-upload
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
├── archetypes/         # Content templates
├── config.toml         # Hugo configuration
├── content/            # Hugo content (auto-generated from Org)
├── content-org/        # Org source files
├── layouts/            # Hugo templates
├── static/             # Static assets (CSS, JS, images)
└── public/             # Generated site
```

## Org File Structure

Each essay should be created as an Org file with proper front matter:

```org
#+TITLE: Location Year
#+DATE: YYYY-MM-DD
#+HUGO_BASE_DIR: ../../
#+HUGO_SECTION: essays
#+HUGO_TAGS: tag1 tag2
#+HUGO_CATEGORIES: category
#+EXPORT_FILE_NAME: file-name
#+HUGO_CUSTOM_FRONT_MATTER: :location "Location" :year "Year"

Essay content goes here...

* Sources
:PROPERTIES:
:EXPORT_EXCLUDE: t
:END:

Source citations here...
```

## Scripts

The project includes several helper scripts:

- **hugo-server.sh**: Start Hugo development server
- **convert-md-to-hugo.sh**: Convert markdown to Hugo format
- **setup-org-workflow.sh**: Convert markdown to Org format
- **stop-servers.sh**: Stop any running servers

## Useful Commands

- **Start Hugo server**: `hugo server -D` or `make serve`
- **Build site**: `hugo` or `make build-for-upload`
- **Create new content**: `hugo new essays/title.md`
- **In Emacs**: `C-c C-e H H` (Export Org to Hugo markdown)

## Troubleshooting

- If exports aren't working, ensure ox-hugo is properly installed
- For Hugo server issues, check the Hugo version with `hugo version`
- Clean the build directory with `rm -rf public/` before rebuilding

## Resources

- [Hugo Documentation](https://gohugo.io/documentation/)
- [ox-hugo Documentation](https://ox-hugo.scripter.co/)
- [Doom Emacs Documentation](https://github.com/doomemacs/doomemacs/blob/master/docs/index.org)