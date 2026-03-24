{
  hanekokoro = {
    nixos = {
      mimeow-coffees = {
        system = "x86_64-linux";
        modules = [
          # keep-sorted start
          "base"
          "bluetooth"
          "desktop"
          "dev"
          "dev-desktop"
          "fwupd"
          "gnupg"
          "hardening"
          "nix"
          "plasma-desktop"
          "root"
          "shadowrz"
          "shell"
          "sound"
          "steam"
          # keep-sorted end
        ];
      };
    };
  };
}
