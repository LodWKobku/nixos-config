{ inputs, config, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;
    
        settings = {
            exec-once = [
                "${pkgs.waybar}/bin/waybar"
                "${pkgs.fuzzel}/bin/fuzzel"

            ];
        };
    };
    xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 

    # Bar
    programs.waybar = { 
        enable = true;
    };

    # Launcher
    programs.fuzzel = {
        enable = true;
    };
}