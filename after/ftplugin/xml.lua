local map = vim.api.nvim_set_keymap
local silentnoremap = {noremap = true, silent = true }

map('i', '<Leader>e', '<C-O> :PhpactorClassExpand<CR>', silentnoremap)
map('n', '<Leader>e', ':PhpactorClassExpand<CR>', silentnoremap)
