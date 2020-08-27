" https://vi.stackexchange.com/questions/27024/how-to-get-syntactic-coloration-for-dist-files/27025
autocmd BufNewFile,BufRead ?\+.dist
    \ execute 'doautocmd filetypedetect BufRead' fnameescape(expand('<afile>:r'))
