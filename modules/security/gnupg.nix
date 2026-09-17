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

  flake.modules.homeManager."security/gnupg" =
    {
      config,
      pkgs,
      ...
    }:
    {
      home.packages = [ pkgs.sequoia-sq ];

      ### GnuPG
      programs.gpg = {
        enable = true;
        scdaemonSettings = {
          pcsc-driver = "${pkgs.pcscliteWithPolkit.lib}/lib/libpcsclite.so";
          card-timeout = "5";
          disable-ccid = true;
          pcsc-shared = true;
        };
      };

      services = {
        ### GnuPG Agent
        gpg-agent = {
          enable = true;
          extraConfig = ''
            allow-loopback-pinentry
            allow-emacs-pinentry
          '';
        };
      };

      systemd.user.sessionVariables.GNUPGHOME = config.home.sessionVariables.GNUPGHOME;
    };
}
