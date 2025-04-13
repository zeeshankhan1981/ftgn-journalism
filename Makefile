# Build HTML from Markdown
html: clean
	mkdir -p public
	
	# Build home page
	cp src/templates/base.html public/index.html
	
	# Build individual essay pages
	for file in essays/en/*.md; do \
		title=$(basename "$file" .md | sed 's/^[0-9]*-//'); \
		location=$(grep "# " "$file" | sed 's/# //'); \
		year=$(echo "$title" | grep -oE '[0-9]{4}'); \
		theme="civilian"; \
		
		pandoc "$file" -f markdown -t html | \
		awk -v title="$title" -v location="$location" -v year="$year" -v theme="$theme" 'BEGIN {print "<!-- Content will be inserted here -->"} 1' | \
		sed 's/\$\{title\}/"'"$title""/g' | \
		sed 's/\$\{location\}/"'"$location""/g' | \
		sed 's/\$\{year\}/"'"$year""/g' | \
		sed 's/\$\{theme\}/"'"$theme""/g' | \
		awk -v file="$file" '{print}' > "public/$$(basename $$file .md).html"; \
	done

# Clean build directory
clean:
	rm -rf public/*.html

# Serve locally
serve: html
	cd public && python3 -m http.server 8080

# Deploy to GitHub Pages
deploy: html
	git add public/
	git commit -m "Deploy to GitHub Pages"
	git push origin main

.PHONY: html clean serve deploy
