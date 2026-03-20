{
  flake.modules.nixos = {
    base =
      { pkgs, ... }:
      {
        services.kmscon = {
          enable = true;
          extraConfig = ''
            drm
            hwaccel
            gpus=primary
            font-dpi=144
            font-size=16
          '';
          extraOptions = "--term xterm-256color";
          fonts = [
            {
              name = "Hanekokoro Mono";
              package = pkgs.hanekokoro-mono;
            }
            {
              name = "Sarasa Mono SC";
              package = pkgs.sarasa-gothic;
            }
          ];
        };
      };
  };
}
