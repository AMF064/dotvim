function! IsClosingBlock(line)
    let opening = stridx(a:line, '{')
    let closing = stridx(a:line, '}')
    return (opening < 0 && closing >= 0)
endfunction

function! IsOpeningBlock(line)
    let opening = stridx(a:line, '{')
    let closing = stridx(a:line, '}')
    return (opening >= 0 && closing < 0)
endfunction

function! CFolds()
    let curline = getline(v:lnum)
    " Do not fold comments or preprocessor directives
    if match(curline, '^\s*/[/*]') >= 0 || match(curline, '^\s*#') >= 0
        return '='
    endif
    " Closing case
    if IsClosingBlock(curline)
        return 's1'
    elseif IsOpeningBlock(curline)
        return 'a1'
    else
        return '='
    endif
    return '0'
endfunction
setlocal foldmethod=expr
setlocal foldexpr=CFolds()
