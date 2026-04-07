{ inputs, ... }:
{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      imports = [ inputs.catppuccin-nix.nixosModules.default ];

      catppuccin = {
        accent = "rosewater";
        flavor = "mocha";
        sources =
          let
            inherit (pkgs.stdenv.hostPlatform) system;
            inherit ((import inputs.catppuccin-nix { inherit pkgs system; })) packages;
          in
          packages
          // {
            default = packages.whiskers;
          };

        # keep-sorted start block=yes
        cursors = {
          enable = true;
        };
        # keep-sorted end
      };
    };

  flake.modules.homeManager.base =
    { pkgs, ... }:
    {
      imports = [
        inputs.catppuccin-nix.homeModules.catppuccin
      ];

      catppuccin = {
        accent = "rosewater";
        flavor = "mocha";
        sources =
          let
            inherit (pkgs.stdenv.hostPlatform) system;
            inherit ((import inputs.catppuccin-nix { inherit pkgs system; })) packages;
          in
          packages
          // {
            default = packages.whiskers;
          };

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
