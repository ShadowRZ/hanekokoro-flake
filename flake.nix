{
  description = "Hanekokoro Flake";

  inputs = {
    nixpkgs = {
      url = "github:NixOS/nixpkgs/nixos-unstable-small";
    };
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
    # keep-sorted start block=yes
    blender-bin = {
      url = "github:ShadowRZ/nix-kotone?dir=blender-bin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin-nix = {
      url = "github:catppuccin/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    crane = {
      url = "github:ipetkov/crane";
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "";
    };
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs = {
        nixpkgs.follows = "";
        nixpkgs-stable.follows = ""; # Only used for Nix Community Hydra jobs
      };
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "";
    };
    import-tree = {
      url = "github:vic/import-tree";
    };
    lanzaboote = {
      url = "github:nix-community/lanzaboote";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        crane.follows = "crane";
        # https://github.com/nix-community/lanzaboote/blob/v0.4.1/flake.nix#L11
        pre-commit.follows = "";
        rust-overlay.follows = "rust-overlay";
      };
    };
    neovim-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs = {
        flake-parts.follows = "flake-parts";
        nixpkgs.follows = "nixpkgs";
      };
    };
    niri = {
      url = "github:niri-wm/niri";
      inputs = {
        nixpkgs.follows = "nixpkgs";
      };
    };
    nix-indexdb = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "";
    };
    nixos-sensible = {
      url = "github:Guanran928/nixos-sensible";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs = {
        flake-parts.follows = "flake-parts";
        # Override Nixpkgs source with nixos-unstable-small
        # Nixvim tests with nixpkgs-unstable branch, which can be behind nixos-unstable-small sometimes
        # Allows for future regressions testing
        nixpkgs.follows = "nixpkgs";
        systems.follows = "systems";
      };
    };
    noctalia = {
      url = "github:noctalia-dev/noctalia";
      inputs = {
        nixpkgs.follows = "";
      };
    };
    preservation = {
      url = "github:nix-community/preservation";
    };
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "";
    };
    shadowrz = {
      url = "github:ShadowRZ/nur-packages";
      inputs.nixpkgs.follows = "";
    };
    silent-sddm = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "";
    };
    systems = {
      url = "github:nix-systems/default";
    };
    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      # The Nixpkgs input is only used for its own checks and formatters,
      # and we only require its flake module which is independent.
      inputs.nixpkgs.follows = "";
    };
    # keep-sorted end
  };

  nixConfig = {
    extra-substituters = [
      "https://shadowrz.cachix.org"
      "https://nix-community.cachix.org"
      "https://cache.nixos-cuda.org"
      "https://cache.garnix.io"
    ];
    extra-trusted-public-keys = [
      # keep-sorted start
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "shadowrz.cachix.org-1:I+6FCWMtdGmN8zYVncKdys/LVsLkCMWO3tfXbwQPTU0="
      "cache.nixos-cuda.org:74DUi4Ye579gUqzH4ziL9IyiJBlDpMRn9MBN8oNan9M="
      # keep-sorted end
    ];
    extra-experimental-features = [
      "pipe-operators"
    ];
  };

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);
}
