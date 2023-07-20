{ ... }:
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

      config.default_prog = { '/home/atilla/.nix-profile/bin/fish', '-l' }

      colors, metadata = wezterm.color.load_base16_scheme("/home/atilla/homefiles/colors/theme.yaml")
      config.colors = colors
      config.font = wezterm.font '${theme.font.mono}'
      config.use_fancy_tab_bar = false
      return config
    '';
  };
}
