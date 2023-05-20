{pkgs, ...}:
{ programs.neovim.enable = true;
  home.packages = with pkgs; [neovide rnix-lsp];}
