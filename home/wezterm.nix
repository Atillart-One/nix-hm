let
  theme = (import ./theme.nix).theme;
in {
  programs.wezterm = {
    enable = true;

    extraConfig = ''
            local wezterm = require 'wezterm'
            local config = {}
            if wezterm.config_builder then
              config = wezterm.config_builder()
            end

            config.color_scheme = '${theme.wezterm}'
            config.font = wezterm.font '${theme.font.mono}'

            local scheme = wezterm.get_builtin_color_schemes()['${theme.wezterm}']
            config.use_fancy_tab_bar = false
            config.colors = {
              tab_bar = {
                # active_tab.bg_color = ,
                active_tab.fg_color = config.colors.inactive_tab.fg_color,
                intensity = 'Bold',
               },
            },
            return config
    '';
  };
}
