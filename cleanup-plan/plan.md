# Cleanup Plan for ftgn-journalism

## Files/Directories to Remove

1. **Duplicate and legacy content**
   - `about.html` (now handled by Hugo via `content/about.md`)
   - `public/essays/en` directory (migrated to Hugo content structure)
   - `public/essays/html` directory (replaced by Hugo generated content)
   - `public/essays/metadata.json` (metadata now in frontmatter)
   - `src/templates/` directory (replaced by Hugo templates in layouts/)
   - `content-org/example.org` (just an example file)
   - `content-org/essays/example-essay.org` (just an example file)
   - `CLAUDE.md` (just a reminder file)

2. **Legacy scripts**
   - `scripts/fix-converter.sh`
   - `scripts/generate-html-wrappers.sh`
   - `scripts/md-to-html.sh` 
   - `scripts/process-markdown.sh`
   - `scripts/restore-markdown.sh`
   - `scripts/simple-converter.sh`
   - `scripts/simple-md-to-html.sh`
   - `scripts/start-server.sh` (replaced by hugo-server.sh)

## Essential Files/Directories to Keep

1. **Content**
   - `content-org/essays/` - Source Org mode files (for editing in Emacs)
   - `content/` - Hugo content files (generated from Org)
   
2. **Hugo Structure**
   - `config.toml` - Hugo configuration
   - `archetypes/` - Templates for new content
   - `layouts/` - HTML templates
   - `static/` - Static assets (CSS, JS, images)
   - `public/` - Generated site (what gets uploaded)

3. **Scripts**
   - `scripts/hugo-server.sh` - Start Hugo development server
   - `scripts/setup-org-workflow.sh` - Convert markdown to Org if needed
   - `scripts/convert-md-to-hugo.sh` - Convert markdown to Hugo if needed
   - `scripts/stop-servers.sh` - Stop any running servers

4. **Documentation**
   - `README.md` - Project overview
   - `SETUP.md` - Installation instructions
   - `Makefile` - Build commands
   - `LICENSE` - Project license

## Simplified Structure

After cleanup, the directory structure will be:

```
ftgn-journalism/
├── archetypes/         # Content templates
├── config.toml         # Hugo configuration
├── content/            # Hugo content (auto-generated from Org)
├── content-org/        # Org source files for editing
│   └── essays/         # Org essays
├── layouts/            # Hugo templates
├── Makefile            # Build commands
├── public/             # Generated site (for upload)
├── README.md           # Documentation
├── scripts/            # Essential scripts only
│   ├── convert-md-to-hugo.sh
│   ├── hugo-server.sh
│   ├── setup-org-workflow.sh
│   └── stop-servers.sh
├── SETUP.md            # Installation guide
├── static/             # Static assets
└── LICENSE             # License file
```

This structure is much cleaner and focuses only on what's needed for the Hugo + Org workflow.