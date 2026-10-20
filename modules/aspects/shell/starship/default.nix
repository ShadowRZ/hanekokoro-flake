{
  flake.modules.homeManager.shell = _: {
    programs.starship = {
      enable = true;
      settings = fromTOML (builtins.readFile ./starship.toml);
    };
  };
}
