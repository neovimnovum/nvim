local colorscheme = "gruvbox"

-- Only for nightfox
-- require('nightfox').load('nightfox')

-- Only for material colorscheme
-- vim.g.material_style = "darker"
vim.o.background = 'dark'

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
