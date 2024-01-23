"Settings {{{1
" Basics {{{2
set number
set relativenumber
set nocompatible
set showcmd
syntax on

" Defaults
set guicursor=""
set cursorline
set laststatus=2
set scrolloff=8

" Backspace options for OpenBSD
if has('bsd')
    set backspace=indent,eol,start
endif

" Folds
set foldlevelstart=0

" Messages
set shortmess=filnxtToOc

" Autoread
set autoread

" Netrw
let g:netrw_banner=0

" Hidden buffers: for changing buffers without saving
set hidden

"Matchit plugin
if has('syntax') && has('eval')
    packadd! matchit
endif

"Man plugin
runtime ftplugin/man.vim
" }}}2

" Colorscheme {{{2
colorscheme desert
" }}}2

" Splits {{{2
set splitright
"}}}2

" Autocompletion {{{2
set path+="**"
set wildmenu
set wildmode=longest,list,full
" }}}2

" Tabs {{{2
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" }}}2

" Indentation {{{2
set smartindent
set autoindent
" No wrap
set nowrap
" }}}2

" Swap files and undodirs {{{2
set nobackup
set noswapfile
set undodir=getenv('HOME')."/.vim/undodir"
set undofile
" }}}2

" Highlight {{{2
set hlsearch
set incsearch

set termguicolors
" }}}2

" Listchars {{{2
set list
set listchars=tab:>\ ,trail:·
" }}}1

