{ inputs, ... }:
{
  flake.modules.nixos = {
    base = _: {
      imports = [ inputs.sops-nix.nixosModules.sops ];

      sops = {
        defaultSopsFile = ./secrets.yaml;
        age = {
          keyFile = "/persist/var/lib/sops.key";
          sshKeyPaths = [ ];
        };
        gnupg.sshKeyPaths = [ ];

        secrets = {
          passwd = {
            neededForUsers = true;
          };
        };
      };

      hanekokoro.nixos.preservation = {
        user.files = [
          ".config/sops/age/keys.txt"
        ];
      };
    };
  };
}
