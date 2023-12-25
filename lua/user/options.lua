local options = {
    backup = false,
    clipboard = "unnamedplus",
    cmdheight = 2,
    completeopt = { "menuone", "noselect" },
    conceallevel = 0,
    fileencoding = "utf-8",
    hlsearch = true,
    ignorecase = false,
    mouse = "nvi", -- disable mouse in all modes
    pumheight = 10, -- pum === popup menu
    showmode = true,
    showtabline = 2,
    smartcase = true, -- disable ignorecase if upper case char in search
    smartindent = true,
    autoindent = true,
    splitbelow = true,
    splitright = true,
    swapfile = true,
    termguicolors = true,
    timeoutlen = 1000,
    undofile = true,
    writebackup = true,
    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    cursorline = true,
    number = true,
    relativenumber = false,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = true,
    scrolloff = 8,
    sidescrolloff = 8,
    guifont = "SauceCodePro Nerd Font Mono:h16",
    cino = "N-sg1"
}

vim.opt.shortmess:append { c = true }
vim.opt.whichwrap:append {
	['<'] = true,
	['>'] = true,
	['['] = true,
	[']'] = true,
	h = true,
	l = true,
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

