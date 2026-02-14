# AI Agent Skills - Just run `make` and you're done!

.PHONY: all clean

# Colors
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[0;33m
NC := \033[0m

# Default: do everything
all:
	@echo "$(BLUE)🤖 Setting up AI Agent Skills...$(NC)"
	@echo ""
	@echo "$(YELLOW)📦 Installing/updating skills...$(NC)"
	@npx skills update
	@echo ""
	@echo "$(YELLOW)🔍 Checking for updates...$(NC)"
	@npx skills check
	@echo ""
	@if [ -d skills ] && [ -f .skill-lock.json ]; then \
		echo "$(GREEN)✅ All done!$(NC)"; \
		echo ""; \
		echo "$(BLUE)Installed skills:$(NC)"; \
		ls -1 skills | sed 's/^/  • /'; \
	else \
		echo "$(YELLOW)⚠️  No skills found. Add some with: npx skills find$(NC)"; \
	fi
	@echo ""

clean:
	@echo "$(BLUE)🧹 Cleaning...$(NC)"
	@rm -f tags
	@echo "$(GREEN)✓ Done$(NC)"
