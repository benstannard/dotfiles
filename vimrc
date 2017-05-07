" .vimrc of Ben Stannard


" VIM-PLUG BLOCK. PlugInstall, PlugUpdate, PlugClean[!], PlugUpgrade, PlugStatus
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/syntastic'
Plug 'bling/vim-airline'
Plug 'mtth/scratch.vim'
call plug#end()


" basic settings
syntax on                   " syntax highlighing
filetype on                 " try to detect filetypes
filetype plugin indent on   " enable loading indent file for filetype
set number                  " display line numbers
set title                   " show title in console title bar
set wildmenu                " menu completion in command mode on <Tab>
set wildmode=full           " <Tab> cycles between all matching choices.
set noerrorbells            " Preserving sanity. No bells, please
set vb t_vb=                " No error blikning I believe
set tabstop=4               " <tab> inserts 4 spaces
set softtabstop=4           " <BS> over an autoindent deletes all space
set shiftwidth=4            " Add an indent level is 4 spaces
set shiftround              " rounds indent to multiple of shiftwidth
set expandtab               " use spaces, not tabs, for autoindent/tabkey
set wrap                    " wrap text
set linebreak               " don't wrap text in the the middle of a word
set ruler                   " show some info, even w/o statuslines
set cursorline              " highlight current line
set nostartofline           " avoid moving cursor to BOL when jumping around
set hidden                  " switch buffers without saving (?)
set foldenable              " enable folding
set foldmethod=indent       " code folding
set foldlevel=99
set encoding=utf-8
set backspace=indent,eol,start
"set background=dark         " use a dark background
"set textwidth=79            " lines auto wrap after 79 columns
"set colorcolumn=80          " highlight column 80 (wrap)

" Reload Vimrc
map <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" Remap leader to comma
let mapleader=','

" Quickly get out of insert mode
inoremap jj <Esc>

" v for visual
vno v <esc>

" open/close the quickfix window
nmap <leader>c :copen<CR>
nmap <leader>cc :cclose<CR>

" leader v/h create vertical/horizontal splits
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" ctrl-hjkl to switch between splits.
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" better indentation
vnoremap < <gv
vnoremap > >gv

" Searching and Patterns, <leader>space to clear search
set ignorecase
set smartcase
set hlsearch
set incsearch
nnoremap <leader><space> :nohlsearch<CR>

" Disable backupand swap files
set nobackup
set nowritebackup
set noswapfile

" Enter adds line below. Shift-Enter add lines above.
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" use <leader> to run buffer in python interpreter or access shell
nnoremap <leader>1 :!shell<CR>
nnoremap <leader>r :!python3 -i %<CR>
nnoremap <leader>3 :!ipython3 <CR>

" buffers
noremap <leader>z :wq<CR>
noremap <leader>w :w<CR>
nnoremap <leader>q :w<bar>bd<CR>
nnoremap <leader>t :bnext<CR>
nnoremap <leader>T :bprevious<CR>
nnoremap <leader>n :enew<CR>
nnoremap <leader>e :Scratch<CR>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" makes paste easier
set pastetoggle=<leader>p

" find files using FZF
nnoremap <leader>f :GFiles<CR>
nnoremap <leader>F :Files<CR>

" Fast editing of vimrc
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>


" Ignore these files when completing
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

" Errors checking for Python. pip install flake8.
let g:syntastic_python_checkers=['flake8']

" vim-airline settings
let laststatus=2
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#trailing_format = 'trailing[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed-indent[%s]'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='dark'

" FileType specific changes
autocmd filetype javascript set sw=2 ts=2
autocmd filetype html set sw=2 ts=2

" Show whitespace.
:highlight ExtraWhitespace ctermbg=red guibg=reg
:match ExtraWhitespace /\s\+$/
