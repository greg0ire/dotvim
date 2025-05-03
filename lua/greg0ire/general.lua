local g = vim.g
local o = vim.o
local wo = vim.wo

o.swapfile = false -- Disable swap files

o.termguicolors = true
g.gdefault = true

o.showcmd = true
o.ruler = true
o.laststatus = 2

o.backspace = 'indent,eol,start'

o.incsearch = true  -- search as chars are entered
o.hlsearch = true   -- highlight matches
o.ignorecase = true -- Case insensitive search
o.smartcase = true  -- except when explicitly using capital letters

o.cursorline = true

o.undofile = true -- save undo history to a file

o.grepprg = 'rg --vimgrep --smart-case'
o.grepformat = '%f:%l:%c:%m'

o.colorcolumn = '81'

wo.relativenumber = true -- display line numbers relative to the current line
wo.number = true -- hybrid mode (requires a recent vim)

o.updatetime = 1000 -- faster highlight updates
