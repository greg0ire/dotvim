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

-- Telescope
map('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<cr>", silentnoremap)
map('n', '<leader>fds', ":lua require('telescope.builtin').lsp_document_symbols()<cr>", silentnoremap)
map('n', '<leader>gr', ":lua require('telescope.builtin').live_grep()<cr>", silentnoremap)
map(
  'n',
  '<leader>l',
  ":lua require('telescope.builtin').git_files({ git_command = {'git', 'ls-files', '--exclude-standard', '--cached', 'src'}})<cr>",
  silentnoremap
)
-- access buffers faster
map('n', '<leader>b', ":lua require('telescope.builtin').buffers()<CR>", silentnoremap)
map('n', '<leader>ta', ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>", silentnoremap)
map('n', '<leader>co', ":lua require('telescope.builtin').commands()<CR>", silentnoremap)
map('n', '<leader>ca', ":lua vim.lsp.buf.code_action()<CR>", silentnoremap)
map('n', '<leader>fm', ":lua vim.lsp.buf.format()<CR>", silentnoremap)
map('n', '<leader>tr', ":lua require('telescope.builtin').lsp_references()<CR>", silentnoremap)

-- search for word under cursor
map('n', '<leader>w', ':grep <cword><CR>', silentnoremap)

-- browse commit under cursor
map('n', '<leader>gh', ':GBrowse <cword><CR>', silentnoremap)

-- argwrap
map('n', '<leader>q', ':ArgWrap<CR>', silentnoremap)

-- gets the git history of the visual selection
map(
  'v',
  '<leader>l',
  ":<c-u>exe ':term git log -L' line(\"'<\").','.line(\"'>\").':'.expand('%')<CR>",
  silentnoremap
)
