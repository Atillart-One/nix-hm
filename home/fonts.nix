{pkgs, ...} : {
home.packages = with pkgs; [
    (nerdfonts.override {fonts = ["IBMPlexMono"];})
    material-icons
    ];
}