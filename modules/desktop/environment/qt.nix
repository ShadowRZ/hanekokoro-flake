{
  flake.modules.homeManager.desktop =
    { config, lib, ... }:
    {
      qt =
        let
          qtctSettings = {
            Appearance = {
              style = "Fusion";
              icon_theme = "Numix-Circle";
              standard_dialogs = "xdgdesktopportal";
            };
            Fonts = {
              fixed = "\"Hanekokoro Mono,13,Extended\"";
              general = "\"Space Grotesk,12\"";
            };
          };
        in
        lib.mkIf (config.qt.platformTheme.name == "qtct") {
          qt5ctSettings = qtctSettings;
          qt6ctSettings = qtctSettings;
        };
    };
}
