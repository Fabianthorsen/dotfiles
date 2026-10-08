# dotfiles

Each top-level folder is a [GNU Stow](https://www.gnu.org/software/stow/) package that mirrors `$HOME`,
e.g. `ghostty/.config/ghostty/config.ghostty` → `~/.config/ghostty/config.ghostty`.

Files are symlinked into place, so editing `~/.zshrc` or anything in `~/.config/<app>` edits this repo.

## Day to day

```sh
cd ~/dotfiles
git status          # see what changed
git add -A && git commit -m "describe the change"
```

Installed something new with Homebrew? Run `just brew-dump` to record it in the `Brewfile`.

New app to track (example: `lazygit`):

```sh
mkdir -p ~/dotfiles/lazygit/.config
mv ~/.config/lazygit ~/dotfiles/lazygit/.config/
cd ~/dotfiles && just link
```

Run `just` to see all recipes.

## New Mac

1. Get this repo to `~/dotfiles` (clone it, or copy the folder over).
2. Install Homebrew and `just`, then run the full setup:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install just
cd ~/dotfiles && just install
```

`just install` installs the `Brewfile`, links everything with stow, installs Oh My Zsh and its plugins,
installs tpm and the tmux plugins, and downloads the yazi theme. If `link` complains about existing files, an app already created its own config;
move it out of the way and run `just link` again (`just link-check` previews without changing anything).

Still manual:
- MonoLisa font (licensed)
- macOS permissions for AeroSpace and Ghostty
- SSH key for GitHub (`.gitconfig` sends GitHub traffic over SSH)

## Not tracked on purpose

- `~/.config/exercism/` — contains an API token
- `~/.config/anthropic/`, `~/.config/.claude/` — app state
