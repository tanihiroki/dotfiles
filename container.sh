#!/usr/bin/env bash
set -euo pipefail

echo "[dotfiles] execute container.sh"

touch "$HOME/.containered"
echo "$HOME" > /tmp/dotfiles-home.txt

# コンテナ外（WSL単体など）なら何もしない
if [ ! -f /.dockerenv ] && [ ! -f /run/.containerenv ]; then
  echo "[dotfiles] not in container, skip"
  exit 0
fi

# ここからコンテナ向け処理
echo "[dotfiles] running in container"

# TARGET="$HOME/.claude"
# SRC="$(cd "$(dirname "$0")" && pwd)/.claude"

# mkdir -p "$TARGET"
# rsync -a --delete "$SRC"/ "$TARGET"/
echo "[dotfiles] synced $SRC -> $TARGET"