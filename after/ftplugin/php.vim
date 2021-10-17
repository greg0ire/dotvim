" Not customizing equalprg or formatprg for this since phpcbf is not a filter,
" meaning it does not work well on lines or blocks, but on whole files.
noremap <buffer> <Leader>x :!phpcbf %<CR>:edit<CR>

" phpactor mappings
inoremap <buffer> <Leader>u <C-O>:PhpactorImportClass<CR>
noremap <buffer> <Leader>u :PhpactorImportClass<CR>
inoremap <buffer> <Leader>e <C-O>:PhpactorClassExpand<CR>
noremap <buffer> <Leader>e :PhpactorClassExpand<CR>
noremap <buffer> <Leader>] :PhpactorGotoDefinition<CR>
noremap <buffer> <Leader>te :TestFile --testdox<CR>
nmap <silent> <Leader>k <Plug>(ale_previous_wrap)
nmap <silent> <Leader>j <Plug>(ale_next_wrap)

let g:ale_php_phpstan_level = 'max'
if !filereadable('./vendor/bin/psalm')
  let g:ale_psalm_langserver_options = '--config="$HOME/.config/psalm/psalm.xml"'
endif

if filereadable('./vendor/bin/phpcbf')
  let b:ale_fixers = ['phpcbf']
endif

if filereadable('./vendor/bin/phpstan')
  let g:ale_php_phpstan_executable = 'vendor/bin/phpstan'
endif

if filereadable('./.php_cs')
  let b:ale_fixers = ['php_cs_fixer']
endif

" php-indent options
let g:PHP_noArrowMatching = 1
let g:PHP_vintage_case_default_indent = 1

lua << EOF
  local custom_lsp_attach = function(client)
    local opts = { noremap=true, silent=true }
    vim.api.nvim_buf_set_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
    vim.api.nvim_buf_set_keymap(0, 'n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
    -- Use LSP as the handler for omnifunc.
    --    See `:help omnifunc` and `:help ins-completion` for more information.
    vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- For plugins with an `on_attach` callback, call them here. For example:
    -- require('completion').on_attach()
  end

  require'lspconfig'.phpactor.setup{
    on_attach=custom_lsp_attach
  }
EOF

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
