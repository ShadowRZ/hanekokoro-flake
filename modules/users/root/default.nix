{
  flake.modules.nixos."users/root" =
    { pkgs, ... }:
    {
      users.users.root = {
        shell = pkgs.fish;
      };
    };
}
