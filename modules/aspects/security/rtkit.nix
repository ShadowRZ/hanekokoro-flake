{
  flake.aspects.base.nixos = _: {
    security.rtkit.enable = true;
  };
}
