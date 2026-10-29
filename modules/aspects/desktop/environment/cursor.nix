{
  flake.aspects.desktop.homeManager = { pkgs, ... }: {
    home.pointerCursor = {
      enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 32;
      gtk.enable = true;
      x11.enable = true;
    };
  };
}
