# Tailwind CSS Setup Documentation

This document details how Tailwind CSS was integrated into the "Against The Tide" Hugo project, including all relevant versions, configuration steps, and troubleshooting notes.

---

## Tailwind Setup Overview

- **CSS Framework:** Tailwind CSS
- **Integration Method:** Standalone CLI binary (not via npm or Hugo asset pipeline)
- **Project Type:** Hugo static site generator (with Org-mode content)
- **Date of Setup:** April 2025

---

## Versions Used

- **Tailwind CSS:** v4.1.4 (standalone binary)
- **PostCSS:** ^8.5.3 (npm, not used in final setup)
- **Autoprefixer:** ^10.4.21 (npm, not used in final setup)
- **Node.js & npm:** (see `node -v` and `npm -v` for your system)
- **Hugo:** v0.146.3+extended

---

## Step-by-Step Integration

### 1. Initial Attempt (npm/Hugo Asset Pipeline)
- Installed Tailwind, PostCSS, and Autoprefixer via npm as devDependencies.
- Created `assets/css/tailwind.css` with Tailwind directives:
  ```css
  @tailwind base;
  @tailwind components;
  @tailwind utilities;
  ```
- Added `tailwind.config.js` and `postcss.config.js`.
- Attempted to use Hugo’s asset pipeline with:
  ```go
  {{ $tailwind := resources.Get "css/tailwind.css" | resources.PostCSS (dict "config" "tailwind.config.js") }}
  <link rel="stylesheet" href="{{ $tailwind.RelPermalink }}">
  ```
- **Problem:** Hugo could not find the PostCSS/Tailwind binaries due to npm environment issues. Builds failed with errors about missing executables.

### 2. Final (Working) Solution: Standalone Tailwind CLI
- Downloaded the official Tailwind CLI binary for macOS ARM64:
  ```sh
  curl -o tailwindcss https://github.com/tailwindlabs/tailwindcss/releases/latest/download/tailwindcss-macos-arm64
  chmod +x tailwindcss
  ```
- Built the CSS manually:
  ```sh
  ./tailwindcss -i ./assets/css/tailwind.css -o ./static/css/tailwind.generated.css --config tailwind.config.js
  ```
- Updated `layouts/_default/baseof.html` to reference the static build:
  ```html
  <link rel="stylesheet" href="/css/tailwind.generated.css">
  ```
- **No Hugo asset pipeline or npm scripts are needed for Tailwind.**

---

## Usage Notes
- To rebuild Tailwind CSS after changing classes or config, rerun:
  ```sh
  ./tailwindcss -i ./assets/css/tailwind.css -o ./static/css/tailwind.generated.css --config tailwind.config.js
  ```
- The Tailwind binary is project-local (`./tailwindcss`).
- All Tailwind config is in `tailwind.config.js`.
- Base input CSS is in `assets/css/tailwind.css`.
- Output CSS is in `static/css/tailwind.generated.css`.

---

## Troubleshooting
- If Hugo fails to build due to PostCSS errors, ensure you are not referencing the asset pipeline in your templates.
- If the Tailwind CLI is missing, re-download it from the [Tailwind CSS releases page](https://github.com/tailwindlabs/tailwindcss/releases).
- For new environments, ensure the CLI binary is executable (`chmod +x tailwindcss`).

---

## References
- [Tailwind CSS Standalone CLI](https://tailwindcss.com/blog/standalone-cli)
- [Hugo + Tailwind Docs](https://gohugo.io/hugo-pipes/postcss/)
