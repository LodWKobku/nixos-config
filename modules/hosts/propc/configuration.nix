{ self, inputs, pkgs, ... }: {
    flake.nixosConfigurations.propc = inputs.nixpkgs.lib.nixosSystem {
        modules = [{
            imports = [
                inputs.home-manager.nixosModules.home-manager
                self.nixosModules.propcHardware
                self.nixosModules.basics
                self.nixosModules.nvidia
                self.nixosModules.keyboard
                self.nixosModules.printer

                self.nixosModules.shell
                self.nixosModules.plasma
                self.nixosModules.stylix
                self.nixosModules.virtualbox
                
                self.nixosModules.browser
                self.nixosModules.music
                self.nixosModules.games
            ];
            
            home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "backup";
                users.user = self.homeModules.user;
            };

            networking.hostName = "propc";

            # Nh (nix helper)
            programs.nh = {
                enable = true;
                clean.enable = true;
                clean.extraArgs = "--keep-since 4d --keep 5";
                flake = "/home/user/Documents/nixos-config#propc";
            };
            
            home-manager.sharedModules = [{
                # Desktop Files
                home.file."Desktop/Steam.desktop".source = "${pkgs.steam}/share/applications/steam.desktop";
                home.file."Desktop/Lutris.desktop".source = "${pkgs.lutris-unwrapped}/share/applications/net.lutris.Lutris.desktop";
                home.file."Desktop/PrismLauncher.desktop".source = "${pkgs.prismlauncher}/share/applications/org.prismlauncher.PrismLauncher.desktop";
                home.file."Desktop/Blender.desktop".source = "${pkgs.blender}/share/applications/blender.desktop";

                # Disable KWallet
                security.pam.services.sddm.kwallet.enable = false;
                programs.plasma.configFile."kwalletrc"."Wallet"."Enabled" = false;
            }];
            system.stateVersion = "25.11";
        }];
    };
}