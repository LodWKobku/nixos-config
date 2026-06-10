{ self, inputs, ... }: {
    flake.nixosModules.virtualbox = { pkgs, lib, config, ... }: {
        virtualisation.virtualbox.host = {
            enable = true;
            enableExtensionPack = true;
        };
        users.users.user.extraGroups = [ "user-with-access-to-virtualbox" ];
    };
}