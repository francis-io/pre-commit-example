install-pre-commit:
	# pull the latest pre-commit code via the submodule
	git submodule update --init --recursive

	# Combine the central pre-commit file with any extra checks found locally
	cat pre-commit-example-central-config/.pre-commit-config-core.yaml .pre-commit-config-extended.yaml > .pre-commit-config.yaml

	# Install the pre-commit hooks
	pre-commit install

run:
	@$(MAKE) install-pre-commit  # The install task is quite light, so lets just run it every time run pre-commit
	pre-commit run --all-files