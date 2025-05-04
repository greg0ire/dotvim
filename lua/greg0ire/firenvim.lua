if vim.g.started_by_firenvim == true
then
  vim.cmd([[
  set background=light
  set laststatus=0
  augroup greg0ire
    autocmd!
    au BufEnter github.com_*.txt set filetype=markdown
  augroup END
  ]])
  vim.g.firenvim_config = {
    globalSettings = {
      alt = 'all',
    },
    localSettings = {
      ['.*'] = {
        cmdline = 'neovim',
        priority = 0,
        selector = 'textarea',
        takeover = 'never',
      },
    },
  }
else
  require('lualine').setup()
end
