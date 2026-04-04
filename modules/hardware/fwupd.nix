{
  flake.modules.nixos."hardware/fwupd" = _: {
    services.fwupd.enable = true;

    hanekokoro.nixos.preservation.directories = [ "/var/lib/fwupd" ];
  };
}
