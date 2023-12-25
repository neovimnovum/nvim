
require("neodev").setup()
require("mason").setup()
require("mason-lspconfig").setup()
vim.diagnostic.config({
    virtual_text = false,
})

require("mason-lspconfig").setup_handlers {
    function (server_name)
        require("lspconfig")[server_name].setup {}
    end,
    ["lua_ls"] = function ()
        require("lspconfig")["lua_ls"].setup {
            settings = {
                Lua = {
                    telemetry = {
                        enable = false,
                    },
                },
            },
        }
    end
}

require("lint").linters_by_ft = {
    cpp = {
        "clangtidy",
        "cpplint",
        "cppcheck"
    },
    c = {
        "clangtidy",
        "cpplint",
        "cppcheck"
    },
}

table.insert(require("lint").linters.cpplint.args, '--filter=-legal/copyright,-whitespace/braces,-readability/braces')
table.insert(require("lint").linters.cpplint.args, '--linelength=132')
table.insert(require("lint").linters.cppcheck.args, '--suppress=missingIncludeSystem')
table.insert(require("lint").linters.cppcheck.args, '--project=compile_commands.json')
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

require("mini.completion").setup();

vim.keymap.set('i', '<Tab>',   [[pumvisible() ? "\<C-n>" : "\<Tab>"]],   { expr = true })
vim.keymap.set('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], { expr = true })
