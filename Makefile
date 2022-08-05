SHELL         = /bin/bash
.DEFAULT_GOAL = all

D_ROOT      := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
#D_HOME      := $(D_ROOT)/sandbox
D_HOME      := $(HOME)
D_DOTFILES  := $(D_ROOT)/dotfiles

DEFAULT_INSTALL_TARGETS := .bash .tmux .nvim .alacritty .inputrc .git .scripts .cronjobs dconf.load

$(info => Using HOME = ${D_HOME})

.PHONY: all
all: $(DEFAULT_INSTALL_TARGETS) 

.PHONY: .bash
.bash: $(shell find $(D_DOTFILES)/bash -name .bash*)
	@echo "Installing config [bash]"
	@ln -sf $^ $(D_HOME)

.PHONY: .tmux
.tmux: $(D_DOTFILES)/tmux/.tmux.conf
	@echo "Installing config [tmux]"
	@ln -sf $< $(D_HOME)/.tmux.conf
	
.PHONY: .nvim
.nvim: $(D_DOTFILES)/nvim
	@rm -rf $(D_HOME)/.config/nvim
	@echo "Installing config [nvim]"
	@mkdir -p $(D_HOME)/.config
	@ln -sf $< $(D_HOME)/.config/nvim

.PHONY: .alacritty
.alacritty: $(D_DOTFILES)/alacritty
	@rm -rf $(D_HOME)/.config/alacritty
	@echo "Installing config [alacritty]"
	@mkdir -p $(D_HOME)/.config
	@ln -sf $< $(D_HOME)/.config/alacritty

.PHONY: .inputrc
.inputrc: $(D_DOTFILES)/.inputrc
	@echo "Installing config [inputrc]"
	@ln -sf $< $(D_HOME)/.inputrc

.PHONY: .git
.git: $(shell find $(D_DOTFILES)/git -type f)
	@echo "Installing config [git]"
	@ln -sf $^ $(D_HOME)

.PHONY: .scripts
.scripts: $(shell find $(D_ROOT)/scripts -type f)
	@echo "Installing scripts"
	@sudo ln -sf $^ /usr/local/bin

.PHONY: .cronjobs
.cronjobs: .crontab.tmp
	@echo "Installing cronjobs"
	@crontab $<
	@rm -f .crontab.tmp

.crontab.tmp: $(D_DOTFILES)/crontab
	@echo "Fetching existing cron table"
	@crontab -l | { grep -v '## dotfiles' || true; } > $@
	@echo "Updating cronjobs"
	@cat $< | awk '{print $$0, "   ## dotfiles"}' >> $@
	@sed -i 's|{{HOME}}|$(D_HOME)|g' $@

.PHONY: dconf.load
dconf.load:
	@echo "Loading dconf"
	@dconf load /org/gnome/desktop/wm/ < $(D_DOTFILES)/dconf-gnome/org.gnome.desktop.wm.conf
	@dconf load /org/gnome/settings-daemon/plugins/media-keys/ < $(D_DOTFILES)/dconf-gnome/org.gnome.settings-daemon.plugins.media-keys.conf

.PHONY: dconf.dump
dconf.dump:
	@dconf dump /org/gnome/desktop/wm/ > $(D_DOTFILES)/dconf-gnome/org.gnome.desktop.wm.conf
	@dconf dump /org/gnome/settings-daemon/plugins/media-keys/ > $(D_DOTFILES)/dconf-gnome/org.gnome.settings-daemon.plugins.media-keys.conf

.PHONY: help
help:
	echo help
