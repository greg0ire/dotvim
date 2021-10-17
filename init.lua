require('greg0ire.plugins')

vim.cmd([[
call has('python3')
if filereadable(glob('~/.vimrc.local'))
  source ~/.vimrc.local
endif

set path=$PWD/**

set noswapfile


" add some color
syntax on

set modelines=0
set encoding=utf-8
set scrolloff=3
set showmode

set hidden
set visualbell
set cursorline
set ttyfast

" display line numbers relative to the current line
set relativenumber
set number " hybrid mode (requires a recent vim)

" save undo history to a file
set undofile
set undodir=~/.vim/undo

colorscheme base16-solarized-dark

set background=dark
filetype on
filetype plugin on

set tags+=.git/tags

" remove trailing spaces
autocmd FileType less,sass,yml,css,html,php,twig,xml,yaml,sh autocmd BufWritePre <buffer> :call setline(1, map(getline(1,'$'), 'substitute(v:val,"\\s\\+$","","")'))
autocmd BufRead,BufNewFile /etc/nginx/* setf nginx
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost .php_cs set filetype=php

" syntactic coloration when using an editor from MariaDB's client
autocmd BufRead,BufNewFile /var/tmp/sql*,/tmp/sql* setf sql

set grepprg=rg\ --vimgrep\ --smart-case
set grepformat=%f:%l:%c:%m


cabbr <expr> %% expand('%:p:h')
set incsearch
set gdefault

"remap the leader to something easier to type
let mapleader = ";"

set hlsearch
"clear the highlighting
nnoremap <leader><space> :noh<cr>

set cc=81

" Vim UI {
    highlight clear SignColumn      " SignColumn should match background for
                                    " things like vim-gitgutter
    " show commands at the bottom right
    set showcmd
    set ruler
    set laststatus=2

    let g:airline_powerline_fonts = 1
    let g:airline_theme='solarized'
    set backspace=indent,eol,start
    set ignorecase
    set smartcase
    set wildmode=longest,list,full
    set wildmenu
    :highlight ExtraWhitespace ctermbg=red guibg=red
    :autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
" }

let g:dbgPavimBreakAtEntry = 0

let g:gitgutter_eager = 0 " Avoid gitgutter lag

let g:deoplete#enable_at_startup = 1

let g:syntastic_puppet_puppet_args = '--parser=future'
let g:ale_echo_msg_format = '%linter% %s'
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '🙊'

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

let g:puppet_align_hashes = 0

" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. <Leader>aip)
nmap <Leader>a <Plug>(EasyAlign)

" php tags update
noremap <Leader>tu :! .git/hooks/php/ctags/update-ctags<CR>

" Instead of reverting the cursor to the last position in the buffer, we
" set it to the first line when editing a git commit message
au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])

:command! -bang -range -nargs=1 -complete=file MoveWrite  <line1>,<line2>write<bang> <args> | <line1>,<line2>delete _
:command! -bang -range -nargs=1 -complete=file MoveAppend <line1>,<line2>write<bang> >> <args> | <line1>,<line2>delete _

" Key (re)Mappings {
  " disable noob keys
  nnoremap <up> <nop>
  nnoremap <down> <nop>
  nnoremap <left> <nop>
  nnoremap <right> <nop>
  inoremap <up> <nop>
  inoremap <down> <nop>
  inoremap <left> <nop>
  inoremap <right> <nop>

  " @see http://stackoverflow.com/questions/80677/what-is-the-difference-between-c-c-and-c-in-vim
  inoremap <C-c> <Esc><Esc>

  "Make moving around windows faster
  nnoremap <C-h> <C-w>h
  nnoremap <C-j> <C-w>j
  nnoremap <C-k> <C-w>k
  nnoremap <C-l> <C-w>l

  " FZF
  nnoremap <leader>f :Files<CR>
  nnoremap <leader>l :Files src<CR>
  inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')

  " access buffers faster
  nnoremap <leader>b :Buffers<CR>

  " search for word under cursor
  nnoremap <leader>w :grep <cword><CR>

  nnoremap <leader>ta :Tags<CR>

  " argwrap
  nnoremap <silent> <leader>q :ArgWrap<CR>

  " gets the git history of the visual selection
  vnoremap <leader>l :<c-u>exe ':term git log -L' line("'<").','.line("'>").':'.expand('%')<CR>
" }


if exists('g:started_by_firenvim')
  packadd firenvim
  set background=light
  set laststatus=0
  augroup greg0ire
    autocmd!
    au BufEnter github.com_*.txt set filetype=markdown
  augroup END
  let g:firenvim_config = {
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'never',
        \ },
    \ }
  \ }
else
  packadd airline
  packadd airline-themes
  let g:airline#extensions#ale#enabled = 1
  let g:airline#extensions#tabline#enabled = 1
endif
]])
