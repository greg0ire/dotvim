set path=$PWD/**

set tags+=.git/tags

cabbr <expr> %% expand('%:p:h')

highlight clear SignColumn      " SignColumn should match background for
                                " things like vim-gitgutter

:highlight ExtraWhitespace ctermbg=red guibg=red
colorscheme base16-solarized-dark
