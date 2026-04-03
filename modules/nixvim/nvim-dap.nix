{
  flake.modules.nixvim.default = _: {
    plugins.dap = {
      enable = true;
    };

    plugins.dap-view.enable = true;
  };
}
