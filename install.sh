#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

# --- Symlink dotfiles ---
echo "Symlinking dotfiles from $DOTFILES_DIR..."

ln -sf "$DOTFILES_DIR/zshenv" ~/.zshenv
ln -sf "$DOTFILES_DIR/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/zsh_plugins.txt" ~/.zsh_plugins.txt
ln -sf "$DOTFILES_DIR/gitconfig" ~/.gitconfig

mkdir -p ~/.config
ln -sf "$DOTFILES_DIR/starship.toml" ~/.config/starship.toml

echo "Dotfiles linked."

# --- OS-specific setup ---
if [[ "$(uname)" == "Darwin" ]]; then
  bash "$DOTFILES_DIR/mac/install.sh"
elif [[ "$(uname)" == "Linux" ]]; then
  # bash "$DOTFILES_DIR/linux/install.sh"
fi

echo ""
echo "Done. Open a new terminal to get started."
