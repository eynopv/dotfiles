.PHONY: base all gemini pi

UID := $(shell id -u)
GID := $(shell id -g)

all: gemini pi

base:
	docker build \
		--build-arg USER_ID=$(UID) \
		--build-arg GROUP_ID=$(GID) \
		-t localhost/agent-base:0.1 \
		--file base/Dockerfile .

gemini pi: base
	docker build -t $@ --file $@/Dockerfile .
