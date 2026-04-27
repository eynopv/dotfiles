FROM debian:bookworm-slim

RUN apt update && apt install -y \
  curl \
  git \
  ripgrep \
  ca-certificates \
  build-essential \
  unzip \
  && rm -rf /var/lib/apt/lists/*
  
# Create `coder` user with passwordless login
RUN useradd -m -s /bin/bash -u 1000 coder && passwd -d coder

# Switch to target user and work directory
USER coder
WORKDIR /home/coder
ENV HOME="/home/coder"

# Install nvm and node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
RUN bash -c "source $HOME/.nvm/nvm.sh && nvm install 24"

# Install pnpm
RUN bash -c "source $HOME/.nvm/nvm.sh && npm install -g pnpm"

# Install pi agent
RUN bash -c "source $HOME/.nvm/nvm.sh && npm install -g @mariozechner/pi-coding-agent"

USER root
COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh
USER coder

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["pi"]
