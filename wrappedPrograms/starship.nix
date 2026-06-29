{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.starship = inputs.wrapper-modules.wrappers.starship.wrap {
            inherit pkgs;
            preset = "catppuccin-powerline";
            settings.palette = "catppuccin_frappe";
        };
    };
}