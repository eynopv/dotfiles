#!/bin/bash

set -eo pipefail

source ../common.sh

echo "Uninstalling ansible"

pipx uninstall ansible

echo "Done"
