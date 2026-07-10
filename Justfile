update:
  nix --extra-experimental-features 'nix-command flakes' flake update --verbose -L --commit-lock-file --accept-flake-config

format:
  nix --extra-experimental-features 'nix-command flakes' fmt --verbose -L --accept-flake-config

build:
  nh os build . -- --accept-flake-config

boot:
  nh os boot . -- --accept-flake-config

switch:
  nh os switch . -- --accept-flake-config
