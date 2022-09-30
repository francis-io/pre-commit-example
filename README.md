# pre-commit-example

The point of this repo is to demonstrate how you would centrally manage a `pre-commit-conifg.yaml` file, but also allowing local execution and additional repo specific checks.

```
Running `make run` will:
    1) pull the latest version of the submodule inside `pre-commit-example-central-config` that holds the checks we want on all repos
    2) Combine that file with any additional checks in `.pre-commit-config-extended.yaml` that exists in this repo into a single `.pre-commit-config.yaml` file
    3) Installs and runs the combined checks
```