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
            config.programs.neovide.package
            pkgs.file-roller
          ];
          associations = {
            added = {
              "image/*" = "firefox.desktop";
            };
          };
          defaultApplications = {
            "image/*" = "firefox.desktop";
            "text/html" = "firefox.desktop";
            "x-scheme-handler/http" = "firefox.desktop";
            "x-scheme-handler/https" = "firefox.desktop";
            "x-scheme-handler/mailto" = "thunderbird.desktop";
          };
        };
      };
    };
}
