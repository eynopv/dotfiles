.PHONY: base all gemini pi

AGENT_VERSION := 0.1
UID := $(shell id -u)
GID := $(shell id -g)

all: gemini pi

base:
	docker build \
		--build-arg USER_ID=$(UID) \
		--build-arg GROUP_ID=$(GID) \
		-t localhost/agent-base:$(AGENT_VERSION) \
		--file base/Dockerfile .

gemini pi: base
	docker build -t $@ --file $@/Dockerfile .
