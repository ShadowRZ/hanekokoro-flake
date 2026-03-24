{
  flake.modules.nixos."virt/libvirt" =
    { pkgs, ... }:
    {
      virtualisation = {
        # Libvirtd
        libvirtd = {
          enable = true;
          qemu = {
            package = pkgs.qemu_kvm;
            # Don't run as root
            runAsRoot = false;
            # Enable virtual TPM support
            swtpm.enable = true;
            vhostUserPackages = [ pkgs.virtiofsd ];
          };
        };
        spiceUSBRedirection.enable = true;
      };

      # Users
      users.users.shadowrz.extraGroups = [ "libvirtd" ];

      services.pykms.enable = true;

      programs.virt-manager.enable = true;
    };
}
