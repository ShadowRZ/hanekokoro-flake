{
  flake.aspects.hardware._.thunderbolt.nixos = _: {
    services.hardware.bolt.enable = true;

    hanekokoro.nixos.preservation.directories = [ "/var/lib/boltd" ];
  };
}
