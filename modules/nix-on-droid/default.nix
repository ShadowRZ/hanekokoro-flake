{
  config,
  inputs,
  withSystem,
  ...
}:
{
  flake.nixOnDroidConfigurations.default = withSystem "aarch64-linux" (
    { pkgs, ... }:
    inputs.nix-on-droid.lib.nixOnDroidConfiguration {
      inherit pkgs;
      modules =
        let
          modules = [
            "base"
            "nix"
            "dev"
            "shell"
          ];
        in
        [
          # Import Nix On Droid configurations
          {
            imports = map (name: config.flake.modules.nixOnDroid.${name} or { }) modules;
          }
          # Import Home Manager configurations
          {
            home-manager.config = {
              imports = map (name: config.flake.modules.homeManager.${name} or { }) modules;
            };
          }
        ];
    }
  );
}
