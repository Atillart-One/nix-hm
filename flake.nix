{
  description = "Home Manager and System Manager configuration";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-f2k.url = "github:fortuneteller2k/nixpkgs-f2k";

    # nixGL
    nixgl.url = "github:guibou/nixGL";

    nyoom = { url = "github:nyoom-engineering/nyoom.nvim"; flake = false; };

    # Fish Plugins
    fzf-fish = { url = "github:PatrickF1/fzf.fish"; flake = false; };
    z-fish = { url = "github:jethrokuan/z"; flake = false; };
    base16-fish = { url = "github:FabioAntunes/base16-fish-shell"; flake = false; };

    # AwesomeWM Modules
    bling = { url = "github:BlingCorp/bling"; flake = false; };
    rubato = { url = "github:andOrlando/rubato"; flake = false; };
  };

  outputs =
    { self
    , nixpkgs
    , nixpkgs-f2k
    , home-manager
    , nixgl
    , ...
    } @ inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      homeConfigurations.atilla = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        # Specify your home configuration modules here, for example,
        # the path to your home.nix.
        modules = [
          ./home
          {
            nixpkgs.overlays = [
              nixgl.overlay
              nixpkgs-f2k.overlays.default
              (import ./overlays { inherit inputs; }).modifications
            ];
          }
        ];

        # Optionally use extraSpecialArgs
        # to pass through arguments to home.nix
        extraSpecialArgs = { inherit inputs outputs; };
      };
    };
}
