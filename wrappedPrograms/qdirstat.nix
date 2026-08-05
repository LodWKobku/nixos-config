{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        packages.qdirstat = inputs.wrappers.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.qdirstat;
            runtimeInputs = [
                pkgs.lxqt.lxqt-sudo
            ];
            # Run qdirstat as sudo by default
            exePath = "${lib.getExe pkgs.lxqt.lxqt-sudo} -q ${lib.getExe pkgs.qdirstat}";
        };
    };
}
