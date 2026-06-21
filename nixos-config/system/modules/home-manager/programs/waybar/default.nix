{ ... }:

{
    programs.waybar = {
        enable = true;
        settings = [
            (builtins.fromJSON (builtins.readFile ../waybar/config))
        ];
        style = builtins.readFile ../waybar/style.css;
    };
}
