if exists('g:loaded_hex')
    finish
endif

let b:hex_mode = 0

function! hex#ToggleHexMode()
    if !b:hex_mode
        write
        silent %! xxd
        let b:hex_mode = 1
    else
        silent %! xxd -r
        let b:hex_mode = 0
    endif
endfunction

function! s:write_hex_pre()
    if &filetype ==# 'fugitive'
        return
    endif
    if b:hex_mode
        %! xxd -r
    endif
endfunction

function! s:write_hex_post()
    if &filetype ==# 'fugitive'
        return
    endif
    if b:hex_mode
        %! xxd
    endif
endfunction

" Prevent the user from writing the file in hex mode
augroup write_while_in_hex
    au!
    autocmd BufWritePre * silent call s:write_hex_pre()
    autocmd BufWritePost * silent call s:write_hex_post()
augroup end

command Hex call hex#ToggleHexMode()
