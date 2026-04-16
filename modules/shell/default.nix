{
  flake.modules.nixos.shell = _: {
    programs.fish.enable = true;

    hanekokoro.nixos.preservation.user = {
      directories = [
        ".config/carapace"
        ".local/share/zoxide"
      ];
      files = [
        ".local/share/fish/fish_history"
      ];
    };
  };

  flake.modules.homeManager.shell = _: {
    programs.aria2.enable = true;
    programs.carapace.enable = true;
    programs.ripgrep.enable = true;
    programs.jq.enable = true;
    programs.fd.enable = true;
    programs.yt-dlp.enable = true;
    programs.zoxide.enable = true;

    home.shellAliases = {
      df = "df -h";
      du = "du -h";
      grep = "grep --color=auto";
      ls = "ls -h --group-directories-first --color=auto";

      chmod = "chmod --preserve-root -v";
      chown = "chown --preserve-root -v";

      ll = "ls -l";
      l = "ll -A";
      la = "ls -a";
    };
  };
}
