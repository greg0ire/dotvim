local map = vim.api.nvim_buf_set_keymap
local silentnoremap = {noremap = true, silent = true }

-- vim-test mappings
map(0, 'n', '<Leader>te', ':TestFile<CR>', silentnoremap)

-- conform mapping
map(0, 'n', '<leader>fm', ":lua require('conform').format({ timeout_ms = 2000 })<CR>", silentnoremap)

-- Create an autocmd group to avoid duplicate definitions
vim.cmd([[
  augroup KotlinGradleTest
    autocmd!
    autocmd BufEnter *.kt lua SetGradleTestExecutable()
  augroup END
]])

-- Define the function to set the Gradle test executable
function SetGradleTestExecutable()
  if vim.fn.expand('%:p'):match('src/testIntegration') then
    vim.g['test#kotlin#gradletest#executable'] = './gradlew testIntegration'
  else
    vim.g['test#kotlin#gradletest#executable'] = './gradlew test'
  end
end
