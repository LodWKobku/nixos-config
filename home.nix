{ config, lib, pkgs, ... }:

{
	imports = [
		./components/home-manager/hyprland.nix
	];

	home.username = "user";
 	home.homeDirectory = "/home/user";
	home.stateVersion = "25.11";

	programs.git = {
		enable = true;
		settings.user = {
			name  = "LodWKobku";
			email = "lodwkobku@gmail.com";
		};
	};
	
	#VS Code
	programs.vscode = {
		enable = true;
		profiles.default = {
			extensions = with pkgs.vscode-extensions; [
			mhutchie.git-graph
			ms-python.python
			bbenoist.nix
			catppuccin.catppuccin-vsc-icons
			];
			userSettings = {
				"workbench.iconTheme" = "catppuccin-frappe";
			};
		};
	};

	#Discord
	programs.discord = {
		enable = true;
		package = pkgs.discord;
		settings.SKIP_HOST_UPDATE = true;
	};

	#Desktop Files
	home.file."Desktop/Steam.desktop".source = "${pkgs.steam}/share/applications/steam.desktop";
	home.file."Desktop/Heroic Game Launcher.desktop".source = "${pkgs.heroic}/share/applications/com.heroicgameslauncher.hgl.desktop";
	home.file."Desktop/PrismLauncher.desktop".source = "${pkgs.prismlauncher}/share/applications/org.prismlauncher.PrismLauncher.desktop";
	home.file."Desktop/Discord.desktop".source = "${pkgs.discord}/share/applications/discord.desktop";
}

