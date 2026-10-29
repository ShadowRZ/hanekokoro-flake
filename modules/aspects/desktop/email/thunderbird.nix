{
  flake.aspects.desktop._.environment.homeManager =
    {
      pkgs,
      ...
    }:
    {
      programs.thunderbird = {
        enable = true;
        package = pkgs.thunderbird-latest;
        profiles = {
          default = {
            isDefault = true;
          };
        };
      };
    };

  flake.aspects.desktop._.environment.nixos = {
    hanekokoro.nixos.preservation.user.directories = [ ".thunderbird/default" ];
  };
}
