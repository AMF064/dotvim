if exists("current_compiler")
    finish
endif

let compiler="nasm"

if exists(":CompilerSet") != 2 "For older Vim versions, we use setlocal
    command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=nasm\ -felf64\ %\ &&\ ld\ -o\ %<\ %<.o

CompilerSet errorformat=
            \%A\ \ File\ \"%f\"\\\,\ line\ %l:\ %t:
            \%C\ \ \ %m
            \%Z

let &cpo = s:cpo_save
unlet s:cpo_save
