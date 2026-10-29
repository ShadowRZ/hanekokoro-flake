{
  flake.aspects.base.nixos =
    { lib, ... }:
    {
      boot = {
        loader.timeout = lib.mkDefault 0;

        tmp.useTmpfs = lib.mkDefault true;
        enableContainers = lib.mkDefault false;
      };
    };
}
