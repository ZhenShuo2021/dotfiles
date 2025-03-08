.PHONY: help

help: ## Print command list
	@perl -nle'print $& if m{^[a-zA-Z0-9_-]+:.*?## .*$$}' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

bootstrap: ## Refresh chezmoi status and initialize
	chezmoi state delete-bucket --bucket=scriptState && chezmoi init

apply: ## Run chezmoi apply
	@chezmoi apply

apply-min: ## Run chezmoi apply with minimum install (Only zsh files, see .chezmoiignore)
	@MINIMUM=1 chezmoi apply

apply-files: ## Only copy files, do not run .chezmoiscripts
	@chezmoi apply -i files

apply-ask: ## Almost fresh install, only except run_once. Use `make bootstrap` to full fresh new install
	@ASK=1 chezmoi init --apply
