compiler gcc
set makeprg=gcc\ -Wall\ -Wextra\ -Wpedantic\ -std=c11\ -o\ %<\ %

iabbrev <buffer> ret return ;<left>
iabbrev <buffer> return NOPENOPENOPE
iabbrev <buffer> fmain int main(int argc, char *argv[]){<CR>}<esc>O
iabbrev <buffer> inc #include <><left>
iabbrev <buffer> include NOPENOPENOPE
iabbrev <buffer> def #define <><left>
iabbrev <buffer> define NOPENOPENOPE
