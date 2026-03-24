{
  flake.modules.nixos."hardware/thunderbolt" = _: {
    services.hardware.bolt.enable = true;
  };
}
