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
        rev = "0b142bd16baab2dba9e01444892032d05c179c2a";
        hash = "sha256-5wHyh3CXN4dJN+QZXFqtCBOTeqrO/B8cB4LtqDKv0Rg=";
        fetchSubmodules = true;
      };
    });
    rofi-wayland-unwrapped = prev.rofi-wayland-unwrapped.overrideAttrs (oldAttrs: rec {
      version = "d06095b5ed40e5d28236b7b7b575ca867696d847";
      src = prev.fetchFromGitHub {
        owner = "lbonn";
        repo = "rofi";
        rev = version;
        hash = "sha256-8IfHpaVFGeWqyw+tLjNtg+aWwAHhSA5PuXJYjpoht2E=";
        fetchSubmodules = true;
      };
    });
  };
}
