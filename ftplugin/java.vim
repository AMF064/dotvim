compiler javac
setlocal makeprg=javac\ -classpath\ %:p:h\ -d\ %:p:h:h/bin/\ %

iabbrev <buffer> ret return ;<left>
iabbrev <buffer> mainclass public class Main<CR>{<CR>public static void main(String[] args)<CR>{<CR>}<CR>}<Esc>kO
