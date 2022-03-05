" vimrc file for easygater

" ============================================================================
" GENERAL SETTINGS {{{
" ============================================================================
let hostname = hostname()

if has("multi_byte")
  if &termencoding == ""
    let &termencoding = &encoding
  endif
  set encoding=utf-8
  setglobal fileencoding=utf-8
  " Uncomment to have 'bomb' on by default for new files.
  " Note, this will not apply to the first, empty buffer created at Vim startup.
  "setglobal bomb
  set fileencodings=ucs-bom,utf-8,latin1
endif

" }}}

" ============================================================================
" PLUGINS {{{
" ============================================================================
"let profilesdir = "$HOME/.vim/profiles"
"source &profilesdir/vimrc.mappings
"source &profilesdir/vimrc.plugins
source $HOME/.vim/profiles/vimrc.mappings
source $HOME/.vim/profiles/vimrc.plugins
"source $HOME/.vim/vimrc.filebrowsing
"source $HOME/.vim/vimrc.filetypes
"source $HOME/.vim/vimrc.functions
"source $HOME/.vim/vimrc.fuzzyfind
"source $HOME/.vim/vimrc.macros
"source $HOME/.vim/vimrc.templates
"source $HOME/.vim/vimrc.ale
"source $HOME/.vim/vimrc.vim_as_perl_ide

" }}}


" ============================================================================
" BASIC SETTINGS {{{
" ============================================================================

set exrc
set guicursor=
set hidden
set noerrorbells
set smartindent
set noswapfile
set termguicolors
set completeopt=menuone,noinsert,noselect
set signcolumn=yes
set cmdheight=2
set updatetime=50
set nocompatible

filetype on
filetype plugin on
filetype indent on
syntax on

set number
set relativenumber

set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

set nobackup
set undodir=~/.vim/undodir
set undofile

set scrolloff=10
set nowrap
set incsearch
set ignorecase
set smartcase
set noshowmode
set showmatch
set nohlsearch
set history=1000
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

set autoindent
set autoread
set backspace=indent,eol,start
set laststatus=2 " always show the statusline
set linebreak
set list
set listchars=tab:▸\ ,trail:¬,extends:>,precedes:<
set modeline " # vim: filetype=zsh syntax=zsh etc
set title
set noinsertmode
set autowrite " Save buffer when changing files
set autoread  " Reload buffer when changing files

" Show marker around 80 chars
"let &colorcolumn=join(range(81,999),",")
"let &colorcolumn="80,".join(range(400,999),",")

set foldmethod=indent
set foldlevel=0
set foldlevelstart=1
highlight Folded  ctermfg=cyan ctermbg=black

" }}}


" ============================================================================
" VIM SCRIPTS {{{
" ============================================================================

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

autocmd FileType html setlocal tabstop=2 shiftwidth?2 expandtab

"let python_highlight_all=1

" vim-latex:
"set grepprg=grep\ -nH\ $*
"let g:tex_flavor='latex'

" Load different themes on GUI/Term based shizzle
if has('gui_running')
    set guioptions-=T  " no toolbar
    set guifont=Ubuntu\ Mono\ 18
else
    set t_Co=256
endif

" }}}

" ============================================================================
" STATUS LINE  {{{
" ============================================================================

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}


" ============================================================================
" COLORS {{{
" ============================================================================
" background needs to be set after the colorscheme is set
" For shiney themes see: http://vimcolors.com/
colorscheme gruvbox

" Toggle background so everything looks pretty
set background=light
set background=dark

" vim hardcodes background color erase even if the terminfo file does
" not contain bce (not to mention that libvte based terminals
" incorrectly contain bce in their terminfo files). This causes
" incorrect background rendering when using a color theme with a
" background color.
let &t_ut=''

" }}}

