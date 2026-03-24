{
  flake.modules.nixos.without-a11y = _: {
    services.orca.enable = false;
    services.speechd.enable = false;
  };
}
