{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.file = {
    ".config/awesome".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/awesome";
    "dotfiles/config/awesome/modules/bling".source = inputs.bling.outPath;
    "dotfiles/config/awesome/modules/rubato".source = inputs.rubato.outPath;
  };
  xsession.windowManager.awesome = {
    enable = true;
    package = pkgs.awesome-git;
  };

  services.picom.enable = true;
}
