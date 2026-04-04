{ inputs, ... }:
{
  flake.modules.nixos."security/lanzaboote" =
    {
      pkgs,
      lib,
      ...
    }:
    {
      imports = [ inputs.lanzaboote.nixosModules.lanzaboote ];

      environment.systemPackages = [
        # For debugging and troubleshooting Secure Boot.
        pkgs.sbctl
      ];

      boot.loader.systemd-boot = {
        # Lanzaboote currently replaces the systemd-boot module.
        # This setting is usually set to true in configuration.nix
        # generated at installation time. So we force it to false
        # for now.
        enable = lib.mkForce false;
        # Editor won't work with Lanzaboote and is unavaliable with Secure Boot anyways.
        editor = false;
      };

      boot.lanzaboote = {
        enable = true;
        pkiBundle = lib.mkDefault "/persist/var/lib/sbctl";
      };

      # Setup a mount point at /var/lib/sbctl
      hanekokoro.nixos.preservation.directories = [ "/var/lib/sbctl" ];
    };
}
