require("telescope").setup {
  defaults = {
    path_display = { "smart" }
  },
  pickers = {
    find_files = {
      find_command = { "fd", "--type", "f", ".", ".", "vendor/" }
    },
  }
}
require("telescope").load_extension("ui-select")
