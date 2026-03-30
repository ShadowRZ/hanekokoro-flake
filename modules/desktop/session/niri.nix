{ inputs, withSystem, ... }:
{
  flake.modules.nixos."desktop/niri" =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {

      imports = [ inputs.silent-sddm.nixosModules.default ];

      services = {
        displayManager = {
          # SDDM
          sddm = {
            enable = true;
            enableHidpi = true;
            settings = {
              General = {
                GreeterEnvironment = lib.mkForce "QML2_IMPORT_PATH=${config.programs.silentSDDM.package'}/share/sddm/themes/silent/components/,QT_SCREEN_SCALE_FACTORS=2,QT_FONT_DPI=192,QT_IM_MODULE=qtvirtualkeyboard";
              };
            };
          };
        };
        power-profiles-daemon.enable = true;
        upower.enable = true;
        playerctld.enable = true;
      };

      environment.systemPackages = [
        pkgs.dconf-editor
        pkgs.xwayland-satellite
        pkgs.shadowrz.silent-sddm
        pkgs.nautilus
      ];

      programs = {
        niri = {
          enable = true;
          package = withSystem pkgs.stdenv.hostPlatform.system (
            { inputs', ... }: inputs'.niri.packages.default
          );
        };
        silentSDDM = {
          enable = true;
          theme = "silvia";
          backgrounds = {
            nix-wallpaper-nineish = pkgs.nixos-artwork.wallpapers.nineish.src;
          };
          settings = {
            "LoginScreen" = {
              blur = 75;
              background = "${pkgs.nixos-artwork.wallpapers.nineish.src.name}";
            };
            "LockScreen" = {
              blur = 0;
              background = "${pkgs.nixos-artwork.wallpapers.nineish.src.name}";
            };
            "LockScreen.Clock" = {
              font-family = "Space Grotesk";
            };
            "LockScreen.Date" = {
              font-family = "Space Grotesk";
            };
            "LockScreen.Message" = {
              font-family = "Space Grotesk";
            };
            "LoginScreen.LoginArea.Username" = {
              font-family = "Space Grotesk";
            };
            "LoginScreen.LoginArea.PasswordInput" = {
              font-family = "Space Grotesk";
            };
            "LoginScreen.LoginArea.LoginButton" = {
              font-family = "Space Grotesk";
            };
            "LoginScreen.LoginArea.Spinner" = {
              font-family = "Space Grotesk";
            };
            "LoginScreen.LoginArea.WarningMessage" = {
              font-family = "Space Grotesk";
            };
            "LoginScreen.MenuArea.Buttons" = {
              font-family = "Space Grotesk";
            };
            "LoginScreen.MenuArea.Popups" = {
              font-family = "Space Grotesk";
            };
            "Tooltips" = {
              font-family = "Space Grotesk";
            };
            "LoginScreen.MenuArea.Layout" = {
              display = false;
            };
          };
        };
      };
    };

  flake.modules.homeManager."desktop/niri" = {
    imports = [ inputs.noctalia-shell.homeModules.default ];

    programs.noctalia-shell.enable = true;

    qt = {
      enable = true;
      platformTheme.name = "qtct";
    };

    home.file.".config/niri/config.kdl".source = ./niri.kdl;
  };
}
