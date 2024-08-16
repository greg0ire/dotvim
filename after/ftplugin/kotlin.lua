local map = vim.api.nvim_buf_set_keymap
local silentnoremap = {noremap = true, silent = true }

-- vim-test mappings
map(0, 'n', '<Leader>te', ':TestFile<CR>', silentnoremap)
