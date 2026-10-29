{
  flake.aspects.security._.pam-fido2.nixos = _: {
    security.pam = {
      services = {
        login.u2fAuth = true;
        sudo.u2fAuth = true;
      };
      u2f = {
        enable = true;
        control = "sufficient";
        settings = {
          cue = true;
        };
      };
    };

    hanekokoro.nixos.preservation.user.files = [ ".config/Yubico/u2f_keys" ];
  };
}
