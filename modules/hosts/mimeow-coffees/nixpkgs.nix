{ inputs, ... }:
{
  flake.modules.nixos."hosts/mimeow-coffees" = _: {
    nixpkgs = {
      hostPlatform = "x86_64-linux";

      overlays = [
        # keep-sorted start
        inputs.emacs-overlay.overlays.default
        inputs.firefox-addons.overlays.default
        inputs.neovim-overlay.overlays.default
        inputs.niri.overlays.default
        inputs.nix-indexdb.overlays.nix-index
        inputs.noctalia-shell.overlays.default
        inputs.shadowrz.overlays.default
        # keep-sorted end
      ];
    };
  };
}
