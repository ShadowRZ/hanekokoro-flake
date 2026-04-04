{
  flake.modules.homeManager.desktop = _: {
    programs.neovide = {
      enable = true;
      settings = {
        frame = "none";
        font = {
          normal = [
            "Hanekokoro Mono"
            "Sarasa Mono SC"
          ];
          size = 16.0;
        };
      };
    };
  };
}
