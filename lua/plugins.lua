return {
  {
    'dmtrKovalenko/fff.nvim',
    build = function()
      -- this will download prebuild binary or try to use existing rustup toolchain to build from source
      -- (if you are using lazy you can use gb for rebuilding a plugin if needed)
      require("fff.download").download_or_build_binary()
    end,
    -- if you are using nixos
    -- build = "nix run .#release",
    opts = { -- (optional)
      debug = {
        enabled = true,     -- we expect your collaboration at least during the beta
        show_scores = true, -- to help us optimize the scoring system, feel free to share your scores!
      },
    },
    -- No need to lazy-load with lazy.nvim.
    -- This plugin initializes itself lazily.
    lazy = false,
    keys = {
      {
        "ff", -- try it if you didn't it is a banger keybinding for a picker
        function() require('fff').find_files() end,
        desc = 'FFFind files',
      }
    }
  },
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
    branch = "main",
    run = ":TSUpdate"
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
    version = "^1.0.0",
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
  },
  {
    'MeanderingProgrammer/treesitter-modules.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      ensure_installed = languages,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<A-o>",
          node_incremental = "<A-o>",
          scope_incremental = "<A-O>",
          node_decremental = "<A-i>",
        },
      },
    },
  },
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
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
}
