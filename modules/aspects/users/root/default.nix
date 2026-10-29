{
  flake.aspects.users._.root.nixos =
    { pkgs, ... }:
    {
      users.users.root = {
        shell = pkgs.nushell;
      };
    };
}
