{ self, inputs, ... }: {
  flake.nixosModules.propcHardware = { config, lib, pkgs, modulesPath, ... }: {
    imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "nvme" "usbhid" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-intel" ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/b883735b-1dea-40dc-9823-6d2cac482942";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/542D-E864";
        fsType = "vfat";
        options = [ "fmask=0077" "dmask=0077" ];
      };

    fileSystems."/mnt/dysk2" =
      { device = "/dev/disk/by-uuid/b5a0894c-9047-4867-b074-4c62ca07fe31";
        fsType = "ext4";
      };

    swapDevices =
      [ { device = "/dev/disk/by-uuid/a37428a9-2941-4655-8491-9f611c398685"; }
      ];

    nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}
