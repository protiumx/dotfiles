local M = {}

function M.setup(bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = '[LSP] ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('gy', vim.lsp.buf.type_definition, 'Show type definition')
  nmap('gi', vim.lsp.buf.implementation, 'Go to implementation')
  nmap('gd', '<cmd>lua vim.lsp.buf.definition()<CR>zz', 'Go to definition')
  nmap('[d', vim.diagnostic.goto_prev, 'Go to prev diagnostic')
  nmap(']d', vim.diagnostic.goto_next, 'Go to next diagnostic')
  nmap('[e', function()
    vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, 'Go to prev error')
  nmap(']e', function()
    vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, 'Go to next error')
  -- nmap('K', vim.lsp.buf.hover, 'Show docs')
  nmap('<C-l>h', vim.lsp.buf.document_highlight, 'Highlight node')
  nmap('<C-l>c', vim.lsp.buf.document_highlight, 'Clear highlights')
end

return M
