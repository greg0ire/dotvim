-- Load packager only when you need it
vim.cmd [[packadd vim-packager]]
require('packager').setup(function(packager)
  packager.add('nvimtools/none-ls.nvim')
  packager.add('gbprod/none-ls-php.nvim')
  packager.add('gbprod/none-ls-shellcheck.nvim')
  packager.add('FooSoft/vim-argwrap', { name = 'argwrap' })
  packager.add('SirVer/ultisnips')
  packager.add('ishan9299/nvim-solarized-lua')
  packager.add('andymass/vim-matchup', { name = 'matchup' })
  packager.add('chr4/nginx.vim', { name = 'nginx' })
  packager.add('folke/which-key.nvim')
  packager.add('fpob/nette.vim')
  packager.add('ray-x/go.nvim')
  packager.add('ray-x/guihua.lua')
  packager.add('mfussenegger/nvim-dap')
  packager.add('nvim-neotest/nvim-nio')
  packager.add('rcarriga/nvim-dap-ui')
  packager.add('theHamsta/nvim-dap-virtual-text')
  packager.add('github/copilot.vim')
  packager.add('CopilotC-Nvim/CopilotChat.nvim')
  packager.add('hashivim/vim-terraform')
  packager.add('IndianBoy42/tree-sitter-just')
  packager.add('Glench/Vim-Jinja2-Syntax')
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
  packager.add('nvim-telescope/telescope-ui-select.nvim')
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
  packager.add('williamboman/mason.nvim')
  packager.add('williamboman/mason-lspconfig.nvim')
  packager.add('stevearc/conform.nvim')
end)

require('tree-sitter-just').setup({})
require('CopilotChat').setup({})

if vim.g.started_by_firenvim == true
then
  vim.cmd([[
  packadd firenvim
  set background=light
  set laststatus=0
  augroup greg0ire
    autocmd!
    au BufEnter github.com_*.txt set filetype=markdown
  augroup END
  ]])
  vim.g.firenvim_config = {
    globalSettings = {
      alt = 'all',
    },
    localSettings = {
      ['.*'] = {
        cmdline = 'neovim',
        priority = 0,
        selector = 'textarea',
        takeover = 'never',
      },
    },
  }
else
  vim.cmd([[
    packadd airline
    packadd airline-themes
    let g:airline#extensions#tabline#enabled = 1
  ]])
end
