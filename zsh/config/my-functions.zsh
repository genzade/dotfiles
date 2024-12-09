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
  git checkout $(
    git branch --sort=-committerdate | fzf \
      --header="------- Checkout branch" \
      --preview "git diff --color=always {1} "  \
      --bind "ctrl-d:preview-page-down,ctrl-u:preview-page-up" \
      --pointer=" "
  )
}

gbD() {
  git branch -D $(
    git branch --sort=-committerdate | fzf \
      --header="------- Delete branch" \
      --preview "git diff --color=always {1} "  \
      --bind "ctrl-d:preview-page-down,ctrl-u:preview-page-up" \
      --pointer=" "
  )
}

rbsme() {
  local branch="${1:-main}"
  # TODO: consider changing to this
  # local branch="$(git branch -rl '*/HEAD' | awk -F/ '{print $NF}')"

  git checkout "$branch" &&
    git pull &&
    git rev-parse HEAD | tr -d '\n' | pbcopy &&
    git checkout - &&
    git rebase -i $(pbpaste)
}

# git checkout helper
gco() {
  git checkout "$@"
}

gcob() {
  git checkout -b "$@"
}

gst() {
  git status
}

gd() {
  git diff "$@"
}

fvi() {
  vim $(
    fzf \
      --header="------ Choose file to open in $EDITOR" \
      --preview="if [[ -f {} ]];then bat --style=full --color=always {};elif [[ -d {} ]];then tree -C -L 2 {} | head -200;else echo {}; fi" \
      --bind "ctrl-d:preview-page-down,ctrl-u:preview-page-up" \
      --pointer=" "
  )
}

s() {
  source ~/.zshrc
}

lzg() {
  lazygit
}

lzd() {
  lazydocker
}
