# Build HTML from Markdown
html: clean
	mkdir -p public
	for file in essays/en/*.md; do \
		markdown $$file | \
		awk -v file="$$file" 'BEGIN {print "<!-- Content will be inserted here -->"} 1' \
		> public/$$(basename $$file .md).html; \
	done

# Clean build directory
clean:
	rm -rf public/*.html

# Serve locally
serve: html
	cd public && python3 -m http.server 8000

# Deploy to GitHub Pages
deploy: html
	git add public/
	git commit -m "Deploy to GitHub Pages"
	git push origin main

.PHONY: html clean serve deploy
