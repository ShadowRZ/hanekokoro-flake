{
  flake.modules.nixos.nix = _: {
    nix = {
      settings = {
        extra-substituters = [
          "https://shadowrz.cachix.org"
          "https://nix-community.cachix.org"
          "https://cache.nixos-cuda.org"
        ];
        extra-trusted-public-keys = [
          # keep-sorted start
          "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "shadowrz.cachix.org-1:I+6FCWMtdGmN8zYVncKdys/LVsLkCMWO3tfXbwQPTU0="
          # keep-sorted end
        ];
      };
    };
  };
}
