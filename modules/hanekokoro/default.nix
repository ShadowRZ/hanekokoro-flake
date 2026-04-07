{
  lib,
  ...
}:
let
  inherit (lib) types mkOption mkEnableOption;
in
{
  options = {
    hanekokoro.nixos = mkOption {
      type = types.attrsOf (
        types.submodule {
          options = {
            useHomeManager =
              mkEnableOption ''
                Home Manager support for this NixOS configuration.

                Usually should be set to `true`,
                though setting to `false` can be useful
                if you're defining a server configuration''
              // {
                default = true;
              };
            modules = mkOption {
              type = types.listOf types.str;
              example = [ "base" ];
              description = ''
                A list of module names to be included in this configuration.

                Modules should be defined using [`modules` of flake-parts](https://flake.parts/options/flake-parts-modules.html).

                Modules named `hosts/<name>` are automatically imported.
              '';
            };
          };
        }
      );
      description = ''
        Define a set of NixOS hosts.
      '';
    };
  };
}
