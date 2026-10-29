{ config, ... }:
{
  flake.aspects.dev = {
    homeManager =
      { pkgs, ... }:
      {
        home.packages = [
          pkgs.devenv
          pkgs.just
          pkgs.just-lsp
          pkgs.just-formatter
        ];

        services.ssh-agent.enable = true;
      };
    nixos = {
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
  };
}
