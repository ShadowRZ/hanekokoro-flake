{
  inputs,
  config,
  lib,
  ...
}:
let
  cfg = config.hanekokoro.nixos;
in
{
  flake.modules.nixos = lib.mapAttrs' (name: cfg: {
    name = "hosts/${name}";
    value = lib.mkIf cfg.useHomeManager {
      imports = [ inputs.home-manager.nixosModules.home-manager ];

      config = {
        home-manager = {
          useUserPackages = true;
          useGlobalPkgs = true;

          users.shadowrz = {
            imports = (map (name: config.flake.modules.homeManager.${name} or { }) cfg.modules) ++ [
              (config.flake.modules.homeManager."hosts/${name}" or { })
            ];
          };
        };
      };
    };
  }) cfg;
}
