{ self, inputs, ... }: {
    flake.homeModules.git = { pkgs, lib, ... }: {
        programs.git = {
            enable = true;
            settings.user = {
                name  = "LodWKobku";
                email = "lodwkobku@gmail.com";
            };
        };
        
        programs.gh = {
            enable = true;
            gitCredentialHelper = {
                enable = true;
            };
        };
    };
}