{ inputs, ... }: {
  flake.aspects = { aspects, ... }: {
    machines._.mimeow-coffees = {
      includes = with aspects; [
        # keep-sorted start
        desktop
        desktop._.environment
        desktop._.environment._.android
        desktop._.environment._.niri
        desktop._.environment._.steam
        dev
        hardening
        hardware._.bluetooth
        hardware._.fwupd
        hardware._.sound
        hardware._.gpu._.intel
        hardware._.gpu._.nvidia
        hardware._.thunderbolt
        network
        network._.networkmanager
        network._.throne
        nix
        security
        security._.gnupg
        security._.lanzaboote
        security._.pam-fido2
        shell
        shell._.nushell
        terminal._.kitty
        terminal._.kmscon
        theming._.catppuccin
        users._.root
        users._.shadowrz
        virtualisation._.libvirt
        virtualisation._.podman
        virtualisation._.waydroid
        # keep-sorted end
        (state-version "26.05")
        (preservation "shadowrz")
      ];

      nixos =
        { pkgs, lib, ... }:
        {
          imports = [
            inputs.home-manager.nixosModules.home-manager
          ];

          networking.hostName = "mimeow-coffees";

          home-manager = {
            useUserPackages = true;
            useGlobalPkgs = true;

            users.shadowrz = {
              imports = [ (aspects.machines._.mimeow-coffees.resolve { class = "homeManager"; }) ];
            };
          };

          services.zram-generator = {
            enable = true;
            settings.zram0 = {
              compression-algorithm = lib.mkDefault "zstd";
              zram-size = lib.mkDefault "ram";
            };
          };

          # https://wiki.archlinux.org/title/Zram#Optimizing_swap_on_zram
          boot.kernel.sysctl = {
            "vm.swappiness" = 180;
            "vm.watermark_boost_factor" = 0;
            "vm.watermark_scale_factor" = 125;
            "vm.page-cluster" = 0;
          };

          boot.kernelPackages = pkgs.linuxPackages_latest.extend (
            final: prev: {
              ## TODO: https://github.com/NixOS/nixpkgs/pull/575468
              lenovo-legion-module = prev.lenovo-legion-module.overrideAttrs (old: {
                makeFlags = old.makeFlags ++ [
                  "INSTALL_MOD_PATH=${placeholder "out"}"
                  "DEPMOD=true"
                ];
                installTargets = [ "modules_install" ];
                installFlags = [
                  "-C"
                  "${prev.kernel.dev}/lib/modules/${prev.kernel.modDirVersion}/build"
                  "M=$(PWD)"
                ];
                installPhase = "";
              });
            }
          );

          time.timeZone = "Asia/Shanghai";

          i18n = {
            defaultLocale = "C.UTF-8";
            # Build all Glibc supported locales as defined in:
            # https://sourceware.org/git/?p=glibc.git;a=blob;f=localedata/SUPPORTED
            supportedLocales = [
              "all"
            ];
          };

          powerManagement = {
            enable = true;
            powertop.enable = true;
            cpuFreqGovernor = lib.mkDefault "powersave";
          };

          services.orca.enable = false;
          services.speechd.enable = false;

          services.userborn.enable = true;
          services.zerotierone.enable = true;

          security.pam.loginLimits = [
            {
              domain = "*";
              type = "-";
              item = "memlock";
              value = "unlimited";
            }
          ];

          users.mutableUsers = false;

          system.etc.overlay = {
            enable = true;
            mutable = true;
          };

          documentation = {
            enable = true;
            doc.enable = false;
            info.enable = false;

            # Enable man-db
            man.man-db.enable = true;
          };

          system = {
            nixos-init.enable = true;
            tools = {
              nixos-option.enable = true;
              nixos-version.enable = false;
              nixos-generate-config.enable = false;
            };
          };

          # Increase open files for all users
          systemd.user.settings = {
            Manager = {
              DefaultLimitNOFILE = "524288:524288";
            };
          };

          services.journald.settings.Journal = {
            SystemMaxUse = "100M";
            MaxFileSec = "3day";
          };

          services.nscd.enableNsncd = true;

          environment = {
            systemPackages = with pkgs; [
              # keep-sorted start
              dnsutils
              file
              gdu
              lsof
              man-pages
              p7zip
              pciutils
              strace
              tree
              unar
              unzip
              usbutils
              wget
              # keep-sorted end
            ];
          };

          nix.settings.substituters = [
            "https://mirrors.cernet.edu.cn/nix-channels/store"
            "https://mirrors.sjtug.sjtu.edu.cn/nix-channels/store"
          ];

          hanekokoro.nixos.preservation.directories = [
            "/var/lib/systemd"
            "/var/lib/zerotier-one"
          ];
        };
    };
  };
}
