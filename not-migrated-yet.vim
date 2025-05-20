set path=$PWD/**
syntax off

cabbr <expr> %% expand('%:p:h')
set clipboard+=unnamedplus

:highlight ExtraWhitespace ctermbg=red guibg=red
colorscheme solarized
set mouse=
