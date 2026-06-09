{ self, inputs, ... }: {
    flake.nixosModules.shell = { pkgs, lib, ... }: {
        
        home-manager.sharedModules = [
            self.homeModules.git
            self.homeModules.nix-init
        ];
    };
}