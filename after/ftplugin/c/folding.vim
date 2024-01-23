function! CFolds()
    let curline = getline(v:lnum)
    " Do not fold comments or preprocessor directives
    if match(curline, '^/[/*]') >= 0 || match(curline, '^#') >= 0
        return '='
    endif
    " Closing case
    if match(curline, '\v.*\}.*') >= 0
        return 's1'
    elseif match(curline, '\v.*\{.*') >= 0
        return 'a1'
    else
        return '='
    endif
    return '0'
endfunction
setlocal foldmethod=expr
setlocal foldexpr=CFolds()
