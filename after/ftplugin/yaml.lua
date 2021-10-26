local map = vim.api.nvim_buf_set_keymap
local silentnoremap = {noremap = true, silent = true }

map(0, 'i', '<Leader>e', '<C-O> :PhpactorClassExpand<CR>', silentnoremap)
map(0, 'n', '<Leader>e', ':PhpactorClassExpand<CR>', silentnoremap)

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true -- did not get indent to work yet
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  }
}
