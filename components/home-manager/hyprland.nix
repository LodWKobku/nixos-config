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
}