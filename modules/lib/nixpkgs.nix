{
  config,
  lib,
  ...
}:
let
  cfg = config.hanekokoro.nixos;
in
{
  flake.modules.nixos = lib.mapAttrs' (name: _: {
    name = "hosts/${name}";
    value =
      { config, lib, ... }:
      let
        inherit (lib) types mkOption;
      in
      {
        options.hanekokoro.nixos.allowedUnfreePredicates = mkOption {
          type = types.listOf types.str;
          default = [ ];
          example = [ "example-unfree-package" ];
          description = ''
            A list of unfree derivation names that are allowed.

            Equivelant to defining `nixpkgs.config.allowUnfreePredicate` as follows:

            ```nix
            {
              nixpkgs.config.allowUnfreePredicate =
                pkg:
                builtins.elem (lib.getName pkg) [ /* allowedUnfreePredicates */];
            }
            ```
          '';
        };

        config = {
          # Unfree predicates
          nixpkgs.config.allowUnfreePredicate =
            pkg: builtins.elem (lib.getName pkg) config.hanekokoro.nixos.allowedUnfreePredicates;
        };
      };
  }) cfg;
}
