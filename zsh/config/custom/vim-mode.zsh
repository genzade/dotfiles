# vim style command line
#bindkey -v

#function zle-line-init zle-keymap-select {
  #RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
  #RPS2=$RPS1
  #zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select

bindkey -v

bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^R' history-incremental-search-backward

precmd() { RPROMPT="khjgfkajhsdgfakjhdfg" }
function zle-line-init zle-keymap-select {
  VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
  zle reset-prompt
}
#function zle-line-init zle-keymap-select {
  #VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
  #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
  #zle reset-prompt
#}

zle -N zle-line-init
zle -N zle-keymap-select
export KEYTIMEOUT=1
