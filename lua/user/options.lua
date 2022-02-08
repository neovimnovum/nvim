local options = {
  backup = false,
  clipboard = "unnamedplus",
  cmdheight = 2,
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",
  hlsearch = true, --TODO - timeout for highlighting all matches
  ignorecase = true,
  mouse = "", -- disable mouse in all modes
  pumheight = 10, -- pum === popup menu
  showmode = true,
  showtabline = 2,
  smartcase = true, -- disable ignorecase if upper case char in search
  smartindent = true, -- TODO: figure out difference between this and autoindent
  splitbelow = true,
  splitright = true,
  swapfile = false, -- TODO: what is a swapfile and why am I disabling it?
  termguicolors = true,
  timeoutlen = 100,
  undofile = true,
  -- updatetime = 300, -- 4000ms default update time for completion. Which do I want?
  writebackup = false, -- TODO: what does this do?
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  numberwidth = 4,
  signcolumn = "yes",
  wrap = true,
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "MesloLGS NF:h16",
}

vim.opt.shortmess:append "c" -- TODO: why the linting error?

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: What does this do and why doesn't it work?
