{
  flake.modules.nixos.nix = _: {
    # Enable Flakes
    nix.settings = {
      experimental-features = [
        "flakes"
      ];
      flake-registry = "";
      accept-flake-config = true;
    };

    # Disable nix-channel
    nix.channel.enable = false;

    nixpkgs.flake.setNixPath = true;
    nixpkgs.flake.setFlakeRegistry = true;

    # Does not work with Flake based configurations
    system.copySystemConfiguration = false;
  };
}
