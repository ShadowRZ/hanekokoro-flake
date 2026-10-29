{
  flake.aspects.base.nixos =
    { lib, ... }:
    {
      environment.defaultPackages = [ ];

      programs.nano.enable = lib.mkDefault false;
    };
}
