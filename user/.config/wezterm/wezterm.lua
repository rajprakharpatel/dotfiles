local wezterm = require 'wezterm'
local config = {}

config.font = wezterm.font 'FantasqueSansM Nerd Font Mono'
config.font_size = 13.0

config.color_scheme = 'darkmoss (base16)'
config.inactive_pane_hsb = {
  saturation = 0.5,
  brightness = 0.6,
}

config.default_prog = { '/opt/homebrew/bin/fish', '-l' }

return config
