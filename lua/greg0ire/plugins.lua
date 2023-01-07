-- Load packager only when you need it
vim.cmd [[packadd vim-packager]]
require('packager').setup(function(packager)
  packager.add('jose-elias-alvarez/null-ls.nvim')
  packager.add('FooSoft/vim-argwrap', { name = 'argwrap' })
  packager.add('SirVer/ultisnips')
  packager.add('fnune/base16-vim', { name = 'base16' })
  packager.add('andymass/vim-matchup', { name = 'matchup' })
  packager.add('chr4/nginx.vim', { name = 'nginx' })
  packager.add('fpob/nette.vim')
  packager.add('github/copilot.vim')
  packager.add('janko-m/vim-test', { name = 'test' })
  packager.add('jiangmiao/auto-pairs')
  packager.add('junegunn/vader.vim', { name = 'vader' })
  packager.add('kristijanhusak/vim-packager', { type = 'opt' })
  packager.add('lewis6991/gitsigns.nvim')
  packager.add('lumiliet/vim-twig', { name = 'twig' })
  packager.add('michaeljsmith/vim-indent-object')
  packager.add('neovim/nvim-lspconfig')
  packager.add('nvim-lua/plenary.nvim')
  packager.add('nvim-telescope/telescope.nvim')
  packager.add('hrsh7th/nvim-cmp')
  packager.add('hrsh7th/cmp-buffer')
  packager.add('hrsh7th/cmp-nvim-lsp')
  packager.add('quangnguyen30192/cmp-nvim-ultisnips')
  packager.add('mcauley-penney/tidy.nvim')
  packager.add('nvim-treesitter/nvim-treesitter', {
    name = 'treesitter',
    ['do'] = ':TSUpdate'
  })
  packager.add('nvim-treesitter/nvim-treesitter-context')
  packager.add('nvim-treesitter/nvim-treesitter-textobjects')
  packager.add('pbrisbin/vim-mkdir', { name = 'mkdir' })
  packager.add('preservim/nerdtree')
  packager.add('tpope/vim-commentary', { name = 'commentary' })
  packager.add('tpope/vim-eunuch', { name = 'eunuch' })
  packager.add('tpope/vim-fugitive', { name = 'fugitive' })
  packager.add('tpope/vim-repeat', { name = 'repeat' })
  packager.add('tpope/vim-rhubarb', { name = 'rhubarb' })
  packager.add('tpope/vim-sleuth', { name = 'sleuth' })
  packager.add('tpope/vim-surround', { name = 'surround' })
  packager.add('tpope/vim-unimpaired', { name = 'unimpaired' })
  packager.add('vim-airline/vim-airline', { name = 'airline', type = 'opt' })
  packager.add('vim-airline/vim-airline-themes', { name = 'airline-themes', type = 'opt' })
  packager.add('github/copilot.vim')
  packager.add('glacambre/firenvim', {
    name = 'firenvim',
    ['do'] = ':call firenvim#install(0)',
    type = 'opt'
  })
  packager.add('phpactor/phpactor', { ['do'] = 'composer install' })
  packager.add('vim-vdebug/vdebug')
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
  let g:airline#extensions#tabline#enabled = 1
endif
]])
