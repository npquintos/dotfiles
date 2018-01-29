# dotfiles
These are my configuration files for zsh, vim, and tmux. They are integrated together to form a unified tool. To improve responsiveness, I tried avoiding plugins as much as I can. In the end, I am still left with the following plugins:

Vim: (place in ~/.vim/plugin)
  - auto-pairs.vim
  - tmux_navigator.vim
  - vimwiki.vim --> This is not necessary but I like this tool

Zsh: (place in ~/)
  - z.sh

In Vim, you do a vertical split with :vsp and horizontal split with :sp. I aliased these commands in .zshrc so that it does exactly the same thing while at tmux. You don't get to remember extra that way.
