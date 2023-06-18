" Basics {{{1
set number
set relativenumber
syntax on

set guicursor=""
set cursorline
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
" }}}1

" Autocompletion {{{1
set path+="**"
set wildmenu
set wildmode=longest,list,full
set tabstop=4
" }}}1

" Tabs {{{1
set softtabstop=4
set shiftwidth=4
set expandtab
" }}}1

" Indentation {{{1
set smartindent
set autoindent
" No wrap
set nowrap
" }}}1

" Swap files and undodirs {{{1
set nobackup
set noswapfile
set undodir=getenv('HOME')."/.vim/undodir"
set undofile
" }}}1

" Highlight {{{1
set nohlsearch
set incsearch

set termguicolors
" }}}1

" Listchars {{{1
set list
set listchars=tab:>\ ,trail:·
" }}}

" Slimv {{{1
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
" }}}1

" Statusline {{{1
" set statusline="%f\ -\ %y\ [%L]%=%{getcwd()}/%=%([%M%R%H%W]%)[%P][%04l,%04v]"
" }}}1

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
nnoremap <leader>ev :vsplit ~/.dotfiles/nvim/lua/amf/remap.lua<CR>
" }}}2

" Insert mode remaps {{{2
" Disable C-c
inoremap <C-c> <nop>
" Delete words with Control-Backspace
inoremap <C-BS> <C-w>
" Capitalize  word
inoremap <C-u> <esc>mzviw~`za
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

" File navigation {{{2
" Change current directory to the current file's one
nnoremap <leader>cd <cmd>lchdir %:p:h<CR>
" }}}2

" Netrw {{{2
" Open netrw
nnoremap <leader>pv :Ex<CR>
" }}}2

" Buffer remaps {{{2
nnoremap <M-l> :buffers<CR>
"Go to buffer
nnoremap <C-b> :buffer <C-d>
nnoremap <leader>ba :badd .<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>q :bunload<CR>
nnoremap <M-d> :bdelete<CR>
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
nnoremap <leader>o :copen
" Up in the quickfix list
nnoremap <C-k> :cprev
" Down in the quickfix list
nnoremap <C-j> :cnext
" Open the local window quickfix list
nnoremap <leader>O :lopen
" Up in the quickfix list (local)
nnoremap <leader>k :lprev
" Down in the quickfix list (local)
nnoremap <leader>j :lnext
" }}}2

" Scripts {{{2
" Chmod the bash file
nnoremap <leader>x <cmd>!chmod +x %<CR>
" }}}2

" }}}1
