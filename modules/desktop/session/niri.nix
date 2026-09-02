{
  flake.modules.nixos."desktop/niri" =
    {
      pkgs,
      lib,
      ...
    }:
    {
      services = {
        displayManager = {
          # SDDM
          noctalia-greeter = {
            cursorTheme = {
              name = "Bibata-Modern-Ice";
              package = pkgs.bibata-cursors;
            };
            enable = true;
            settings = {
              cursor = {
                size = 32;
                name = "Bibata-Modern-Ice";
              };
              keyboard = {
                layout = "us";
              };
              appearance = {
                font_family = "Space Grotesk";
                hide_logo = true;
              };
            };
          };
        };
        power-profiles-daemon.enable = true;
        upower.enable = true;
        playerctld.enable = true;
        # Using oo7 instead of Niri upstream default of gnome-keyring
        oo7.enable = true;
        gnome.gnome-keyring.enable = false;
      };

      # Override Secret Portal too
      xdg.portal.config.niri."org.freedesktop.impl.portal.Secret" = lib.mkForce "oo7-portal";

      environment.systemPackages = [
        pkgs.bibata-cursors
        pkgs.dconf-editor
        pkgs.xwayland-satellite
        pkgs.nautilus
        pkgs.file-roller
        pkgs.loupe
      ];

      programs = {
        niri.enable = true;
        nm-applet.enable = true;
      };

      nix.settings = {
        extra-substituters = [ "https://noctalia.cachix.org" ];
        extra-trusted-public-keys = [
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        ];
      };

      hanekokoro.nixos.preservation = {
        directories = [
          "/var/lib/upower"
        ];
        user.directories = [
          ".config/noctalia"
          ".local/share/keyrings"
          ".local/share/nautilus"
          ".local/state/noctalia"
        ];
      };
    };

  flake.modules.homeManager."desktop/niri" =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.noctalia ];

      qt = {
        enable = true;
        platformTheme = {
          name = "qtct";
          package = [ pkgs.qt6Packages.qt6ct ];
        };
      };

      services.swayidle = {
        enable = true;
        events = {
          "before-sleep" = "loginctl lock-session";
          "lock" = "loginctl lock-session";
        };
        timeouts = [
          {
            timeout = 600;
            command = "noctalia msg session lock-and-suspend";
          }
        ];
      };

      home.file.".config/niri/config.kdl".source = ./niri.kdl;
    };
}
