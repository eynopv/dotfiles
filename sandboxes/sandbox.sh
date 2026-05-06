#!/usr/bin/env bash

set -eo pipefail

# 1. Immediate validation
image="$1"
if [[ -z "$image" ]]; then
  echo "Usage: $0 {pi|gemini} [dir]"
  exit 1
fi

# 2. Pathing and Defaults
coder_home="/home/coder"
target_dir="${2:-.}"
abs_path=$(realpath "$target_dir")
workspace_root=$(pwd)

volumes=(
  -v "$workspace_root:$coder_home/workspace"
  -v "$HOME/.agents:$coder_home/.agents"
  -v "$HOME/.cache/agent-docker:/tmp/.cache"
)

envs=(
  -e HOME="$coder_home"
  -e TERM="$TERM"
  -e COLORTERM=truecolor
)

# 3. Worktree Logic
if [[ -f "$abs_path/.git" ]] && grep -q "gitdir" "$abs_path/.git"; then
  if [[ -z "$2" ]]; then
    echo "Error: Worktree detected. You must pass the directory path explicitly."
    echo "Usage: $0 $image ./your-worktree-folder"
    exit 1
  fi

  worktree_name=$(basename "$(sed 's/gitdir: //' "$abs_path/.git")")
  container_worktree="$coder_home/workspace/$(basename "$abs_path")"
  envs+=(
    -e GIT_DIR="$coder_home/workspace/.bare/worktrees/$worktree_name"
    -e GIT_COMMON_DIR="$coder_home/workspace/.bare"
    -e GIT_WORK_TREE="$container_worktree"
    -e GIT_CONFIG_PARAMETERS="'core.bare=false' 'safe.directory=*'"
  )
  workdir="$container_worktree"
else
  workdir="$coder_home/workspace"
fi

# 4. Image-Specific Logic
case "$image" in
  pi)
    volumes+=(-v "$HOME/.pi:$coder_home/.pi")
    ;;
  gemini)
    volumes+=(-v "$HOME/.gemini:$coder_home/.gemini")
    envs+=(-e GOOGLE_CLOUD_PROJECT="${GOOGLE_CLOUD_PROJECT:-}")
    ;;
  *)
    echo "Error: Unknown image '$image'"
    exit 1
    ;;
esac

# 5. Execute
docker run --rm -it \
  --user "$(id -u):$(id -g)" \
  --network=host \
  -w "$workdir" \
  "${envs[@]}" \
  "${volumes[@]}" \
  "$image"
