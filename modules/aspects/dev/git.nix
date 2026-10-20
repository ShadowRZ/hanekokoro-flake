{
  flake.modules.homeManager.dev =
    { pkgs, lib, ... }:
    {
      programs = {
        git = {
          enable = true;
          package = pkgs.gitMinimal;
          signing = {
            signByDefault = true;
            format = "openpgp";
            signer = lib.getExe pkgs.oct-git;
            key = "AC597AD389D1CC5618AD1ED9B7123A2B6B0AE434";
          };
          settings = {
            user = {
              name = "夜坂雅";
              email = "23130178+ShadowRZ@users.noreply.github.com";
            };
            init.defaultBranch = "master";
          };
          lfs = {
            enable = true;
            skipSmudge = true;
          };
        };
        ### Delta highlighter
        delta = {
          enable = true;
          enableGitIntegration = true;
          enableJujutsuIntegration = true;
        };
        ### Gh
        gh = {
          enable = true;
          settings = {
            git_protocol = "ssh";
            version = "1";
          };
        };
        ### Jujutsu
        jujutsu = {
          enable = true;
          settings = {
            user = {
              name = "夜坂雅";
              email = "23130178+ShadowRZ@users.noreply.github.com";
            };
            aliases = {
              mine = [
                "log"
                "-r"
                "mine()"
              ];
              roots = [
                "log"
                "-r"
                "roots(mine())"
              ];
            };
            signing = {
              behavior = "drop";
              backend = "gpg";
              key = "AC597AD389D1CC5618AD1ED9B7123A2B6B0AE434";
              backends.gpg.program = lib.getExe pkgs.oct-git;
            };
            git = {
              sign-on-push = true;
              abandon-unreachable-commits = true;
            };
            ui = {
              conflict-marker-style = "git";
              default-command = "log";
            };
            templates = {
              draft_commit_description = ''
                concat(
                  builtin_draft_commit_description,
                  "JJ: ignore-rest\n",
                  "JJ: ------------------------ >8 ------------------------\n",
                  "JJ: Do not modify or remove the line above.\n",
                  "JJ: Everything below it will be ignored.\n",
                  diff.git(),
                )
              '';
              git_push_bookmark = "\"shadowrz/push-\" ++ change_id.short()";
            };
            revsets = {
              bookmark-advance-to = "closest_pushable(@)";
            };
            revset-aliases = {
              "closest_pushable(to)" = ''
                heads(
                    ::to
                    & mutable()
                    & description(regex:"\\S")
                    & (~empty() | merges())
                )
              '';
            };
          };
        };
      };
    };

  flake.modules.nixos.dev = {
    hanekokoro.nixos.preservation.user = {
      files = [ ".config/gh/hosts.yml" ];
      directories = [ ".config/jj/repos" ];
    };
  };
}
