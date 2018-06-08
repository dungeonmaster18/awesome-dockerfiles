.PHONY: build
build:  ## Installs the bin and etc directory files and the dotfiles.
	@./build.sh

.PHONY: test
test:  ## Installs the bin and etc directory files and the dotfiles.
	@./test.sh

.PHONY: test
test:  ## Installs the bin and etc directory files and the dotfiles.
	@./build-all.sh

PHONY: help
help: ## Shows help.
	@echo
	@echo 'Usage:'
	@echo '    make <target>'
	@echo
	@echo 'Targets:'
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "    \033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo