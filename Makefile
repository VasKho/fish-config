EXECUTABLES := fish git fzf nvim fd bat
ROW := "%-15s|%-20s\n"
INSTALL_DIR := $(HOME)/.config/fish
SRC := config.fish conf.d functions
NEW_SHELL := $(shell which fish)

all: install configure

install:
	@if [ -d $(INSTALL_DIR) ]; then echo "$(INSTALL_DIR) already exists"; exit 1; fi
	mkdir -p $(INSTALL_DIR)
	cp -r $(SRC) $(INSTALL_DIR)

check:
	for exec in $(EXECUTABLES); do which $$exec > /dev/null 2>/dev/null && printf $(ROW) "$$exec" "Found" || printf $(ROW) "$$exec" "Not found"; done

configure:
	chsh -s $(NEW_SHELL)

uninstall:
	rm -rf $(INSTALL_DIR)


.PHONY: check
.SILENT: check
