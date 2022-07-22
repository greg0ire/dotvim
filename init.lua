require('greg0ire.commands')
require('greg0ire.general')
require('greg0ire.intellisense')
require('greg0ire.mappings')
require('greg0ire.plugins')
require('greg0ire.telescope')
require('greg0ire.treesitter')
local f = io.open(os.getenv('HOME') .. '/.init.local.lua', 'r')
if f~=nil then
  f:close()
  dofile(os.getenv('HOME') .. '/.init.local.lua')
end
vim.cmd 'source ~/.config/nvim/not-migrated-yet.vim'
