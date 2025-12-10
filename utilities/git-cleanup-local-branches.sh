#!/bin/bash

echo "Fetching remote branches"
git fetch --prune

current_branch=$(git symbolic-ref --short HEAD)

echo "Checking local branches against origin/"

for branch in $(git for-each-ref --format='%(refname:short)' refs/heads/); do
  if [ "$branch" == "$current_branch" ]; then
    echo "Skipping current branch: $branch"
    continue
  fi

  if git show-ref --quiet refs/remote/origin/$branch; then
    echo "Remote branch exists: $branch"
    continue
  fi

  last_commit_msg=$(git log -1 --pretty=format:"%s" "$branch")
  last_commit_author=$(git log -1 --pretty=format:"%an" "$branch")
    
  echo ""
  echo "  No remote branch found: $branch"
  echo "  Last commit: $last_commit_msg"
  echo "  Author: $last_commit_author"
  echo ""

  read -r -p "Delete local branch '$branch'? [y/N] " response
  case "$response" in
    [yY])
      git branch -D "$branch"
      echo "Deleted local branch: $branch"
      ;;
    *)
      echo "Skipped: $branch"
      ;;
  esac
done
