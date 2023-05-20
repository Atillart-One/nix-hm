{pkgs, config, ...}:
let
    theme = (import ./theme.nix).theme;
in {
xsession.windowManager.awesome = {
enable = true;
package = pkgs.awesome-git;
};

# home.file.".config/awesome".source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/nix-hm/config/awesome";
}

