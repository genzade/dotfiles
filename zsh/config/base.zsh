# MY FUNCTIONS

# Make a directory and change into it in one command
mkcd () {
  mkdir -p "$@" && cd "$@"
}

# Redefine prompt_context for hiding user@hostname
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}
export DISABLE_AUTO_TITLE=true
# Editor of choice
export EDITOR='vim'

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Increase history size
export SAVEHIST=100000
export HISTSIZE=100000
