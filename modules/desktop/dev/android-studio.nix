{
  flake.modules.nixos."desktop/dev/android" =
    { pkgs, ... }:
    {
      users.users.shadowrz.packages = [
        pkgs.android-studio
      ];

      nixpkgs.config.android_sdk.accept_license = true;
    };
}
