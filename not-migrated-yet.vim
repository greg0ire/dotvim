
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
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost .php_cs set filetype=php
" syntactic coloration when using an editor from MariaDB's client
autocmd BufRead,BufNewFile /var/tmp/sql*,/tmp/sql* setf sql
augroup MyColors
  autocmd!
  autocmd ColorScheme * highlight NormalFloat cterm=NONE ctermbg=76 ctermfg=16 gui=NONE guibg=#073642 guifg=#ffffff
augroup END

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
autocmd FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
