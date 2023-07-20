{inputs, config, ...}: let
  theme = (import ./theme.nix).theme;
in {
  imports = [
   inputs. nix-colors.homeManagerModules.default
  ];

  colorScheme = inputs.nix-colors.lib.schemeFromYAML "scheme" (builtins.readFile ../colors/theme.yaml);
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        shell = "fish";
        font = theme.font.mono;
        dpi-aware = "yes";
        pad = "10x10center";
      };
      colors = {
        foreground = "${config.colorScheme.colors.base05}";
        background = "${config.colorScheme.colors.base00}";
        regular0 = "${config.colorScheme.colors.base00}";
        regular1 = "${config.colorScheme.colors.base08}";
        regular2 = "${config.colorScheme.colors.base0B}";
        regular3 = "${config.colorScheme.colors.base0A}";
        regular4 = "${config.colorScheme.colors.base0D}";
        regular5 = "${config.colorScheme.colors.base0E}";
        regular6 = "${config.colorScheme.colors.base0C}";
        regular7 = "${config.colorScheme.colors.base05}";
        bright0 = "${config.colorScheme.colors.base03}";
        bright1 = "${config.colorScheme.colors.base08}";
        bright2 = "${config.colorScheme.colors.base0B}";
        bright3 = "${config.colorScheme.colors.base0A}";
        bright4 = "${config.colorScheme.colors.base0D}";
        bright5 = "${config.colorScheme.colors.base0E}";
        bright6 = "${config.colorScheme.colors.base0C}";
        bright7 = "${config.colorScheme.colors.base07}";
      };
    };
  };
}
