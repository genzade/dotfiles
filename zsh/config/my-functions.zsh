# Make a directory and change into it in one command
mkcd () {
  mkdir -p "$@" && cd "$@"
}

# quickly resolve merge conflicts, opens files in vim buffer
vimfix () {
  vim $(git status | grep 'both modified' | cut -d: -f2)
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
  git checkout master &&
    git pull &&
    git rev-parse HEAD | tr -d '\n' | pbcopy &&
    git checkout - &&
    git rebase -i $(pbpaste)
}

fvi() {
  vim $(fzf)
}

s() {
  source ~/.zshrc
}
