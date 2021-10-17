vim.o.textwidth = 72
vim.o.colorcolumn = 72

vim.api.nvim_set_keymap(
  'i',
  '<Leader>e',
  '<C-O>:call phpactor#ClassExpand()<CR>',
  { buffer = true, noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  'n',
  '<Leader>e',
  '<C-O>:call phpactor#ClassExpand()<CR>',
  { buffer = true, noremap = true, silent = true }
)
