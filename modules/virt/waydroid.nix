{
  flake.modules.nixos."virt/waydroid" =
    { pkgs, ... }:
    {
      virtualisation.waydroid = {
        enable = true;
        package = pkgs.waydroid-nftables;
      };
    };
}
