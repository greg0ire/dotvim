return {
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
  }
}
