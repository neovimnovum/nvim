-- Taken from LunarVim/Neovim-from-scratch

-- Automatically install packer
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

--Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("lazy").setup({

  'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim
  'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins
  'rebelot/kanagawa.nvim',
  'ellisonleao/gruvbox.nvim',
  'nvim-tree/nvim-tree.lua',
  { 'akinsho/bufferline.nvim', version = "v3.*", dependencies = 'nvim-tree/nvim-web-devicons' },
  {
    "williamboman/mason.nvim",
    dependencies = {"williamboman/mason-lspconfig.nvim", "neovim/nvim-lspconfig" },
    build = ":MasonUpdate" -- :MasonUpdate updates registry contents
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  'windwp/nvim-autopairs',

  {
    'nvim-telescope/telescope.nvim',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-lualine/lualine.nvim', dependencies = { {'nvim-tree/nvim-web-devicons'} } },
  'xiyaowong/which-key.nvim',
  'stevearc/dressing.nvim',
  'mrjones2014/legendary.nvim',
  --use 'pangloss/vim-javascript'
})
