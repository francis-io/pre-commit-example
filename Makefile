ifneq (,)
.error This Makefile requires GNU Make.
endif

# Supress printing of the make command
.SILENT:

.DEFAULT_GOAL := help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)


.PHONY: fmt-check
install-pre-commit: ## Installs pre-commit hooks
	# pull the latest pre-commit code via the submodule
	git submodule update --init --recursive

	# Combine the central pre-commit file with any extra checks found locally
	cat pre-commit-example-central-config/.pre-commit-config-core.yaml .pre-commit-config-extended.yaml > .pre-commit-config.yaml

	# Install the pre-commit hooks
	pre-commit install

.PHONY: run
run: install-pre-commit ## Runs the pre-commit hooks
	pre-commit run --all-files