{ inputs, config, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;

        settings = {
            "$mod" = "SUPER";
            bind = [
                "$mod, Super_L, exec, pkill rofi || ${pkgs.rofi}/bin/rofi -show drun"
            ];

            exec-once = [
                "${pkgs.waybar}/bin/waybar"

            ];
        };
    };
    xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 

    # Bar
    programs.waybar = { 
        enable = true;
    };

    # Launcher
    programs.rofi = {
        enable = true;
    };
}