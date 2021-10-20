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

local map = vim.api.nvim_set_keymap
local silentnoremap = {noremap = true, silent = true }

-- ale mappings
map('n', '<Leader>k', '<Plug>(ale_previous_wrap)', { silent = true })
map('n', '<Leader>j', '<Plug>(ale_next_wrap)', { silent = true })

-- phpactor mappings
map('i', '<Leader>u', '<C-O> :PhpactorImportClass<CR>', silentnoremap)
map('n', '<Leader>u', ':PhpactorImportClass<CR>', silentnoremap)
map('i', '<Leader>e', '<C-O> :PhpactorClassExpand<CR>', silentnoremap)
map('n', '<Leader>e', ':PhpactorClassExpand<CR>', silentnoremap)

-- php-indent options
vim.g.PHP_noArrowMatching = true
vim.g.PHP_vintage_case_default_indent = 1

require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true -- did not get indent to work yet
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  }
}
