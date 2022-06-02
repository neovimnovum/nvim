-- Taken from LunarVim/Neovim-from-scratch

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  -- use "marko-cerovac/material.nvim"
  -- use "rebelot/kanagawa.nvim"
  -- use "savq/melange"
  -- use "EdenEast/nightfox.nvim"
  use "ellisonleao/gruvbox.nvim"
  use {
  'phaazon/hop.nvim',
  branch = 'v0', -- optional but strongly recommended
  config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }
  use 'kyazdani42/nvim-web-devicons'
  use 'kyazdani42/nvim-tree.lua'
  use {'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons'}

  use {
    'neovim/nvim-lspconfig',
    'williamboman/nvim-lsp-installer',
  }
  -- Treesitter

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'windwp/nvim-autopairs'

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  use 'xiyaowong/which-key.nvim'
  use {'stevearc/dressing.nvim'}
  use {'mrjones2014/legendary.nvim'}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
