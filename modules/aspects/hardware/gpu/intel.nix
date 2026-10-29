{
  flake.aspects.hardware._.gpu._.intel.nixos =
    { pkgs, ... }:
    {
      hardware = {
        graphics = {
          extraPackages = with pkgs; [
            intel-compute-runtime
            intel-media-driver
          ];
          extraPackages32 = with pkgs.pkgsi686Linux; [
            intel-media-driver
          ];
        };
      };

      services.xserver.videoDrivers = [ "nvidia" ];
    };
}
