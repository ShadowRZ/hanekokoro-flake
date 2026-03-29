{
  flake.modules = {
    nixos = {
      nix = _: {
        nix = {
          settings = {
            substituters = [
              "https://mirrors.ustc.edu.cn/nix-channels/store?priority=10"
              "https://mirrors.sjtug.sjtu.edu.cn/nix-channels/store?priority=10"
              "https://shadowrz.cachix.org?priority=20"
              "https://nix-community.cachix.org?priority=20"
              "https://noctalia.cachix.org?priority=20"
              "https://cache.garnix.io?priority=30"
            ];
            trusted-public-keys = [
              # keep-sorted start
              "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
              "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
              "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
              "shadowrz.cachix.org-1:I+6FCWMtdGmN8zYVncKdys/LVsLkCMWO3tfXbwQPTU0="
              # keep-sorted end
            ];
          };
        };
      };
    };
  };
}
