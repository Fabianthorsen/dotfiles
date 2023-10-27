# Fabianthorsen's dotfiles
## Requirements
- Assumes that the shell is `zsh`
- To automatically generate symlinks use [dotbot](https://github.com/anishathalye/dotbot)
- `pip install dotbot`

## Setup
- From `dotfiles/` run `dotbot -c install.conf.yaml` to build links and directories
- Install [tmux plugin manager](https://github.com/tmux-plugins/tpm) by running `git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm`
- To install tmux plugins press `Ctrl + a` and `I` (captial `i`)

## Usage
- To add new plugins to `oh-my-zsh` or similar, add them as submodules into their plugin folders
- `oh-my-zsh` by default has `ZSH_CUSTOM=${HOME}/.oh-my-plugins` which is linked to `dotfiles/zsh/plugins`
