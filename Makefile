.DEFAULT_GOAL := all

MKDIR_P  = mkdir -p
RM       = rm -rf

export MKDIR_P RM

all: nvim bash

.PHONY: nvim
nvim:
	make -C nvim

.PHONY: bash
bash:
	make -C bash

.PHONY: sandbox
sandbox:
	make -C _sandbox run
