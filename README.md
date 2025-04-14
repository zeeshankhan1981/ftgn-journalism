# Against The Tide

A series of fact-based civilian experience essays documenting U.S. military bombardments.

## Overview

Against The Tide is a collection of 250-word essays documenting civilian experiences during U.S. military bombardments. This project provides fact-based, compassionate journalism that focuses on the human impact of warfare.

## Features

- **Markdown-based content**: All essays are stored as simple Markdown files
- **Modern, responsive design**: Typewriter-inspired, minimalist presentation 
- **Dark mode support**: Toggle between light/dark themes
- **Keyboard navigation**: Quick access with keyboard shortcuts
- **Sortable list view**: Sort essays by title, location, year, or theme
- **Print-friendly styling**: Well-formatted printed output

## Directory Structure

- `essays/` - All 250-word essays in Markdown format
- `public/` - Generated website files
- `src/` - Template files for site generation
- `scripts/` - Helper scripts for development

## Usage

### Local Development

```bash
# Start local server (builds site and opens in browser)
./scripts/start-server.sh

# Stop any running servers
./scripts/stop-servers.sh
```

### Content Management

Edit essay files in the `essays/en/` directory using any text editor (Emacs Doom recommended).

### Deployment

```bash
# Generate files for torchscribe.com
make build-for-upload

# Then upload the contents of the 'public' directory to your web host
# using your preferred file transfer method (FTP, SFTP, etc.)
```

## Keyboard Shortcuts

- `Alt+S`: Focus search box
- `Alt+A`: Go to About page
- `Alt+Home`: Go to Home page
- `Alt+E`: Return to essays list from an essay
- `Print`: `Ctrl+P`/`⌘+P` (printer-friendly styling included)

## License

© 2025 TorchScribe. All rights reserved.
EOF < /dev/null