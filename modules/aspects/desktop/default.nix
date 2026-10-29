{
  flake.aspects = { aspects, ... }: {
    desktop = {
      includes = [ aspects.base ];
      nixos = {
        hardware.graphics.enable = true;
      };
      homeManager = {
        systemd.user.sessionVariables.QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";
        home.sessionVariables.QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";

        xdg.userDirs = {
          enable = true;
          setSessionVariables = false;
        };
      };
    };
  };
}
