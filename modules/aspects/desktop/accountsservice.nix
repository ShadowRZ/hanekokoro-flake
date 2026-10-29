{
  flake.aspects.desktop.nixos = _: {
    services.accounts-daemon.enable = true;

    hanekokoro.nixos.preservation.directories = [ "/var/lib/AccountsService" ];
  };
}
