function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil
     then io.close(f)
       return true
     else
       return false
     end
end

local map = vim.api.nvim_buf_set_keymap
local silentnoremap = {noremap = true, silent = true }

-- phpactor mappings
map(0, 'i', '<Leader>u', '<C-O> :PhpactorImportClass<CR>', silentnoremap)
map(0, 'n', '<Leader>u', ':PhpactorImportClass<CR>', silentnoremap)
map(0, 'i', '<Leader>e', '<C-O> :PhpactorClassExpand<CR>', silentnoremap)
map(0, 'n', '<Leader>e', ':PhpactorClassExpand<CR>', silentnoremap)

-- show diagnostics on current line in a float
vim.api.nvim_set_keymap('n', '<leader>di', '<cmd>lua vim.diagnostic.open_float()<CR>', silentnoremap)
-- navigate to previous diagnostic
vim.api.nvim_set_keymap('n', '<leader>dp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', silentnoremap)
-- next diagnostic
vim.api.nvim_set_keymap('n', '<leader>dn', '<cmd>lua vim.diagnostic.goto_next()<CR>', silentnoremap)

-- vim-test mappings
map(0, 'n', '<Leader>te', ':TestFile --testdox<CR>', silentnoremap)

-- php-indent options
vim.g.PHP_noArrowMatching = true
vim.g.PHP_vintage_case_default_indent = 1
