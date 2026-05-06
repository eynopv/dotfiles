.PHONY: base all gemini pi

all: gemini pi

base:
	docker build -t localhost/agent-base:0.1 --file base/Dockerfile .

gemini pi: base
	docker build -t $@ --file $@/Dockerfile .
