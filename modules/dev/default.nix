{ config, ... }:
{
  flake.modules = {
    homeManager = {
      dev =
        { pkgs, ... }:
        {
          home.packages = [
            pkgs.just
            pkgs.just-lsp
            pkgs.just-formatter
          ];
        };
    };

    nixos.dev = {
      imports = [
        config.flake.modules.nixos.nixvim
      ];
    };
  };
}
