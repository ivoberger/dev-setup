# --- Early PATH setup ---
export PATH="$HOME/.local/bin:$HOME/.fzf/bin:$PATH"

# --- Auto-update check (every 28 days) ---
_UPDATE_STAMP="${XDG_CACHE_HOME:-$HOME/.cache}/zsh_update_stamp"
_UPDATE_INTERVAL=$((28 * 24 * 60 * 60))

function _check_updates() {
  local now=$(date +%s)
  local last_update=0

  if [[ -f "$_UPDATE_STAMP" ]]; then
    last_update=$(cat "$_UPDATE_STAMP")
  fi

  if (( now - last_update > _UPDATE_INTERVAL )); then
    echo "It's been a while since your shell plugins were updated."
    echo -n "Run updates now? [Y/n] "
    read -r answer
    if [[ -z "$answer" || "$answer" =~ ^[Yy]$ ]]; then
      echo "Updating antidote plugins..."
      antidote update
      echo "$now" > "$_UPDATE_STAMP"
      echo "All updates complete."
    else
      echo "$now" > "$_UPDATE_STAMP"
    fi
  fi
}

_check_updates
unfunction _check_updates

# --- Source local config (before compinit so local fpath entries are picked up) ---
[[ -f ~/.env.zsh ]] && source ~/.env.zsh
[[ -f ~/.local.env.zsh ]] && source ~/.local.env.zsh

# --- Completion (must be before antidote load) ---
autoload -Uz compinit && compinit

# --- Antidote plugin manager ---
# Bootstrap antidote if not installed
ANTIDOTE_HOME="${ZDOTDIR:-$HOME}/.antidote"
if [[ ! -d "$ANTIDOTE_HOME" ]]; then
  git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_HOME"
fi
source "$ANTIDOTE_HOME"/antidote.zsh

# Load plugins from ~/.zsh_plugins.txt
antidote load

# --- Prompt ---
eval "$(starship init zsh)"

# --- fzf ---
if command -v fzf &>/dev/null; then
  if [[ $(fzf --version | cut -d. -f1-2 | tr -d .) -ge 048 ]]; then
    eval "$(fzf --zsh)"
  else
    # Older fzf: source scripts directly
    [[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
  fi
fi

# --- direnv ---
eval "$(direnv hook zsh)" 2>/dev/null

# --- zoxide ---
eval "$(zoxide init zsh)" 2>/dev/null

# --- PATH ---
path=(~/bin ~/.yarn/bin $path)

# --- Environment ---
export GPG_TTY=$TTY
export NVM_COMPLETION=true
export NVM_AUTO_USE=true
[[ "$(uname)" == "Linux" ]] && export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
unset BROWSER

# --- Key bindings ---
# Backward kill word
bindkey '^H' backward-kill-word        # Ctrl+Backspace / Ctrl+H
bindkey '^[^?' backward-kill-word      # Ctrl+Alt+Backspace

# History substring search (Up/Down after typing)
bindkey '^[[A' history-substring-search-up    # Up arrow
bindkey '^[[B' history-substring-search-down  # Down arrow

# Undo/redo
bindkey '^/' undo                      # Ctrl+/
bindkey '^[/' redo                     # Alt+/

# --- Autoload ---
autoload -Uz zmv

# --- Functions ---
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# --- Aliases ---
alias tree='tree -a -I .git'
alias ls="${aliases[ls]:-ls} -A"

# --- Shell options ---
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu

# --- Bun ---
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
