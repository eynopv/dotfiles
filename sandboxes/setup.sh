#!/usr/bin/env bash

set -eo pipefail

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/../install/common.sh"

current_dir=$(script_dir)

create_symlink "$current_dir/agents" "$HOME/.agents"
