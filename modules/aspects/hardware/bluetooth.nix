{
  flake.modules.nixos."hardware/bluetooth" = _: {
    hardware.bluetooth.enable = true;

    hanekokoro.nixos.preservation.directories = [ "/var/lib/bluetooth" ];
  };
}
