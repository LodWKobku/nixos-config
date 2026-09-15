{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.proton-launcher = pkgs.writeShellApplication {
            name = "proton-launcher";
            runtimeInputs = [ 
                self'.packages.rofi
            ];
            text = ''
                choice=$(echo -e "proton-vpn\x00icon\x1fproton-vpn-logo\nproton-pass\x00icon\x1fproton-pass\nprotonmail-desktop\x00icon\x1fproton-mail" | rofi -show-icons -dmenu -p "Launch Proton App")

                case "$choice" in
                    proton-vpn) exec ${lib.getExe pkgs.proton-vpn} ;;
                    proton-pass) exec ${lib.getExe pkgs.proton-pass} ;;
                    protonmail-desktop) exec ${lib.getExe pkgs.protonmail-desktop} ;;
                    *) exit 0 ;;
                esac
            '';
        };
    };
}
