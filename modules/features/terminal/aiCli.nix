{ self, inputs, ... }: {
    flake.nixosModules.aiCli = { pkgs, lib, config, ... }: {
        environment.systemPackages = with pkgs; [
            python313Packages.huggingface-hub
            python313Packages.modelscope
            gemini-cli
            antigravity-cli
        ];
    };
}