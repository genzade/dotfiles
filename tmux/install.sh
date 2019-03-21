#!/bin/sh

cat << Output
------------------------------------
                 tmux install script
------------------------------------
Output

if [[ "$(uname)" == "Darwin" ]]; then

  # tmux installation
cat << Output
                                    ------------------------------------
                                    installing tmux
                                    ------------------------------------
Output
  # brew install tmux

cat << Output
------------------------------------
                               done!
------------------------------------
Output

  # tmux plugin manager setup
cat << Output
------------------------------------
      setting up tmux plugin manager
------------------------------------
Output

  # git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


cat << Output
------------------------------------
                               done!
------------------------------------
Output

  # ReattachToUserNamespace installation
cat << Output
                                    ------------------------------------
                                    installing ReattachToUserNamespace
                                    ------------------------------------
Output
  # brew install reattach-to-user-namespace

cat << Output
------------------------------------
                               done!
------------------------------------
Output

fi
