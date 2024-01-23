if exists("current_compiler")
    finish
endif

let compiler="nasm"

if exists(":CompilerSet") != 2 "For older Vim versions, we use setlocal
    command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet errorformat=%f:%l:\ %trror:\ %m

let &cpo = s:cpo_save
unlet s:cpo_save
