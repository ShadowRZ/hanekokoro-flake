{
  flake.aspects.desktop._.environment._.android.nixos =
    { pkgs, ... }:
    {
      users.users.shadowrz.packages = [
        (pkgs.android-studio.override {
          git = pkgs.gitMinimal;
        })
        pkgs.android-tools
      ];

      nixpkgs.config.android_sdk.accept_license = true;

      hanekokoro.nixos = {
        allowedUnfreePredicates = [ "android-studio" ];
        preservation.user.directories = [
          ".android"
          ".config/Google"
          ".local/share/Google"
          ".local/share/JetBrains"
        ];
      };
    };
}
