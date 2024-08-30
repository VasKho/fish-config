EXECUTABLES := git fzf nvim
ROW := "%-15s|%-20s\n"
INSTALL_DIR := $(HOME)/.config/zsh
SRC := .zshrc bindings

all: install

install:
	@if [ -d $(INSTALL_DIR) ]; then echo "$(INSTALL_DIR) already exists"; exit 1; fi
	mkdir -p $(INSTALL_DIR)
	cp -r $(SRC) $(INSTALL_DIR)

check:
	for exec in $(EXECUTABLES); do which $$exec > /dev/null 2>/dev/null && printf $(ROW) "$$exec" "Found" || printf $(ROW) "$$exec" "Not found"; done

uninstall:
	rm -rf $(INSTALL_DIR)


.PHONY: check
.SILENT: check
