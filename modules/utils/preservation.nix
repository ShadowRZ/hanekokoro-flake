{ inputs, ... }:
let
  preservationModule =
    { lib, ... }:
    let
      inherit (lib) types mkOption;
    in
    {
      options.hanekokoro.nixos.preservation = mkOption {
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
in
{
  flake.modules.nixos.preservation =
    { config, ... }:
    let
      cfg = config.hanekokoro.nixos.preservation;
      inherit (config.hanekokoro.nixos) user;
    in
    {
      imports = [
        preservationModule
        inputs.preservation.nixosModules.preservation
      ];

      fileSystems.${cfg.location}.neededForBoot = true;

      preservation = {
        enable = true;
        preserveAt.${cfg.location} = {
          inherit (cfg) directories;
          files = [
            {
              file = "/etc/machine-id";
              inInitrd = true;
              how = "symlink";
              configureParent = true;
            }
          ]
          ++ cfg.files;
          users = {
            ${user} = {
              inherit (cfg.user) directories;
              inherit (cfg.user) files;
            };
            root = {
              home = "/root";
              directories = [ ".cache/nix" ];
            };
          };
        };
      };

      systemd.services.systemd-machine-id-commit = {
        unitConfig.ConditionPathIsMountPoint = [
          ""
          "/persist/etc/machine-id"
        ];
        serviceConfig.ExecStart = [
          ""
          "systemd-machine-id-setup --commit --root /persist"
        ];
      };
    };
}
