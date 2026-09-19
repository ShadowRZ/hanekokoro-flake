if ("ZELLIJ" in $env) or ("TERMUX_VERSION" in $env) {
  print $"(ansi light_cyan_bold)Nushell (version | get version)"
  print $"(ansi light_magenta_bold)@ Hanekokoro Flake ("(https://github.com/ShadowRZ/hanekokoro-flake)")"
} else {
  fastfetch
}

$env.config.menus ++= [
  {
    name: help_menu
    only_buffer_difference: true
    marker: "? "
    type: {
      layout: description
      columns: 4
      col_width: 10
      col_padding: 1
      selection_rows: 5
      description_rows: 20
    }
    style: {
      text: $theme.peach
      selected_text: { fg: $theme.base bg: $theme.peach }
      description_text: $theme.subtext1
    }
  }
  {
    name: completion_menu
    only_buffer_difference: false
    marker: "· "
    type: {
      layout: columnar
      columns: 4
      col_width: 10
      col_padding: 1
      selection_rows: 5
      description_rows: 20
    }
    style: {
      text: $theme.peach
      selected_text: { fg: $theme.peach, attr: r }
      description_text: $theme.peach
      match_text: { fg: $theme.peach, attr: u }
      selected_match_text: { fg: $theme.peach, attr: ur }
    }
  }
  {
    name: history_menu
    only_buffer_difference: true
    marker: "? "
    type: {
      layout: list
      page_size: 10
    }
    style: {
      text: $theme.peach
      selected_text: { fg: $theme.base bg: $theme.peach }
      description_text: $theme.subtext1
    }
  }
]
