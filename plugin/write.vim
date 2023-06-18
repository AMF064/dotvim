" Do these to things before writing to file
augroup please_be_nice
    au!
    " Indent
    autocmd BufWritePre * silent normal! gg=G`^
    " Remove trailing whitespace
    autocmd BufWritePre * :%s/\s\+$//e
augroup end

" For editing text, not code
augroup writer_settings
    au!
    autocmd FileType nroff,text,markdown setlocal wrap
    autocmd FileType nroff,text,markdown setlocal list
augroup end
