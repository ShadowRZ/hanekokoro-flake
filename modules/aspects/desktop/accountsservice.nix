{
  flake.modules.nixos.desktop = _: {
    services.accounts-daemon.enable = true;

    hanekokoro.nixos.preservation.directories = [ "/var/lib/AccountsService" ];
  };
}
