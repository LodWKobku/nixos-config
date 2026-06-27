{ self, inputs, ... }: {
    flake.nixosConfigurations.propc = inputs.nixpkgs.lib.nixosSystem {
        modules = [{
            imports = [
                inputs.home-manager.nixosModules.home-manager
                self.nixosModules.propcHardware
                self.nixosModules.basics
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

            system.stateVersion = "25.11";
        }];
    };
}