{
  config,
  inputs,
  ...
}:
let
  cfg = config.hanekokoro.nixos;
in
{
  config = {
    flake.nixosConfigurations = builtins.mapAttrs (
      name: cfg:
      (inputs.nixpkgs.lib.nixosSystem {
        modules = [
          # Import NixOS configurations
          {
            imports = map (name: config.flake.modules.nixos.${name} or { }) cfg.modules;
          }
          # Import Home Manager configurations
          (
            { lib, ... }:
            {
              imports = lib.optional cfg.useHomeManager inputs.home-manager.nixosModules.home-manager;

              config = lib.mkIf cfg.useHomeManager {
                home-manager = {
                  useUserPackages = true;
                  useGlobalPkgs = true;
                };

                home-manager.users.shadowrz = {
                  imports = (map (name: config.flake.modules.homeManager.${name} or { }) cfg.modules) ++ [
                    (config.flake.modules.homeManager."hosts/${name}" or { })
                  ];
                };
              };
            }
          )
          (
            { lib, ... }:
            {
              # Import system local config
              imports = [
                (config.flake.modules.nixos."hosts/${name}" or { })
              ];

              networking.hostName = lib.mkDefault name;
            }
          )
        ];
      })
    ) cfg;
  };
}
