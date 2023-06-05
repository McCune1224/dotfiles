local colorscheme = "kanagawa"

local cat_ok, cat_config = pcall(require, "catppuccin")
if not cat_ok then
	return
end

local trans = false
cat_config.setup({
	dim_inactive = {
		enabled = not trans,
		shade = "dark",
		percentage = 0.01,
	},
	transparent_background = trans,
	integrations = {
		nvimtree = {
			enabled = true,
			show_root = true,
			transparent_panel = trans,
		},
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		dap = {
			enabled = true,
			enable_ui = true, -- enable nvim-dap-ui
		},
		which_key = {
			enabled = true,
			show_icons = true,
		},
		illuminate = true,
		telescope = true,
	},
})

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	return
end
