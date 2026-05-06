FROM debian:bookworm-slim

RUN apt update && apt install -y \
  curl \
  wget \
  git \
  grep \
  ripgrep \
  ca-certificates \
  build-essential \
  zip \
  unzip \
  jq \
  libvips-dev \
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

# Install prettier
RUN bash -c "source $HOME/.nvm/nvm.sh && npm install -g prettier"

# Install go
# Detect architecture and install correct Go binary
RUN ARCH=$(dpkg --print-architecture) && \
    curl -L "https://go.dev/dl/go1.26.2.linux-${ARCH}.tar.gz" | tar -xz -C "$HOME" || exit 1
RUN "$HOME/go/bin/go" install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@v2.10.1
ENV PATH="$HOME/go/bin:$PATH" \
  GOPATH="$HOME/go" \
  GOROOT="$HOME/go"

# Create work directory
RUN mkdir "$HOME/workspace"
WORKDIR "$HOME/workspace"

# Setup entrypoint
USER root
COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh
USER coder
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
