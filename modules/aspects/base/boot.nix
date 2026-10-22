{
  flake.modules.nixos = {
    base =
      { lib, ... }:
      {
        boot = {
          loader.timeout = 0;

          tmp.useTmpfs = true;
          enableContainers = lib.mkDefault false;
        };
      };
  };
}
