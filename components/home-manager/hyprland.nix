{ inputs, config, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;
        systemd.enable = false;
    
        settings = {
            exec-once = [
                "waybar"
            ];
        };
    };

    programs.waybar = {
        enable = true;
    };
}