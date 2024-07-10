" Compiler settings {{{1
compiler gcc
setlocal makeprg=cc\ -Wall\ -Wextra\ -Wpedantic\ -ggdb\ -std=c11\ -o\ %<\ %
" }}}1

" Keywordprg, indentation and completion {{{1
setlocal keywordprg=:Man
set cinoptions=+0,(0,E-s
setlocal omnifunc=ccomplete#Complete
" }}}1

" Buffer-local remaps {{{1
nnoremap <buffer> <silent> <localleader>c I//<Esc>
" }}}1

" Abbreviations {{{1
iabbrev <buffer> fmain int main(int argc, char *argv[])<CR>{<CR>}<esc>O<C-R>=personal#Eatchar(' ')<CR>
iabbrev <buffer> vmain int main(void)<CR>{<CR>}<esc>O<C-R>=personal#Eatchar(' ')<CR>
iabbrev <buffer> inc #include
iabbrev <buffer> def #define
" }}}1
" vim: foldmethod=marker
