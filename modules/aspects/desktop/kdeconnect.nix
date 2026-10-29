{
  flake.aspects.desktop = {
    nixos = {
      programs.kdeconnect = {
        enable = true;
        package = null;
      };

      hanekokoro.nixos.preservation.user.directories = [ ".config/kdeconnect" ];
    };
    homeManager =
      { pkgs, ... }:
      {
        services.kdeconnect = {
          enable = true;
          package = pkgs.kdePackages.kdeconnect-kde;
          indicator = true;
        };
      };
  };
}
