-- This config owes a great deal to LunarVim/Neovim-from-scratch

local opts = { noremap = true, silent = true }

local keymap = vim.api.nvim_set_keymap


-- Initialize legendary keymaps
require('which-key').setup()
local legendary = require('legendary')

legendary.setup({
  -- Include builtins by default, set to false to disable
  include_builtin = true,
  -- Customize the prompt that appears on your vim.ui.select() handler
  -- Can be a string or a function that takes the `kind` and returns
  -- a string. See "Item Kinds" below for details.
  select_prompt = function(kind)
    if kind == 'legendary.items' then
      return 'Legendary'
    end

    -- Convert kind to Title Case (e.g. legendary.keymaps => Legendary Keymaps)
    return string.gsub(' ' .. kind:gsub('%.', ' '), '%W%l', string.upper):sub(2)
  end,
  -- Initial keymaps to bind
  keymaps = {
    { '<C-h>', '<C-w>h', description = 'Move cursor to window left', opts = opts },
    { '<C-j>', '<C-w>j', description = 'Move cursor to window down', opts = opts },
    { '<C-k>', '<C-w>k', description = 'Move cursor to window up', opts = opts },
    { '<C-l>', '<C-w>l', description = 'Move cursor to window right', opts = opts },
    { '<C-Up>', ':resize -2<CR>', description = 'Grow top split', opts = opts },
    { '<C-Down>', ':resize +2<CR>', description = 'Grow bottom split', opts = opts },
    { '<C-Left>', ':vertical resize -2<CR>', description = 'Grow left split', opts = opts },
    { '<C-Right>', ':vertical resize +2<CR>', description = 'Grow right split', opts = opts },
    { '<S-l>', ':bnext<CR>', description = 'Switch to buffer right', opts = opts },
    { '<S-h>', ':bprevious<CR>', description = 'Switch to buffer left', opts = opts },
    { '<leader>e', ':NvimTreeToggle<CR>', description = 'Open NvimTree', opts = opts },
    { '<leader>k', legendary.find, description = 'Keymap legend', opts = opts },
  },
  -- Initial commands to bind
  commands = {
    -- your command tables here
  },
  -- Initial augroups and autocmds to bind
  autocmds = {
    -- your autocmd tables here
  },
  -- Automatically add which-key tables to legendary
  -- see "which-key.nvim Integration" below for more details
})

-- Move a block of text
-- keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
-- keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)


-- Visual Mode --
-- Indent text
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- Move text
-- keymap("v", "<A-j>", "<Esc>:m .+1<CR>==", opts)
-- keymap("v", "<A-k>", "<Esc>:m .-2<CR>==", opts)
-- keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
