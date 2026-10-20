{
  flake.modules.nixos."network/throne" = _: {
    programs.throne = {
      enable = true;
      tunMode.enable = true;
    };

    hanekokoro.nixos.preservation.user.directories = [ ".config/Throne" ];
  };
}
