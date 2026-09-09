{ self, inputs, ... }: {
    flake.nixosModules.aiCli = { pkgs, lib, config, ... }: {
        environment.systemPackages = with pkgs; [
            python313Packages.huggingface-hub
            # python313Packages.modelscope # Temperary disabled becouse it is marked as unsafe https://tracker.security.nixos.org/issues/NIXPKGS-2026-2474
            antigravity-cli
            self.packages.${pkgs.stdenv.hostPlatform.system}.opencode
        ];
    };
}