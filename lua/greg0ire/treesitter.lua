require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = {
      "php" -- needed for the cursor to be properly indented on new lines
    },
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  textobjects = {
    select = {
      enable = true,

      keymaps = {
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
  },
}
