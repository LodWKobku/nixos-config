{ self, inputs, ... }: {
    flake.homeModules.user = { pkgs, ... }: {
        imports = [
            self.homeModules.plasma-manager
        ];
        
        #Fastfetch
        programs.fastfetch.enable = true;

        home.username = "user";
        home.homeDirectory = "/home/user";
        home.stateVersion = "25.11";
    };
}