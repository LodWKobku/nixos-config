{ config, pkgs, ... }:
{
  # Installed packages
  environment.systemPackages = with pkgs; [
     gemini-cli
     aider-chat-full # aider gemini cli alternative
     prismlauncher # Another Minecraft Launcher
     python313Packages.huggingface-hub # Huggingface CLI
     python313Packages.modelscope # Modelscope CLI
     pear-desktop # Youtube music app
     gnome-calculator # Calculator
     gnome-clocks # Clock
     heroic # Heroic game launcher
     nmap # Tool for analizing network
     deskflow # For usin one keyboard and mouse on two computers
     wl-clipboard # Clipboard support for deskflow
     uget # Download manager
  ];

  # Firefox.
  programs.firefox = {
    enable = true;
    preferences = {
      "ui.key.menuAccessKeyFocuses" = false;
    };
    nativeMessagingHosts.packages = [ pkgs.uget-integrator ];
  };

  # Virtual Box
  virtualisation.virtualbox.host = {
    enable = true;
    enableExtensionPack = true;
  };
  
  # Nh (nix helper)
  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 5";
    flake = "/home/user/Documents/nixos-nowe"; # sets NH_OS_FLAKE variable for you
  };

  # Steam
  programs.steam = {
    enable = true; # Master switch, already covered in installation
    remotePlay.openFirewall = true;  # Open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # Open ports for Source Dedicated Server hosting
    # Other general flags if available can be set here.
  };

  # OBS
  programs.obs-studio = {
    enable = true;
    enableVirtualCamera = true;
  };

  #Flatpak
  services.flatpak.enable = true;
  services.flatpak.packages = [
      "org.freedownloadmanager.Manager"
  ];
}