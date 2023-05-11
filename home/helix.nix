let
  theme = (import ./theme.nix).theme;
in {
  programs.helix = {
    enable = true;
    settings = {
      theme = theme.helix;
      editor.lsp.display-messages = true;
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
      };
    };
    languages = [
      {
        name = "nix";
        formatter = {command = "alejandra";};
      }
    ];
  };
}
