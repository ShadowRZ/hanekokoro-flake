{
  flake.modules.homeManager.desktop =
    { config, lib, ... }:
    {
      qt =
        let
          qtctSettings = {
            Appearance = {
              style = "kvantum";
              # Sync with GTK
              icon_theme = config.gtk.iconTheme.name;
              standard_dialogs = "xdgdesktopportal";
            };
            Fonts = {
              fixed = "\"Hanekokoro Mono,12,-1,5,50,0,0,0,0,0,Extended\"";
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
