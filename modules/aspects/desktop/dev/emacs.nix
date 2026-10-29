{
  flake.aspects.desktop._.environment = {
    homeManager =
      {
        pkgs,
        ...
      }:
      {
        services.emacs = {
          enable = true;
          client.enable = true;
          socketActivation.enable = true;
          startWithUserSession = true;
        };

        programs.emacs = {
          enable = true;
          package = pkgs.emacs-git-pgtk;
          extraPackages = epkgs: [
            epkgs.treesit-grammars.with-all-grammars
            epkgs.vterm
          ];
        };
      };
    nixos = {
      hanekokoro.nixos.preservation.user.directories = [
        ".config/doom"
        ".config/emacs"
      ];
    };
  };
}
