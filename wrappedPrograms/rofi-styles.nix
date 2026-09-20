{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.rofi-styles = pkgs.stdenv.mkDerivation (finalAttrs: {
            pname = "rofi-styles";
            version = "512a585fff6da5b2a90e5948059b062516ddb2e7";
            src = pkgs.fetchFromGitHub {
                owner = "adi1090x";
                repo = "rofi";
                rev = finalAttrs.version;
                hash = "sha256-iUX0Quae06tGd7gDgXZo1B3KYgPHU+ADPBrowHlv02A=";
            };

            nativeBuildInputs = [ pkgs.installFonts ];

            installPhase = ''
                runHook preInstall    
                cp -r files/* $out
                runHook postInstall
            '';

            meta = {
                description = "A huge collection of Rofi based custom Applets, Launchers & Powermenus";
                homepage = "https://github.com/adi1090x/rofi";
                license = lib.licenses.gpl3Only;
            };
        });
    };
}