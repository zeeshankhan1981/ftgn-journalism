# ftgn-journalism: Doom Emacs Developer Workflow & Release Guide

## Table of Contents
1. [Getting Started](#getting-started)
2. [Project Structure](#project-structure)
3. [Doom Emacs Usage](#doom-emacs-usage)
4. [Keybindings & Shortcuts](#keybindings--shortcuts)
5. [Git & GitHub Workflow](#git--github-workflow)
6. [Release Cycle](#release-cycle)
7. [Best Practices](#best-practices)
8. [Troubleshooting & Tips](#troubleshooting--tips)

---

## Getting Started

- **Prerequisites:**
  - Emacs 29+ (recommended: 30.1)
  - Doom Emacs (fully installed and configured)
  - Python 3.x
  - Hugo
  - direnv (for environment management)
  - Git (with SSH or HTTPS access to GitHub)

- **First-time setup:**
  - Clone the repo and enter the project directory.
  - Run `direnv allow` to load environment variables and activate the Python venv.

---

## Project Structure

- `archetypes/`, `content/`, `layouts/`, `static/`, `public/` — Hugo directories
- `scripts/` — Custom scripts (Python, shell)
- `venv/` — Python virtual environment (project-local)
- `.doom.d/` — Doom Emacs project config (`init.el`, `config.el`, `packages.el`)
- `.dir-locals.el` — Per-project Emacs settings
- `.envrc` — direnv environment loader
- `Makefile`, `README.md`, `SETUP.md` — Project documentation and automation

---

## Doom Emacs Usage

### Opening the Project

1. Launch Emacs:
   ```sh
   emacs
   ```
2. Press `SPC p p` and select or type the project path to open it.

### Project Navigation
- Use `SPC p f` to fuzzy-find any file.
- Use `SPC /` to search project-wide.
- Use `SPC b b` to switch buffers.

### Running Hugo, Scripts, and Python
- **Hugo server:**  `SPC ! ./scripts/hugo-server.sh` or `SPC ! make serve`
- **Python scripts:**  Open the script, then `SPC m c c` to run, or open a REPL with `SPC m s i`.
- **Shell scripts:**  Open the script and run with `SPC ! ./scripts/<scriptname>.sh`

---

## Keybindings & Shortcuts

| Action                        | Keys           | Context/Notes                  |
|-------------------------------|----------------|-------------------------------|
| Project switch                | SPC p p        | Any buffer                    |
| Find file in project          | SPC p f        | Any buffer                    |
| Search in project             | SPC /          | Any buffer                    |
| Open terminal in project root | SPC '          | Any buffer                    |
| Magit (Git status)            | SPC g g        | Any buffer                    |
| Stage file                    | s              | In Magit status buffer        |
| Commit changes                | c c            | In Magit status buffer        |
| Push to GitHub                | P P            | In Magit status buffer        |
| Pull from GitHub              | F F            | In Magit status buffer        |
| Create Git tag                | t              | In Magit status buffer        |
| View diff                     | d              | In Magit status buffer        |
| Forge issues/PRs              | # or @         | In Magit status buffer        |
| Run shell command             | SPC !          | Any buffer                    |
| Open Python REPL              | SPC m s i      | In Python buffer              |
| Run Python script             | SPC m c c      | In Python buffer              |
| Toggle git-gutter/diff-hl     | M-x git-gutter:toggle | Any buffer           |
| Open Org agenda               | SPC a o a      | Any buffer                    |
| Toggle file tree (treemacs)   | SPC o p        | Any buffer                    |
| Describe keybinding           | SPC h k        | Any buffer                    |

---

## Git & GitHub Workflow

### Daily Git Operations

1. Open Magit with `SPC g g`.
2. Stage files with `s`.
3. Commit with `c c`, write your message, and `C-c C-c` to confirm.
4. Push to GitHub with `P P`.
5. Pull updates with `F F`.

### Pushing to GitHub
- Ensure your SSH agent is running, or be ready to enter HTTPS credentials.
- Use Magit (`SPC g g`) for all Git operations.

### Using Version Tags
- To tag a release:
  1. Open Magit (`SPC g g`).
  2. Press `t` for tagging.
  3. Enter the tag name (e.g., `v1.0.0`).
  4. Push tags with `P P` (Magit will ask if you want to push tags).

### Using Forge for Issues/PRs
- In Magit, press `#` to list issues, `@` for pull requests.
- Authenticate with a GitHub token if prompted.
- You can comment, create, and close issues/PRs directly from Emacs.

---

## Release Cycle

1. Ensure all code is committed and pushed.
2. Bump the version in your documentation, code, or config as needed.
3. Tag the release in Magit (`t` in Magit status).
4. Push the tag (`P P`).
5. Optionally, create a release on GitHub via the web or Forge.
6. Deploy or distribute as needed.

---

## Best Practices

- Always work in a feature branch for new work.
- Use descriptive commit messages.
- Regularly pull from `main` to stay up to date.
- Use Magit for all Git operations for safety and visibility.
- Tag all releases and document changes in `CHANGELOG.md` or similar.
- Use direnv and `.envrc` for secure environment variable management.
- Keep your venv project-local and out of version control (`venv/` in `.gitignore`).

---

## Troubleshooting & Tips

- **Doom Emacs not loading?**  Run `~/.emacs.d/bin/doom sync` and restart Emacs.
- **GitHub push fails?**  Check SSH agent or HTTPS credentials.
- **Magit/Forge not working?**  Ensure you have authenticated with GitHub via Forge.
- **Python environment issues?**  Check that your venv is active (`source venv/bin/activate`) and dependencies are installed.
- **direnv not loading?**  Run `direnv allow` in your project directory.

---

## References

- [Doom Emacs Documentation](https://docs.doomemacs.org/)
- [Magit User Manual](https://magit.vc/manual/magit/)
- [Forge Manual](https://magit.vc/manual/forge/)
- [direnv Documentation](https://direnv.net/)

