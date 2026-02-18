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

# --- Install tools ---
function _ensure_installed() {
  local name="$1" check_cmd="$2" install_cmd="$3"
  if command -v "$check_cmd" &>/dev/null; then
    echo "[$name] already installed."
  else
    echo ""
    echo -n "Install $name? [Y/n] "
    read -r answer
    if [[ -z "$answer" || "$answer" =~ ^[Yy]$ ]]; then
      eval "$install_cmd"
    else
      echo "Skipping $name."
    fi
  fi
}

echo ""
echo "Checking tool dependencies..."

_ensure_installed "starship" "starship" \
  'curl -sS https://starship.rs/install.sh | sh -s -- -y'

_ensure_installed "fzf" "fzf" \
  'git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install --all --no-bash --no-fish'

_ensure_installed "direnv" "direnv" \
  'curl -sfL https://direnv.net/install.sh | bash'

_ensure_installed "zoxide" "zoxide" \
  'curl -sSf https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh'

echo ""
echo "Done. Open a new terminal to get started."
