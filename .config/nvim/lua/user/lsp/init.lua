--[[ local status_ok, _ = pcall(require, "lspconfig") ]]
--[[ if not status_ok then ]]
--[[   return ]]
--[[ end ]]
--[[]]
--[[ local mason_lspconfig_ok, _ = pcall(require, "mason-lspconfig") ]]
--[[ if not mason_lspconfig_ok then ]]
--[[     return ]]
--[[ end ]]

require "user.lsp.mason"
require("user.lsp.handlers").setup()
require "user.lsp.null-ls"
