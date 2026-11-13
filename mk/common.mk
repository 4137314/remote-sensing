# Shared helpers.

help: ## list the targets
	@awk 'BEGIN{FS=":.*## "} /^[a-zA-Z0-9_-]+:.*## /{printf "  \033[1m%-18s\033[0m %s\n",$$1,$$2}' \
	  $(MAKEFILE_LIST) | sort

.PHONY: help
