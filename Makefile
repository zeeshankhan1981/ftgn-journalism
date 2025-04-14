# Build HTML from Markdown
html: clean
	mkdir -p public/essays
	mkdir -p public/css public/js public/img
	
	# No need to copy files - they're already in place
	
	# Build home page
	cp src/templates/base.html public/index.html
	
	# Copy markdown essays to public folder so they can be accessed directly
	mkdir -p public/essays/en
	cp -f essays/en/*.md public/essays/en/
	
	# Copy metadata
	cp -f essays/metadata.json public/essays/
	
	# Create about page
	cp -f about.html public/

# Clean build directory
clean:
	rm -rf public/*.html public/essays/*.html

# Serve locally
serve: html
	cd public && python3 -m http.server 8080

# Deploy to GitHub Pages
deploy: html
	git add public/
	git commit -m "Deploy to GitHub Pages"
	git push origin main

.PHONY: html clean serve deploy