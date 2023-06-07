{ config, ... }:
let
  theme = (import ./theme.nix).theme;
in
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}
      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      colors, metadata = wezterm.color.load_base16_scheme("${config.home.homeDirectory}/homefiles/colors/${theme.name}.yaml")
      config.colors = colors
      config.font = wezterm.font '${theme.font.mono}'
      config.use_fancy_tab_bar = false
      return config
    '';
  };
}
