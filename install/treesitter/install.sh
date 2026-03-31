#!/usr/bin/env bash

set -eo pipefail

VERSION="v0.26.7"


curl -L "https://github.com/tree-sitter/tree-sitter/releases/download/$VERSION/tree-sitter-linux-x64.gz" | gunzip > ~/.local/bin/tree-sitter

chmod +x ~/.local/bin/tree-sitter
