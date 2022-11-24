local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
    return
end

local mason_null_status_ok, mason_null = pcall(require, "mason-null-ls")
if not mason_null_status_ok then
    return
end

mason_null.setup({
    ensure_installed = {},
    automatic_setup = true,
})

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

require("mason-null-ls").setup_handlers({
    function(source_name, methods)
        -- all sources with no handler get passed here
        -- Keep original functionality of `automatic_setup = true`
        require("mason-null-ls.automatic_setup")(source_name, methods)
    end,
    stylua = function(source_name, methods)
        null_ls.register(null_ls.builtins.formatting.stylua)
    end,
})

-- will setup any installed and configured sources above
null_ls.setup()
