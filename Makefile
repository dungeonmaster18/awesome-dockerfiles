.PHONY: build
build:  ## Builds all the changed dockerfile and pushes to dockerhub
	@./build.sh

.PHONY: test
test:  ## Test the Changed dockerfiles.

.PHONY: build-all
build-all:  ## Builds all the dockerfile and pushes to dockerhub
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