# Build HTML from Markdown
html: clean
	mkdir -p public/essays
	mkdir -p public/css public/js public/img
	
	# No need to copy files - they're already in place
	
	# Build home page
	cp src/templates/base.html public/index.html
	
	# Essays are already in the public folder
	mkdir -p public/essays/en
	mkdir -p public/essays/html
	
	# Generate HTML wrappers for markdown files
	chmod +x scripts/generate-html-wrappers.sh
	./scripts/generate-html-wrappers.sh
	
	# Metadata is already in the public folder
	
	# Create about page if it exists
	[ -f about.html ] && cp -f about.html public/ || echo "No about.html found"

# Clean build directory
clean:
	rm -rf public/*.html public/essays/*.html

# Serve locally
serve: html
	cd public && python3 -m http.server 8080

# Generate files for manual upload to torchscribe.com
build-for-upload: html
	@echo "Files generated in the 'public' directory are ready to be uploaded to torchscribe.com"
	@echo "Use your preferred file transfer method (FTP, SFTP, etc.) to upload these files."

.PHONY: html clean serve deploy