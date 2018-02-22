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

## Regular Tmux key bindings:
The default leader, C-b was replaced with ` (backtick character) due to conflict of the former with vim key binding.

 -  **`c** will **c**reate a new window (and prompt you for a window name)
 
 -  **`d** will **d**etach you from that window session (but saves that session so that you could go back in). Or, you could just close the window via **x** at the upper right window corner
 
  -  **`$** will change the **s**ession name
  
  -  **`,** will change the window name
  
  -  **exit** will destroy that pane.
  
## Customized Tmux key bindings:

-  **Ctrl-h**/**j**/**k**/**l**  will seamlessly move you between panes, and vim splits. You need not worry whether you are inside or outside of vim; behavior is consistent.

 -  **Alt-h**/**j**/**k**/**l**  will increase/decrease pane size based on direction

 -  **Esc p** (or **Ctrl-\[ p**) will place you to the **p**revious window if there is one

 -  **Alt-p**/**n** will place you to the **p**revious/**n**ext window if there is one
 
 ## The following aliases are in .zshrc but affects the tmux behavior. 
 
 For consistency, all commands affecting tmux are preceded by **:** 
 
 Attempts are made to make the command look like vim.
 
 - **:vsp**/**:sp**  (take note of the **:** prefix) will create vertical/horizontal splits within vim if you are inside vim and in the window if you are outside vim

 -  **:lsw** lists all **w**indows in this current session

 -  **:lss** lists all **s**ession
 
 -  **:q** kill pane where you are at (**q**uit). similar to **exit** or **Ctrl-b x** Same command you use when quitting a pane in vim.
 
 -  **:qw** kill window where you are at (**q**uit **w**indow). It will ask for confirmation
 
 -  **:qt** detach the session where you are at (**q**uit **t**mux).
  
 -  **:qs** detach the session where you are at (**q**uit **s**ession). This is the same as **:qt**

 -  **:win \<window name or :index\>** jumps to that named window or index. **Window name** could be partial for as long as it is unique; tmux will try to find a match. For example, if you have a window name (within that tmux session) called **programming**, you could type **:win prog** \<Enter\> and it should place you to that window.
 -  **:vi** enters you to copy mode while in tmux pane - alternative to the usual Ctrl-b \[ sequence
 
 -  **:so** **so**urces or reload the .tmux.conf file
 
 -  **`p** - **p**aste the string from the buffer after yanking that string while in tmux vi-copy mode.

## Customized vim key bindings:
 - \<leader\> is **;**
  
 - **\<leader\>\<leader\>** will convert that line into a comment (bash, zsh or python style)
  
 - **\<leader\>ha** will print **################################################################################** 
 
    **ha** stands for **ha**sh
 
 - **\<leader\>dt** will insert date at current location
  
 - **\<leader\>'** will try to place the word under the cursor inside '  '. Will also work with {(\[" by preceeding them with \<leader\>
  
 - **\<leader\>m** will remove the **^M** characters from files coming from MSDOS.
  
 - **\<space\>** will unhighlight selection or matches
  
 - **^**, which is the start of line, is remapped to **B**
 
 - **$**, which is the end of the line, is rempapped to **E**
 
 - **\<leader\>n** will cycle through the **n**ext buffers (or files in the memory).
 
 - **C-p** will run **p**ython against the current file.
 
 - **C-i** will **i**ncrease the column width of the pane
 
 - **C-d** will **d**ecrease the column width of the pane
 
 - **T** will place the current line to the **T**op of the display
  
  - **U** will change the word under the cursor to **U**ppercase
  
Previously highlighted lines via **V** will not un-highlight after doing a **>>** or **<<** so that you could continue indenting or un-indenting without having to highlight them again.

If you want to edit another file, say, a python file, but you don't remember the exact name nor the exact directory location but you are sure it is on one of the directory from where you open vim, you could do:

**:find \*.py\<TAB\>** , then tab through the list until you find the one you are looking for, then hit \<ENTER\>

## zsh prompt

Format of zsh prompt is:

**/path/to/your/current/working/directory (git_branch_you_are_in  ●  no_of_uncommited_untracked_deleted_added_files)**


**⊳  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;username@hostname**


If you are not in a git repository, the branch name would not show up. If you are in a git repository, the current branch name would show up in white font, together with the total number of untracked, modified, added, and deleted files, **if any**. You will see a large dot, followed by number of affected files in red font so that you don't miss it. Once you do a commit, this large dot, together with the number, will be gone and only the branch name remains. This is to remind you before changing branch that there are uncommited files which could be lost.


For example,

/home/joe/projectA (master ● 3)

⊳  &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;joe@prod1

In the above example, you are currently in /home/joe/projectA directory, it has a git repository, and you are at the "master" branch, with 3 pending commits. These pending commits could be a combination of modified tracked files, new untracked files, or deleted files, which could either be just in the working directory (i.e., unstaged) or, in the staging area.


