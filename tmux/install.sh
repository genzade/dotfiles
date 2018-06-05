#!/bin/sh

echo '---------INSTALLATION-SCRIPT---------\n'

echo '\n\n---------------\ninstalling tmux\n---------------\n\n'
if [[ "$(uname)" == "Darwin" ]]; then

  # tmux installation
cat << ShellMessage
------------------------------------
                     installing tmux
------------------------------------
ShellMessage
  brew install tmux

cat << ShellMessage

done!
ShellMessage

  # tmux plugin manager setup
cat << ShellMessage
------------------------------------
      setting up tmux plugin manager
------------------------------------
ShellMessage

  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


cat << ShellMessage

done!
ShellMessage

  # ReattachToUserNamespace installation
cat << ShellMessage
------------------------------------
  installing ReattachToUserNamespace
------------------------------------
ShellMessage
  brew install reattach-to-user-namespace

cat << ShellMessage

done!
ShellMessage

fi
