{
  flake.modules.nixos.desktop =
    _:
    {
      programs.kdeconnect = {
        enable = true;
        package = null;
      };

      hanekokoro.nixos.preservation.user.directories = [ ".config/kdeconnect" ];
    };

  flake.modules.homeManager.desktop =
    { pkgs, ... }:
    {
      services.kdeconnect = {
        enable = true;
        package = pkgs.kdePackages.kdeconnect-kde;
        indicator = true;
      };
    };
}
