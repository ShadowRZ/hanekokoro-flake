{ inputs, ... }:
{
  flake.modules.nixos = {
    "hosts/mimeow-coffees" =
      {
        config,
        ...
      }:
      {
        imports = [ inputs.nixpkgs.nixosModules.notDetected ];

        hardware = {
          cpu.intel.updateMicrocode = true;
          nvidia = {
            prime = {
              offload = {
                enable = true;
                enableOffloadCmd = true;
              };
              intelBusId = "PCI:0@0:2:0";
              nvidiaBusId = "PCI:1@0:0:0";
            };
          };
        };

        boot = {
          kernelModules = [
            "legion-laptop"
          ];
          initrd = {
            availableKernelModules = [
              # keep-sorted start
              "legion-laptop"
              "nvme"
              "sd_mod"
              "thunderbolt"
              "usb_storage"
              "usbhid"
              "xhci_pci"
              # keep-sorted end
            ];
          };
          plymouth.extraConfig = ''
            DeviceScale=2
            UseFirmwareBackground=true
          '';
          extraModulePackages = [
            config.boot.kernelPackages.lenovo-legion-module
          ];
        };

        # SSD TRIM
        services.fstrim.enable = true;
      };
  };
}
