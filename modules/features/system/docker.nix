{ self, inputs, ... }: {
    flake.nixosModules.docker = { pkgs, lib, config, ... }: {
        virtualisation.docker.enable = true;
        users.users.user.extraGroups = [ "docker" ];
    };
}