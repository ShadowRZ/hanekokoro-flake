update:
  nix --extra-experimental-features 'nix-command flakes' flake update --verbose -L --commit-lock-file

format:
  nix --extra-experimental-features 'nix-command flakes' fmt --verbose -L

build:
  nh os build . -- --option always-allow-substitutes true

boot:
  nh os boot . -- --option always-allow-substitutes true

switch:
  nh os switch . -- --option always-allow-substitutes true
