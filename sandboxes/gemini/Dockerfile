FROM localhost/agent-base:0.1

ARG version="0.41.1"

RUN bash -c "source $HOME/.nvm/nvm.sh && npm install -g @google/gemini-cli@$version"

CMD ["gemini"]
