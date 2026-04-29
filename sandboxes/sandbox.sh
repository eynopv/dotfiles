#!/usr/bin/env bash

set -eo pipefail

docker run --rm -it \
  -e TERM=$TERM \
  -v "$HOME/.pi":/home/coder/.pi \
  pi
