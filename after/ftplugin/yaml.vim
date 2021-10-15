inoremap <buffer> <Leader>e <C-O>:PhpactorClassExpand<CR>
noremap <buffer> <Leader>e :PhpactorClassExpand<CR>

lua <<EOF
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
EOF
