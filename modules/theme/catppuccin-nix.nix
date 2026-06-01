{ inputs, ... }:
{
  flake.modules.nixos.base =
    { pkgs, ... }:
    {
      imports = [ inputs.catppuccin-nix.nixosModules.default ];

      catppuccin = {
        enable = true;
        autoEnable = true;

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
        enable = true;
        autoEnable = true;

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
        gtk.icon = {
          flavor = "latte";
        };
        obs = {
          flavor = "latte";
        };
        # keep-sorted end
      };
    };
}
