{
  config,
  inputs,
  ...
}:
let
  cfg = config.hanekokoro.nixos;
  hanekokoroModule =
    { config, lib, ... }:
    let
      cfg = config.hanekokoro.nixos;
      inherit (lib) types mkOption;
    in
    {
      _file = "modules/hanekokoro/nixos-configurations.nix";
      _class = "nixos";

      options.hanekokoro.nixos = mkOption {
        type = types.submodule {
          options = {
            user = mkOption {
              type = types.str;
              description = ''
                Default user name.
              '';
            };
            allowedUnfreePredicates = mkOption {
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

            preservation = mkOption {
              type = types.submodule {
                options = {
                  location = mkOption {
                    type = types.str;
                    description = ''
                      Where the persisted files are located.
                    '';
                  };
                  directories = mkOption {
                    type = types.listOf types.anything;
                    default = [ ];
                    description = ''
                      Specify a list of directories that should be preserved.
                      The paths are interpreted as absolute paths.
                    '';
                  };
                  files = mkOption {
                    type = types.listOf types.anything;
                    default = [ ];
                    description = ''
                      Specify a list of files that should be preserved.
                      The paths are interpreted as absolute paths.
                    '';
                  };
                  user.directories = mkOption {
                    type = types.listOf types.anything;
                    default = [ ];
                    description = ''
                      Specify a list of directories that should be preserved.
                      The paths are interpreted as absolute paths.
                    '';
                  };
                  user.files = mkOption {
                    type = types.listOf types.anything;
                    default = [ ];
                    description = ''
                      Specify a list of files that should be preserved.
                      The paths are interpreted as absolute paths.
                    '';
                  };
                };
              };
              description = ''
                Preservation paths.
              '';
            };
          };
        };
        description = ''
          NixOS local configuration.
        '';
      };

      config = {
        # Unfree predicates
        nixpkgs.config.allowUnfreePredicate =
          pkg: builtins.elem (lib.getName pkg) cfg.allowedUnfreePredicates;
      };
    };
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
          # Import system local config
          (config.flake.modules.nixos."hosts/${name}" or { })
          # Import NixOS local module
          hanekokoroModule
          (
            { lib, ... }:
            {
              # Hostname
              networking.hostName = lib.mkDefault name;
            }
          )
        ];
      })
    ) cfg;
  };
}
