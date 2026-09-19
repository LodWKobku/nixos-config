{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.proton-launcher = pkgs.writeShellApplication {
            name = "proton-launcher";
            runtimeInputs = [ 
                (inputs.wrapper-modules.wrappers.rofi.wrap {
                     inherit pkgs;
                    theme = "${inputs.rofi-styles}/files/launchers/type-3/style-6.rasi";
                })
            ];
            text = 
            let
                proton-apps = pkgs.runCommand "proton-apps" {} ''
                    printf "Proton VPN\x00icon\x1fproton-vpn-logo\nProton Pass\x00icon\x1fproton-pass\nProton Mail\x00icon\x1fproton-mail" > $out
                '';
            in
            ''
                choice=$(rofi -input ${proton-apps} -theme-str "#listview { columns: 3; }" -dmenu -p "Launch Proton App")

                case "$choice" in
                    "Proton VPN") exec ${lib.getExe pkgs.proton-vpn} ;;
                    "Proton Pass") exec ${lib.getExe pkgs.proton-pass} ;;
                    "Proton Mail") exec ${lib.getExe pkgs.protonmail-desktop} ;;
                    *) exit 0 ;;
                esac
            '';
        };
    };
}
