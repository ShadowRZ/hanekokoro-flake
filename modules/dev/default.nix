{ config, ... }:
{
  flake.modules.homeManager.dev =
    { pkgs, ... }:
    {
      home.packages = [
        pkgs.just
        pkgs.just-lsp
        pkgs.just-formatter
      ];
    };

  flake.modules.nixos.dev = {
    imports = [
      config.flake.modules.nixos.nixvim
    ];

    hanekokoro.nixos.preservation.user = {
      directories = [
        ".cache"
        ".cargo"
        ".gradle"
        ".java"
        ".konan"
        ".local/share/direnv"
        ".local/share/nvim"
        ".m2"
        ".mitmproxy"
        ".renpy"
      ];
      files = [ ".npmrc" ];
    };
  };
}
