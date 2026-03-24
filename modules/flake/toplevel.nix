{ inputs, ... }:
{
  # Add Flake Parts flake module for modules feature.
  imports = [ inputs.flake-parts.flakeModules.modules ];

  # Enable debugging functionalities.
  # Required for nixd auto completions.
  debug = true;

  systems = [
    "x86_64-linux"
    "aarch64-linux"
  ];
}
