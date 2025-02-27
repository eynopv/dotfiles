#!/bin/bash

set -eo pipefail

echo "Removing client"

sudo apt remove postgresql-client

echo "Done"
