By default, NixOS installs "stable" channel.
But Home Manager uses "unstable" channel.
So in order to use Home Manager, we have to change "stable" channel to "unstable"

`sudo nix-channel --list` - list current channels
`sudo nix-channel --remove nixos` - remove current "nixos" (stable)
`sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos` - add unstable nixos
`sudo nixos-rebuild switch` - rebuild to take effect. Now changes in Home Manager will be reflected
