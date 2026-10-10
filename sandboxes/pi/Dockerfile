FROM localhost/agent-base:0.1

ARG version="1.1.0"

RUN bash -c "source $HOME/.nvm/nvm.sh && npm install -g @earendil-works/pi-coding-agent@$version"

CMD ["pi"]
