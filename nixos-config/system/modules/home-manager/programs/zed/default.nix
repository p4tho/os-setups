{ ... }:

{
  programs.zed-editor = {
    enable = true;

    userSettings = {
      theme = "Ayu Dark";

      hour_format = "hour24";
      vim_mode = false;

      autosave = {
        after_delay = {
          milliseconds = 500;
        };
      };

      use_auto_surround = true;
      auto_indent = true;
      auto_indent_on_paste = true;
    };

    extensions = [
      "react-typescript-snippets"
      "nix"
    ];
  };
}