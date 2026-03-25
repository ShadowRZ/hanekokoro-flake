{ inputs, ... }:
{
  flake.modules.nixos.base = {
    imports = [ inputs.catppuccin-nix.nixosModules.default ];

    catppuccin = {
      accent = "rosewater";
      flavor = "mocha";

      # keep-sorted start block=yes
      cursors = {
        enable = true;
      };
      # keep-sorted end
    };
  };

  flake.modules.homeManager.base = {
    imports = [
      inputs.catppuccin-nix.homeModules.catppuccin
    ];

    catppuccin = {
      accent = "rosewater";
      flavor = "mocha";

      # keep-sorted start block=yes
      cursors = {
        enable = true;
        flavor = "latte";
      };
      delta = {
        enable = true;
      };
      fish = {
        enable = true;
      };
      kitty = {
        enable = true;
      };
      mpv = {
        enable = true;
      };
      obs = {
        enable = true;
        flavor = "latte";
      };
      starship = {
        enable = true;
      };
      # keep-sorted end
    };
  };
}
