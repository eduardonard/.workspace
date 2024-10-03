" -----------------------------
" Basic Settings
" -----------------------------

" Enable syntax highlighting
syntax on

" Set encoding to UTF-8
set encoding=utf-8
set fileencoding=utf-8

" Show line numbers and relative line numbers
set number
set relativenumber

" Highlight the current line
set cursorline

" Enable mouse support
set mouse=a

" Show the command being typed at the bottom
set showcmd

" Enable 24-bit RGB colors (true color)
if (has("termguicolors"))
  set termguicolors
endif

" Use system clipboard for copy-pasting
set clipboard=unnamedplus

" -----------------------------
" Indentation and Tabs
" -----------------------------

" Set tab to 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Enable smart indentation
set smartindent
set autoindent

" Don't wrap lines
set nowrap

" -----------------------------
" Search Settings
" -----------------------------

" Ignore case when searching (but not with capital letters)
set ignorecase
set smartcase

" Highlight search matches
set hlsearch

" Incremental search
set incsearch

" -----------------------------
" Visual Enhancements
" -----------------------------

" Show matching parentheses and brackets
set showmatch

" Set a fancy status line
set laststatus=2

" Show column number and percentage through file in status line
set ruler

" Always show a sign column (prevents shifting)
set signcolumn=yes

" Shorten messages (no intro screen)
set shortmess+=c

" -----------------------------
" Backup and Undo
" -----------------------------

" Save undo history across sessions
set undofile

" Set the directory for backup files and undo files
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//

" -----------------------------
" Interface Behavior
" -----------------------------

" Set a wildmenu for better autocompletion
set wildmenu
set wildmode=list:longest

" Show partial commands in the status line
set showcmd

" Faster command-line completion
set timeoutlen=500

" -----------------------------
" Key Bindings
" -----------------------------

" Map jj to escape in insert mode
inoremap jj <Esc>

" Disable arrow keys to encourage using hjkl
map <Up> <Nop>
map <Down> <Nop>
map <Left> <Nop>
map <Right> <Nop>

" Press ,w to quickly save the file
nnoremap ,w :w<CR>

" -----------------------------
" Plugins (Optional)
" -----------------------------

" If you're using a plugin manager like vim-plug:
" call plug#begin('~/.vim/plugged')

" Plug 'scrooloose/nerdtree' " File explorer
" Plug 'itchyny/lightline.vim' " Status line plugin
" Plug 'tpope/vim-fugitive' " Git plugin
" Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder

" call plug#end()

" -----------------------------
" Miscellaneous
" -----------------------------

" Disable swap files
set noswapfile

" Disable audible bell
set noerrorbells
set visualbell

" Faster scrolling and rendering
set ttyfast

" Automatically reload file if changed externally
set autoread

" Split window behavior
set splitbelow
set splitright

" -----------------------------
" End of vimrc
" -----------------------------
