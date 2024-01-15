" Compiler settings {{{1
compiler gcc
setlocal makeprg=gcc\ -Wall\ -Wextra\ -Wpedantic\ -ggdb\ -std=c11\ -o\ %<\ %
" }}}1

" Keywordprg {{{1
setlocal keywordprg=:Man
" }}}1

" Indentation {{{1
set cinoptions=+0,(0
" }}}1

" Buffer-local remaps {{{1
"nnoremap <buffer> <silent> K :Man <cword><CR>
nnoremap <buffer> <silent> <localleader>c I//<Esc>
" }}}1

" Abbreviations {{{1
iabbrev <buffer> fmain int main(int argc, char *argv[])<CR>{<CR>}<esc>O
iabbrev <buffer> vmain int main(void)<CR>{<CR>}<esc>O
iabbrev <buffer> inc #include
iabbrev <buffer> def #define
" }}}1
