" Compiler settings {{{1
compiler gcc
setlocal makeprg=gcc\ -Wall\ -Wextra\ -Wpedantic\ -std=c11\ -o\ %<\ %
" }}}1

" Buffer-local remaps {{{1
nnoremap <buffer> <silent> K :Man <cword><CR>
" }}}1

" Abbreviations {{{1
iabbrev <buffer> ret return ;<left>
iabbrev <buffer> fmain int main(int argc, char *argv[]){<CR>}<esc>O
iabbrev <buffer> inc #include
iabbrev <buffer> def #define
" }}}1
