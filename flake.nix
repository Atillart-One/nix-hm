{
  description = "Home Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";
    nix-colors.url = "github:misterio77/nix-colors";
    nixgl.url = "github:guibou/nixGL";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # awesomewm
#    bling = { url = "github:BlingCorp/bling"; flake = false; };
#    rubato = { url = "github:andOrlando/rubato"; flake = false; };
#    awm = { url = "github:Atillart-One/awesome"; flake = false; };
  };

  outputs = {
    nixpkgs,
    home-manager,
    nixgl,
    nixpkgs-f2k,
    nix-colors,
    ...
  }: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    homeConfigurations.atillart = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;

      # Specify your home configuration modules here, for example,
      # the path to your home.nix.
      modules = [
        ./home
        {
          nixpkgs.overlays = [
            nixgl.overlay
            nixpkgs-f2k.overlays.compositors
            nixpkgs-f2k.overlays.window-managers
            nixpkgs-f2k.overlays.terminal-emulators
          ];
        }
      ];

      # Optionally use extraSpecialArgs
      # to pass through arguments to home.nix
      extraSpecialArgs = {inherit nixgl nix-colors;};
    };
  };
}
