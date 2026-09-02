{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.labwc = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.labwc;
        };
    };
}