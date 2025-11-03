local function lsp_status()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if #clients == 0 then
    return ''
  end
  local names = {}
  for _, client in ipairs(clients) do
    table.insert(names, client.name)
  end
  return ' LSP:' .. table.concat(names, ',')
end

local function diagnostic_status()
  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

  if errors > 0 or warnings > 0 then
    return string.format(' E:%d W:%d', errors, warnings)
  end
  return ''
end

function _G.statusline()
  local mode = vim.api.nvim_get_mode().mode
  local mode_map = {
    n = 'NORMAL',
    i = 'INSERT',
    v = 'VISUAL',
    V = 'V-LINE',
    ['\22'] = 'V-BLOCK',
    c = 'COMMAND',
    R = 'REPLACE',
    t = 'TERMINAL',
  }

  return table.concat({
    ' ' .. (mode_map[mode] or mode:upper()),
    ' | %f',
    ' %m',
    '%=',
    lsp_status(),
    diagnostic_status(),
    ' | %l:%c ',
    ' %p%% ',
  })
end

vim.opt.statusline = '%!v:lua.statusline()'
vim.opt.laststatus = 2
