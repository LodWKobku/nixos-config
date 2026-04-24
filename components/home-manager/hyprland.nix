{ inputs, config, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;
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