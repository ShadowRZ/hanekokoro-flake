{
  config,
  inputs,
  ...
}:
let
  cfg = config.hanekokoro.nixos;
in
{
  config = {
    flake.nixosConfigurations = builtins.mapAttrs (
      name: _:
      (inputs.nixpkgs.lib.nixosSystem {
        modules = [
          config.flake.modules.nixos."hosts/${name}"
        ];
      })
    ) cfg;
  };
}
