local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp_zero.default_keymaps({ buffer = bufnr })
end)



require('mason').setup({
  ensure_installed = { 'prettier' }
})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = { 'tsserver', 'eslint', 'lua_ls', 'tailwindcss', 'cssls', 'html', 'mdx_analyzer', 'sqlls', 'yamlls', 'gopls' },
  handlers = {
    lsp_zero.default_setup,
  },
})

local cmp = require('cmp')
cmp.setup({

  mapping = cmp.mapping.preset.insert({
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  })
})

lsp_zero.on_attach(function(client, bufnr)
  local otps = { buffer = bufnr, remap = false }

  vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, otps)
  vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, otps)
  vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, opts)
  -- vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, opts)
  vim.keymap.set('n', '<leader>vr', function() require('telescope.builtin').lsp_references() end, opts)
  vim.keymap.set('n', '<leader>rn', function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)

  lsp_zero.buffer_autoformat()
end)

lsp_zero.setup()
