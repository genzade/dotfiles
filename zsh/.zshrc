# TODO: fix errors
# Download zinit if not present
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d "$ZINIT_HOME" ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d "$ZINIT_HOME"/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

# PLUGINS

# theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure

zinit ice lucid wait for 'fzf-tab'
zinit light Aloxaf/fzf-tab

autoload -Uz compinit && compinit # initialise completions with ZSH's compinit

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit light zsh-users/zsh-completions

# vi mode
zinit ice depth=1 ; zinit light jeffreytse/zsh-vi-mode

# For postponing loading `fzf`
zinit ice lucid wait ; zinit snippet OMZP::fzf

zinit cdreplay -q

zle_highlight+=(paste:none)

HISTFILE=$HOME/.zsh_history

setopt SHARE_HISTORY # Share history between sessions
setopt HIST_IGNORE_ALL_DUPS # erase duplicates in history
setopt HIST_IGNORE_DUPS  # Don't save duplicate lines
setopt HIST_IGNORE_SPACE # Don't save when prefixed with space
setopt HIST_SAVE_NO_DUPS # Don't save duplicates
setopt HIST_FIND_NO_DUPS # Don't find duplicates
setopt APPEND_HISTORY # Append to history file, don't overwrite it

# Completion
setopt AUTO_MENU
setopt ALWAYS_TO_END
setopt COMPLETE_IN_WORD
unsetopt FLOW_CONTROL
unsetopt MENU_COMPLETE

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# # alacritty setup
# fpath+=${ZDOTDIR:-~}/.zsh_functions

# # shellcheck disable=SC1091
# [ -f "$HOME"/.fzf.zsh ] && source "$HOME"/.fzf.zsh

# ripgrep + fzf

# --files: List files that would be searched but do not search
# --no-ignore: Do not respect .gitignore, etc...
# --hidden: Search hidden files and folders
# --follow: Follow symlinks
# --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden --glob "!.git/*"'
export TERM="tmux-256color"
export EDITOR='nvim' # Editor of choice
export GIT_EDITOR="$EDITOR"
export UPDATE_ZSH_DAYS=13
export SAVEHIST=100000
export HISTSIZE=100000
export QMK_HOME="$HOME"/.config/qmk_firmware
export PKG_CONFIG_PATH="$(brew --prefix)/opt/ncurses/lib/pkgconfig"
export ZSHRC="$HOME"/.zshrc

if [[ "$(uname -s)" == "Darwin" ]]; then
  # check this article
  # https://gpanders.com/blog/the-definitive-guide-to-using-tmux-256color-on-macos/
  export TERMINFO_DIRS=$TERMINFO_DIRS:$HOME/.local/share/terminfo
fi

alias vi="$EDITOR"
alias vim="$EDITOR"
alias brow="arch --x86_64 /usr/local/homebrew/bin/brew"
alias ls="ls --color=auto"
alias lzg="lazygit"
alias lzd="lazydocker"

# shellcheck disable=SC1091
source "$HOME"/dotfiles/zsh/config/my-functions.zsh # MY FUNCTIONS

# # shellcheck disable=SC1091
# source "$HOME"/.asdf/asdf.sh

# # append completions to fpath
# # shellcheck disable=SC2206
# fpath=("$HOME"/.zsh/completion $fpath)

# # Base16 Shell
# BASE16_SHELL="$HOME/.config/base16-shell/"
# [ -n "$PS1" ] \
#   && [ -s "$BASE16_SHELL/profile_helper.sh" ] \
#     && source "$BASE16_SHELL/profile_helper.sh"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# Load .local file at the end for post configurations
# shellcheck disable=SC1091
[ -e "$HOME"/.zshrc.local ] && source "$HOME"/.zshrc.local

# # Add `GOPATH/bin` directory to your `PATH` environment variable so you can run Go programs anywhere.
# export PATH=$PATH:$(go env GOPATH)/bin

export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/bin:$PATH"
export ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"

# Add LUA_PATH to the environment ensuring the lua version is set since
# luarocks from homebrew uses lua 5.4 by default so would otherwise add the
# wrong path
if which luarocks >/dev/null; then
  eval "$(luarocks --lua-version=5.1 path)"
fi

eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"
