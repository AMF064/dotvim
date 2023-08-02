compiler javac
setlocal makeprg=javac\ -classpath\ %:p:h\ -d\ %:p:h:h/bin/\ %

iabbrev <buffer> ret return ;<left>
iabbrev <buffer> return NOPENOPENOPE
