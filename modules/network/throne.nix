{
  flake.modules.nixos."network/throne" = _: {
    programs.throne = {
      enable = true;
      tunMode.enable = true;
    };
  };
}
