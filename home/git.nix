{
  config,
  pkgs,
  ...
}: {
  programs.git = {
    enable = true;
    delta.enable = true;
  };
  programs.gitui.enable = true;
  home.packages = [pkgs.gh];
}
