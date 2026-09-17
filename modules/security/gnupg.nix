{
  flake.modules.nixos."security/gnupg" = _: {
    services.pcscd.enable = true;

    hanekokoro.nixos.preservation.user.directories = [
      {
        directory = ".gnupg";
        mode = "0700";
      }
      {
        directory = ".local/share/pgp.cert.d";
        mode = "0700";
      }
      ".local/share/sequoia/keystore"
    ];
  };

  flake.modules.homeManager."security/gnupg" = { pkgs, ... }: {
    home.packages = [ pkgs.sequoia-sq ];
  };
}
