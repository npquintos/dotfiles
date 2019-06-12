"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" set keboard mapping delays
set timeout timeoutlen=3000 ttimeoutlen=100
" Sets how many lines of history VIM has to remember
set history=700

" If your main.cpp file is in project/src and include
" files in project/include, and  you want to
" automatically create header files while working on
" main.cpp, and quickly open that header file via gf
set path=.,../src,../include

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
" To use, type :find *.txt<TAB>, then tab through
" the selection until the desired file is reached,
" then hit <ENTER>
set wildmenu
set wildmode=list:full
set wildignorecase

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Set to change to the same directory as the currently opened file
set autochdir

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ";"
let g:mapleader = ";"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Ignore compiled files
set wildignore=*.o,*~,*.pyc

"Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases 
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
syntax enable

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" toggle commnting
map <leader><leader> :call MyComment()<CR>

" Disable highlight when space is pressed
map <silent> <space> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM B to first non-blank character
map B ^
" Remap E to the end of the line
map E $

" Tmux integration
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>


" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"noel's customizations
set splitright

"For these to work, place cpp_helper.vim inside .vim/plugin
"This plugin is in cpp_helper repository under npquintos
map <silent> <leader>h :call CreateHeader()<cr><cr>
map <silent> <leader>d :call CreateCode()<cr><cr>
map <silent> <leader>c :call ExtractClass()<cr>

set nocompatible
map <leader>ha 80a#<ESC>a
imap <leader>ha <ESC>80a#<ESC>a
map <Leader>dt :r !date /t<CR>
map <leader>n :bnext<CR>
imap <leader>n <ESC><leader>n
map <C-p> :!python %<CR>
imap <C-p> <ESC><C-p>
set undofile
set colorcolumn=85
vnoremap > >gv
vnoremap < <gv
map <C-i> :vertical resize +5<cr>
map <C-d> :vertical resize -5<cr>
map T zt
" set to uppercase the word under the cursor
noremap <leader>U gUiw
noremap / /\v
vnoremap / /\v
imap <Leader>' diwa'<ESC>p
imap <Leader>" diwa"<ESC>p
imap <Leader>( diwa(<ESC>p
imap <Leader>{ diwa{<ESC>p
imap <Leader>[ diwa[<ESC>p
map <Leader>p :PlugInstall<cr>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'jiangmiao/auto-pairs'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Python and bash comment toggle
function! MyComment()
  let line = getline('.')
  if match(line, '^\(\s*\)#') == 0
    let line = substitute(line, '^\(\s*\)# ', '\1', '')
  elseif match(line, '^\s*$') != 0
    let line = substitute(line, '^\(\s*\)', '\1# ', '')
  endif
  call setline('.', line)
endfunction
        
" Will create header files for header name under the cursor                          
function! CreateHeader()                                                             
    let mycurf=expand("<cfile>")                                                     
    let nycurf = substitute(mycurf, ".h", "", "")                                    
    execute("!sed 's/xxx/".nycurf."/;s/\\./_/g' ../include/template.h   > ../include/".mycurf)
    execute("vsp ../include/".mycurf)                                                
    normal! <C-h>                                                                    
endfunction    
