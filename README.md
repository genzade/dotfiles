# I Didn't Choose The DOTLife, THE DOTLife CHOSE ME!

This is my basic dotfile, I like to use vim with tmux in a z shell specifically
oh-my-zsh.

## setup

###...it's a beautiful DOTLife

Make sure your terminal is lookin' good. This [insert link to my powerline
setup] or check (this general guide)
[http://powerline.readthedocs.io/en/master/installation/osx.html]

## useful vim tips and tricks

### search and replace

Let's say you have some variable or keyword `foo` all over your project and you
decide you wanted to change `foo` to `bar`. You don't, however, want to open
every file that has `foo` and manually change it to `bar` mainly because you're
not a loser and I believe in you!

Simple - combine vim's args function with mileszs' 'ack' plugin to perfection.
Have a look at the following instructions...

```
:args `ag -l foo .`
```

Here we use `ag` to find occurrences of the word `foo` in our working directory
(note that we use the `-l` flag to list the files) and pass it into vim's
args.

```
:argdo %s/foo/bar/g | w
```

We then use vim's argdo function to do a global (`/g`) search (`%s`) and replace
as well as saving (writing) each file with `| w` and finally visit youtube to
research what the best microphone available to purchase on the market, make
the order and upon delivery of said microphone, drop that bad boy because your
search-and-replace-headache-having-days are done.
