{ self, inputs, ... }: {
    flake.nixosModules.hyprland = { pkgs, lib, config, ... }: {
        imports = [inputs.hyprland.nixosModules.default];
        programs.hyprland = {
            enable = true;
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
    };
}