" --------------- Vundle --------------------
set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My bundles here:

" https://github.com/Valloric/YouCompleteMe
" ~/.vim/bundle/YouCompleteMe/install.sh
" Bundle 'Valloric/YouCompleteMe'

Bundle 'christoomey/vim-tmux-navigator'

" Tagbar
Bundle 'majutsushi/tagbar'

" easymotion
Bundle 'Lokaltog/vim-easymotion'

" ctrl-p
Bundle 'kien/ctrlp.vim'

" NERDTree
Bundle 'scrooloose/nerdtree'

" Git Gutter
Bundle 'airblade/vim-gitgutter'

" Vim session
" :SaveSession
" :OpenSession
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-session'
let g:session_autosave = 'no'

Bundle 'altercation/vim-colors-solarized'

filetype plugin indent on     " required!
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install (update) bundles
" :BundleSearch(!) foo - search (or refresh cache first) for foo
" :BundleClean(!)      - confirm (or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle commands are not allowed.
" -------------------------------------------


" Syntax highlighting
syntax on
set background=dark
colorscheme enzyme

autocmd! BufRead,BufNewFile,BufEnter *.{c,cpp,cc,h,javascript,java,py} call CSyntaxAfter()

" Mappings
let mapleader=","
map <CR> o<Esc>
inoremap jj <Esc>
inoremap jk <Esc>
nnoremap cy "*y
nnoremap cp "*p
vnoremap cy "*y
vnoremap cp "*p

" General settings
set nocompatible
set ruler
set number
set autoindent
set smartindent
set expandtab
set ts=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set nowrap
set tags=./tags;

let g:ycm_add_preview_to_completeopt = 1
let g:session_autoload = 'no'
let g:tagbar_left = 1

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" Autocomplete mode
set wildmode=longest,list,full
set wildmenu
set wildignore=*.o,*~,*.pyc

" Configure backspace so it acts as it should act
" set backspace=eol,start,indent
" set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

" ^v toggles Paste mode
" (disables autoindent)
nnoremap <C-v> :set invpaste paste?<CR>
set pastetoggle=<C-v>
set showmode

" Search settings
set ignorecase
set smartcase
set incsearch
set hlsearch

" Command line abbreviation for directory of the current file
cabbr <expr> %% expand('%:p:h')

" Tabs and windows
noremap <silent> <C-h> :wincmd h<CR>
noremap <silent> <C-l> :wincmd l<CR>
noremap <silent> <C-k> :wincmd k<CR>
noremap <silent> <C-j> :wincmd j<CR>
noremap <silent> <C-i> :tabp<CR>
noremap <silent> <C-o> :tabn<CR>

noremap <silent> <C-g> <C-]>

" Always yank to the system clipboard
set clipboard=unnamed,unnamedplus

" Plugin Mappings
nmap f <Plug>(easymotion-s)
let g:ctrlp_map = '<c-f>'

" Ctrl-P settings
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" Handle common typos
command! Q q

" Reload all buffers
function! ReloadAllBuffers()
  set noconfirm
  checktime
  set confirm
endfunction

command! ReloadAll call ReloadAllBuffers()

" Highlight lines longer than 80 char
hi OverLength ctermbg=none cterm=none
match OverLength /\%>81v/
function! LongLineHLToggle()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>81v', 0)
 else
  call matchdelete(w:longlinehl)
  unl w:longlinehl
 endif
endfunction

function! LongLineHLEnable()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>81v', 0)
 endif
endfunction

function! LongLineHLEnableJava()
 if !exists('w:longlinehl')
  let w:longlinehl = matchadd('ErrorMsg', '.\%>101v', 0)
 endif
endfunction

command! ToggleLongLine call LongLineHLToggle()
autocmd BufNewFile,BufRead,BufCreate *.py call LongLineHLEnable()
autocmd BufNewFile,BufRead,BufCreate *.cc call LongLineHLEnable()
autocmd BufNewFile,BufRead,BufCreate *.c call LongLineHLEnable()
autocmd BufNewFile,BufRead,BufCreate *.h call LongLineHLEnable()
autocmd BufNewFile,BufRead,BufCreate *.sh call LongLineHLEnable()
autocmd BufNewFile,BufRead,BufCreate *.js call LongLineHLEnable()

" Java specific config
function! JavaConfig()
  call LongLineHLEnableJava()
  set ts=2
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
endfunction

autocmd BufNewFile,BufRead,BufCreate *.java call JavaConfig()
autocmd BufNewFile,BufRead,BufCreate *.py call JavaConfig()

" Go specific config
function! GoConfig()
  set filetype=go
  set ts=4
  set tabstop=4
  set shiftwidth=4
  set softtabstop=4
endfunction

autocmd BufNewFile,BufRead,BufCreate *.go call GoConfig()

" Delete trailing white space on saving
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.java :call DeleteTrailingWS()
autocmd BufWrite *.cc :call DeleteTrailingWS()
autocmd BufWrite *.c :call DeleteTrailingWS()
autocmd BufWrite *.go :call DeleteTrailingWS()
autocmd BufWrite *.js :call DeleteTrailingWS()

" Print current file
command! CurrentFile echo "Currently editing:" bufname("%")
