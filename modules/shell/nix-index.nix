{
  flake.modules.nixos.shell =
    { pkgs, ... }:
    {
      environment.systemPackages = [ pkgs.comma-with-db ];

      programs = {
        # Nix-Index
        nix-index = {
          enable = true;
          package = pkgs.nix-index-with-db;
          enableFishIntegration = true;
        };
      };
    };
}
