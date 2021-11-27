vim.o.textwidth = 72
vim.o.colorcolumn = '72'

vim.api.nvim_buf_set_keymap(
  0,
  'i',
  '<Leader>e',
  '<C-O>:call phpactor#ClassExpand()<CR>',
  { noremap = true, silent = true }
)
vim.api.nvim_buf_set_keymap(
  0,
  'n',
  '<Leader>e',
  '<C-O>:call phpactor#ClassExpand()<CR>',
  { noremap = true, silent = true }
)

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  }
}