" Statusline {{{2
set statusline=%f\ -\ %y\ [%L]\ %{fugitive#statusline()}%=%{getcwd()}/%=%([%M%R%H%W]%)[%P][%04l,%04v]
" }}}2

" Zepl {{{2
let g:repl_config = {
            \   'scheme': {
            \       'cmd': 'rlwrap guile',
            \   },
            \   'lisp': {
            \     'cmd': 'rlwrap sbcl',
            \   },
            \   'matlab': {'cmd': 'octave'},
            \   'python': {'cmd': 'python3'},
            \ }
" }}}2
"}}}1

" Remaps {{{1
let g:mapleader = " "
let g:maplocalleader = '\'

" Normal mode remaps {{{2
nnoremap H _
nnoremap L $
" Deactivate highlighting
nnoremap <silent> <leader>s :nohlsearch<CR>
" Move one line down
nnoremap - <cmd>set lz<CR>ddp<cmd>set nolz<CR>
" Move one line up
nnoremap ~ <cmd>set lz<CR>ddkP<cmd>set nolz<CR>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" Change case of a word
nnoremap <leader>u mzviw~`z
" Capitalize the first letter
nnoremap <leader>U mzviw~lve~`z
nnoremap <leader>ev :vsplit ~/.vim/.vimrc<CR>
" Open netrw
nnoremap <leader>pv :Ex<CR>
" Change current directory to the current file's one
nnoremap <leader>cd <cmd>lchdir %:p:h<CR>
" Zepl remaps
nnoremap <silent> <leader>r <cmd>vertical keep 60 Repl<CR>
nnoremap <silent> <leader>R <cmd>keep botright 10 Repl<CR>
" Toggle the foldcolumn
nnoremap <leader>f <cmd>call personal#ToggleFoldColumn()<CR>

" Inspect the highlight group
nnoremap <leader>h :call personal#ShowHighGroup()<CR>
" Interchange words
nnoremap <leader>; yiwWvep#vepW
" Interchange to C-function arguments backwards
nnoremap <leader>, yiwbbvep*vepbbb
" }}}2

" Insert mode remaps {{{2
" Disable C-c
inoremap <C-c> <nop>
" Definitive escape
noremap <esc> <esc><esc>
" Delete words with Control-Backspace
inoremap <C-BS> <C-w>
" Capitalize  word
inoremap <C-u> <esc>g~iw`]a
" Capitalize the first letter
inoremap <M-u> <esc>mzviw~lve~`za
" }}}2

" Visual mode remaps {{{2
vnoremap H 0
vnoremap L $
" Move selected lines down
vnoremap J :m '>+1<CR>gv=gv
" Move selected lines up
vnoremap K :m '<-2<CR>gv=gv
" Comment selected lines
vnoremap <C-m> :norm I//<CR>
" }}}2

" Pattern-overview remaps {{{2
" For email addresses
onoremap in@ :<c-u>execute "normal! /@\r:nohlsearch\rhvb"<cr>
onoremap an@ :<c-u>execute "normal! /@\r:nohlsearch\rlvE"<cr>
onoremap il@ :<c-u>execute "normal! ?@\r:nohlsearch\rhvb"<cr>
onoremap al@ :<c-u>execute "normal! ?@\r:nohlsearch\rlvE"<cr>
" }}}2

" Command-line remaps {{{2
"cnoremap <C-b> <Left>
"cnoremap <C-f> <Right>
"cnoremap <C-a> <Home>
"cnoremap <C-t> <C-f>
"cnoremap <C-d> <delete>
" }}}2

" Buffer remaps {{{2
"Go to buffer
"nnoremap <C-b> :buffer <C-d>       Using fzf now
nnoremap <silent> <leader>ba :badd .<CR>
nnoremap <silent> <leader>bn :bnext<CR>
nnoremap <silent> <leader>bl :buffers<CR>
nnoremap <silent> <leader>bp :bprevious<CR>
nnoremap <silent> <leader>q :bunload<CR>
nnoremap <silent> <leader>d :bdelete<CR>
" }}}2

" Argument remaps {{{2
nnoremap <leader>an <cmd>next<CR>
nnoremap <leader>ap <cmd>previous<CR>
nnoremap <leader>ar <cmd>rewind<CR>
" }}}2

" Terminal remaps {{{2
" Exit terminal mode
" tnoremap <Esc> <C-\\><C-n>   " It doesn't work
nnoremap <silent> <leader>t :vertical terminal<CR>
nnoremap <silent> <leader>T :terminal<CR>
" }}}2

" Clipboard remaps {{{2
" Yanking in the + register
nnoremap <leader>y \"+y
" Yanking in the + register (visual mode)
vnoremap <leader>y \"+y
" Yanking line in the + register
nnoremap <leader>Y \"+Y
" Pasting from the + register
nnoremap <leader>p \"+p
" }}}2

" Quickfix list remaps {{{2
" Toggle the quickix list
nnoremap <silent> <leader>o :call personal#ToggleQuickFix()<CR>
" Up in the quickfix list
nnoremap <silent> <C-k> :cprev<CR>
" Down in the quickfix list
nnoremap <silent> <C-j> :cnext<CR>
" Open the local window quickfix list
nnoremap <silent> <leader>O :call personal#ToggleLocationList()<CR>
" Up in the quickfix list (local)
nnoremap <silent> <leader>k :lprev<CR>
" Down in the quickfix list (local)
nnoremap <silent> <leader>j :lnext<CR>
" }}}2

" Scripts {{{2
" Chmod the bash file
nnoremap <leader>x <cmd>!chmod +x %<CR>
" }}}2

" }}}1

" Commands {{{1
command! CC call personal#CompileQuickFix()
command! CL call personal#CompileLocation()
" }}}1

" Abbreviations {{{1
"Insert mode abbrevs{{{2
iabbrev itn int
iabbrev flaot float
iabbrev cahr char
iabbrev Strign String
iabbrev Stirng String
iabbrev tehn then
iabbrev tahn than
iabbrev gmial gmail
"}}}2

" Command-line abbrevs {{{2
cnoreabbrev hg helpgrep
cnoreabbrev lhg lhelpgrep
"}}}2
"}}}1

" Plugins {{{1
" Make sure it is installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'

if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf.vim'
Plug 'axvr/zepl.vim'
call plug#end()
"}}}1
" vim: foldmethod=marker
