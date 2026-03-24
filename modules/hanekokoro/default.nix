{
  lib,
  ...
}:
let
  inherit (lib) types mkOption;
in
{
  options = {
    hanekokoro.nixos = mkOption {
      type = types.attrsOf (
        types.submodule {
          options = {
            system = mkOption {
              type = types.enum [
                "x86_64-linux"
                "aarch64-linux"
              ];
              example = "x86_64-linux";
              description = ''
                Specifies the platform where the NixOS configuration will run.
              '';
            };
            useHomeManager = mkOption {
              type = types.bool;
              default = true;
              example = false;
              description = ''
                Whether to include Home Manager support for this NixOS configuration.

                Usually should be set to `true`, though setting to `false` can be useful
                if you're defining a server configuration.
              '';
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
