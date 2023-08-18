{
  programs.helix = {
    enable = true;
    defaultEditor = true;
    settings = {
      theme = "papercolor-dark";
      editor = {
        line-number = "relative";
        lsp.display-messages = true;
      };
      keys.normal = {
        space.space = "file_picker";
        space.w = ":w";
        space.q = ":q";
      };
    };
    languages = {
      language = [
        {
          name = "nix";
          formatter = {command = "alejandra";};
        }
      ];
    };
  };
}
