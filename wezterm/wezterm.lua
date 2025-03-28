local wezterm = require("wezterm")
local config = wezterm.config_builder()

-- config.default_prog = { "pwsh" }

-- config.font = wezterm.font("Iosevka Nerd Font")
-- config.font = wezterm.font("ShureTechMono Nerd Font")
config.font = wezterm.font("OverpassM Nerd Font")
config.font_size = 14
config.color_scheme = "Gruvbox Material (Gogh)"
--cursor style
-- config.cursor_style = "SteadyUnderline"

-- => != 0 O o q Q l L 1  <=  -->

local direction = "Right"
config.keys = {
	-- ============= PANES =============
	-- New Pane Right
	{
		mods = "CTRL|SHIFT",
		key = "RightArrow",
		action = wezterm.action.SplitPane({ direction = "Right" }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "LeftArrow",
		action = wezterm.action.SplitPane({ direction = "Left" }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "UpArrow",
		action = wezterm.action.SplitPane({ direction = "Up" }),
	},
	{
		mods = "CTRL|SHIFT",
		key = "DownArrow",
		action = wezterm.action.SplitPane({ direction = "Down" }),
	},
	-- Move to right pane
	{
		mods = "CTRL|SHIFT",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	-- Move to left pane
	{
		mods = "CTRL|SHIFT",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},

	-- Move to down pane
	{
		mods = "CTRL|SHIFT",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	-- Move to up pane
	{
		mods = "CTRL|SHIFT",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},

	-- Close current pane (confirm)
	{
		key = "w",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},

	-- ============= Tabs =============

	-- New tab
	{
		key = "t",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},

	-- Close tab with confirmation: ctrl+shift+q
	{
		key = "q",
		mods = "CTRL|SHIFT",
		action = wezterm.action.CloseCurrentTab({ confirm = true }),
	},

	-- ============= Windows =============

	-- New window: ctrl+shift+n
	{
		key = "n",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnWindow,
	},
}

return config
