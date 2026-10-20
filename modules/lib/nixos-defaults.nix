{
  config,
  lib,
  ...
}:
let
  cfg = config.hanekokoro.nixos;
in
{
  config.flake.modules.nixos = lib.mapAttrs' (name: _: {
    name = "hosts/${name}";
    value =
      { lib, ... }:
      let
        inherit (lib) types mkOption;
      in
      {
        options.hanekokoro.nixos.user = mkOption {
          type = types.str;
          description = ''
            Default user name.
          '';
        };

        config = {
          # Hostname
          networking.hostName = lib.mkDefault name;
        };
      };
  }) cfg;
}
