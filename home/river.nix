{ config
, pkgs
, ...
}: {
  home.packages = with pkgs; [ river-git wlr-randr ];

  home.file.".config/river/init".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/config/river/init";
}
