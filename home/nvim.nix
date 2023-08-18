{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
    withPython3 = true;
    extraPackages = with pkgs; [tree-sitter nodejs ripgrep fd unzip];
  };

  home.packages = with pkgs; [rnix-lsp gcc cargo nerdfonts];

  home.file = {
    "nyoom.nvim" = {
      source = inputs.nyoom.outPath;
      target = ".config/nvim";
      recursive = true;
    };
  };
}
