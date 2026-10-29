{
  flake.aspects.desktop._.environment.homeManager =
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

  flake.aspects.desktop._.environment.nixos = {
    hanekokoro.nixos.preservation.user.directories = [
      ".config/zed"
      ".local/share/zed"
    ];
  };
}
