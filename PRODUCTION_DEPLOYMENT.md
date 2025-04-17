# Production Deployment Guide: Hostinger FTP

This guide explains how to prepare and deploy your Hugo-based personal blog to Hostinger using FTP. It assumes your website is static (client-side code only) and that you use local testing before pushing to production.

---

## 1. Prepare the Site for Production

1. **Build the Static Site**
   - In your project root, run:
     ```sh
     hugo --minify
     ```
   - This generates the optimized static site in the `public/` directory.

2. **Test Locally**
   - Preview your site locally to ensure everything works:
     ```sh
     hugo server -D
     ```
   - Visit http://localhost:1313 in your browser.
   - Check for broken links, missing images, and layout issues.

---

## 2. Prepare Files for FTP Upload

- Only the contents of the `public/` directory need to be uploaded to Hostinger.
- Do **not** upload source files, configuration, or scripts.

---

## 3. Deploy to Hostinger via FTP

1. **Obtain FTP Credentials**
   - Get your FTP hostname, username, and password from your Hostinger dashboard.

2. **Connect Using an FTP Client**
   - Recommended tools: FileZilla, Cyberduck, or the command-line `ftp`/`lftp`.

3. **Upload the Site**
   - Connect to your Hostinger FTP server.
   - Navigate to the `public_html` (or equivalent) directory.
   - Upload all files and folders from your local `public/` directory.
   - Overwrite existing files if updating the site.

---

## 4. Post-Deployment Checklist

- Visit your domain to verify the site is live and displays correctly.
- Test navigation, media, forms, and interactive features.
- Clear your browser cache if you don't see updates.
- Optionally, enable HTTPS/SSL from your Hostinger dashboard.

---

## 5. Tips & Best Practices

- **Backup:** Always keep a backup of your local `public/` directory and content.
- **Minify:** Use `hugo --minify` for faster load times.
- **Clean Builds:** If you encounter issues, delete `public/` and rebuild.
- **Update Regularly:** Re-upload the entire `public/` directory after each change.
- **Security:** Never upload `.env`, config, or source files to production.

---

## 6. Troubleshooting

- If your site does not appear, check:
  - Files are in the correct directory (`public_html` or equivalent)
  - No missing `index.html`
  - Permissions are set correctly (usually 644 for files, 755 for folders)
  - DNS settings point to Hostinger

---

## 7. Local Testing Workflow (Recommended)

1. Edit and preview content locally using Spacemacs and Hugo.
2. Build with `hugo --minify`.
3. Upload `public/` to Hostinger via FTP.
4. Verify the live site.

---

*This guide is for static sites only. For dynamic backends, additional configuration is required.*
