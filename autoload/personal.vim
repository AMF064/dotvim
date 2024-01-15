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

" Compile the current buffer and put the compiler messages in the quickfix list
function! personal#CompileQuickFix()
    if &makeprg ==# ''
        echoe 'Compile: error: makeprg has not been set for this buffer'
        return
    endif
    " Close both lists
    cclose
    lclose
    let g:quickfix_return_to_window = winnr()
    write
    silent! make
    botright cwindow
    redraw!
    execute g:quickfix_return_to_window . ' wincmd w'
endfunction

" Compile the current buffer and put the compiler messages in the location
" list
function! personal#CompileLocation()
    if &makeprg ==# ''
        echoe 'Compile: error: makeprg has not been set for this buffer'
        return
    endif
    cclose
    lclose
    let g:location_return_to_window = winnr()
    write
    silent! lmake
    botright lwindow
    redraw!
    execute g:location_return_to_window . ' wincmd w'
endfunction

" Show the highlight group the word under the cursor belongs to
function! personal#ShowHighGroup()
    if !exists('*synstack')
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
