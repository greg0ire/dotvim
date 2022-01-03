local map = vim.api.nvim_buf_set_keymap
local silentnoremap = {noremap = true, silent = true }

map(0, 'i', '<Leader>e', '<C-O> :PhpactorClassExpand<CR>', silentnoremap)
map(0, 'n', '<Leader>e', ':PhpactorClassExpand<CR>', silentnoremap)
