# TODO: fix errors
# Download zinit if not present
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d "$ZINIT_HOME"/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

HISTFILE=$HOME/.zsh_history

# # tweaking settings

# HISTSIZE=2147483647
# SAVEHIST=$HISTSIZE

# Share history between sessions
setopt SHARE_HISTORY     

# # # Beep in ZLE when a widget attempts to access a history entry which isn’t there.
# # setopt HIST_BEEP

# setopt HIST_EXPIRE_DUPS_FIRST
# setopt HIST_FCNTL_LOCK

# erase duplicates in history
setopt HIST_IGNORE_ALL_DUPS

# Don't save duplicate lines
setopt HIST_IGNORE_DUPS  
# Don't save when prefixed with space
setopt HIST_IGNORE_SPACE 
# setopt HIST_REDUCE_BLANKS

setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS

# setopt HIST_VERIFY

# Append to history file, don't overwrite it
setopt APPEND_HISTORY
# setopt EXTENDED_HISTORY
# setopt INC_APPEND_HISTORY

# setopt BRACE_CCL
# setopt LONG_LIST_JOBS
# setopt AUTO_LIST
# setopt MENU_COMPLETE
# setopt COMPLETE_ALIASES

# PLUGINS

# theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

# autosuggestions
zinit light zsh-users/zsh-autosuggestions

# syntax highlighting
zinit light zdharma/fast-syntax-highlighting

# fzf tab
# zinit light Aloxaf/fzf-tab

# vi mode
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# For postponing loading `fzf`
zinit ice lucid wait
zinit snippet OMZP::fzf

# zsh completion
zinit light zsh-users/zsh-completions

# fzf tab
zinit light Aloxaf/fzf-tab

# PLUGINS

# alacritty setup
fpath+=${ZDOTDIR:-~}/.zsh_functions

# fzf fuzzy finder (all hail https://github.com/junegunn)
# shellcheck disable=SC1091
[ -f "$HOME"/.fzf.zsh ] && source "$HOME"/.fzf.zsh

# ripgrep + fzf

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --follow --glob "!.git/*"'

export TERM="tmux-256color"

# Editor of choice
export EDITOR='nvim'
export GIT_EDITOR="$EDITOR"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Increase history size
export SAVEHIST=100000
export HISTSIZE=100000

export QMK_HOME="$HOME"/.config/qmk_firmware

export PKG_CONFIG_PATH="$(brew --prefix)/opt/ncurses/lib/pkgconfig"

if [[ "$(uname -s)" == "Darwin" ]]; then
  # check this article
  # https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
  export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo
fi

alias vi="nvim"
alias vim="nvim"
alias brow='arch --x86_64 /usr/local/homebrew/bin/brew'
alias ls="ls --color=auto"

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# MY FUNCTIONS
# shellcheck disable=SC1091
source "$HOME"/dotfiles/zsh/config/my-functions.zsh

# asdf
# shellcheck disable=SC1091
source "$HOME"/.asdf/asdf.sh

# append completions to fpath
# shellcheck disable=SC2206
fpath=("$HOME"/.zsh/completion $fpath)

# initialise completions with ZSH's compinit
autoload -Uz compinit
compinit

zinit cdreplay -q

# # Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] \
#   && [ -s "$BASE16_SHELL/profile_helper.sh" ] \
#     && source "$BASE16_SHELL/profile_helper.sh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Load .local file at the end for post configurations
# shellcheck disable=SC1091
[ -e "$HOME"/.zshrc.local ] && source "$HOME"/.zshrc.local

# Add `GOPATH/bin` directory to your `PATH` environment variable so you can run Go programs anywhere.
export PATH=$PATH:$(go env GOPATH)/bin

export PATH="/usr/local/sbin:$PATH"

eval "$(zoxide init --cmd cd zsh)"
