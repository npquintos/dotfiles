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

 - **:vsp**/**:sp**  (take note of the : prefix) will create vertical/horizontal splits within vim if you are inside vim and in the window if you are outside vim

 -  **Ctrl-h**/**j**/**k**/**l**  will seamlessly move you between panes, and vim splits

 -  **Alt-h**/**j**/**k**/**l**  will increase/decrease pane size based on direction

 -  **exit** will destroy that pane.

 -  **Esc p** (or **Ctrl-\[ p**) will place you to the previous window if there is one

 -  **Alt-p**/**n** will place you to the previous/next window if there is one

 -  **Ctrl-b c** will create a new window (and prompt you for a window name)

 -  **Ctrl-b d** will detach you from that window session (but saves that session so that you could go back in). Or, you could just close the window via x at the upper right corner.

 -  **:lsw** lists all windows in this current session

 -  **:lss** lists all session

 -  **:win \<window name or :index\>** jumps to that named window or index. **Window name** could be partial for as long as it is unique; tmux will try to find a match.
  


