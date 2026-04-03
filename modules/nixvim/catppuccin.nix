{
  flake.modules.nixvim.default =
    { lib, ... }:
    {
      colorschemes = {
        catppuccin = {
          enable = true;
          settings = {
            integrations = {
              # keep-sorted start block=yes
              blink_cmp = {
                style = "bordered";
              };
              cmp = true;
              diffview = true;
              fzf = true;
              lualine = {
                all = lib.nixvim.mkRaw ''
                  function(colors)
                    ---@type CtpIntegrationLualineOverride
                    return {
                      normal = {
                        a = { bg = colors.blue, fg = colors.mantle, gui = "bold" },
                        b = { bg = colors.surface0, fg = colors.blue },
                        c = { bg = colors.mantle, fg = colors.text },
                      },
                      insert = {
                        a = { bg = colors.green, fg = colors.base, gui = "bold" },
                        b = { bg = colors.surface0, fg = colors.green },
                      },
                      terminal = {
                        a = { bg = colors.green, fg = colors.base, gui = "bold" },
                        b = { bg = colors.surface0, fg = colors.green },
                      },
                      command = {
                        a = { bg = colors.peach, fg = colors.base, gui = "bold" },
                        b = { bg = colors.surface0, fg = colors.peach },
                      },
                      visual = {
                        a = { bg = colors.mauve, fg = colors.base, gui = "bold" },
                        b = { bg = colors.surface0, fg = colors.mauve },
                      },
                      replace = {
                        a = { bg = colors.red, fg = colors.base, gui = "bold" },
                        b = { bg = colors.surface0, fg = colors.red },
                      },
                      inactive = {
                        a = { bg = colors.mantle, fg = colors.blue },
                        b = { bg = colors.mantle, fg = colors.surface1, gui = "bold" },
                        c = { bg = colors.mantle, fg = colors.overlay0 },
                      },
                    }
                  end
                '';
              };
              neogit = true;
              neotree = true;
              nvim_surround = true;
              treesitter = true;
              # keep-sorted end
            };
            term_colors = true;
          };
        };
      };

      plugins.lualine.settings.options.theme = "catppuccin-nvim";

      colorscheme = "catppuccin-mocha";
    };
}
