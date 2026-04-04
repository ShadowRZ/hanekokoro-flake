{
  flake.modules.homeManager."desktop/dev" =
    { pkgs, ... }:
    {
      programs.zed-editor = {
        enable = true;
        package = pkgs.zed-editor.fhsWithPackages (pkgs: [
          pkgs.libxkbcommon
          pkgs.udev
          pkgs.libinput
          pkgs.libgbm
          pkgs.fontconfig.lib
          pkgs.freetype
        ]);
      };
    };

  flake.modules.nixos.desktop = {
    hanekokoro.nixos.preservation.user.directories = [
      ".config/zed"
      ".local/share/zed"
    ];
  };
}
