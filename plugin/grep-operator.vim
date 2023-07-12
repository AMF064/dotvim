nnoremap <silent> <leader>G :set operatorfunc=<SID>GrepOperator<cr>g@
vnoremap <silent> <leader>G :<C-u>call <SID>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed = @@
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    execute "silent grep! -R " . shellescape(@@) . " ."
    copen
    redraw!

    let @@ = saved_unnamed
endfunction
