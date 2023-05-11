{
  programs.fish = {
    enable = true;
    interactiveShellInit = "export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive";
    shellAbbrs = {
      nsudo = "sudo-nix";
      nsudoedit = "sudoedit-nix";
    };
  };
  programs.fzf.enable = true;
  programs.starship.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
