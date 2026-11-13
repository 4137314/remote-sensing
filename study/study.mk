# Study knowledge base (study/): read-only Emacs reader provided by the flake (output `study`).

ST_NAME := remote-sensing
ST_STATE := $(or $(XDG_STATE_HOME),$(HOME)/.local/state)/$(ST_NAME)-emacs
ST_APPS := $(or $(XDG_DATA_HOME),$(HOME)/.local/share)/applications
ST_DESKTOP := $(ST_APPS)/$(ST_NAME).desktop
ST_BIN := $(ST_STATE)/profile/bin/$(ST_NAME)-study

study: ## open Emacs on the knowledge base (study/kb)
	RS_ROOT=$(ROOT) nix run $(ROOT)#study

study-install: ## build the reader, render the formulas, add "Remote Sensing" to the launcher
	mkdir -p $(ST_STATE) $(ST_APPS)
	nix build $(ROOT)#study -o $(ST_STATE)/profile
	RS_ROOT=$(ROOT) $(ST_BIN) --check
	sed -e 's|@ROOT@|$(ROOT)|g' -e 's|@BIN@|$(ST_BIN)|g' \
	  study/$(ST_NAME).desktop.in > $(ST_DESKTOP)
	-update-desktop-database $(ST_APPS) 2>/dev/null
	@echo "installed: $(ST_DESKTOP) (search \"remote sensing\" in the launcher)"

study-uninstall: ## remove the launcher entry and the profile (notes and repo stay)
	rm -f $(ST_DESKTOP) $(ST_STATE)/profile

study-check: ## batch check: metadata, links, prerequisites, forbidden words, formulas/TikZ
	nix build $(ROOT)#study --no-link
	RS_ROOT=$(ROOT) systemd-run --user --scope -q -p MemoryMax=1500M timeout 300 \
	  nix run $(ROOT)#study -- --check

.PHONY: study study-install study-uninstall study-check
