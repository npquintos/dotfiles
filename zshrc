autoload -U colors select-word-style
colors          # colours
select-word-style bash # ctrl+w on words

##
# Vcs info
##
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn hg
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' formats "%{$fg[yellow]%}%c%{$fg[green]%}%u%{$reset_color%} [%{$fg[blue]%}%b%{$reset_color%}] %{$fg[yellow]%}%s%{$reset_color%}:%r"
precmd() {  # run before each prompt
  vcs_info
}

##
# Prompt
##
setopt PROMPT_SUBST     # allow funky stuff in prompt
color="blue"
if [ "$USER" = "root" ]; then
    color="red"         # root is red, user is blue
fi;
prompt='%{%K{blue}%}%{%F{white}%}%d%{$vcs_info%}%{$reset_color%}
$ '
RPROMPT='$FG[237]%n@%m%{$reset_color%}'

bindkey -v                      # vi keybinding
export KEYTIMEOUT=1
##
# Completion
##
autoload -U compinit
compinit
zmodload -i zsh/complist        
setopt hash_list_all            # hash everything before completion
setopt completealiases          # complete alisases
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word    
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.

zstyle ':completion::complete:*' use-cache on               # completion caching, use rehash to clear
zstyle ':completion:*' cache-path ~/.zsh/cache              # cache path
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'   # ignore case
zstyle ':completion:*' menu select=2                        # menu if nb items > 2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}       # colorz !
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate # list of completers to use
zstyle ':completion:*' accept-exact '*(N)'

# sections completion !
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format $'\e[00;34m%d'
zstyle ':completion:*:messages' format $'\e[00;31m%d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true

zstyle ':completion:*:processes' command 'ps -au$USER'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*:processes' list-colors "=(#b) #([0-9]#)*=29=34"
zstyle ':completion:*:*:killall:*' menu yes select
zstyle ':completion:*:killall:*' force-list always
users=(jvoisin root)           # because I don't care about others
zstyle ':completion:*' users $users

#generic completion with --help
compdef _gnu_generic gcc
compdef _gnu_generic r2
compdef _gnu_generic gdb
compdef _gnu_generic openssl

##
# Pushd
##
DIRSTACKSIZE=8
setopt auto_pushd               # make cd push old dir in dir stack
setopt pushd_ignore_dups        # no duplicates in dir stack
setopt pushd_silent             # no dir stack after pushd or popd
setopt pushd_to_home            # `pushd` = `pushd $HOME`
setopt pushdminus 

##
# History
##
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=4096					# big history
SAVEHIST=4096                	# big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword

##
# Various
##
setopt auto_cd                  # if command is a path, cd into it
setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
setopt print_exit_value         # print return value if non-zero
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower prio for background jobs
setopt clobber                  # must use >| to truncate existing files
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt ignore_eof             # do not exit on end-of-file
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'
setxkbmap -option compose:ralt  # compose-key
print -Pn "\e]0; %n@%M: %~\a"   # terminal title
TERM=xterm-256color             # Colorz!
export TZ='Europe/Paris'		# Excuse my french
export GCC_COLORS=1				# Colorz in gcc!
unset LD_PRELOAD				# Meh.
export EDITOR=vim				# Meh.

# Command Aliases
unalias ls
alias ll='ls -lt | more -30'
alias lh='ls -ld .??*'
alias lt='tree -d | more'
alias lsd='ls -d */'
alias lr='g() {ls -lt **/*$1*};g'
alias lsz='f() {ls -lh **/*(Lm+$1)};f'
alias lsp='ls -lt *py | more -30'
alias viml='vim *(om[1])'
alias vimp='vim *.py(om[1])'
alias popl='populate *.DAT(om[1])'
# aliases for tmux
alias :vsp='tmux split-window -h'
alias :sp='tmux split-window -v'
alias :lss='tmux list-sessions'
alias :lsw='tmux list-windows'
alias :win='tmux select-window -t' 
alias :ses='tmux switch -t '
alias :q='tmux kill-pane'
alias :qw='tmux confirm-before kill-window'
alias :qs='tmux detach'
alias :qt='tmux detach'

# cd aliases
alias /='cd /'
alias ...='cd ../..'
alias d='dirs -v'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'

# Default application based on file extensions
alias -s py=vim
alias -s txt=vim
alias -s csv=vim
alias -s dat=vim
alias -s DAT=vim
alias -s SKM=vim
alias -s cal=vim
alias -s prn=vim
autoload -U zmv
alias mmv='noglob zmv -W'
alias -s log="tail -f"

# source z plugin
. ./z.sh

# Custom Functions
function qfind() {
    /usr/bin/find -name "*$@*" -print 2>/dev/null
}

# use tmux as default shell
if command -v tmux > /dev/null; then
    [[ $TERM != "screen" ]] && [ -z $TMUX  ] && (tmux a -t `whoami`_session || exec tmux new -s `whoami`_session)
fi
