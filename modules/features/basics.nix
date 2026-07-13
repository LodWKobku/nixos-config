# Basic features for all configs
{ self, inputs, ... }: {
    flake.nixosModules.basics = { pkgs, lib, ... }: {
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        users.users.user = {
            isNormalUser = true;
            initialPassword = "user";
            description = "user";
            extraGroups = [ "networkmanager" "wheel" "libvirtd" ];
        };

        # Bootloader
        boot.loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };

        networking.networkmanager.enable = true; # Networking
        time.timeZone = "Europe/Warsaw"; # Timezone
        nixpkgs.config.allowUnfree = true;  # Unfree packages
        boot.tmp.cleanOnBoot = true; # Automaticly cleaning /tmp

        # Sound
        hardware.bluetooth.enable = true;
        services.pulseaudio.enable = false;
        security.rtkit.enable = true;
        services.pipewire = {
            enable = true;
            alsa.enable = true;
            alsa.support32Bit = true;
            pulse.enable = true;
        };

        # Virtual machine settings
        virtualisation = {
            libvirtd.enable = true;
            vmVariant = {
                virtualisation.memorySize = 5102;
                virtualisation.cores = 6;
            };
        };

        fonts.packages = with pkgs; [
            nerd-fonts.jetbrains-mono
            noto-fonts-cjk-sans
        ];
    };
}