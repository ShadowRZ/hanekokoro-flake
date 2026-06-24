{
  flake.modules.homeManager = {
    desktop =
      _:
      {
        gtk =
          let
            gtkIni = {
              gtk-application-prefer-dark-theme = false;
              gtk-decoration-layout = "icon,menu:close";
              gtk-enable-animations = true;
              gtk-primary-button-warps-slider = true;
            };
          in
          {
            enable = true;
            font = {
              name = "Space Grotesk";
              size = 13;
            };
            gtk3.extraConfig = gtkIni;
            gtk4.extraConfig = gtkIni;
            theme = {
              name = "adw-gtk3";
            };
          };

        dconf.settings = {
          "org/gnome/desktop/interface" = {
            font-name = "Space Grotesk 13";
            document-font-name = "Space Grotesk 13";
            monospace-font-name = "Hanekokoro Mono Extended 13";
          };
          "org/gnome/desktop/wm/preferences" = {
            button-layout = "icon,appmenu:close";
          };
        };
      };
  };
}
