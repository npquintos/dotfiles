# dotfiles
These are my configuration files for zsh, vim, and tmux. Simply rename them with a dot '.' in front and save them in your home directory.They are integrated together to form a unified tool. My aims are as follows:
- less plugins as possible to enhance speed
- less memorization of keystrokes by using the same keystrokes while inside vim or at tmux.
- Frequently used keys must be keys that are easy to type

The following plugins are necessary for these configuration files to work properly.

Vim: (place in ~/.vim/plugin)
  - [auto-pairs.vim](https://github.com/jiangmiao/auto-pairs)
  - [tmux_navigator.vim](https://github.com/christoomey/vim-tmux-navigator)
  - [fugitive.vim](https://github.com/tpope/vim-fugitive) --> needs git installation. This plugin is optional
  - [vimwiki.vim](https://github.com/vimwiki/vimwiki) --> This is not necessary but I like this tool
  
NerdTree is popular but I find myself just doing ":e ." most of the time and are sufficient for my needs. If I need to edit a particular file, ":find filenamepattern", followed by selection via TAB, is also good enough for me.

Zsh: (place in ~/)
  - [z.sh](https://github.com/rupa/z) - remembers previously visited directories and allows you to go there without typing the complete path.

I  set .zshrc so that you are automatically inside tmux when you open a new terminal and it attaches itself automatically from the last tmux session. The automatically created tmux session is \<username\>_session. If your username is **john**, the session name would be **john_session**. If such session already exists, it will re-attach to it. If that session does not exist, it will create a new one with that name.

## Regular Tmux commands:
The default leader, C-b was left unchanged and all regular command should still work:
 -  **Ctrl-b c** will **c**reate a new window (and prompt you for a window name)
 
 -  **Ctrl-b d** will **d**etach you from that window session (but saves that session so that you could go back in). Or, you could just close the window via **x** at the upper right window corner
 
  -  **Ctrl-b $** will change the **s**ession name
  
  -  **Ctrl-b ,** will change the window name
  
  -  **exit** will destroy that pane.
  
## Customized Tmux commands:
 - **:vsp**/**:sp**  (take note of the **:** prefix) will create vertical/horizontal splits within vim if you are inside vim and in the window if you are outside vim

-  **Ctrl-h**/**j**/**k**/**l**  will seamlessly move you between panes, and vim splits. You need not worry whether you are inside or outside of vim; behavior is consistent.

 -  **Alt-h**/**j**/**k**/**l**  will increase/decrease pane size based on direction

 -  **Esc p** (or **Ctrl-\[ p**) will place you to the **p**revious window if there is one

 -  **Alt-p**/**n** will place you to the **p**revious/**n**ext window if there is one

 -  **:lsw** lists all **w**indows in this current session

 -  **:lss** lists all **s**ession

 -  **:win \<window name or :index\>** jumps to that named window or index. **Window name** could be partial for as long as it is unique; tmux will try to find a match. For example, if you have a window name (within that tmux session) called **programming**, you could type **:win prog** \<Enter\> and it should place you to that window.
  


