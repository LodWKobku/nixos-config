{ self, inputs, ... }: {
    flake.nixosModules.stylix = { pkgs, lib, config, ... }: {
        imports = [
            inputs.stylix.nixosModules.stylix
        ];
        
        stylix = {
            enable = true;
            autoEnable = true;
            base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
            image = "${pkgs.nixos-artwork.wallpapers.nineish-catppuccin-frappe}/share/backgrounds/nixos/nix-wallpaper-nineish-catppuccin-frappe.png";
        };
        
        home-manager.sharedModules = [
            {
                stylix.targets.kde.enable = true;
	            gtk.gtk2.force = true;
            }
        ];
    };
}