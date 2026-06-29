{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.fastfetch = inputs.wrapper-modules.wrappers.fastfetch.wrap {
            inherit pkgs;
        };
    };
}