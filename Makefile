SHELL         = /bin/bash
.DEFAULT_GOAL = all

D_ROOT      := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
D_HOME      := $(D_ROOT)/sandbox
#D_HOME      := $(HOME)
D_DOTFILES  := $(D_ROOT)/dotfiles

DEFAULT_INSTALL_TARGETS := .bash .tmux .nvim .inputrc .cronjobs 

$(info => Using HOME = ${D_HOME})

.PHONY: all
all: $(DEFAULT_INSTALL_TARGETS) 

.PHONY: .bash
.bash: $(shell find $(D_DOTFILES) -name .bash*)
	@echo "Installing config [bash]"
	@ln -sf $^ $(D_HOME)

.PHONY: .tmux
.tmux: $(D_DOTFILES)/.tmux.conf
	@echo "Installing config [tmux]"
	@ln -sf $< $(D_HOME)/.tmux.conf
	
.PHONY: .nvim
.nvim: $(D_DOTFILES)/nvim
	@echo "Installing config [nvim]"
	@mkdir -p $(D_HOME)/.config
	@ln -sf $< $(D_HOME)/.config/nvim

.PHONY: .inputrc
.inputrc: $(D_DOTFILES)/.inputrc
	@echo "Installing config [inputrc]"
	@ln -sf $< $(D_HOME)/.inputrc

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

.PHONY: help
help:
	echo help
