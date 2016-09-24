# Install Powerline
First things first

`pip install powerline-status`

Check where it is (just to be sure and to access the various configs) with;

`pip show powerline-status`

## VIM
Follow [this](https://coderwall.com/p/yiot4q/setup-vim-powerline-and-iterm2-on-mac-os-x) guide for vim. One note about
this guide being that powerline is now unified and on github is no longer under lokaltog (check longlivechief's comment
in this guide) and thus instead of `Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}` put
`Bundle 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}` Vundler (or your vim plugin manager of choice, I use
Vundler and I'm not saying you should use Vundler but you should use Vundler)

## TMUX
In your `.tmux.conf` file put the following line

`source /usr/local/lib/python2.7/site-packages/powerline/bindings/tmux/powerline.conf`
