# Dev Setup

A collection of shell scripts and dotfiles to set up a new system as painlessly as possible.

## Dotfiles

Run the install script to symlink everything into place:

```bash
./dotfiles/install.sh
```

## Shell Stack

| Component | Tool | Purpose |
|---|---|---|
| Plugin manager | [antidote](https://getantidote.github.io/) | Installs and loads zsh plugins |
| Prompt | [Starship](https://starship.rs/) | Cross-shell prompt |
| Fuzzy finder | [fzf](https://github.com/junegunn/fzf) | Fuzzy search for history (Ctrl+R), files (Ctrl+T), directories (Alt+C) |
| Directory jumper | [zoxide](https://github.com/ajeetdsouza/zoxide) | Smart `cd` replacement (`z <partial-name>`) |
| Env management | [direnv](https://direnv.net/) | Auto-loads `.envrc` files per directory |
| Node manager | [fnm](https://github.com/Schniz/fnm) | Fast Node.js version manager |

Tools are installed interactively when running `./dotfiles/install.sh`.
An update check runs every 28 days on shell launch.

## Plugins

Managed via antidote in `dotfiles/zsh_plugins.txt`:

- **zsh-autosuggestions** -- inline command suggestions from history
- **zsh-syntax-highlighting** -- syntax highlighting as you type
- **zsh-completions** -- additional tab completions for common tools
- **zsh-history-substring-search** -- Up/Down arrows search history by substring
- **zsh-safe-rm** -- prevents dangerous `rm` operations
- **zsh-fnm** -- auto-switches Node version on `cd`
- **zsh-better-npm-completion** -- improved npm tab completion

## Machine-Specific Config

Create `~/.local.env.zsh` for machine-specific environment variables, PATH entries, and completions. This file is sourced before plugins load and is not committed to the repo.
