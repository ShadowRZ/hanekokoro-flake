{
  flake.modules.nixos."hardware/gpu/nvidia" =
    { config, ... }:
    {
      hardware = {
        nvidia = {
          package = config.boot.kernelPackages.nvidiaPackages.production;
          open = true;
          nvidiaSettings = false;
          powerManagement = {
            enable = true;
            finegrained = true;
          };
        };
      };

      boot.kernelParams = [
        "nvidia.NVreg_TemporaryFilePath=/var/tmp"
      ];

      services.xserver.videoDrivers = [ "nvidia" ];
    };
}
