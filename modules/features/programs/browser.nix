{ self, inputs, ... }: {
    flake.nixosModules.browser = { pkgs, lib, ... }: {
        programs.firefox = {
            enable = true;
            preferences = {
                "ui.key.menuAccessKeyFocuses" = false;
            };
            nativeMessagingHosts.packages = [ pkgs.uget-integrator ];
        };
    };
}