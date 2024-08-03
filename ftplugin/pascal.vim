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

" Functions for more functionality {{{1
let b:pascal_memcheck_mode=0
function s:MemCheck()
    if !exists('b:pascal_memcheck_mode') || b:pascal_memcheck_mode==0
        setlocal makeprg=fpc\ -g\ -gh\ %
        let b:pascal_memcheck_mode=1
        echom 'Activated memory checker for Free Pascal'
    else
        setlocal makeprg=fpc\ -g\ %
        let b:pascal_memcheck_mode=0
        echom 'Deactivated memory checker for Free Pascal'
    endif
endfunction

nnoremap <localleader>m :call <SID>MemCheck()<CR>
" }}}1

" Abbreviations {{{1
iabbrev <buffer> func function
iabbrev <buffer> proc procedure
iabbrev <buffer> main program <C-R>=expand("%<")<CR>;<CR><CR>begin<CR><esc>0iend.<esc>O<C-R>=personal#Eatchar(' ')<CR>
iabbrev <buffer> begin begin<CR>end;<esc>O
" }}}1
" vim: foldmethod=marker
