{ inputs, ... }:
{
  flake.modules.nixos."hosts/mimeow-coffees" =
    { lib, ... }:
    {
      nixpkgs = {
        hostPlatform = "x86_64-linux";

        overlays = [
          # keep-sorted start
          inputs.blender-bin.overlays.default
          inputs.emacs-overlay.overlays.default
          inputs.firefox-addons-nix.overlays.default
          inputs.neovim-overlay.overlays.default
          inputs.nix-indexdb.overlays.nix-index
          inputs.rust-overlay.overlays.default
          inputs.self.overlays.default
          inputs.shadowrz.overlays.default
          # keep-sorted end
        ];

        config = {
          allowUnfree = true;
          allowInsecurePredicate = pkg: builtins.elem (lib.getName pkg) [ "electron" ];
          # https://developer.android.google.cn/studio/terms
          android_sdk.accept_license = true;
        };
      };
    };
}
