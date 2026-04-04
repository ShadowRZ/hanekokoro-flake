{
  flake.modules.nixos."virt/libvirt" =
    { config, pkgs, ... }:
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

      networking.firewall.trustedInterfaces = [ "virbr*" ];

      users.users.${config.hanekokoro.nixos.user}.extraGroups = [
        "kvm"
        "libvirtd"
      ];

      services.pykms.enable = true;

      programs.virt-manager.enable = true;

      systemd.tmpfiles.rules = [
        "L+ /var/lib/pykms - root root - private/pykms"
      ];

      hanekokoro.nixos.preservation.directories = [
        "/var/lib/fwupd"
        "/var/lib/libvirt"
        "/var/lib/swtpm-localca"
        {
          directory = "/var/lib/private/pykms";
          user = "pykms";
          group = "pykms";
        }
      ];
    };
}
