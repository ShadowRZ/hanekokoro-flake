{
  flake.aspects.desktop._.environment._.flatpak.nixos = {
    services.flatpak.enable = true;
    hanekokoro.nixos.preservation = {
      directories = [ "/var/lib/flatpak" ];
      user.directories = [
        ".var"
      ];
    };
  };
}
