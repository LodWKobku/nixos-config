{ self, inputs, ... }: {
    flake.nixosModules.browser = { pkgs, lib, ... }: {
        programs.firefox = {
            enable = true;
            languagePacks = [ "en-US" "pl" ];
            preferences = {
                "ui.key.menuAccessKeyFocuses" = false;
            };
            nativeMessagingHosts.packages = [ pkgs.uget-integrator ];
        };
    };
}