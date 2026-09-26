{ self, inputs, ... }: {
    flake.nixosModules.virt-manager = { pkgs, lib, config, ... }: {
        # Virt-manager
        programs.dconf.enable = true;
        virtualisation = {
            spiceUSBRedirection.enable = true;
            libvirtd = {
                enable = true;
                qemu.swtpm.enable = true;
            };
        };
        users.users.user.extraGroups = [ "libvirtd" ];
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