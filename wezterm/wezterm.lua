local wezterm = require("wezterm")
local config = wezterm.config_builder and wezterm.config_builder() or {}
local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")
config.use_fancy_tab_bar = true

config.enable_wayland = true

-- config.default_prog = { "pwsh" }

-- config.font = wezterm.font("Iosevka Nerd Font")
-- config.font = wezterm.font("DroidSansM Nerd Font")
-- config.font = wezterm.font("ShureTechMono Nerd Font")
-- config.font = wezterm.font("OverpassM Nerd Font")
config.font = wezterm.font("JetBrains Mono Nerd Font")
config.font_size = 14
-- config.max_fps = 144
-- config.color_scheme = "Gruvbox Material (Gogh)"
-- config.color_scheme = "Arthur (Gogh)"
config.color_scheme = "One Half Black (Gogh)"
-- config.color_scheme = "Twilight (Gogh)"
-- local kanso = require("kanso-ink")
-- config.colors = kanso.colors

-- local direction = "Right"
--
-- iI1lLf0Oo => >= <= === != =>>

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

bar.apply_to_config(config, {
	position = "bottom",
	max_width = 64,
	padding = {
		left = 1,
		right = 1,
		tabs = {
			left = 0,
			right = 2,
		},
	},
	separator = {
		space = 1,
		-- left_icon = wezterm.nerdfonts.fa_long_arrow_right,
		-- right_icon = wezterm.nerdfonts.fa_long_arrow_left,
		left_icon = "",
		right_icon = "",
		field_icon = wezterm.nerdfonts.indent_line,
	},
	modules = {
		tabs = {
			active_tab_fg = 7,
			inactive_tab_fg = 8,
			new_tab_fg = 2,
		},
		workspace = {
			enabled = false,
			-- icon = wez.nerdfonts.cod_window,
			color = 8,
		},
		leader = {
			enabled = true,
			-- icon = wez.nerdfonts.oct_rocket,
			color = 2,
		},
		zoom = {
			enabled = false,
			-- icon = wez.nerdfonts.md_fullscreen,
			color = 4,
		},
		pane = {
			enabled = false,
			-- icon = wez.nerdfonts.cod_multiple_windows,
			color = 7,
		},
		username = {
			enabled = false,
			-- icon = wez.nerdfonts.fa_user,
			color = 6,
		},
		hostname = {
			enabled = false,
			-- icon = wez.nerdfonts.cod_server,
			color = 8,
		},
		clock = {
			enabled = false,
			-- icon = wez.nerdfonts.md_calendar_clock,
			format = "%H:%M",
			color = 5,
		},
		cwd = {
			enabled = true,
			-- icon = wez.nerdfonts.oct_file_directory,
			color = 7,
		},
		spotify = {
			enabled = false,
			-- icon = wez.nerdfonts.fa_spotify,
			color = 3,
			max_width = 64,
			throttle = 15,
		},
	},
})
return config
