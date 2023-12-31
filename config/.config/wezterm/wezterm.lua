local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'AdventureTime'
-- config.color_scheme = 'Batman'
config.font = wezterm.font('JetBrains Mono')

config.font_size = 23.0
config.enable_tab_bar = false


-- and finally, return the configuration to wezterm
return config
