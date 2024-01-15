" TODO: coordinate function with the set cinoptions
function! CFolds()
    let thisline = getline(v:lnum)
    "let nextline = getline(v:lnum + 1)
    " Closing case
    if match(thisline, '^\v\}(.*)?$') >= 0
        return "<1"
    " Allman-style function definitions
    elseif match(thisline, '\v^(\S+\s+)?(\S+\s+)?\S+\s+\S+\s*\(.*\).*\{?$') >= 0
        return ">1"
        " Stroustrup-style function definitions
        "elseif match(thisline, '\v.*\(.*\)\s*\{\s*$') >= 0
    " return '<1'
    " Structs
    elseif match(thisline, '\v^(typedef )?(struct|enum).*\{?$') >= 0
        return ">1"
    else
        return "="
    endif
    return '0'
endfunction
setlocal foldmethod=expr
setlocal foldexpr=CFolds()
