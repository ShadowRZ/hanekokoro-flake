{
  flake.modules.nixos.shell = _: {
    hanekokoro.nixos.preservation.user.directories = [
      ".local/share/nushell"
    ];
  };

  flake.modules.homeManager.shell =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    {
      programs.nushell = {
        enable = true;
        settings = {
          show_banner = false;
          completions.external = {
            enable = true;
            max_results = 200;
          };
          table.mode = "frameless";
          history = {
            file_format = "sqlite";
            path = "${config.xdg.dataHome}/nushell/";
          };
        };
        plugins = [
          pkgs.nushellPlugins.formats
          pkgs.nushellPlugins.query
        ];
        extraConfig =
          let
            git-aliases = pkgs.fetchFromGitHub {
              owner = "KamilKleina";
              repo = "git-aliases.nu";
              rev = "109cc6159fb2ff040aadb256971170b164ed1fc2";
              hash = "sha256-YbT5JMM1xzR4Vc8s8Z998d53mPdKfPDNDypglLHso5E=";
            };
          in
          ''
            overlay use ${git-aliases}/git-aliases.nu

            source ${./config.nu}
          '';
        shellAliases = {
          ls = lib.mkForce "ls";
          l = lib.mkForce "ls";
          du = lib.mkForce "du";
        };
        environmentVariables = {
          GPG_TTY = lib.hm.nushell.mkNushellInline "(tty)";
        };
      };
    };
}
