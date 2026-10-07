# Run `just` to list recipes. Recipes run from this folder (~/dotfiles).

omz_custom := env("HOME") / ".oh-my-zsh/custom/plugins"

# list recipes
default:
    @just --list

# full setup on a new Mac: Homebrew packages, links, Oh My Zsh, yazi theme
# (link runs before omz so the Oh My Zsh installer keeps our .zshrc instead of writing its own)
install: brew link omz
    ya pkg install

# install everything in the Brewfile
brew:
    brew bundle --file=Brewfile

# refresh the Brewfile from what's installed now
brew-dump:
    brew bundle dump --force --file=Brewfile
    @echo "Brewfile updated. Note: re-add 'cask \"ghostty\"' if it was installed outside Homebrew."

# show Homebrew packages installed here but missing from the Brewfile
brew-check:
    brew bundle cleanup --file=Brewfile || true

# install Oh My Zsh and its custom plugins (skips what's already there)
omz:
    #!/usr/bin/env bash
    set -euo pipefail
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        RUNZSH=no KEEP_ZSHRC=yes sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
    for plugin in zsh-autosuggestions zsh-syntax-highlighting; do
        [ -d "{{omz_custom}}/$plugin" ] || git clone --depth 1 "https://github.com/zsh-users/$plugin" "{{omz_custom}}/$plugin"
    done

# link every package into $HOME
link:
    stow -v -t ~ */

# preview what `link` would do, without changing anything
link-check:
    stow -n -v -t ~ */

# remove all links (files stay in this repo)
unlink:
    stow -v -D -t ~ */
