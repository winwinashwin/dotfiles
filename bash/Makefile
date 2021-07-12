DEST = ~

TARGETS = .alias .bashrc .env .functions .rosdev

all: .setup .make-dirs .create-links

.PHONY: .setup
.setup: ;

.PHONY: .make-dirs
.make-dirs: ;

.PHONY: .create-links
.create-links: $(addprefix link/, $(TARGETS))

link/%: %
	@echo "Creating Symlink $< => $(DEST)/$<"
	@ln -snf $(CURDIR)/$< $(DEST)/$<
