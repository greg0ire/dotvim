
local map = vim.api.nvim_buf_set_keymap
local silentnoremap = {noremap = true, silent = true }

map(0, 'n', '<Leader>ta', ':Telescope lsp_dynamic_workspace_symbols<CR>', silentnoremap)
map(0, 'n', '<Leader>te', ':GoTestFunc<CR>', silentnoremap)
require('go').setup()

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimports()
  end,
  group = format_sync_grp,
})
