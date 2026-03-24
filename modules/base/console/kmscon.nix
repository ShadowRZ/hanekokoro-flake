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

            # Catppuccin Mocha
            palette=custom

            palette-black=69,71,90
            palette-red=243,139,168
            palette-green=166,227,161
            palette-yellow=249,226,175
            palette-blue=137,180,250
            palette-magenta=245,194,231
            palette-cyan=148,226,213
            palette-light-red=243,119,153
            palette-light-green=137,216,139
            palette-light-yellow=235,211,145
            palette-light-blue=116,168,252
            palette-light-magenta=242,174,222
            palette-light-cyan=107,215,202
            palette-white=166,173,200
            palette-foreground=205,214,244
            palette-background=30,30,46
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
