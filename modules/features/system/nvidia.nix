{ self, inputs, ... }: {
    flake.nixosModules.nvidia = { pkgs, lib, config, ... }: {
         # Enable OpenGL
        hardware.graphics = {
            enable = true;
        };

        # Nvidia drivers (https://nixos.wiki/wiki/Nvidia#Modifying_NixOS_Configuration)
        services.xserver.videoDrivers = ["nvidia"];
        hardware.nvidia = {
            modesetting.enable = true;
            powerManagement.enable = false;
            powerManagement.finegrained = false;
            open = true;
            nvidiaSettings = true;
            package = config.boot.kernelPackages.nvidiaPackages.stable;
        };
        hardware.nvidia-container-toolkit.enable = true;
    };
}