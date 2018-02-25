# Make a directory and change into it in one command
mkcd () {
  mkdir -p "$@" && cd "$@"
}

# quickly resolve merge conflicts, opens files in multiple tabs
# (remember that vim only allows 10 tabs to be open at one time)
vimfix () {
  vim -p $(git status | grep 'both modified' | cut -d: -f2)
}

# Redefine prompt_context for hiding user@hostname
prompt_context() {
  if [[ "$USER" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$USER"
  fi
}

# choose which branch to checkout/delete with fuzzy-finder (fzf)
# make sure junegunn's awesome fzf plugin is installed
gcgb() {
  git checkout $(git branch | fzf)
}

gbD() {
  git branch -D $(git branch | fzf)
}

rbsme() {
  gcm && gl && git rev-parse HEAD | tr -d '\n' | pbcopy && gco - && grbi $(pbpaste)
}

fvi() {
  vim $(fzf)
}

soz() {
  source ~/.zshrc
}
