{inputs, ...}: {
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
      plugins = [
        {
          name = "z";
          src = inputs.z-fish.outPath;
        }
        {
          name = "fzf.fish";
          src = inputs.fzf-fish.outPath;
        }
        {
          name = "base16-fish";
          src = inputs.base16-fish.outPath;
        }
      ];
    };
    fzf.enable = true;
    # starship.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
