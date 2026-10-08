export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

# zsh-syntax-highlighting must stay last
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Catppuccin Macchiato colours for zsh-syntax-highlighting (must load before the plugin)
source ~/.config/zsh/catppuccin_macchiato-zsh-syntax-highlighting.zsh

source $ZSH/oh-my-zsh.sh

export EDITOR='nvim'

# yazi: `y` opens yazi and cds into the folder you quit in
function y() {
	local tmp cwd; tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd" || builtin true
	command rm -f -- "$tmp"
}

alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias ng="nvim -c 'Neogit kind=replace'"

# Modern CLI replacements
# eza reads its theme from here; LS_COLORS (set by Oh My Zsh) is blanked so it doesn't override the theme
export EZA_CONFIG_DIR="$HOME/.config/eza"
alias ls="LS_COLORS= eza --icons --git --group-directories-first"
alias ll="LS_COLORS= eza -lh --icons --git --group-directories-first --binary --color-scale"
alias la="LS_COLORS= eza -lah --icons --git --group-directories-first --binary --color-scale"
alias tree="LS_COLORS= eza --tree --level=3 --icons --git"
alias cat="bat"

# fzf: Ctrl-R history search, Ctrl-T file picker, Alt-C cd into a folder
# Catppuccin Macchiato colours, background left out so Ghostty's transparency shows
export FZF_DEFAULT_OPTS=" \
--color=bg+:#363A4F,spinner:#F4DBD6,hl:#ED8796 \
--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
--color=selected-bg:#494D64 \
--color=border:#6E738D,label:#CAD3F5 \
--layout=reverse --border"
# use fd for listing: faster, includes dotfiles, skips .git and .gitignore'd files
export FZF_DEFAULT_COMMAND="fd --type f --hidden --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d --hidden --exclude .git"
_fzf_compgen_path() { fd --hidden --exclude .git . "$1" }
_fzf_compgen_dir() { fd --type d --hidden --exclude .git . "$1" }
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:300 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --level=2 --icons --color=always {}'"
source <(fzf --zsh)

source "$HOME/.config/broot/launcher/bash/br"
[[ -z "$TMUX" ]] && fastfetch

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
