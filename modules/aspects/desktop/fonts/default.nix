{
  flake.aspects.desktop = {
    homeManager = {
      fonts.fontconfig.enable = false;
    };
    nixos =
      { lib, pkgs, ... }:
      {
        # Fonts.
        fonts = {
          enableDefaultPackages = false;
          packages = with pkgs; [
            noto-fonts # Base Noto Fonts
            noto-fonts-color-emoji # Noto Color Emoji
            sarasa-gothic # Sarasa Gothic
            source-han-sans-vf-otf # Source Han Sans Variable
            source-han-serif-vf-otf # Source Han Serif Variable
            nerd-fonts.symbols-only
            hubot-sans
            (google-fonts.override {
              fonts = [
                "Space Grotesk"
                "Outfit"
              ];
            })
            (iosevka-bin.override {
              variant = "Aile";
            })
            dejavu_fonts
            # Iosevka Builds
            hanekokoro-sans
            hanekokoro-mono
            hanekokoro-mono-e
            hanekokoro-mono-k
          ];
          fontconfig = {
            defaultFonts = lib.mkForce {
              # XXX: Qt solely uses the first 255 fonts from fontconfig:
              # https://bugreports.qt.io/browse/QTBUG-80434
              # So put emoji font here.
              sansSerif = [
                "DejaVu Sans"
                "思源黑体 VF"
                "Noto Color Emoji"
              ];
              serif = [
                "DejaVu Serif"
                "思源宋体 VF"
                "Noto Color Emoji"
              ];
              monospace = [
                "Hanekokoro Mono-E"
                "Sarasa Mono SC"
                "Noto Color Emoji"
              ];
              emoji = [ "Noto Color Emoji" ];
            };
            subpixel.rgba = "rgb";
            localConf = builtins.readFile ./fontconfig.conf;
            cache32Bit = true;
          };
        };
      };
  };
}
