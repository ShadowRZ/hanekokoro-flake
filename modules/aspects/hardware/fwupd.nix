{
  flake.aspects.hardware._.fwupd.nixos = _: {
    services.fwupd.enable = true;

    hanekokoro.nixos.preservation.directories = [ "/var/lib/fwupd" ];
  };
}
