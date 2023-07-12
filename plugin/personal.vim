" Toggle the quickfix list. Code from Gavin Freeborn at https://github.com/Gavinok/dotvim/blob/master/autoload/dotvim.vim
function! personal#ToggleQuickFix() abort
    let nr = winnr('$')
    " Close the location list
    silent! lclose
    " Open the quickfix list
    copen
    let nr2 = winnr('$')
    " Check if the last window's number has changed
    if nr == nr2
        cclose
    endif
endfunction

" Toggle the location list. Code from Gavin Freeborn at https://github.com/Gavinok/dotvim/blob/master/autoload/dotvim.vim
function! personal#ToggleLocationList() abort
    let nr = winnr('$')
    " Close the quickfix list
    cclose
    " Open the quickfix list
    silent! lopen
    let nr2 = winnr('$')
    " Check if the last window's number has changed
    if nr == nr2
        cclose
        silent! lclose
    endif
endfunction

" Toggle the foldcolumn.
function! personal#ToggleFoldColumn()
    if &foldcolumn
        setlocal foldcolumn=0
    else
        setlocal foldcolumn=4
    endif
endfunction


" Autocommands

" Function for not moving the cursor
function! s:indent_file()
    let l:view = winsaveview()
    keepjumps execute "keepjumps normal! gg=G"
    call winrestview(l:view)
endfunction

" Do these to things before writing to file
augroup please_be_nice
    au!
    " Indent
    autocmd BufWritePre * silent call <SID>indent_file()
    " Remove trailing whitespace
    autocmd BufWritePre * :%s/\s\+$//e
augroup end

" For editing text, not code
augroup writer_settings
    au!
    autocmd FileType nroff,text,markdown setlocal wrap
    autocmd FileType nroff,text,markdown setlocal list
augroup end
