{
  flake.modules.nixos."hardware/fwupd" = _: {
    services.fwupd.enable = true;
  };
}
