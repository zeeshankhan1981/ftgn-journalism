---
title: "About"
date: 2025-04-14
url: "/about/"
---

# About Against The Tide

A journalism project focused on civilian experiences during military operations, built with a focus on minimalism and ease of maintenance.

## Project Philosophy

Against The Tide is a collection of fact-based accounts focused on civilian experiences during U.S. military bombardments throughout history. The project aims to document these stories in a straightforward, accessible way with minimal technical overhead.

## Technical Stack

This website is built using a modern, efficient stack:

- **Content Creation**: Emacs with Org mode
- **Content Processing**: ox-hugo for Org to Markdown conversion
- **Site Generation**: Hugo static site generator
- **Frontend**: Vanilla HTML, CSS, and JavaScript (no frameworks)
- **Version Control**: Git

The entire site is statically generated, requiring no databases or server-side processing.

## Content Structure

Essays are written in Org format and exported to Markdown. Each essay follows a consistent structure:

- A clear headline indicating location and date
- A concise account of events
- Verifiable sources for further reading

Metadata for each essay (like location, year, and theme) is stored in frontmatter, making it easy to organize and search.

## Design Principles

The site's design is guided by a few core principles:

- **Typewriter-inspired:** Using monospace fonts and subtle design elements that evoke classic journalism
- **Content-first:** Minimal distractions with focus on readability
- **Responsive:** Works well on all devices from mobile to desktop
- **Accessible:** Consideration for different reading preferences, including dark mode

## Emacs + Org Workflow

This project is designed to be fully editable through Emacs with Org mode, providing:

- Structured content creation with Org mode
- Automated export to Hugo via ox-hugo
- Version control through Magit
- Project-wide search and refactoring
- Terminal access for running local server and build commands

The entire workflow can be managed within Emacs, from writing content to previewing with Hugo's live server.

## Keyboard Shortcuts

The site features several keyboard shortcuts for power users:

- <kbd>Alt</kbd> + <kbd>Home</kbd>: Return to home page
- <kbd>Alt</kbd> + <kbd>S</kbd>: Focus search input
- <kbd>Alt</kbd> + <kbd>E</kbd>: Return to essays list
- <kbd>Alt</kbd> + <kbd>A</kbd>: Go to about page

## Authorship

All content on Against The Tide is curated by TorchScribe, with a commitment to factual accuracy and source verification.