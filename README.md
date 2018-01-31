# dotfiles
These are my configuration files for zsh, vim, and tmux. They are integrated together to form a unified tool. My aims are as follows:
- less plugins as possible to enhance speed
- less memorization of keystrokes by using the same keystrokes while inside vim or at tmux.
- Frequently used keys must be keys that are easy to type

The following plugins are necessary for these configuration files to work properly.

Vim: (place in ~/.vim/plugin)
  - auto-pairs.vim
  - tmux_navigator.vim
  - fugitive.vim --> needs git installation. This plugin is optional
  - vimwiki.vim --> This is not necessary but I like this tool
  
NerdTree is popular but I find myself just doing ":e ." most of the time and are sufficient for my needs. If I need to edit a particular file, ":find -R filepattern", followed by selection, is also good enough for me.

Zsh: (place in ~/)
  - z.sh

I  set .zshrc so that you are automatically inside tmux when you open a new terminal and it attaches itself automatically from the last tmux session.

Modified Tmux commands:
:vsp - to split tmux panel vertically, similar to your command inside vim
:sp  - to split tmux panel horizontally, similar to vim command
C-h  - go to left panel - similar behavior while inside vim
C-j  - go to panel below - similar behavior while inside vim
C-k  - go to panel above - similar behavior while inside vim
C-l  - go to panel to the right - similar behavior while inside vim
C-\[p - go to previous tmux window
ESC-p - to to previous tmux window
:ls  - list tmux sessions

