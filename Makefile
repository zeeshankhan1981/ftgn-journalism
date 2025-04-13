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

.PHONY: html clean serve
