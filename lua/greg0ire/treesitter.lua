require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,

      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
      },
    },
  },
}
