" Compiler configuration {{{1
compiler javac
setlocal makeprg=javac\ -classpath\ %:p:h\ -d\ %:p:h:h/bin/\ %
" }}}1

" Indentation {{{1
set cinoptions=+0,(0
" }}}1

" Abbreviations {{{1
iabbrev <buffer> ret return ;<left>
iabbrev <buffer> mainclass public class Main<CR>{<CR>public static void main(String[] args)<CR>{<CR>}<CR>}<Esc>kO<C-R>=personal#Eatchar(' ')<CR>
iabbrev <buffer> pubclass public class <C-R>=expand("%<")<CR>{<CR>}<Esc>k$i
iabbrev <buffer> nclass class {<CR>}<Esc>k$i
" }}}1
