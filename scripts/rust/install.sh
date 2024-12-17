#!/bin/bash

set -eo pipefail

# TODO: This automatically adds to .zshrc, so should be removed and add own env
curl https://sh.rustup.rs -sSf | sh
