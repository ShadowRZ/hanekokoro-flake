{
  flake.aspects.virtualisation._.waydroid.nixos =
    { pkgs, ... }:
    {
      virtualisation.waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
      };

      hanekokoro.nixos.preservation = {
        directories = [ "/var/lib/waydroid" ];
        user.directories = [ ".local/share/waydroid" ];
      };
    };
}
