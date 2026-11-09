{ self, inputs, ... }: {
    perSystem = { pkgs, lib, self', ... }: {
        # Simple shell script that launches matlab using its docker image in vnc mode
        packages.matlab = pkgs.writeShellScriptBin "matlab-docker" ''
            ${lib.getExe pkgs.firefox} localhost:6080
            ${lib.getExe pkgs.docker} run -it --rm -p 5901:5901 -p 6080:6080 --shm-size=3G mathworks/matlab -vnc
        '';
    };
}