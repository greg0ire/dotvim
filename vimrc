call has('python3')
if filereadable(glob('~/.vimrc.local'))
  source ~/.vimrc.local
endif

set rtp+=~/.fzf

set path=$PWD/**

set noswapfile

" don't try to be compatible with old specs of vi
if &compatible
  set nocompatible
endif

" Load packager only when you need it
function! PackagerInit() abort
  packadd vim-packager
  call packager#init({ 'dir': '~/.vim/pack/greg0ire' })
  call packager#add('FooSoft/vim-argwrap', { 'name': 'argwrap' })
  call packager#add('Shougo/deoplete.nvim', { 'name': 'deoplete' })
  call packager#add('SirVer/ultisnips')
  call packager#add('airblade/vim-gitgutter', { 'name': 'gitgutter' })
  call packager#add('altercation/vim-colors-solarized', { 'name': 'solarized' })
  call packager#add('andymass/vim-matchup', { 'name': 'matchup' })
  call packager#add('bling/vim-bufferline', { 'name': 'bufferline' })
  call packager#add('chr4/nginx.vim', { 'name': 'nginx' })
  call packager#add('dense-analysis/ale')
  call packager#add('janko-m/vim-test', { 'name': 'test' })
  call packager#add('jiangmiao/auto-pairs')
  call packager#add('junegunn/fzf.vim', { 'name': 'fzf' })
  call packager#add('junegunn/vader.vim', { 'name': 'vader' })
  call packager#add('kristijanhusak/deoplete-phpactor')
  call packager#add('kristijanhusak/vim-packager', { 'type': 'opt' })
  call packager#add('lumiliet/vim-twig', { 'name': 'twig' })
  call packager#add('michaeljsmith/vim-indent-object')
  call packager#add('pbrisbin/vim-mkdir', { 'name': 'mkdir' })
  call packager#add('preservim/nerdtree')
  call packager#add('roxma/nvim-yarp')
  call packager#add('roxma/vim-hug-neovim-rpc')
  call packager#add('tpope/vim-commentary', { 'name': 'commentary' })
  call packager#add('tpope/vim-eunuch', { 'name': 'eunuch' })
  call packager#add('tpope/vim-fugitive', { 'name': 'fugitive' })
  call packager#add('tpope/vim-repeat', { 'name': 'repeat' })
  call packager#add('tpope/vim-sleuth', { 'name': 'sleuth' })
  call packager#add('tpope/vim-surround', { 'name': 'surround' })
  call packager#add('tpope/vim-unimpaired', { 'name': 'unimpaired' })
  call packager#add('vim-airline/vim-airline', { 'name': 'airline' })
  call packager#add('vim-airline/vim-airline-themes', { 'name': 'airline-themes' })
  call packager#add('vim-scripts/argtextobj.vim', { 'name': 'argtextobj' })

  "Loaded only for specific filetypes on demand. Requires autocommands below.
  call packager#add('phpactor/phpactor', { 'do': 'composer install', 'type': 'opt' })
endfunction


command! PackagerInstall call PackagerInit() | call packager#install()
command! -bang PackagerUpdate call PackagerInit() | call packager#update({ 'force_hooks': '<bang>' })
command! PackagerClean call PackagerInit() | call packager#clean()
command! PackagerStatus call PackagerInit() | call packager#status()

"Load plugins only for specific filetype
augroup packager_filetype
  autocmd!
  autocmd FileType php packadd phpactor
augroup END


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

colorscheme solarized
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"

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

let g:php_cs_fixer_path = "~/bin/php-cs-fixer"  " define the path to the php-cs-fixer.phar
let g:php_cs_fixer_php_path = "php"             " Path to PHP
let g:php_cs_fixer_level = 'all'                " Which part of the standard to apply
let g:php_cs_fixer_config_file = '.php_cs'      " works only if you open vim in the root of the project
let g:php_cs_fixer_enable_default_mapping = 1   " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
let g:php_cs_fixer_verbose = 1                  " Return the output of command if 1, else an inline information.

let g:gitgutter_eager = 0 " Avoid gitgutter lag

let g:deoplete#enable_at_startup = 1

let g:syntastic_puppet_puppet_args = '--parser=future'
let g:airline#extensions#ale#enabled = 1
let g:ale_echo_msg_format = '%linter% %s'
let g:ale_sign_error = '💩'
let g:ale_sign_warning = '⚠️'

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

  " sf phpunit
  nnoremap <leader>p :! bin/phpunit --configuration app %<CR>

  " access buffers faster
  nnoremap <leader>b :Buffers<CR>

  " search for word under cursor
  nnoremap <leader>w :grep <cword><CR>

  nnoremap <leader>ta :Tags<CR>

  " argwrap
  nnoremap <silent> <leader>q :ArgWrap<CR>
" }
