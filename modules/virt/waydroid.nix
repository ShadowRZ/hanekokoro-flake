{
  flake.modules.nixos."virt/waydroid" =
    { pkgs, ... }:
    {
      virtualisation.waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
      };

      networking.firewall.trustedInterfaces = [ "waydroid0" ];

      hanekokoro.nixos.preservation = {
        directories = [ "/var/lib/waydroid" ];
        user.directories = [ ".local/share/waydroid" ];
      };
    };
}
