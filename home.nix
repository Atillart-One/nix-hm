{
  config,
  pkgs,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "atilla";
  home.homeDirectory = "/home/atilla";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "22.11"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = with pkgs; [
    # Fonts
    nerdfonts

    # GTK
    # lxappearance

    # Terminal
    foot
  
    # Other packages
    haskellPackages.greenclip
    git
    nil
    alejandra

    (writeShellScriptBin "nix-sudo" ''sudo $(which $1) ''${@: 2}'')
    (writeShellScriptBin "nix-sudoedit" ''EDITOR=$(which hx) sudoedit $@'')
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello

    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/atilla/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    #  EDITOR = "emacs";
  };

  # Foot Setup
  programs.foot = {
    enable = true;
    server.enable = true;
    settings = {
      main = {
      shell = "/home/atilla/.nix-profile/bin/fish";
        font = "BlexMono Nerd Font Mono";
        pad = "20x20";
      };

      cursor = {
        style = "block";
        blink = "no";
        beam-thickness = 1.5;
      };
      colors = {
        background = "282828";
        foreground = "ebdbb2";
        regular0 = "282828";
        regular1 = "cc241d";
        regular2 = "98971a";
        regular3 = "d79921";
        regular4 = "458588";
        regular5 = "b16286";
        regular6 = "689d6a";
        regular7 = "a89984";
        bright0 = "928374";
        bright1 = "fb4934";
        bright2 = "b8bb26";
        bright3 = "fabd2f";
        bright4 = "83a598";
        bright5 = "d3869b";
        bright6 = "8ec07c";
        bright7 = "ebdbb2";
      };
    };
  };

  # Editor Setup
  programs.helix = {
    enable = true;
    settings = {
      theme = "gruvbox";
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

  # Manage fonts
  fonts.fontconfig.enable = true;

  # Shell
  # programs.bash.enable = true;
  # programs.bash.initExtra = "fish";
  programs.fish.enable = true;
  programs.fzf.enable = true;
  programs.starship.enable = true;
  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
