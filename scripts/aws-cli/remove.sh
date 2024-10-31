#!/bin/bash

set -eo pipefail

echo "Deleting symlinks"
sudo rm /usr/local/bin/aws
sudo rm /usr/local/bin/aws_completer

echo "Deleting aws-cli"
sudo rm -rf /usr/local/aws-cli

echo "Deleting settings"
sudo rm -rf ~/.aws/

echo "Done"
