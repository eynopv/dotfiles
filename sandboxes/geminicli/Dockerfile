FROM golang:1.26.1-bookworm AS go-bin

FROM node:24-bookworm

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    ripgrep \
    curl \
    ca-certificates \
    build-essential \
    libvips-dev \
    && rm -rf /var/lib/apt/lists/*

COPY --from=go-bin /usr/local/go/ /usr/local/go/
ENV PATH="/usr/local/go/bin:${PATH}"

RUN curl -sSfL https://golangci-lint.run/install.sh | sh -s -- -b /usr/local/bin v2.11.4
RUN npm install -g prettier @google/gemini-cli@0.38.1

ENV GOCACHE=/tmp/.cache/go-build
ENV GOLANGCI_LINT_CACHE=/tmp/.cache/golangci-lint
ENV GOPATH=/tmp/go
ENV PATH="/usr/local/go/bin:/usr/local/bin:${PATH}"

WORKDIR /workspace

ENTRYPOINT ["gemini"]
