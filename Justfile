update:
  nix --extra-experimental-features 'nix-command flakes' flake update --verbose -L --commit-lock-file --accept-flake-config

format:
  nix --extra-experimental-features 'nix-command flakes' fmt --verbose -L --accept-flake-config

build:
  nh os build . -- --option always-allow-substitutes true --accept-flake-config

boot:
  nh os boot . -- --option always-allow-substitutes true --accept-flake-config

switch:
  nh os switch . -- --option always-allow-substitutes true --accept-flake-config
