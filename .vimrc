"Settings {{{1
" Basics {{{2
set number
set relativenumber
set nocompatible
set showcmd
syntax on

set guicursor=""
set cursorline
set laststatus=2
set scrolloff=8

" Folds
set foldmethod=marker
set foldlevelstart=0

" Update time
set updatetime=50

" Netrw
let g:netrw_banner=0

" Hidden buffers: for changing buffers without saving
set hidden

" Colorscheme
colorscheme desert

"Matchit plugin
if has('syntax') && has('eval')
    packadd! matchit
endif
" }}}2

" Splits {{{2
set splitright
"}}}2

" Autocompletion {{{2
set path+="**"
set wildmenu
" }}}2

" Tabs {{{2
set wildmode=longest,list,full
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
set nohlsearch
set incsearch

set termguicolors
" }}}2

" Listchars {{{2
set list
set listchars=tab:>\ ,trail:·
" }}}

" Statusline {{{2
set statusline=%f\ -\ %y\ [%L]%=%{getcwd()}/%=%([%M%R%H%W]%)[%P][%04l,%04v]
" }}}2

" Slimv {{{2
let g:slimv_lisp = 'usr/bin/sbcl'
let g:slimv_lisp_impl = 'sbcl'
let g:slimv_preferred = 'mit'            " For Scheme
let g:slimv_swank_cmd = '! st -c \"Floating\" -g 60x20+480+280 -e sbcl " load /home/amf/.local/share/nvim/site/pack/packer/start/slimv/slime/start-swank.lisp &'
let g:slimv_swank_scheme = '! st -c \"Floating" -g 60x20+480+280 -e ~/.local/bin/bin/mit-scheme " load /home/amf/.local/share/nvim/site/pack/packer/start/slimv/slime/contrib/swank-mit-scheme.scm &'
let g:swank_block_size = 65536
let g:slimv_leader = '\\'                " Leader key is '\'
let g:slimv_repl_split = 4               " Vertical split for REPL
let g:slimv_repl_split_size = 80         " REPL split size
let g:paredit_electric_return = 0        " Disable paredit electric return (annoying)
let g:slimv_disable_scheme = 0
" }}}2

"}}}1

" Remaps {{{1
let g:mapleader = " "

" Normal mode remaps {{{2
nnoremap H 0
nnoremap L $
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
nnoremap <leader>ev :vsplit ~/.vimrc<CR>
"Open previous buffer in a vertical split
nnoremap <leader>z :execute "rightbelow vsplit " . bufnr('#')<CR>
" Open netrw
nnoremap <leader>pv :Ex<CR>
" Change current directory to the current file's one
nnoremap <leader>cd <cmd>lchdir %:p:h<CR>
" }}}2

" Insert mode remaps {{{2
" Disable C-c
inoremap <C-c> <nop>
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

" Patter-overview remaps {{{2
" For email addresses
onoremap in@ :<c-u>execute "normal! /@\r:nohlsearch\rhvb"<cr>
onoremap an@ :<c-u>execute "normal! /@\r:nohlsearch\rlvE"<cr>
onoremap il@ :<c-u>execute "normal! ?@\r:nohlsearch\rhvb"<cr>
onoremap al@ :<c-u>execute "normal! ?@\r:nohlsearch\rlvE"<cr>
" }}}2

" Command-line remaps (Emacs mode) {{{2
cnoremap <C-b> <Left>
cnoremap <M-b> <C-Left>
cnoremap <C-f> <Right>
cnoremap <M-f> <C-Right>
cnoremap <C-a> <Home>
cnoremap <C-t> <C-f>
cnoremap <C-d> <delete>
" }}}2


" Buffer remaps {{{2
"Go to buffer
"nnoremap <C-b> :buffer <C-d>       Using fzf now
nnoremap <leader>ba :badd .<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bl :buffers<CR>   Using fzf now
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>q :bunload<CR>
nnoremap <leader>d :bdelete<CR>
" }}}2

" Terminal remaps {{{2
" Exit terminal mode
tnoremap <Esc> <C-\\><C-n>
nnoremap <leader>t :vertical terminal<CR>
nnoremap <leader>T :terminal<CR>
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
" Open the quickix list
nnoremap <leader>o :copen<CR>
" Up in the quickfix list
nnoremap <C-k> :cprev<CR>
" Down in the quickfix list
nnoremap <C-j> :cnext<CR>
" Open the local window quickfix list
nnoremap <leader>O :lopen<CR>
" Up in the quickfix list (local)
nnoremap <leader>k :lprev<CR>
" Down in the quickfix list (local)
nnoremap <leader>j :lnext<CR>
" }}}2

" Scripts {{{2
" Chmod the bash file
nnoremap <leader>x <cmd>!chmod +x %<CR>
" }}}2

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
cabbrev hg helpgrep
cabbrev lhg lhelpgrep
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
call plug#end()
"}}}1
