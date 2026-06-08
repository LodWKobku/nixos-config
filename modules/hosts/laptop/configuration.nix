{ self, inputs, ... }: {

  flake.nixosModules.laptopConfig = { pkgs, lib, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      self.nixosModules.laptopHardware
      
      self.nixosModules.plasma
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    users.users.user = {
      isNormalUser = true;
      initialPassword = "user";
      description = "user";
      extraGroups = [ "networkmanager" "wheel" "user-with-access-to-virtualbox" "docker" "scanner" "lp"];
    };

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.user = self.homeModules.user;
    };

    # Bootloader
    boot.loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    networking.hostName = "nixos";
    
    networking.networkmanager.enable = true; # Networking
    time.timeZone = "Europe/Warsaw"; # Timezone
    nixpkgs.config.allowUnfree = true;  # Unfree packages

    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };
    
    system.stateVersion = "25.11";
  };
}
