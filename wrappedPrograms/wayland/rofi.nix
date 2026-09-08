{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.rofi = inputs.wrapper-modules.wrappers.rofi.wrap {
            inherit pkgs;
            theme = "${pkgs.fetchFromGitHub {
                owner = "adi1090x";
                repo = "rofi";
                rev = "512a585fff6da5b2a90e5948059b062516ddb2e7";
                sha256 = "sha256-iUX0Quae06tGd7gDgXZo1B3KYgPHU+ADPBrowHlv02A=";
            }}/files/launchers/type-3/style-1.rasi";
        };
    };
}