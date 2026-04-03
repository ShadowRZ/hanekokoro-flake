{
  flake.modules.homeManager.desktop =
    { config, pkgs, ... }:
    {
      xdg = {
        mime.enable = true;
        mimeApps = {
          enable = true;
          defaultApplicationPackages = [
            config.programs.mpv.package
            pkgs.file-roller
          ];
          defaultApplications = {
            "text/html" = "firefox.desktop";
            "x-scheme-handler/http" = "firefox.desktop";
            "x-scheme-handler/https" = "firefox.desktop";
            "x-scheme-handler/mailto" = "thunderbird.desktop";
          };
        };
      };
    };
}
