# checkmake:ignore=maxbodylength

.PHONY: all install clean test lint lint-md lint-html lint-make help
.DEFAULT_GOAL := help

## Setup
all: help

install: # Install project dependencies
	@npm install

clean:# Remove node_modules
	@rm -rf node_modules

## Development
test: # Run tests and report status (Currently just linters)
	@echo "Running verification...\n"
	@if $(MAKE) lint; \
	then echo "\033[32mPASSED: All checks completed successfully.\033[0m"; \
	else echo "\033[31mFAILED: Linting or build errors found.\033[0m"; exit 1; fi

lint: lint-md lint-html lint-make # Run all linters

lint-md: # Lint all markdown files
	@npm run lint:md

lint-html: # Lint all HTML files
	@npm run lint:html

lint-make: # Run checkmake on the Makefile
	@if ! command -v go >/dev/null 2>&1; then \
		echo "Error: 'go' is not installed. Please install Go to lint the Makefile."; \
		echo "`goenv` recommended: https://github.com/go-nv/goenv or `brew install goenv`"; exit 1; \
	fi
	@go run github.com/checkmake/checkmake/cmd/checkmake@latest Makefile

format: # Run prettier
	@npm run format

## Help
help: # Show this help message
	@echo "Usage: make [command]"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?# .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?# "}; {printf "\033[36m%-15s\033[0m %s\n", $$1, $$2}'