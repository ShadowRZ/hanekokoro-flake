{ inputs, ... }:
{
  flake.aspects.theming._.catppuccin.nixos =
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
        plymouth = {
          enable = false;
        };
        sddm = {
          enable = false;
        };
        tty = {
          enable = false;
        };
        # keep-sorted end
      };
    };

  flake.aspects.theming._.catppuccin.homeManager =
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
        firefox = {
          enable = false;
        };
        gtk.icon = {
          flavor = "latte";
        };
        kvantum = {
          flavor = "latte";
          assertStyle = false;
        };
        obs = {
          flavor = "latte";
        };
        starship = {
          enable = false; # Configuration vendered to the TOML file
        };
        # keep-sorted end
      };
    };
}
