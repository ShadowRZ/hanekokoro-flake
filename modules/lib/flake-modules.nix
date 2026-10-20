{
  config,
  lib,
  ...
}:
let
  cfg = config.hanekokoro.nixos;
in
{
  flake.modules.nixos = lib.mapAttrs' (name: cfg: {
    name = "hosts/${name}";
    value = _: {
      imports = map (name: config.flake.modules.nixos.${name} or { }) cfg.modules;
    };
  }) cfg;
}
