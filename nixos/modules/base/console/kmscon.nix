{
  flake.modules.nixos = {
    base =
      { pkgs, ... }:
      {
        services.kmscon = {
          enable = true;
          hwRender = true;
          useXkbConfig = true;
          term = "xterm-256color";
          extraConfig = ''
            font-dpi=144
            font-size=16
          '';
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
