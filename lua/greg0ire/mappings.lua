local map = vim.keymap.set
local silentnoremapWithDesc = function(desc)
  return {noremap = true, silent = true, desc = desc}
end
local silentWithDesc = function(desc)
  return {silent = true, desc = desc}
end
local silent = {silent = true}

map('n', '<leader><space>', ':noh<CR>', silentWithDesc('clear the highlighting'))

-- disable n00b keys
map('n', '<up>', '<nop>', silent)
map('n', '<down>', '<nop>', silent)
map('n', '<left>', '<nop>', silent)
map('n', '<right>', '<nop>', silent)
map('i', '<up>', '<nop>', silent)
map('i', '<down>', '<nop>', silent)
map('i', '<left>', '<nop>', silent)
map('i', '<right>', '<nop>', silent)

-- http://stackoverflow.com/questions/80677/what-is-the-difference-between-c-c-and-c-in-vim
map('i', '<C-c>', '<Esc><Esc>', silent)

-- Make moving around windows faster
map('n', '<C-h>', '<C-w>h', silent)
map('n', '<C-j>', '<C-w>j', silent)
map('n', '<C-k>', '<C-w>k', silent)
map('n', '<C-l>', '<C-w>l', silent)

-- Telescope
map('n', '<leader>fds', require('telescope.builtin').lsp_document_symbols, silentWithDesc('document symbols'))
map('n', '<leader>gr', require('telescope.builtin').live_grep, silentWithDesc('live grep'))
map(
  'n',
  '<leader>l',
  function()
    require('telescope.builtin').git_files({ git_command = { 'git', 'ls-files', '--exclude-standard', '--cached', 'src' } })
  end,
  silentWithDesc('git files limited to src')
)

-- access buffers faster
map('n', '<leader>b', require('telescope.builtin').buffers, silentWithDesc('open buffers'))
map('n', '<leader>ta', require('telescope.builtin').lsp_workspace_symbols, silentWithDesc('workspace symbols'))
map('n', '<leader>co', require('telescope.builtin').commands, silentWithDesc('commands'))
map('n', '<leader>ca', vim.lsp.buf.code_action, silentWithDesc('code actions'))
map('n', '<leader>fm', vim.lsp.buf.format, silentWithDesc('format'))
map('n', '<leader>tr', require('telescope.builtin').lsp_references, silentWithDesc('references'))

map('n', '<leader>w', ':grep <cword><CR>', silentWithDesc('search for word under cursor'))

map('n', '<leader>gh', ':GBrowse <cword><CR>', silentWithDesc('browse commit under cursor'))

map('n', '<leader>q', ':ArgWrap<CR>', silentWithDesc('toggle multiline arguments'))

map(
  'v',
  '<leader>l',
  ":<c-u>exe ':term git log -L' line(\"'<\").','.line(\"'>\").':'.expand('%')<CR>",
  silentnoremapWithDesc('git log of visual selection')
)
