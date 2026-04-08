{
  flake.modules.nixos.nix = _: {
    nix = {
      settings = {
        extra-substituters = [
          "https://shadowrz.cachix.org"
          "https://nix-community.cachix.org"
          "https://cache.garnix.io"
        ];
        extra-trusted-public-keys = [
          # keep-sorted start
          "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "shadowrz.cachix.org-1:I+6FCWMtdGmN8zYVncKdys/LVsLkCMWO3tfXbwQPTU0="
          # keep-sorted end
        ];
      };
    };
  };
}
