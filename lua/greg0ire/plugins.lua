-- Load packager only when you need it
vim.cmd [[packadd vim-packager]]
require('packager').setup(function(packager)
  packager.add('FooSoft/vim-argwrap', { name = 'argwrap' })
  packager.add('Shougo/deoplete.nvim', { name = 'deoplete' })
  packager.add('SirVer/ultisnips')
  packager.add('airblade/vim-gitgutter', { name = 'gitgutter' })
  packager.add('RRethy/nvim-base16', { name = 'base16' })
  packager.add('andymass/vim-matchup', { name = 'matchup' })
  packager.add('chr4/nginx.vim', { name = 'nginx' })
  packager.add('dense-analysis/ale')
  packager.add('janko-m/vim-test', { name = 'test' })
  packager.add('jiangmiao/auto-pairs')
  packager.add('junegunn/fzf.vim', { name = 'fzf' })
  packager.add('junegunn/vader.vim', { name = 'vader' })
  packager.add('kristijanhusak/deoplete-phpactor')
  packager.add('kristijanhusak/vim-packager', { type = 'opt' })
  packager.add('lumiliet/vim-twig', { name = 'twig' })
  packager.add('michaeljsmith/vim-indent-object')
  packager.add('neovim/nvim-lspconfig')
  packager.add('nvim-treesitter/nvim-treesitter', {
    name = 'treesitter',
    branch = '0.5-compat',
    ['do'] = ':TSUpdate'
  })
  packager.add('pbrisbin/vim-mkdir', { name = 'mkdir' })
  packager.add('preservim/nerdtree')
  packager.add('roxma/nvim-yarp')
  packager.add('roxma/vim-hug-neovim-rpc')
  packager.add('tpope/vim-commentary', { name = 'commentary' })
  packager.add('tpope/vim-eunuch', { name = 'eunuch' })
  packager.add('tpope/vim-fugitive', { name = 'fugitive' })
  packager.add('tpope/vim-repeat', { name = 'repeat' })
  packager.add('tpope/vim-sleuth', { name = 'sleuth' })
  packager.add('tpope/vim-surround', { name = 'surround' })
  packager.add('tpope/vim-unimpaired', { name = 'unimpaired' })
  packager.add('vim-airline/vim-airline', { name = 'airline', type = 'opt' })
  packager.add('vim-airline/vim-airline-themes', { name = 'airline-themes', type = 'opt' })
  packager.add('vim-scripts/argtextobj.vim', { name = 'argtextobj' })
  packager.add('glacambre/firenvim', {
    name = 'firenvim',
    ['do'] = ':call firenvim#install(0)',
    type = 'opt'
  })
  packager.add('phpactor/phpactor', { ['do'] = 'composer install' })
end)

vim.cmd([[
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
