# pre-commit-example

The point of this repo is to demonstrate how you would centrally manage a pre-commit config, but also allowing a repo to extend these checks. It also supports local execution.

I have implemented this logic in a `Makefile`. I would expect a check in GitHub to also run `make run`.

Running `make run` will:

1) pull the latest version of the submodule inside `pre-commit-example-central-config`
2) Combine that file with any additional checks found in `.pre-commit-config-extended.yaml` in this repo into a single `.pre-commit-config.yaml` file
3) Installs and runs the combined config
