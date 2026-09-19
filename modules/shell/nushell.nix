{
  flake.modules.homeManager.shell =
    { pkgs, lib, ... }:
    {
      programs.nushell = {
        enable = true;
        configFile.source = ./config.nu;
        settings = {
          show_banner = false;
          completions.external = {
            enable = true;
            max_results = 200;
          };
          table.mode = "frameless";
          history = {
            file_format = "sqlite";
            isolation = true;
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
