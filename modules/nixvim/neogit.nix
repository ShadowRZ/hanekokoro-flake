{
  flake.modules.nixvim.default = _: {
    ## Dependencies intended for NeoGit
    dependencies.skim.enable = true;

    ## fzf-lua: Menu selection
    plugins.fzf-lua = {
      enable = true;
      settings = {
        fzf_bin = "sk";
      };
    };

    ## diffview
    plugins.diffview = {
      enable = true;
    };

    # NeoGit
    plugins.neogit = {
      enable = true;
      settings = {
        commit_popup = {
          kind = "floating";
        };
        disable_builtin_notifications = true;
        disable_commit_confirmation = true;
        kind = "floating";
        popup = {
          kind = "floating";
        };
        preview_buffer = {
          kind = "floating";
        };
        sections = {
          recent = {
            folded = true;
            hidden = false;
          };
          staged = {
            folded = false;
            hidden = false;
          };
          stashes = {
            folded = false;
            hidden = false;
          };
          unmerged = {
            folded = true;
            hidden = false;
          };
          unpulled = {
            folded = false;
            hidden = false;
          };
          unstaged = {
            folded = false;
            hidden = false;
          };
          untracked = {
            folded = false;
            hidden = false;
          };
        };
      };
    };
  };
}
