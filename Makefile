.PHONY: build clean serve hugo-build build-for-upload convert-org help all

# Default target
all: build

# Clean build artifacts
clean:
	rm -rf public/*

# Build the site with Hugo
hugo-build: clean
	hugo --minify

# Start Hugo development server
serve:
	./scripts/hugo-server.sh

# Convert Org files to Hugo markdown
convert-org:
	@echo "Converting Org files to Hugo markdown..."
	@echo "Note: This should be done in Emacs with ox-hugo (C-c C-e H H)"
	@echo "This target is just a reminder."

# Build for upload to torchscribe.com
build-for-upload: hugo-build
	@echo "Site built successfully in public/ directory"
	@echo "Ready for upload to torchscribe.com"

# Legacy build method (kept for compatibility)
html: clean
	@echo "Legacy build system is deprecated. Using Hugo instead."
	$(MAKE) hugo-build

# Help command
help:
	@echo "Available commands:"
	@echo "  make              - Build the site with Hugo"
	@echo "  make clean        - Remove build artifacts"
	@echo "  make serve        - Start Hugo development server"
	@echo "  make convert-org  - Reminder to convert Org files"
	@echo "  make build-for-upload - Build site for upload to torchscribe.com"
	@echo "  make html         - Legacy build (redirects to Hugo build)"

# Build is the default target
build: hugo-build