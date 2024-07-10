" Autocommands

" Function for not moving the cursor
function! s:indent_file()
    let l:view = winsaveview()
    call cursor(1,1)
    keepjumps normal =G
    call winrestview(l:view)
endfunction

function! s:trim_trailing_whitespace()
    if &binary || &filetype == 'diff' || bufname('%') =~# '.*\.vimrc'
        return
    endif
    let l:view = winsaveview()
    keepjumps %s/\s\+$//e
    call winrestview(l:view)
endfunction

" Do these two things before writing to file
augroup before_writing
    au!
    autocmd BufWritePre *.c,*.h,*.cpp,*.pas,*.java,*.m,*.scm,*.lisp,*.pl,*.el,*.vim,*.sh,.kshrc,.bashrc,.profile,.bash_profile,.xinitrc silent call <SID>indent_file()
    autocmd BufWritePre * call <SID>trim_trailing_whitespace()
augroup end

" For editing text, not code
augroup writer_settings
    au!
    autocmd FileType nroff,text,markdown setlocal wrap linebreak nolist
augroup end
