{
  targets.genericLinux.enable = true;
  programs = {
    bash = {
      enable = true;
      bashrcExtra = ''
        test -s ~/.alias && . ~/.alias || true
      '';
      profileExtra = ''
        test -z "$PROFILEREAD" && . /etc/profile || true
      '';
    };
    fish = {
      enable = true;
      interactiveShellInit = "export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive";
      shellAbbrs = {
        nsudo = "sudo-nix";
        nsudoedit = "sudoedit-nix";
      };
    };
    fzf.enable = true;
    starship.enable = true;
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
