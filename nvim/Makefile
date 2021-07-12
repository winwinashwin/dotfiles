DEST = ~/.config/nvim

TARGETS = $(shell find . -regex ".*\.vim$$\|.*\.lua$$")

all: .setup .make-dirs .create-links

.PHONY: .setup
.setup:
	$(RM) $(DEST)

.PHONY: .make-dirs
.make-dirs:
	$(MKDIR_P) ~/.config/nvim/plugin

.PHONY: .create-links
.create-links: $(addprefix link/, $(TARGETS))

link/%: %
	@echo "Creating Symlink $< => $(DEST)/$<"
	@ln -snf $(CURDIR)/$< $(DEST)/$<
