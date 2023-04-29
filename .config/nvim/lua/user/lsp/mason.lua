local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end

local masonlspconfig_status_ok, masonlspconfig = pcall(require, "mason-lspconfig")
if not masonlspconfig_status_ok then
	return
end

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
	return
end

mason.setup({
	ui = {
		icons = {
			package_installed = "✓",
			package_pending = "➜",
			package_uninstalled = "✗",
		},
	},
})

masonlspconfig.setup({})
masonlspconfig.setup_handlers({
	function(server_name)
		opts = {
			on_attach = require("user.lsp.handlers").on_attach,
			capabilities = require("user.lsp.handlers").capabilities,
		}
		lspconfig[server_name].setup(opts)
	end,
})
