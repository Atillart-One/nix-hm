# This file defines overlays
{ inputs, ... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  additions = final: _prev: import ../pkgs { pkgs = final; };

  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {
    river = prev.river.overrideAttrs (oldAttrs: rec {
      version = "0.3";
      src = prev.fetchFromGitHub {
        owner = "riverwm";
        repo = "river";
        rev = "93a567ca945bd1f8a04b6453e59e0dbaeed0fcb3";
        hash = "sha256-5tPFFTgQhvq5ZE/7qHA0dLtqs09v3WiUWpmXFqiIREc=";
        fetchSubmodules = true;
      };
    });
  };
}
