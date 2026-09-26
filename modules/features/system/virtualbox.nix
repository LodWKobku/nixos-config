{ self, inputs, ... }: {
    flake.nixosModules.virtualbox = { pkgs, lib, config, ... }: {
        virtualisation.virtualbox.host = {
            enable = true;
            enableExtensionPack = true;
        };
        users.users.user.extraGroups = [ "user-with-access-to-virtualbox" "libvirtd" ];
        
        # Virt-manager
        programs.dconf.enable = true;
        virtualisation = {
            spiceUSBRedirection.enable = true;
            libvirtd = {
                enable = true;
                qemu.swtpm.enable = true;
            };
        };
        services.spice-vdagentd.enable = true;
        programs.virt-manager.enable = true;
        environment.systemPackages = with pkgs; [
            virt-viewer
            spice spice-gtk
            spice-protocol
            virtio-win
            win-spice
            adwaita-icon-theme
        ];
    };
}