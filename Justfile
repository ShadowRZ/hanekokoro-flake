update:
  @nix --extra-experimental-features 'nix-command flakes' flake update --verbose -L --commit-lock-file --accept-flake-config

format:
  @nix --extra-experimental-features 'nix-command flakes' fmt --verbose -L --accept-flake-config

build:
  @nixos-rebuild build --flake --no-link --keep-going --accept-flake-config --no-reexec --log-format internal-json |& nom --json

boot:
  @nixos-rebuild boot --flake --keep-going --accept-flake-config --no-reexec --sudo --log-format internal-json |& nom --json

switch:
  @nixos-rebuild switch --flake --keep-going --accept-flake-config --no-reexec --sudo --log-format internal-json |& nom --json
