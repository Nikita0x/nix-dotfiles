By default, NixOS installs "stable" channel.
But Home Manager uses "unstable" channel.
So in order to use Home Manager, we have to change "stable" channel to "unstable"

`sudo nix-channel --list` - list current channels
`sudo nix-channel --remove nixos` - remove current "nixos" (stable)
`sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos` - add unstable nixos
`sudo nixos-rebuild switch` - rebuild to take effect. Now changes in Home Manager will be reflected

You also need to generate new SSH key for Github (after fresh install)

1. `ssh-keygen -t ed25519 -C "klirmio21@gmail.com"` //generate new key
2. Enter
3. Enter
4. Enter
5. `cd ~/.ssh && cat id_ed25519.pub | xclip -selection clipboard` //enter directory and copy the insides of the key

6) Github -> Profile -> Settings -> SSH and GPG keys -> New SSH key
