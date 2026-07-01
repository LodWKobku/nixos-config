{ self, inputs, ... }: {
    flake.nixosModules.hyprland = { pkgs, lib, config, ... }: {
        nix.settings = {
            substituters = [
                "https://hyprland.cachix.org"
            ];
            trusted-substituters = [
                "https://hyprland.cachix.org"
            ];
            trusted-public-keys = [
                "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
            ];
        };
        
        services.xserver.enable = true;

        programs.hyprland = {
            enable = true;
            withUWSM = true;
            xwayland.enable = true;
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
            systemd.enable = true;
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