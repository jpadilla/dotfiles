"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

" Sets how many lines of history VIM has to remember
set history=1000

" Enable filetype plugins
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" Automatically save file before certain commands
set autowrite

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Display line numbers
set number
set numberwidth=5

" 80 char ruler
set textwidth=80
set colorcolumn=+1

"Always show current position
set ruler

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Show matching brackets when text indicator is over them
set showmatch

" Enable mouse
set mouse=a

" Make backspace work like most other apps
set backspace=2

" Hide search highlight
nnoremap <Esc><Esc> :nohlsearch<CR>

" Show partial commands in the last line of the screen
set showcmd

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax on

" Color
set background=dark


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2

" Linebreak on 500 characters
set linebreak
set textwidth=500

" Auto ident
set autoindent

" Smart indent
set smartindent

" Wrap lines
set wrap

" List disables linebreak
set nolist

" Remove trailing whitespace
autocmd BufWritePre *.* :%s/\s\+$//e


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Always show the status line
set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
execute pathogen#infect()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cd ~/Projects
map <Leader>n :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.swp$', '\.pyc$', '\.git$', '__pycache__$']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_check_on_open=1
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"


""""""""""""""""""""""""""""""
" => CTRL-P
""""""""""""""""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore='node_modules\|DS_Store\|git\|tmp\|dist\|bower_components'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => GUI Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("gui")
  " Font
  set guifont=Sauce\ Code\ Powerline\ Light:h19

  " Color
  set background=dark
  colorscheme base16-ocean

  " vim-airline
  set laststatus=2
  let g:airline_theme='powerlineish'
  let g:airline#extensions#branch#enabled=1
  let g:airline#extensions#syntastic#enabled=1
  let g:airline_powerline_fonts = 1
endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
