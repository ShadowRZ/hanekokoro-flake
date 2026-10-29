{
  flake.aspects.security._.gnupg = {
    nixos = _: {
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
    homeManager = { pkgs, ... }: {
      home.packages = [
        pkgs.openpgp-card-tools
        pkgs.sequoia-sq
      ];
    };
  };
}
