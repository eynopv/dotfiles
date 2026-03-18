FROM node:24-bookworm

RUN apt update
RUN apt install -y --no-install-recommends \
    git \
    ripgrep \
    curl \
    ca-certificates \
    build-essential
RUN rm -rf /var/lib/apt/lists/*
RUN npm install -g @google/gemini-cli

WORKDIR /workspace

USER node

ENTRYPOINT ["gemini"]
