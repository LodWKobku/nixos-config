{ self, inputs, ... }: {

  flake.nixosModules.laptopConfig = { pkgs, lib, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      self.nixosModules.laptopHardware
      self.nixosModules.basics
      
      self.nixosModules.plasma
      self.nixosModules.browser
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users.user = self.homeModules.user;
    };

    networking.hostName = "laptop";
    
    system.stateVersion = "25.11";
  };
}
