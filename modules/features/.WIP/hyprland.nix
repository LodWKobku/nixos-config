{ self, inputs, ... }: {
    flake.nixosModules.hyprland = { pkgs, lib, config, ... }: {        
        services.xserver.enable = true;

        programs.hyprland = {
            enable = true;
            withUWSM = true;
            xwayland.enable = true;
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
            portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        };

        home-manager.sharedModules = [
            self.homeModules.hyprlandHome
        ];
    };

    flake.homeModules.hyprlandHome = { pkgs, lib, config, ... }: {
        home.sessionVariables.NIXOS_OZONE_WL = "1";
        xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 
        
        wayland.windowManager.hyprland = {
            enable = true;
            configType = "hyprlang";
            xwayland.enable = true;
            package = null;
            portalPackage = null;
            
            # Resources:
                # https://github.com/hyprwm/Hyprland/blob/v0.54.3-b/example/hyprland.conf
                # https://wiki.hypr.land/0.54.0/Configuring/
                
            settings = {
                # Declare programs
                "$terminal" = "${lib.getExe self.packages.${pkgs.stdenv.hostPlatform.system}.kitty}";
                "$nm-applet" = "${lib.getExe pkgs.networkmanagerapplet}";
                "$rofi" = "${lib.getExe pkgs.rofi}";
                "$waybar" = "${lib.getExe pkgs.waybar}";
                "$awww" = "${pkgs.awww}/bin/awww";
                "$awww-daemon" = "${pkgs.awww}/bin/awww-daemon";

                bind = [
                    "CONTROL, Q, exec, killactive"
                    "CONTROL, L, exec, pkill rofi || $rofi -show drun"
                    "CONTROL, T, exec, $terminal"
                ];

                exec-once = [
                    "$waybar"
                    "$nm-applet"
                    "$awww-daemon"
                    "$awww img ${pkgs.fetchurl {
                        url = "https://github.com/NixOS/nixos-artwork/blob/master/wallpapers/nix-wallpaper-nineish-catppuccin-frappe.png?raw=true";
                        hash = "sha256-/HAtpGwLxjNfJvX5/4YZfM8jPNStaM3gisK8+ImRmQ4=";
                    }}"
                ];
            };
        };

        # TODO
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
                rev = "512a585fff6da5b2a90e5948059b062516ddb2e7";
                sha256 = "sha256-iUX0Quae06tGd7gDgXZo1B3KYgPHU+ADPBrowHlv02A=";
            }}/files/launchers/type-3/style-1.rasi";
        };
    };
}