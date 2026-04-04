{
  flake.modules.nixos.desktop =
    { pkgs, ... }:
    {
      programs.kdeconnect = {
        enable = true;
        package = pkgs.valent;
      };

      hanekokoro.nixos.preservation.user.directories = [ ".config/valent" ];
    };
}
