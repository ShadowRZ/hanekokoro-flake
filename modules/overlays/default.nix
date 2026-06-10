{
  flake.overlays.default = final: prev: {
    neovim-unwrapped = prev.neovim-unwrapped.overrideAttrs {
      patches = [ ];
    };
  };
}
