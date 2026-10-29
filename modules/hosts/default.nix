{ config, inputs, ... }: {
  flake.nixosConfigurations.mimeow-coffees = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.aspects.machines._.mimeow-coffees.modules.nixos
    ];
  };
}
