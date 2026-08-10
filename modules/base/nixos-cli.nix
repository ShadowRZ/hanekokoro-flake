{ inputs, ... }:
{
  flake.modules.nixos = {
    base =
      { ... }:
      {
        imports = [
          inputs.nixos-cli.nixosModules.nixos-cli
        ];

        programs.nixos-cli = {
          enable = true;
        };
      };
  };
}
