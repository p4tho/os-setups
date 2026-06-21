{ pkgs, ... }:

{
  xdg.configFile."wofi/config".source = ./wofi-config;
  xdg.configFile."wofi/style.css".source = ./wofi-style.css;

  xdg.configFile."hypr/hyprpaper.conf".text = ''
    splash = false

    wallpaper {
      monitor =
      path = ${./wallpapers/lain3.jpeg}
    }
  '';

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      ecosystem = {
        no_update_news = true;
      };
      
      "$mod" = "SUPER";

      env = [
        "XCURSOR_THEME,Bibata-Modern-Classic"
        "XCURSOR_SIZE,24"
      ];

      monitor = [
        ",preferred,auto,1.07"
      ];

      bind = [
        "$mod, RETURN, exec, kitty"
        "ALT, Q, killactive"
        "$mod, L, exec, wlogout"
        "$mod, B, exec, pkill -SIGUSR1 waybar"
        "$mod, SPACE, exec, wofi --show drun"

        "ALT, TAB, workspace, e+1"
        "ALT SHIFT, TAB, workspace, e-1"

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
      ];

      binde = [
        # Resize windows: Ctrl + Shift + Super + arrows
        "$mod CTRL SHIFT, left, resizeactive, -40 0"
        "$mod CTRL SHIFT, right, resizeactive, 40 0"
        "$mod CTRL SHIFT, up, resizeactive, 0 -40"
        "$mod CTRL SHIFT, down, resizeactive, 0 40"

        # Move tiled windows
        "$mod SHIFT, left, movewindoworgroup, l"
        "$mod SHIFT, right, movewindoworgroup, r"
        "$mod SHIFT, up, movewindoworgroup, u"
        "$mod SHIFT, down, movewindoworgroup, d"
      ];

      bindl = [
        # Volume
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"

        # Microphone
        ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"

        # Brightness
        ", XF86MonBrightnessUp, exec, brightnessctl set 5%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

        # Media
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPause, exec, playerctl pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      exec-once = [
        "waybar"
        "mako"
        "hyprpaper"
        "nm-applet"
      ];
    };
  };
}
