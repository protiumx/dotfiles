local M = {}

local function keymaps()
  local keymap = vim.keymap.set
  keymap('n', 'gh', '<cmd>Lspsaga lsp_finder<CR>', { silent = true })
  keymap('i', '<M-h>', '<Esc><cmd>Lspsaga lsp_finder<CR>', { silent = true })

  keymap({ 'n', 'v' }, '<Leader>ca', '<cmd>Lspsaga code_action<CR>', { silent = true })
  keymap('n', 'gr', '<cmd>Lspsaga rename<CR>', { silent = true })
  keymap('n', '<F2>', '<cmd>Lspsaga rename<CR>', { silent = true })

  keymap('n', '<M-d>', '<cmd>Lspsaga peek_definition<CR>', { silent = true })
  -- Go to definition
  keymap('n', 'gd', '<cmd>Lspsaga goto_definition<CR>')

  -- Show buffer diagnostics
  keymap('n', '<Leader>ld', '<cmd>Lspsaga show_buf_diagnostics<CR>')

  keymap('n', 'K', '<cmd>Lspsaga hover_doc<CR>', { silent = true })

  -- Diagnostic jump
  -- You can use <C-o> to jump back to your previous location
  keymap('n', '[e', '<cmd>Lspsaga diagnostic_jump_prev<CR>')
  keymap('n', ']e', '<cmd>Lspsaga diagnostic_jump_next<CR>')

  -- Only jump to errors
  keymap('n', '[E', function()
    require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })
  keymap('n', ']E', function()
    require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
  end, { silent = true })

  -- Outline
  keymap('n', '<M-S-H>', '<cmd>Lspsaga outline<CR>', { silent = true })
end

function M.setup()
  local colors = require('config.colors')
  require('lspsaga').setup({
    lightbulb = {
      enable = false,
    },

    symbol_in_winbar = {
      enable = false, -- showing symbols in feline
      separator = '  ',
      hide_keyword = true,
      show_file = false,
    },

    ui = {
      border = 'single',
      colors = {
        normal_bg = colors.background,
        title_bg = colors.background,
        red = '#e95678',
        magenta = '#b33076',
        orange = '#FF8700',
        yellow = '#f7bb3b',
        green = '#afd700',
        cyan = '#36d0e0',
        blue = '#61afef',
        purple = '#CBA6F7',
        white = '#d1d4cf',
        black = '#1c1c19',
      },
    },
  })

  keymaps()
end

return M
