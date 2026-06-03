{
  flake.modules.homeManager.desktop =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      qt = lib.mkMerge [
        (
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
          }
        )
        {
          kvantum = {
            enable = true;
            settings = {
              General.theme = "catppuccin-latte-rosewater";
            };
          };
        }
      ];

      home.packages = [
        pkgs.qt6Packages.qtstyleplugin-kvantum
      ];
    };
}
