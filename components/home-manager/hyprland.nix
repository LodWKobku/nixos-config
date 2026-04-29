{ inputs, config, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;

        settings = {
            bind = [
                "CONTROL, L, exec, pkill rofi || ${pkgs.rofi}/bin/rofi -show drun"
                "CONTROL, T, exec, ${pkgs.kitty}/bin/kitty"
            ];

            exec-once = [
                "${pkgs.waybar}/bin/waybar"
                "${pkgs.networkmanagerapplet}/bin/nm-applet"
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
        theme = "${pkgs.fetchFromGitHub {
            owner = "adi1090x";
            repo = "rofi";
            rev = "master";
            sha256 = "sha256-iUX0Quae06tGd7gDgXZo1B3KYgPHU+ADPBrowHlv02A=";
        }}/files/launchers/type-3/style-1.rasi";
    };
}