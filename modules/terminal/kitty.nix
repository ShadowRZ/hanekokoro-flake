{
  flake.modules.homeManager."terminal/kitty" = {
    programs.kitty = {
      enable = true;
      enableGitIntegration = true;
      font = {
        name = "Hanekokoro Mono";
        size = 16.0;
      };
      settings = {
        hide_window_decorations = true;
        tab_bar_style = "powerline";
        tab_title_template = "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{tab.last_focused_progress_percent}[{index}]";
        active_tab_title_template = "{fmt.fg.red}{bell_symbol}{activity_symbol}{fmt.fg.tab}{tab.last_focused_progress_percent}[{index}] {title}";
      };
      extraConfig = ''
        symbol_map U+e000-U+e00a,U+e0a0-U+e0a2,U+e0a3,U+e0b0-U+e0b3,U+e0b4-U+e0c8,U+e0ca,U+e0cc-U+e0d7,U+e200-U+e2a9,U+e300-U+e3e3,U+e5fa-U+e6b7,U+e700-U+e8ef,U+ea60-U+ec1e,U+ed00-U+efce,U+f000-U+f2ff,U+f300-U+f381,U+f400-U+f533,U+f0001-U+f1af0 Symbols Nerd Font Mono
      '';
    };
  };
}
