# Make a directory and change into it in one command
mkcd() {
  mkdir -p -- "$@" && cd -- "$@" || return
}

# quickly resolve merge conflicts, opens files in vim buffer
vimfix() {
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
  local branch
  branch=$(
    git branch --sort=-committerdate | fzf \
      --header="------- Checkout branch" \
      --preview="git diff --color=always {1}" \
      --bind="ctrl-d:preview-page-down,ctrl-u:preview-page-up" \
      --pointer=" "
  )
  [ -n "$branch" ] && git checkout "${branch//[[:space:]]/}"
}

gbD() {
  # Select branches to delete using fzf
  local branches
  branches="$(
    git for-each-ref --format='%(refname:short)' --sort=-committerdate refs/heads/ | fzf \
      --header="------- Delete branch" \
      --multi \
      --preview "git diff --color=always {1}" \
      --bind "ctrl-d:preview-page-down,ctrl-u:preview-page-up" \
      --pointer=" "
  )"
  # Only delete if a branch was selected
  [ -n "$branches" ] && git branch -D "$branches"
}

rbsme() {
  # Determine the branch to use: argument, or default branch if not provided
  local branch="${1:-$(git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null | awk -F/ '{print $2}')}"
  [ -z "$branch" ] && branch="main"

  # Checkout branch and pull latest changes
  git checkout "$branch" && git pull || return 1

  # Save current commit hash
  local commit_hash
  commit_hash=$(git rev-parse HEAD) || return 1

  # Return to previous branch and start interactive rebase
  git checkout - && git rebase -i "$commit_hash"
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

# Fuzzy-find and open files in $EDITOR with preview
_fzf_preview() {
  if [ -f {} ]; then
    bat --style=full --color=always {}
  elif [ -d {} ]; then
    tree -C -L 2 {} | head -200
  else
    echo {}
  fi
}

fvi() {
  local file
  file="$(
    fzf \
      --header="------ Choose file to open in $EDITOR" \
      --multi \
      --preview=" _fzf_preview()" \
      --tmux 80% \
      --bind "ctrl-d:preview-page-down,ctrl-u:preview-page-up" \
      --pointer=" "
  )" || return
  [ -n "$file" ] && "$EDITOR" "$file"
}

s() {
  source "$ZSHRC"
}

tvim() {
  # for running a separate instance of neovim with its own config, for testing purposes only
  NVIM_APPNAME='tvim' nvim "$@"
}
