return {
  "FooSoft/vim-argwrap",
  "SirVer/ultisnips",
  "andymass/vim-matchup",
  "chr4/nginx.vim",
  "fpob/nette.vim",
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    "gbprod/none-ls-php.nvim",
    ft = "php",
  },
  {
    "gbprod/none-ls-shellcheck.nvim",
    ft = "sh",
  },
  "github/copilot.vim",
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
    }
  },
  "ishan9299/nvim-solarized-lua",
  "janko-m/vim-test",
  "jiangmiao/auto-pairs",
  "junegunn/vader.vim",
  "lewis6991/gitsigns.nvim",
  {
  "lumiliet/vim-twig",
  ft = "twig",
  },
  "mcauley-penney/tidy.nvim",
  "michaeljsmith/vim-indent-object",
  "neovim/nvim-lspconfig",
  "nvim-lua/plenary.nvim",
  "nvim-lualine/lualine.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  "nvim-telescope/telescope.nvim",
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  "nvimtools/none-ls.nvim",
  "quangnguyen30192/cmp-nvim-ultisnips",
  {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate"
  },
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "pbrisbin/vim-mkdir",
  {
    "phpactor/phpactor",
    ft = "php",
    build = "composer install"
  },
  "preservim/nerdtree",
  "tpope/vim-eunuch",
  "tpope/vim-fugitive",
  "tpope/vim-repeat",
  "tpope/vim-rhubarb",
  "tpope/vim-sleuth",
  "tpope/vim-surround",
  "tpope/vim-unimpaired",
  {
    "glacambre/firenvim",
    build = ":call firenvim#install(0)"
  },
  "vim-vdebug/vdebug",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim"
}
