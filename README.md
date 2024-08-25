By default, NixOS installs "stable" channel.
But Home Manager uses "unstable" channel.
So in order to use Home Manager, we have to change "stable" channel to "unstable"

sudo nix-channel --list
sudo nix-channel --remove nixos
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos
sudo nixos-rebuild switch
