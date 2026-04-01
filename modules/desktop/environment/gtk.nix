{
  flake.modules.homeManager = {
    desktop =
      { config, ... }:
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
            gtk2 = {
              configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
              extraConfig = ''
                gtk-can-change-accels = 1
                gtk-enable-animations = 1
                gtk-primary-button-warps-slider = 1
                gtk-toolbar-style = 3
                gtk-menu-images = 1
                gtk-button-images = 1
              '';
            };
            gtk3.extraConfig = gtkIni;
            gtk4.extraConfig = gtkIni;
            iconTheme = {
              name = "Papirus-Light";
            };
            theme = {
              name = "adw-gtk3";
            };
          };

        systemd.user.sessionVariables.GTK2_RC_FILES = config.home.sessionVariables.GTK2_RC_FILES;

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
