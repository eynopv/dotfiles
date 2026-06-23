FROM debian:bookworm-20260610-slim

ARG USER_ID=1000
ARG GROUP_ID=1000

ARG GO_VERSION="1.26.3"
ARG PNPM_VERSION="11.4.0"

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
RUN groupadd -g "$GROUP_ID" coder || groupmod -g "$GROUP_ID" $(getent group "$GROUP_ID" | cut -d: -f1)
RUN useradd -m -s /bin/bash -u "$USER_ID" -g "$GROUP_ID" coder && passwd -d coder

# Switch to target user and work directory
USER coder
WORKDIR /home/coder
ENV HOME="/home/coder"

# Install nvm and node
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
RUN bash -c "source $HOME/.nvm/nvm.sh && nvm install 22.22.3"

# Install pnpm
RUN bash -c "source $HOME/.nvm/nvm.sh && npm install -g pnpm@$PNPM_VERSION"

# Install prettier
RUN bash -c "source $HOME/.nvm/nvm.sh && npm install -g prettier"

# Install playwright
RUN bash -c "source $HOME/.nvm/nvm.sh && npx -y playwright@latest install"

# Install go
ENV GOROOT="$HOME/go"
ENV GOPATH="$HOME/go-workspace"
ENV GOCACHE="/tmp/.cache/go-cache"
RUN mkdir -p "$GOPATH" "$GOCACHE"
# Detect architecture and install correct Go binary
RUN ARCH=$(dpkg --print-architecture) && \
    curl -L "https://go.dev/dl/go$GO_VERSION.linux-$ARCH.tar.gz" | tar -xz -C "$HOME"
ENV PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
RUN go install github.com/golangci/golangci-lint/v2/cmd/golangci-lint@v2.12.2

# Create work directory
RUN mkdir "$HOME/workspace"
WORKDIR "$HOME/workspace"

# Setup entrypoint
USER root
COPY --chmod=0755 entrypoint.sh /usr/local/bin/entrypoint.sh
USER coder
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
