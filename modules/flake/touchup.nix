{ inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.touchup ];

  touchup = {
    attr = {
      allSystems.enable = false;
      meta.enable = false;
      modules.enable = false;
    };
  };
}
