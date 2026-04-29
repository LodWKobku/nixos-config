{ inputs, config, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;
    
        settings = {
            exec-once = [
                "${pkgs.waybar}/bin/waybar"
            ];
        };
    };
    xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 

    programs.waybar = {
        enable = true;
    };
}