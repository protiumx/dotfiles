local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('show_signcolumn', { clear = true })
autocmd({ 'BufRead', 'BufNewFile' }, {
  group = 'show_signcolumn',
  pattern = '*',
  command = 'setlocal signcolumn=yes',
})

-- Trim white spaces before writing
augroup('remove_white_spaces', { clear = true })
autocmd({ 'BufWritePre' }, {
  group = 'remove_white_spaces',
  pattern = "*",
  callback = function()
    if next(vim.lsp.buf_get_clients(0)) ~= nil then
      return
    end

    vim.cmd [[%s/\s\+$//e]]
  end,
})

augroup('yank_post', { clear = true })
autocmd('TextYankPost', {
  group = 'yank_post',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      timeout = 300,
    })
  end,
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = '*.heex',
  command = [[setlocal ft=html syntax=html]],
})

autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = 'Dockerfile*',
  command = [[set ft=dockerfile]],
})

augroup('term_open_insert', { clear = true })
autocmd('TermOpen', {
  group = 'term_open_insert',
  pattern = '*',
  command = [[
    startinsert
    setlocal nonumber norelativenumber nospell laststatus=0 signcolumn=no noruler
  ]],
})

-- dont list quickfix buffers
autocmd('FileType', {
  pattern = 'qf',
  callback = function()
    vim.opt_local.buflisted = false
  end,
})

autocmd('FileType', {
  pattern = { 'gitcommit', 'fugitive' },
  command = [[
    setlocal nonumber signcolumn=no
  ]]
})

autocmd('FileType', {
  pattern = { 'help', 'startuptime', 'qf', 'lspinfo' },
  command = [[nnoremap <buffer><silent> q :close<CR>]],
})

autocmd('FileType', {
  pattern = 'man',
  command = [[nnoremap <buffer><silent> q :quit<CR>]]
})

local cmd_timer = nil
augroup('clear_cmdline', { clear = true })
autocmd('CmdlineLeave', {
  group = 'clear_cmdline',
  pattern = '*',
  callback = function()
    cmd_timer = vim.defer_fn(function()
      vim.api.nvim_command('echo ""')
      cmd_timer = nil
    end, 3000)
  end,
})

autocmd({ 'CmdlineEnter', 'CmdlineChanged' }, {
  group = 'clear_cmdline',
  pattern = '*',
  callback = function()
    if cmd_timer ~= nil then
      cmd_timer:stop()
    end
  end,
})
