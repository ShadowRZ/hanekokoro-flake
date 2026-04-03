{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      hardware.graphics.enable = true;

      environment = {
        systemPackages = with pkgs; [
          adw-gtk3
          wl-clipboard
          papirus-icon-theme
        ];
      };

      services.gvfs.enable = true;

      users.users.shadowrz = {
        packages = with pkgs; [
          # keep-sorted start
          blender_5_0 # Blender 5.0.* (Binary)
          d-spy # D-Spy
          fractal
          gimp3 # GIMP 3
          godot_4
          inkscape # Inkscape
          onlyoffice-desktopeditors # ONLYOFFICE Desktop editors
          pika-backup
          quodlibet-full
          ungoogled-chromium
          # keep-sorted end
        ];
      };
    };

  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      systemd.user.sessionVariables.QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";
      home.sessionVariables.QT_SCALE_FACTOR_ROUNDING_POLICY = "RoundPreferFloor";
      services.gpg-agent.pinentry.package = pkgs.pinentry-curses;

      xdg.userDirs = {
        enable = true;
        setSessionVariables = false;
      };
    };
}
