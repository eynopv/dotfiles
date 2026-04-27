#!/usr/bin/env bash

set -eo pipefail

docker run --rm -it \
  -v "$HOME/.pi":/home/coder/.pi \
  pi
