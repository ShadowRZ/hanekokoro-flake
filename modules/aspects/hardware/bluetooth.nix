{
  flake.aspects.hardware._.bluetooth.nixos = _: {
    hardware.bluetooth.enable = true;

    hanekokoro.nixos.preservation.directories = [ "/var/lib/bluetooth" ];
  };
}
