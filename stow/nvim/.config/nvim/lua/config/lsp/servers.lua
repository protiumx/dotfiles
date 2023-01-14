local servers = {
  tsserver = {},
  eslint = {},
  rust_analyzer = {},
  clangd = {},
  pyright = {},
  bashls = {},

  gopls = {
    gofumpt = true,
    analyses = {
      unusedparams = true,
    },
    staticcheck = true,
    linksInHover = false,
    codelenses = {
      generate = true,
      gc_details = true,
      regenerate_cgo = true,
      tidy = true,
      upgrade_depdendency = true,
      vendor = true,
    },
    usePlaceholders = true,
  },

  sumneko_lua = {
    Lua = {
      diagnostics = {
        globals = { 'vim', 'jit' }
      },
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.expand '$VIMRUNTIME/lua/vim/lsp'] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
      telemetry = { enable = false },
    },
  },
}

return servers