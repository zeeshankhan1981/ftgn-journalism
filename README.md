# Against The Tide

A series of fact-based civilian experience essays documenting U.S. military bombardments.

## Overview

Against The Tide is a collection of 250-word essays documenting civilian experiences during U.S. military bombardments. This project provides fact-based, compassionate journalism that focuses on the human impact of warfare.

## Features

- **Org-mode content**: Essays are written in Emacs Org mode
- **Hugo-powered site**: Fast, modern static site generation
- **Modern, responsive design**: Typewriter-inspired, minimalist presentation 
- **Dark mode support**: Toggle between light/dark themes
- **Keyboard navigation**: Quick access with keyboard shortcuts
- **Sortable table view**: Sort essays by title, location, year
- **Print-friendly styling**: Well-formatted printed output

## Directory Structure

- `content-org/` - Original essay content in Org format
- `content/` - Hugo content (auto-generated from Org)
- `public/` - Generated website files
- `layouts/` - Hugo templates for site generation
- `static/` - Static assets (CSS, JS, images)
- `archetypes/` - Content templates for Hugo

## Workflow

### Content Creation

Essays are written in Org mode using Emacs (Doom Emacs recommended) and stored in the `content-org/essays/` directory.

```org
#+TITLE: Location Year
#+DATE: YYYY-MM-DD
#+HUGO_TAGS: tag1 tag2
#+HUGO_CATEGORIES: category
#+HUGO_SECTION: essays
#+HUGO_CUSTOM_FRONT_MATTER: :location "Location" :year "Year"
#+EXPORT_FILE_NAME: file-name

Essay content here...

* Sources
:PROPERTIES:
:EXPORT_EXCLUDE: t
:END:

Source citations here...
```

### Local Development

```bash
# Start Hugo development server
./scripts/hugo-server.sh
# or
make serve

# Stop any running servers
./scripts/stop-servers.sh
```

### Converting Existing Content

Two scripts are provided to help with content conversion:

```bash
# Convert existing markdown to Hugo format
./scripts/convert-md-to-hugo.sh

# Convert existing markdown to Org format
./scripts/setup-org-workflow.sh
```

### Deployment

```bash
# Generate files for torchscribe.com
make build-for-upload

# Then upload the contents of the 'public' directory to your web host
# using your preferred file transfer method (FTP, SFTP, etc.)
```

### New Installation

For setting up on a new machine, see [SETUP.md](SETUP.md) for detailed instructions.

## Keyboard Shortcuts

- `Alt+S`: Focus search box
- `Alt+A`: Go to About page
- `Alt+Home`: Go to Home page
- `Alt+E`: Return to essays list from an essay
- `Print`: `Ctrl+P`/`⌘+P` (printer-friendly styling included)

## License

© 2025 TorchScribe. All rights reserved.