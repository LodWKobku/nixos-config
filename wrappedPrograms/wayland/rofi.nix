{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.rofi = inputs.wrapper-modules.wrappers.rofi.wrap {
            inherit pkgs;
            theme = "${inputs.rofi-styles}/files/launchers/type-3/style-1.rasi";
        };
    };
}