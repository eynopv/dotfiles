.PHONY: base all geminicli pi

all: geminicli pi

base:
	docker build -t localhost/agent-base:0.1 --file base/Dockerfile .

opencode geminicli pi: base
	docker build -t $@ --file $@/Dockerfile .
