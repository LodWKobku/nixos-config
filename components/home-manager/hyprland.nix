{ inputs, config, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
        enable = true;
        configType = "hyprlang";
        
        settings = {
            # Declare programs
            "$terminal" = "${pkgs.kitty}/bin/kitty";
            "$nm-applet" = "${pkgs.networkmanagerapplet}/bin/nm-applet";
            "$rofi" = "${pkgs.rofi}/bin/rofi";
            "$waybar" = "${pkgs.waybar}/bin/waybar";


            bind = [
                "CONTROL, L, exec, pkill rofi || $rofi -show drun"
                "CONTROL, T, exec, $terminal"
            ];

            exec-once = [
                "$waybar"
                "$nm-applet"
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
            sha256 = "sha256-pM183MHOMuKJyLgthozM1MRsmhBM25VQgWc7CmLL2HI=";
        }}/files/launchers/type-3/style-1.rasi";
    };
}