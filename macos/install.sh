#!/bin/bash
set -e

DOTFILES_DIR="$(cd "$(dirname "$0")/.." && pwd)"

# --- Homebrew ---
if ! command -v brew &>/dev/null; then
  echo ""
  echo -n "Install Homebrew? [Y/n] "
  read -r answer
  if [[ -z "$answer" || "$answer" =~ ^[Yy]$ ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  else
    echo "Skipping Homebrew — cannot install packages without it."
    exit 0
  fi
else
  echo "[brew] already installed."
fi

# --- Packages from packages.txt ---
echo ""
echo "Installing packages from packages.txt..."

TO_INSTALL=()

while IFS= read -r line; do
  [[ "$line" =~ ^#.*$ || -z "$line" ]] && continue
  pkg=$(echo "$line" | awk '{print $1}')
  platform=$(echo "$line" | awk '{print $2}')
  [[ "$platform" == "linux" ]] && continue
  if brew list "$pkg" &>/dev/null; then
    echo "[$pkg] already installed."
  else
    TO_INSTALL+=("$pkg")
  fi
done < "$DOTFILES_DIR/packages.txt"

if [[ ${#TO_INSTALL[@]} -gt 0 ]]; then
  echo ""
  echo "Packages to install: ${TO_INSTALL[*]}"
  echo -n "Install all? [Y/n] "
  read -r answer
  if [[ -z "$answer" || "$answer" =~ ^[Yy]$ ]]; then
    brew install "${TO_INSTALL[@]}"
  else
    echo "Skipping packages."
  fi
fi

echo ""
echo "Done. Open a new terminal to get started."
