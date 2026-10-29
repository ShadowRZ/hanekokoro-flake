{
  flake.aspects.base.nixos = _: {
    security.sudo-rs.enable = true;
    security.sudo-rs.execWheelOnly = true;
  };
}
