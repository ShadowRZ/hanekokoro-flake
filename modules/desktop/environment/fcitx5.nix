{
  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      i18n = {
        # Fcitx 5
        inputMethod = {
          enable = true;
          type = "fcitx5";
          fcitx5 = {
            fcitx5-with-addons = pkgs.qt6Packages.fcitx5-with-addons.override {
              withConfigtool = false;
            };
            waylandFrontend = true;
            addons = with pkgs; [
              kdePackages.fcitx5-chinese-addons
              fcitx5-pinyin-moegirl
              fcitx5-pinyin-zhwiki
            ];
            settings = {
              addons = {
                classicui.globalSection = {
                  Font = "Space Grotesk Medium 16";
                  MenuFont = "Space Grotesk Medium 16";
                  TrayFont = "Space Grotesk Medium 11";
                };
                pinyin.globalSection.FirstRun = "False";
              };
              inputMethod = {
                "Groups/0" = {
                  Name = "Default";
                  "Default Layout" = "us";
                  DefaultIM = "keyboard-us";
                };
                "Groups/0/Items/0" = {
                  Name = "keyboard-us";
                  Layout = "";
                };
                "Groups/0/Items/1" = {
                  Name = "pinyin";
                  Layout = "us";
                };
                "GroupOrder" = {
                  "0" = "Default";
                };
              };
              globalOptions = {
                "Hotkey/TriggerKeys" = {
                  "0" = "Control+space";
                };
                "Hotkey/AltTriggerKeys" = {
                  "0" = "Shift_L";
                };
                "Hotkey/EnumerateGroupForwardKeys" = {
                  "0" = "Super+space";
                };
                "Hotkey/EnumerateGroupBackwardKeys" = {
                  "0" = "Shift+Super+space";
                };
                "Hotkey/PrevPage" = {
                  "0" = "Up";
                };
                "Hotkey/NextPage" = {
                  "0" = "Down";
                };
                "Hotkey/PrevCandidate" = {
                  "0" = "Shift+Tab";
                };
                "Hotkey/NextCandidate" = {
                  "0" = "Tab";
                };
                "Hotkey/TogglePreedit" = {
                  "0" = "Control+Alt+P";
                };
              };
            };
          };
        };
      };
    };

  flake.modules.nixos.desktop = {
    hanekokoro.nixos = {
      allowedUnfreePredicates = [ "fcitx5-pinyin-moegirl" ];
      preservation.user.directories = [
        ".local/share/fcitx5"
      ];
    };
  };
}
