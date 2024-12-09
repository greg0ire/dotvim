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

-- vim-test mappings
map(0, 'n', '<Leader>te', ':TestFile --testdox<CR>', silentnoremap)

-- php-indent options
vim.g.PHP_noArrowMatching = true
vim.g.PHP_vintage_case_default_indent = 1

if file_exists('docker-compose.yaml') then
  vim.g['test#php#phpunit#executable'] = 'docker-compose exec php vendor/bin/phpunit'
end
