local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

-- Remove multiple format options, only use null-ls (need nvim 0.8)
--[[ local callback = function() ]]
--[[     vim.lsp.buf.format({ ]]
--[[         bufnr = bufnr, ]]
--[[         filter = function(client) ]]
--[[             return client.name == "null-ls" ]]
--[[         end ]]
--[[     }) ]]
--[[ end, ]]
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
	debug = false,
	sources = {
		--Format on Save
		on_attach = function(client, bufnr)
			if client.supports_method("textDocument/formatting") then
				vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
				vim.api.nvim_create_autocmd("BufWritePre", {
					group = augroup,
					buffer = bufnr,
					callback = function()
						-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
						vim.lsp.buf.formatting_sync()
					end,
				})
			end
		end,
		--python
		formatting.black,
		-- diagnostics.flake8,

		--golang
		diagnostics.golangci_lint,
		formatting.goimports,

		--lua
		formatting.stylua,
	},
})
