{ pkgs
, ...
}: {
  home.packages = with pkgs; [ river riverctl rivertile ];

  home.file.".config/river/init".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/homefiles/config/river/init";
}

