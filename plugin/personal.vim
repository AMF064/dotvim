" Autocommands

" Function for not moving the cursor
function! s:indent_file()
    let l:view = winsaveview()
    call cursor(0,0)
    keepjumps normal =G
    call winrestview(l:view)
endfunction

" Do these two things before writing to file
augroup before_writing
    au!
    " Indent
    autocmd BufWritePre *.c,*.java,*.py,*.scm,*.lisp,*.perl,*.el,*.vim,.vimrc
                \ silent call <SID>indent_file()
    " Remove trailing whitespace
    autocmd BufWritePre * :%s/\s\+$//e
augroup end

" For editing text, not code
augroup writer_settings
    au!
    autocmd FileType nroff,text,markdown setlocal wrap linebreak nolist
augroup end
