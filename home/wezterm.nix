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

      colors, metadata = wezterm.color.load_base16_scheme("/home/atilla/dotfiles/colors/theme.yaml")
      config.colors = colors 
      config.use_fancy_tab_bar = false
      return config
    '';
  };
}
