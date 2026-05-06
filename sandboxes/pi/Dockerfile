FROM localhost/agent-base:0.1

ARG version="0.73.0"

RUN bash -c "source $HOME/.nvm/nvm.sh && npm install -g @mariozechner/pi-coding-agent@$version"

CMD ["pi"]
