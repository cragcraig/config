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
Bundle 'Valloric/YouCompleteMe'


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
colorscheme enzyme

" Mappings
map <CR> o<Esc>
inoremap jj <Esc>
inoremap jk <Esc>

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

" Autocomplete mode
set wildmode=longest,list,full
set wildmenu

" Remember cursor position between sessions
function! ResCur()
  if line("'\"") <= line("$")
    normal! g`"
    return 1
  endif
endfunction

augroup resCur
  autocmd!
  autocmd BufWinEnter * call ResCur()
augroup END

" ^p toggles Paste mode
" (disables autoindent)
nnoremap <C-p>p :set invpaste paste?<CR>
set pastetoggle=<C-p>p
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
autocmd BufNewFile,BufRead,BufCreate *.java call LongLineHLEnableJava()

" Print current file
command! CurrentFile echo "Currently editing:" bufname("%")
