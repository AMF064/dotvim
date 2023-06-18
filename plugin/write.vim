" Do these to things before writing to file
augroup please_be_nice
    au!
    " Indent
    autocmd BufWritePre * silent normal =gg']=G
    " Remove trailing whitespace
    autocmd BufWritePre * :%s/\s\+$//e
augroup end

" For editing text, not code
augroup writer_settings
    au!
    autocmd FileType nroff,txt,markdown setlocal wrap
    autocmd FileType nroff,txt,markdown setlocal list
augroup end

" For folds in the configuration
augroup folds
    au!
    autocmd BufWritePre /home/amf/.dotfiles/nvim/* setlocal foldmethod=marker
augroup end
