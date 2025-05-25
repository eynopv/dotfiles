#!/bin/bash

set -eo pipefail

echo "Installing ansible"

pipx install --include-deps ansible

echo "Done"
