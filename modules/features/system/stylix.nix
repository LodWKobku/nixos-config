{ self, inputs, ... }: {
    flake.nixosModules.stylix = { pkgs, lib, config, ... }: {
        imports = [
            inputs.stylix.nixosModules.stylix
        ];
        
        stylix = {
            enable = true;
            autoEnable = true;
            base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-frappe.yaml";
            image = pkgs.fetchurl {
                url = "https://github.com/NixOS/nixos-artwork/blob/master/wallpapers/nix-wallpaper-nineish-catppuccin-frappe.png?raw=true";
                hash = "sha256-/HAtpGwLxjNfJvX5/4YZfM8jPNStaM3gisK8+ImRmQ4=";
            };
        };
        
        home-manager.sharedModules = [
            {
                stylix.targets.kde.enable = true;
	            gtk.gtk2.force = true;
            }
        ];
    };
}