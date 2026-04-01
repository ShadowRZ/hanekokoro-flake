{ inputs, ... }:
{
  flake.modules.nixos = {
    "hosts/mimeow-coffees" =
      { ... }:
      {
        imports = [
          inputs.preservation.nixosModules.preservation
        ];

        fileSystems."/persist".neededForBoot = true;
        # Persistent files
        preservation = {
          enable = true;
          preserveAt."/persist" = {
            directories = [
              "/var/log"
              "/var/lib"
            ];
            files = [
              {
                file = "/etc/machine-id";
                inInitrd = true;
                how = "symlink";
                configureParent = true;
              }
            ];
            users = {
              shadowrz = {
                directories = [
                  "Desktop"
                  "Documents"
                  "Downloads"
                  "Pictures"
                  "Projects"
                  "Music"
                  "Public"
                  "Templates"
                  "Videos"
                  # keep-sorted start
                  ".android"
                  ".cache"
                  ".cargo"
                  ".conda"
                  ".config/Code"
                  ".config/GIMP"
                  ".config/Google"
                  ".config/Throne"
                  ".config/blender"
                  ".config/borg"
                  ".config/chromium"
                  ".config/dconf"
                  ".config/doom"
                  ".config/emacs"
                  ".config/fcitx5"
                  ".config/godot"
                  ".config/inkscape"
                  ".config/libvirt"
                  ".config/noctalia"
                  ".config/onlyoffice"
                  ".config/pika-backup"
                  ".config/qt5ct"
                  ".config/qt6ct"
                  ".config/quodlibet"
                  ".config/valent"
                  ".config/zed"
                  ".gradle"
                  ".java"
                  ".konan"
                  ".local/share"
                  ".local/share/Google"
                  ".local/share/Steam"
                  ".local/share/applications"
                  ".local/share/direnv"
                  ".local/share/doom"
                  ".local/share/fcitx5"
                  ".local/share/fonts"
                  ".local/share/fractal"
                  ".local/share/godot"
                  ".local/share/keyrings"
                  ".local/share/nautilus"
                  ".local/share/nvim"
                  ".local/share/onlyoffice"
                  ".local/share/pki"
                  ".local/share/waydroid"
                  ".local/share/zed"
                  ".local/share/zoxide"
                  ".m2"
                  ".mitmproxy"
                  ".mozilla/firefox/default"
                  ".renpy"
                  ".thunderbird/default"
                  ".vscode"
                  # keep-sorted end
                  {
                    directory = ".gnupg";
                    mode = "0700";
                  }
                  {
                    directory = ".ssh";
                    mode = "0700";
                  }
                ];
                files = [
                  # keep-sorted start
                  ".config/Yubico/u2f_keys"
                  ".config/gh/hosts.yml"
                  ".config/nix/nix.conf"
                  ".config/sops/age/keys.txt"
                  ".local/share/fish/fish_history"
                  ".npmrc"
                  # keep-sorted end
                ];
              };
              root = {
                home = "/root";
                directories = [ ".cache/nix" ];
              };
            };
          };
        };

        systemd.tmpfiles.settings.preservation = {
          "/home/shadowrz/.local/share".d = {
            user = "shadowrz";
            group = "users";
            mode = "0755";
          };
          "/home/shadowrz/.local/state".d = {
            user = "shadowrz";
            group = "users";
            mode = "0755";
          };
        };

        systemd.services.systemd-machine-id-commit = {
          unitConfig.ConditionPathIsMountPoint = [
            ""
            "/persist/etc/machine-id"
          ];
          serviceConfig.ExecStart = [
            ""
            "systemd-machine-id-setup --commit --root /persist"
          ];
        };
      };
  };
}
