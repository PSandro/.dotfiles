require('config.options')
require('config.keymaps')
require('config.statusline')
require('config.lsp')

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3
vim.g.netrw_browse_split = 4
vim.g.netrw_altv = 0
vim.g.netrw_winsize = 25

local ok, tokyonight = pcall(require, 'tokyonight')
if ok then
  tokyonight.setup({
    style = "night",
    transparent = false,
    terminal_colors = true,
    styles = {
      comments = { italic = true },
      keywords = { italic = true },
      functions = { italic = true },
      variables = { italic = true },
    }
  })
  vim.cmd[[colorscheme tokyonight]]
else
  vim.notify('tokyonight.nvim not installed', vim.log.levels.WARN)
end
