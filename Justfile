update:
  nix --extra-experimental-features 'nix-command flakes' flake update --verbose -L --commit-lock-file

format:
  nix --extra-experimental-features 'nix-command flakes' fmt --verbose -L

build:
  nh os build . -- --no-link --option always-allow-substitutes true

boot:
  nh os boot . -- --no-link --option always-allow-substitutes true

switch:
  nh os switch . -- --no-link --option always-allow-substitutes true
