local map = vim.api.nvim_set_keymap
local silentnoremap = {noremap = true, silent = true}

vim.g.mapleader = ';' -- remap the leader to something easier to type

map('n', '<leader><space>', ':noh<CR>', silentnoremap) -- clear the highlighting

-- disable n00b keys
map('n', '<up>', '<nop>', silentnoremap)
map('n', '<down>', '<nop>', silentnoremap)
map('n', '<left>', '<nop>', silentnoremap)
map('n', '<right>', '<nop>', silentnoremap)
map('i', '<up>', '<nop>', silentnoremap)
map('i', '<down>', '<nop>', silentnoremap)
map('i', '<left>', '<nop>', silentnoremap)
map('i', '<right>', '<nop>', silentnoremap)

-- http://stackoverflow.com/questions/80677/what-is-the-difference-between-c-c-and-c-in-vim
map('i', '<C-c>', '<Esc><Esc>', silentnoremap)

-- Make moving around windows faster
map('n', '<C-h>', '<C-w>h', silentnoremap)
map('n', '<C-j>', '<C-w>j', silentnoremap)
map('n', '<C-k>', '<C-w>k', silentnoremap)
map('n', '<C-l>', '<C-w>l', silentnoremap)

-- FZF
map('n', '<leader>f', ":lua require('telescope.builtin').git_files()<cr>", silentnoremap)
map(
  'n',
  '<leader>l',
  ":lua require('telescope.builtin').git_files({ git_command = {'git', 'ls-files', '--exclude_standard', '--cached', 'src'}})<cr>",
  silentnoremap
)
map('i', '<C-x><C-f>', "fzf#vim#complete#path('rg --files')", { noremap = true, expr = true })
-- access buffers faster
map('n', '<leader>b', ":lua require('telescope.builtin').buffers()<CR>", silentnoremap)

-- search for word under cursor
map('n', '<leader>w', ':grep <cword><CR>', silentnoremap)
map('n', '<leader>ta', ":lua require('telescope.builtin').tags()<CR>", silentnoremap)

-- argwrap
map('n', '<leader>q', ':ArgWrap<CR>', silentnoremap)

-- gets the git history of the visual selection
map(
  'v',
  '<leader>l',
  ":<c-u>exe ':term git log -L' line(\"'<\").','.line(\"'>\").':'.expand('%')<CR>",
  silentnoremap
)

-- ctags update
map(
  'n',
  '<Leader>tu',
  ":! .git/hooks/php/ctags/update-ctags<CR>",
  silentnoremap
)
