# Basic features for all configs
{ self, inputs, ... }: {
    flake.nixosModules.basics = { pkgs, lib, ... }: {
        nix.settings.experimental-features = [ "nix-command" "flakes" ];

        users.users.user = {
            isNormalUser = true;
            initialPassword = "user";
            description = "user";
            extraGroups = [ "networkmanager" "wheel"];
        };

        # Bootloader
        boot.loader = {
            systemd-boot.enable = true;
            efi.canTouchEfiVariables = true;
        };

        networking.networkmanager.enable = true; # Networking
        time.timeZone = "Europe/Warsaw"; # Timezone
        nixpkgs.config.allowUnfree = true;  # Unfree packages
    };
}