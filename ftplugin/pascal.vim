" Compiler settings {{{1
compiler fpc
setlocal makeprg=fpc\ -g\ %
" }}}1

" Pascal-specific settings {{{1
let pascal_fpc=1
let pascal_traditional=1
let pascal_symbol_operator=1
let pascal_one_line_string=1
let pascal_no_functions=1
" }}}1

" Abbreviations {{{1
iabbrev <buffer> func function
iabbrev <buffer> proc procedure
iabbrev <buffer> main program <C-R>=expand("%<")<CR>;<CR><CR>begin<CR><esc>0iend.<esc>O<C-R>=personal#Eatchar(' ')<CR>
" }}}1
" vim: foldmethod=marker
