.PHONY: build
build: Dockerfile
	docker build -t dotfiles/sandbox $(CURDIR)

.PHONY: run
run: build
	@docker run --rm -it \
	-v $(CURDIR)/..:/root/dotfiles \
	-w /root \
	dotfiles/sandbox \
	bash
