" Compiler settings {{{1
compiler gcc
set makeprg=gcc\ -Wall\ -Wextra\ -Wpedantic\ -std=c11\ -o\ %<\ %
" }}}1

" Buffer-local remaps {{{1
nnoremap <buffer> <silent> K :Man <cword><CR>
" }}}1

" Abbreviations {{{1
iabbrev <buffer> ret return ;<left>
iabbrev <buffer> return NOPENOPENOPE
iabbrev <buffer> fmain int main(int argc, char *argv[]){<CR>}<esc>O
iabbrev <buffer> inc #include <><left>
iabbrev <buffer> include NOPENOPENOPE
iabbrev <buffer> def #define <><left>
iabbrev <buffer> define NOPENOPENOPE
" }}}1
