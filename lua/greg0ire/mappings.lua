local map = vim.api.nvim_set_keymap
local silentnoremap = {noremap = true, silent = true}
local silentnoremapWithDesc = function(desc)
  return {noremap = true, silent = true, desc = desc}
end

map('n', '<leader><space>', ':noh<CR>', silentnoremapWithDesc('clear the highlighting'))

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
map('n', '<leader>ff', ":lua require('telescope.builtin').find_files()<cr>", silentnoremapWithDesc('find files'))
map('n', '<leader>fds', ":lua require('telescope.builtin').lsp_document_symbols()<cr>", silentnoremapWithDesc('document symbols'))
map('n', '<leader>gr', ":lua require('telescope.builtin').live_grep()<cr>", silentnoremapWithDesc('live grep'))
map(
  'n',
  '<leader>l',
  ":lua require('telescope.builtin').git_files({ git_command = {'git', 'ls-files', '--exclude-standard', '--cached', 'src'}})<cr>",
  silentnoremapWithDesc('git files limited to src')
)
-- access buffers faster
map('n', '<leader>b', ":lua require('telescope.builtin').buffers()<CR>", silentnoremapWithDesc('open buffers'))
map('n', '<leader>ta', ":lua require('telescope.builtin').lsp_workspace_symbols()<CR>", silentnoremapWithDesc('workspace symbols'))
map('n', '<leader>co', ":lua require('telescope.builtin').commands()<CR>", silentnoremapWithDesc('commands'))
map('n', '<leader>ca', ":lua vim.lsp.buf.code_action()<CR>", silentnoremapWithDesc('code actions'))
map('n', '<leader>fm', ":lua vim.lsp.buf.format()<CR>", silentnoremapWithDesc('format'))
map('n', '<leader>tr', ":lua require('telescope.builtin').lsp_references()<CR>", silentnoremapWithDesc('references'))

map('n', '<leader>w', ':grep <cword><CR>', silentnoremapWithDesc('search for word under cursor'))

map('n', '<leader>gh', ':GBrowse <cword><CR>', silentnoremapWithDesc('browse commit under cursor'))

map('n', '<leader>q', ':ArgWrap<CR>', silentnoremapWithDesc('toggle multiline arguments'))

map(
  'v',
  '<leader>l',
  ":<c-u>exe ':term git log -L' line(\"'<\").','.line(\"'>\").':'.expand('%')<CR>",
  silentnoremapWithDesc('git log of visual selection')
)
