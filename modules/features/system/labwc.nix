{ self, inputs, ... }: {
    flake.nixosModules.labwc = { pkgs, lib, config, ... }: {
        programs.labwc = {
            enable = true;
            package = self.packages.${pkgs.stdenv.hostPlatform.system}.labwc;
            # Configs are in wrappedPrograms/wayfire.nix
        };

        services.displayManager.noctalia-greeter = {
            enable = true;
            settings = {
                cursor.size = 30;
                keyboard.layout = "us";
            };
            cursorTheme = {
                package = pkgs.capitaine-cursors;
                name = "capitaine-cursors";
            };
        };

    };
}