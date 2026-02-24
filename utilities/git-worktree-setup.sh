#!/usr/bin/env bash
set -euo pipefail

url="${1:?Usage: $0 <git-url>}"
dir="${url##*/}"
dir="${dir%.git}"

mkdir -p "$dir" && cd "$dir"

# Initialize bare repo
git clone --bare "$url" .bare
echo "gitdir: ./.bare" > .git

# Fix remote tracking
git config remote.origin.fetch "+refs/heads/*:refs/remotes/origin/*"
git fetch origin

# Determine and add default branch
default=$(git remote show origin | awk '/HEAD branch/ {print $3}')

git worktree add "$default"
