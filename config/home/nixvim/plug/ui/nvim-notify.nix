{
  programs.nixvim = {
    plugins.notify = {
      enable = true;
      backgroundColour = "#000000";
      fps = 60;
      render = "default";
      timeout = 1000;
      topDown = true;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>un";
        action = ''
        <cmd>lua require("notify").dismiss({ silent = true, pending = true })<cr>
        '';

        options.desc = "Dismiss All Notifications";
      }
    ];
  };
}
