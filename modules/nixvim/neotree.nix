{
  flake.modules.nixvim.default = _: {
    plugins.web-devicons.enable = true;

    plugins.neo-tree = {
      enable = true;
      settings = {
        close_if_last_window = false;
        popup_border_style = "";
        clipboard = {
          sync = "none";
        };
        enable_git_status = true;
        enable_diagnostics = true;
        open_files_do_not_replace_types = [
          "terminal"
          "trouble"
          "qf"
        ];
        filesystem = {
          follow_current_file = {
            enabled = true;
            leave_dirs_open = true;
          };
        };
      };
    };
  };
}
