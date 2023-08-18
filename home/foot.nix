{inputs, config, ...}: {
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
        shell = "fish";
        # font = "Fairfax HD";
        dpi-aware = "yes";
        pad = "10x10center";
      };
    };
  };
}
