{
  targets.genericLinux.enable = true;
  programs = {
    bash = {
      enable = true;
      bashrcExtra = builtins.readFile ../config/.bashrc;
      profileExtra = builtins.readFile ../config/.profile;
    };
    fish = {
      enable = true;
      interactiveShellInit = "export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive";
    };
    fzf.enable = true;
    # starship.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
