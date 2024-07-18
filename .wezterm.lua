local wezterm = require("wezterm")

local conf = wezterm.config_builder()
local act = wezterm.action

-- conf.color_scheme = "Batman"
-- conf.color_scheme = "Fahrenheit"
-- conf.color_scheme = "Dawn (terminal.sexy)"
conf.color_scheme = "Default (dark) (terminal.sexy)"

conf.font = wezterm.font("JetBrains Mono")
conf.font_size = 14

-- Setup $TERM to wezterm https://wezfurlong.org/wezterm/config/lua/config/term.html?h=env
conf.term = "wezterm"

conf.keys = {
	{
		key = "P",
		mods = "CTRL",
		action = wezterm.action.ActivateCommandPalette,
	},
}

for i = 1, 8 do
	-- CTRL+ALT + number to activate that tab
	table.insert(conf.keys, {
		key = tostring(i),
		mods = "CTRL|ALT",
		action = act.ActivateTab(i - 1),
	})
	-- F1 through F8 to activate that tab
	table.insert(conf.keys, {
		key = "F" .. tostring(i),
		action = act.ActivateTab(i - 1),
	})
end

return conf
