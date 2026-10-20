{
  flake.modules.nixos.shell =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.comma-with-db ];
    };

  flake.modules.homeManager.shell =
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
