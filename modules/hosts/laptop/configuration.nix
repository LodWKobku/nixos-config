{ self, inputs, ... }: {

  flake.nixosModules.laptopConfig = { pkgs, lib, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      self.nixosModules.laptopHardware
      self.nixosModules.basics
      self.nixosModules.keyboard
      
      self.nixosModules.shell
      self.nixosModules.plasma
      self.nixosModules.stylix
      self.nixosModules.browser
      self.nixosModules.music
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      users.user = self.homeModules.user;
    };

    networking.hostName = "laptop";
    
    # Nh (nix helper)
    programs.nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 5";
      flake = "/home/user/Documents/nixos-config#laptop";
    };

    system.stateVersion = "25.11";
  };
}
