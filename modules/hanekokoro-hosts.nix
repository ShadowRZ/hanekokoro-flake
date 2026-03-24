{
  hanekokoro = {
    nixos = {
      mimeow-coffees = {
        system = "x86_64-linux";
        modules = [
          # keep-sorted start
          "base"
          "desktop"
          "desktop/dev"
          "desktop/plasma6"
          "desktop/steam"
          "dev"
          "hardening"
          "hardware/bluetooth"
          "hardware/fwupd"
          "hardware/gpu/intel"
          "hardware/gpu/nvidia"
          "hardware/sound"
          "hardware/thunderbolt"
          "network"
          "network/networkmanager"
          "nix"
          "security/gnupg"
          "security/lanzaboote"
          "security/pam-fido2"
          "shell"
          "terminal/kmscon"
          "users/root"
          "users/shadowrz"
          "virt/libvirt"
          "virt/waydroid"
          # keep-sorted end
        ];
      };
    };
  };
}
