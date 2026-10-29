{ inputs, ... }:
{
  flake.aspects.machines._.mimeow-coffees.nixos = _: {
    nixpkgs = {
      hostPlatform = "x86_64-linux";

      overlays = [
        # keep-sorted start
        inputs.blender-bin.overlays.scoped
        inputs.emacs-overlay.overlays.default
        inputs.firefox-addons.overlays.default
        inputs.neovim-overlay.overlays.default
        inputs.niri.overlays.default
        inputs.nix-indexdb.overlays.nix-index
        inputs.shadowrz.overlays.default
        # keep-sorted end
      ];
    };
  };
}
