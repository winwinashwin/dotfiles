.DEFAULT_GOAL := all

MKDIR_P  = mkdir -p
RM       = rm -rf

export MKDIR_P RM

all: nvim

.PHONY: nvim
nvim:
	make -C nvim

.PHONY: sandbox
sandbox:
	make -C _sandbox run
