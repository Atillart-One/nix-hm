{ config
, pkgs
, ...
}: {
  home.packages = with pkgs; [ river ];

  home.file.".config/river/init".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/homefiles/config/river/init";
}

