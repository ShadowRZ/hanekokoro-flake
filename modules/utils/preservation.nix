{ inputs, ... }:
{
  flake.modules.nixos.preservation =
    { config, ... }:
    let
      cfg = config.hanekokoro.nixos.preservation;
      inherit (config.hanekokoro.nixos) user;
    in
    {
      imports = [
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
