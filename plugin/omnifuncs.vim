"Setting omnifunc variable
augroup set_omnifunc
    au!
    au Filetype c setlocal omnifunc=ccomplete#Complete
    au Filetype python setlocal omnifunc=python3complete#Complete
augroup end
