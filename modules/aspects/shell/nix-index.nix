{
  flake.aspects.shell.nixos =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.comma-with-db ];
    };

  flake.aspects.shell.homeManager =
    { pkgs, ... }:
    {
      programs = {
        # Nix-Index
        nix-index = {
          enable = true;
          package = pkgs.nix-index-with-db;
        };
      };
    };
}
