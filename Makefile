# AI Agent Skills Management
# Makefile for convenient skill installation, updates, and maintenance

.PHONY: help install update check find list clean verify

# Default target
.DEFAULT_GOAL := help

# Colors for output
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
RED := \033[0;31m
NC := \033[0m # No Color

help: ## Show this help message
	@echo "$(BLUE)AI Agent Skills Management$(NC)"
	@echo ""
	@echo "$(GREEN)Available commands:$(NC)"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(YELLOW)%-12s$(NC) %s\n", $$1, $$2}'
	@echo ""
	@echo "$(BLUE)Examples:$(NC)"
	@echo "  make install    # First time setup or restore skills"
	@echo "  make check      # Check for updates weekly"
	@echo "  make update     # Apply available updates"
	@echo "  make find       # Search for new skills"
	@echo ""

install: ## Install/restore all skills from .skill-lock.json
	@echo "$(BLUE)Installing skills...$(NC)"
	@if [ -f .skill-lock.json ]; then \
		npx skills update; \
		echo "$(GREEN)✓ Skills installed successfully$(NC)"; \
	else \
		echo "$(RED)✗ No .skill-lock.json found$(NC)"; \
		echo "$(YELLOW)Run 'make find' to discover and install skills$(NC)"; \
		exit 1; \
	fi

update: ## Update all installed skills to latest versions
	@echo "$(BLUE)Updating skills...$(NC)"
	@npx skills update
	@echo "$(GREEN)✓ Skills updated$(NC)"
	@echo "$(YELLOW)Don't forget to commit .skill-lock.json if changed$(NC)"

check: ## Check for available skill updates
	@echo "$(BLUE)Checking for updates...$(NC)"
	@npx skills check

find: ## Search for skills interactively
	@echo "$(BLUE)Searching for skills...$(NC)"
	@npx skills find

list: ## List all installed skills
	@echo "$(BLUE)Installed skills:$(NC)"
	@npx skills list

verify: ## Verify skills installation
	@echo "$(BLUE)Verifying installation...$(NC)"
	@if [ -d skills ]; then \
		echo "$(GREEN)✓ Skills directory exists$(NC)"; \
		ls -1 skills | sed 's/^/  - /'; \
	else \
		echo "$(RED)✗ Skills directory not found$(NC)"; \
		exit 1; \
	fi
	@echo ""
	@if [ -f .skill-lock.json ]; then \
		echo "$(GREEN)✓ Lock file exists$(NC)"; \
	else \
		echo "$(RED)✗ Lock file missing$(NC)"; \
		exit 1; \
	fi

clean: ## Clean cache and temporary files
	@echo "$(BLUE)Cleaning...$(NC)"
	@rm -f tags
	@echo "$(GREEN)✓ Cleaned temporary files$(NC)"

reset: ## Remove all skills and reinstall (use with caution)
	@echo "$(RED)⚠️  This will remove all installed skills$(NC)"
	@read -p "Are you sure? [y/N] " -n 1 -r; \
	echo; \
	if [[ $$REPLY =~ ^[Yy]$$ ]]; then \
		rm -rf skills/; \
		echo "$(YELLOW)Skills removed. Run 'make install' to restore$(NC)"; \
	else \
		echo "$(GREEN)Cancelled$(NC)"; \
	fi

setup: install verify ## Complete setup for new users
	@echo ""
	@echo "$(GREEN)✓ Setup complete!$(NC)"
	@echo ""
	@echo "$(BLUE)Next steps:$(NC)"
	@echo "  1. Open Claude Code in your project"
	@echo "  2. Skills are now automatically available"
	@echo "  3. Run 'make find' to discover more skills"
	@echo ""

# Maintenance targets
.PHONY: maintenance weekly monthly

weekly: check ## Weekly maintenance: check for updates
	@echo "$(GREEN)✓ Weekly check complete$(NC)"

monthly: check update ## Monthly maintenance: update all skills
	@echo "$(GREEN)✓ Monthly update complete$(NC)"
	@echo "$(YELLOW)Review and commit .skill-lock.json changes$(NC)"
