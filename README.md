# Nixos configuration
This is repo for my personal nixos configuration for daily usage. For now it isn't anything crazy but feel free to copy.
 
## Programs
| <!-- -->    | <!-- -->    |
|-------------|-------------|
|**Desktop envirement**| KDE Plasma |
|**Theme** | Catppuccin Frappe |
|**Code Editor**|VS Code|
|**Browser**|Firefox|

## Notable features
* Automatic theming with [stylix](https://github.com/nix-community/stylix)
* [Custom fcitx5 input method configuration](components/keyboard.nix) for typing both Polish characters (native language) and Mandarin Characters with pinyin (currently learning) on seperate groups
* [Plasma configuration](home.nix)

## Testing
To test this configuration i recomend to use build-in `nixos-rebuild build-vm` feature. Having [enabled flakes](https://wiki.nixos.org/wiki/Flakes) required
```
git clone https://github.com/LodWKobku/nixos-config && cd nixos-config
nix flake update # Not required but recommended
nixos-rebuild build-vm --flake .
```

## Running locally
1. Activate [nix flakes](https://wiki.nixos.org/wiki/Flakes) on your current configuration.
2.
```
git clone https://github.com/LodWKobku/nixos-config && cd nixos-config
nix flake update # Not required but recommended
nixos-generate-config --dir . # To automaticly change hardware-configuration.nix
sudo nixos-rebuild boot --flake . # Recomend installing it with boot not switch to avoid probles with stylix
```