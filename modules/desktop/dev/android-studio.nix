{
  flake.modules.nixos."desktop/dev/android" =
    { pkgs, ... }:
    {
      users.users.shadowrz.packages = [
        pkgs.android-studio
        pkgs.android-tools
      ];

      nixpkgs.config.android_sdk.accept_license = true;

      hanekokoro.nixos = {
        allowedUnfreePredicates = [ "android-studio" ];
        preservation.user.directories = [
          ".android"
          ".config/Google"
          ".local/share/Google"
        ];
      };
    };
}
