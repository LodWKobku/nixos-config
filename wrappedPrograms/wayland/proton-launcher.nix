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
                    printf "proton-vpn\x00icon\x1fproton-vpn-logo\nproton-pass\x00icon\x1fproton-pass\nprotonmail-desktop\x00icon\x1fproton-mail" > $out
                '';
            in
            ''
                choice=$(rofi -input ${proton-apps} -theme-str "#listview { columns: 3; }" -dmenu -p "Launch Proton App")

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
