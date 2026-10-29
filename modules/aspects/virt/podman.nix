{
  flake.aspects.virtualisation._.podman.nixos = _: {
    # Podman
    virtualisation.podman = {
      enable = true;
      dockerCompat = true;
      dockerSocket.enable = true;
    };
  };
}
