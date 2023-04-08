local configs = require("nvim-treesitter.configs")
configs.setup {
  sync_install = false,
  auto_install = true,
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,

  },
  indent = { enable = true },
}
