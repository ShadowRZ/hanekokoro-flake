{ config, ... }:
{
  flake.modules.nixOnDroid.base = _: {
    ## Home Manager
    home-manager = {
      useGlobalPkgs = true;
      config = {
        imports = [
          config.flake.modules.homeManager.nixvim
          {
            manual.manpages.enable = false;
          }
        ];
      };
    };
  };
}
