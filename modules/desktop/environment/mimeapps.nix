{
  flake.modules.homeManager.desktop =
    { config, ... }:
    {
      xdg = {
        mime.enable = true;
        mimeApps = {
          enable = true;
          defaultApplicationPackages = [
            config.programs.mpv.package
          ];
          defaultApplications = {
            "text/html" = "firefox.desktop";
            "x-scheme-handler/http" = "firefox.desktop";
            "x-scheme-handler/https" = "firefox.desktop";
            "x-scheme-handler/mailto" = "thunderbird.desktop";
            "x-scheme-handler/vscode" = "code-url-handler.desktop";
          };
        };
      };
    };
}
