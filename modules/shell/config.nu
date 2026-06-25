if ("ZELLIJ" in $env) or ("TERMUX_VERSION" in $env) {
  print $"(ansi light_cyan_bold)Nushell (version | get version)"
  print $"(ansi light_magenta_bold)@ Hanekokoro Flake ("(https://github.com/ShadowRZ/hanekokoro-flake)")"
} else {
  fastfetch
}
