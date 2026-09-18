{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.proton-launcher = pkgs.writeShellApplication {
            name = "proton-launcher";
            runtimeInputs = [ 
                (inputs.wrapper-modules.wrappers.rofi.wrap {
                     inherit pkgs;
                    theme = "${pkgs.fetchFromGitHub {
                        owner = "adi1090x";
                        repo = "rofi";
                        rev = "512a585fff6da5b2a90e5948059b062516ddb2e7";
                        sha256 = "sha256-iUX0Quae06tGd7gDgXZo1B3KYgPHU+ADPBrowHlv02A=";
                    }}/files/launchers/type-3/style-6.rasi";
                })
            ];
            text = ''
                choice=$(echo -e "proton-vpn\x00icon\x1fproton-vpn-logo\nproton-pass\x00icon\x1fproton-pass\nprotonmail-desktop\x00icon\x1fproton-mail" | rofi -show-icons -theme-str "#listview { columns: 3; }" -dmenu -p "Launch Proton App")

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
