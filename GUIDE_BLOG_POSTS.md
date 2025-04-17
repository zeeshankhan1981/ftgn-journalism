# Creating and Managing Blog Posts with Spacemacs & Hugo

This guide explains how to create, edit, and publish new blog posts in your Hugo site using Spacemacs and Org-mode.

---

## 1. Create a New Blog Post

1. Open Spacemacs and navigate to your project directory.
2. Run the following command in your terminal (inside Spacemacs or externally):
   ```sh
   hugo new posts/my-first-blog-post.md
   ```
   - This creates a new Markdown file at `content/posts/my-first-blog-post.md` with pre-filled front matter.
   - You can also use Org-mode files if your Hugo setup supports it (e.g., `hugo new posts/my-first-blog-post.org`).

---

## 2. Edit Your Blog Post

- Open the new file in Spacemacs.
- Fill in the title, summary, tags, and categories in the front matter.
- Write your post content below the front matter.
- Use Org-mode features if writing in `.org` files (headings, links, code blocks, etc.).
- Save your changes.

---

## 3. Preview Locally

1. Start the Hugo development server:
   ```sh
   hugo server -D
   ```
2. Visit `http://localhost:1313/posts/` to preview your blog section.
3. Make edits and refresh the browser to see changes.

---

## 4. Publish Your Post

- When ready, set `draft: false` in the front matter.
- Rebuild your site for production:
  ```sh
  hugo --minify
  ```
- Deploy the updated `public/` directory to your production host (see PRODUCTION_DEPLOYMENT.md).

---

## 5. Tips

- Use tags and categories for organization and navigation.
- Keep posts in Markdown or Org-mode for compatibility.
- Use the archetype (`archetypes/posts.md`) for consistent formatting.
- For image uploads, place images in `static/images/` and link using `/images/your-image.jpg`.

---

*This workflow keeps your content creation entirely within Spacemacs, leveraging its powerful editing and Org-mode capabilities.*
