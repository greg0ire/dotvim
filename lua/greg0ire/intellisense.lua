local cmp = require 'cmp'
cmp.setup {
    snippet = {
    expand = function(args)
      -- For `ultisnips` user.
      vim.fn["UltiSnips#Anon"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'buffer' },
    { name = 'ultisnips' },
    { name = 'nvim_lsp' }
  }
}

local custom_lsp_attach = function(ev)
  local client = vim.lsp.get_client_by_id(ev.data.client_id)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(0, ...) end
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {noremap = true})
  buf_set_keymap('n', '<c-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', {noremap = true})
  buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- show diagnostics on current line in a float
  buf_set_keymap('n', '<leader>di', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)

  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)


  -- Use LSP as the handler for omnifunc.
  --    See `:help omnifunc` and `:help ins-completion` for more information.
  vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  if client.server_capabilities.documentHighlightProvider then
    vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
    vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
    vim.api.nvim_create_autocmd("CursorHold", {
      pattern = "*.php",
      callback = function()
        if string.sub(vim.fn.expand('%'), 1, string.len("fugitive")) == "fugitive" then
            return
        end
        vim.lsp.buf.document_highlight()
      end,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Document Highlight",
    })
    vim.api.nvim_create_autocmd("CursorMoved", {
      pattern = "*.php",
      callback = vim.lsp.buf.clear_references,
      buffer = bufnr,
      group = "lsp_document_highlight",
      desc = "Clear All the References",
    })
  end

  -- For plugins with an `on_attach` callback, call them here. For example:
  -- require('completion').on_attach()
end

require("mason").setup()
require("mason-lspconfig").setup()

require("mason-lspconfig").setup_handlers {
    function (server_name) -- default handler (optional)
      require("lspconfig")[server_name].setup {
        on_attach=custom_lsp_attach,
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      }
    end,
}

local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    require("none-ls-php.diagnostics.php"),
    require("none-ls-shellcheck.diagnostics"),
    require("none-ls-shellcheck.code_actions"),
    null_ls.builtins.diagnostics.phpcs.with({
      only_local = 'vendor/bin',
      condition = function(utils)
        return utils.root_has_file('vendor/bin/phpcs')
      end
    }),
    null_ls.builtins.formatting.phpcsfixer.with({
      only_local = 'vendor/bin',
      condition = function(utils)
        return utils.root_has_file('vendor/bin/php-cs-fixer')
      end
    }),
    null_ls.builtins.formatting.phpcbf.with({
      only_local = 'vendor/bin',
      condition = function(utils)
        return utils.root_has_file('vendor/bin/phpcbf')
      end
    }),
  },
})
