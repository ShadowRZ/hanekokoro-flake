{
  flake.modules.nixvim.default = _: {
    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          bash = [
            "shellcheck"
            "shellharden"
            "shfmt"
          ];
          cpp = [ "clang_format" ];
          python = [
            "isort"
            "black"
          ];
          rust = {
            __unkeyed-1 = "rustfmt";
            lsp_format = "fallback";
          };
          nix = {
            __unkeyed-1 = "deadnix";
            __unkeyed-2 = "statix";
            __unkeyed-3 = "nixfmt";
            lsp_format = "fallback";
          };
          javascript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            timeout_ms = 2000;
            stop_after_first = true;
          };
          "_" = [
            "squeeze_blanks"
            "trim_whitespace"
            "trim_newlines"
          ];
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_format = "fallback";
        };
        log_level = "warn";
        notify_on_error = false;
        notify_no_formatters = false;
      };
    };
  };
}
