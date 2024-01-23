compiler nasm
setlocal makeprg=nasm\ -felf64\ % " &&\ ld\ -o\ %<\ %<.o
