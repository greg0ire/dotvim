function file_exists(name)
   local f=io.open(name,"r")
   if f~=nil
     then io.close(f)
       return true
     else
       return false
     end
end

if file_exists('./vendor/bin/phpcbf')
  then
    vim.g.ale_fixers = {'phpcbf'}
  end

if file_exists('./.phpcs')
  then
    vim.g.ale_fixers = {'php_cs_fixer'}
  end


if file_exists('./vendor/bin/phpstan')
  then
    vim.g.ale_php_phpstan_executable = {'vendor/bin/phpstan'}
  end

if not file_exists('./vendor/bin/psalm')
  then
    vim.g.ale_psalm_langserver_options = '--config="$HOME/.config/psalm/psalm.xml"'
  end

vim.g.ale_php_phpstan_level = 'max'

local map = vim.api.nvim_buf_set_keymap
local silentnoremap = {noremap = true, silent = true }

-- ale mappings
map(0, 'n', '<Leader>k', '<Plug>(ale_previous_wrap)', { silent = true })
map(0, 'n', '<Leader>j', '<Plug>(ale_next_wrap)', { silent = true })

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
