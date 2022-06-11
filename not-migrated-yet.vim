
call has('python3')
if filereadable(glob('~/.vimrc.local'))
  source ~/.vimrc.local
endif

set path=$PWD/**

set tags+=.git/tags

cabbr <expr> %% expand('%:p:h')

highlight clear SignColumn      " SignColumn should match background for
                                " things like vim-gitgutter

:highlight ExtraWhitespace ctermbg=red guibg=red

" remove trailing spaces
autocmd FileType less,sass,yml,css,html,php,twig,xml,yaml,sh autocmd BufWritePre <buffer> :call setline(1, map(getline(1,'$'), 'substitute(v:val,"\\s\\+$","","")'))
autocmd BufRead,BufNewFile /etc/nginx/* setf nginx
" syntactic coloration when using an editor from MariaDB's client
autocmd BufRead,BufNewFile /var/tmp/sql*,/tmp/sql* setf sql
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
colorscheme base16-solarized-dark
