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
    };
  };
}
