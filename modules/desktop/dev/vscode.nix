{
  flake.modules.homeManager."desktop/dev" =
    { pkgs, ... }:
    {
      programs.vscode = {
        enable = true;
        package = pkgs.vscode.fhsWithPackages (pkgs: [
          pkgs.libxkbcommon
          pkgs.udev
          pkgs.libinput
          pkgs.libgbm
          pkgs.fontconfig.lib
          pkgs.freetype
        ]);
      };
    };
}
