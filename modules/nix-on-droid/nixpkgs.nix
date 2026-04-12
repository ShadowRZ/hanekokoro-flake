{ inputs, ... }:
{
  flake.modules.nixOnDroid.default = _: {
    nixpkgs = {
      hostPlatform = "x86_64-linux";

      overlays = [
        # keep-sorted start
        inputs.emacs-overlay.overlays.default
        inputs.neovim-overlay.overlays.default
        inputs.nix-indexdb.overlays.nix-index
        inputs.shadowrz.overlays.default
        # keep-sorted end
      ];
    };
  };
}
