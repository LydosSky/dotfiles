local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { "tmux", "new-session", "-A", "-s", "main" }

config.font = wezterm.font("Roboto Mono")
config.freetype_load_target = "HorizontalLcd"
config.freetype_render_target = "HorizontalLcd"
config.font_size = 13.0

config.color_scheme = "One Light (Gogh)"
config.window_decorations = "RESIZE | INTEGRATED_BUTTONS | TITLE"
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.enable_tab_bar = false
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = false
config.show_tabs_in_tab_bar = false
config.enable_wayland = true

config.disable_default_key_bindings = true
config.keys = {
	{ key = "V", mods = "CTRL", action = wezterm.action.PasteFrom("Clipboard") },
	{ key = "C", mods = "CTRL", action = wezterm.action.CopyTo("Clipboard") },
}

return config
